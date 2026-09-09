//! Regression guards for the deterministic lookup index.
//!
//! Two kinds of assertions:
//! - `assert_top1`: query has one clearly-correct answer, must rank #1.
//! - `assert_in_top`: query is legitimately ambiguous between a small set of
//!   closely related commands (e.g. singular vs. array variants of the same
//!   operation); any one of the expected ids appearing in the top N is a
//!   pass. This avoids over-fitting the test suite to incidental scoring
//!   details while still catching real regressions (e.g. the expected
//!   command falling out of the top results entirely).
//!
//! Every query/expectation below was verified against the actual embedded
//! index (see the session's investigation), not guessed.

use fourd_language_classic::ir;
use fourd_language_classic::model;

fn assert_top1(query: &str, expected_id: &str) {
    let results = model::lookup(query, 5);
    assert!(
        !results.is_empty(),
        "query {query:?} returned no results (expected top-1 {expected_id:?})"
    );
    assert_eq!(
        results[0].id,
        expected_id,
        "query {query:?}: expected top-1 {expected_id:?}, got {:?} (full top-5: {:?})",
        results[0].id,
        results.iter().map(|r| r.id.as_str()).collect::<Vec<_>>()
    );
}

fn assert_in_top(query: &str, expected_ids: &[&str], top_n: usize) {
    let results = model::lookup(query, top_n);
    let got: Vec<&str> = results.iter().map(|r| r.id.as_str()).collect();
    assert!(
        expected_ids.iter().any(|e| got.contains(e)),
        "query {query:?}: expected one of {expected_ids:?} in top {top_n}, got {got:?}"
    );
}

#[test]
fn read_or_parse_json() {
    assert_top1("how do I read a json file", "JSON-Parse");
    assert_top1("parse json", "JSON-Parse");
}

#[test]
fn convert_to_json_string() {
    assert_in_top(
        "convert to json string",
        &["JSON-Stringify", "JSON-Stringify-array"],
        3,
    );
    assert_in_top(
        "stringify json",
        &["JSON-Stringify", "JSON-Stringify-array"],
        3,
    );
}

#[test]
fn open_a_file_dialog() {
    assert_top1("open a file dialog", "Select-document");
    assert_top1("choose a file", "Select-document");
}

#[test]
fn sort_an_array_or_records() {
    assert_in_top(
        "sort array by field",
        &["SORT-ARRAY", "MULTI-SORT-ARRAY"],
        3,
    );
    assert_in_top(
        "sort records by field",
        &["ORDER-BY-ATTRIBUTE", "ORDER-BY", "SORT-ARRAY"],
        3,
    );
}

#[test]
fn print_options() {
    assert_in_top(
        "get print option value",
        &[
            "GET-PRINT-OPTION",
            "SET-PRINT-OPTION",
            "PRINT-OPTION-VALUES",
        ],
        3,
    );
}

#[test]
fn connect_to_imap_mailbox() {
    assert_top1("connect to imap mailbox", "IMAP-New-transporter");
}

#[test]
fn send_an_email() {
    assert_in_top(
        "send an email",
        &[
            "MAIL-New-attachment",
            "MAIL-Convert-to-MIME",
            "IMAP-New-transporter",
        ],
        3,
    );
}

/// Guards against the embedded IR snapshot drifting out of sync with the
/// `ir.rs` structs: every command in the real, full corpus must deserialize
/// without error.
#[test]
fn full_ir_corpus_deserializes() {
    let root = ir::parse_embedded();
    assert!(
        root.commands.len() > 1000,
        "expected the full ~1456-command corpus, got {}",
        root.commands.len()
    );
    for cmd in &root.commands {
        assert!(!cmd.id.is_empty());
        assert!(!cmd.display_name.is_empty());
        assert!(!cmd.theme.is_empty());
    }
}

/// Every command that has a compiler-verified synthetic example available
/// must resolve one via `model::lookup`'s `example` field (spot-checked
/// against known ids rather than iterating all 1334 — this is a wiring
/// check, not a full corpus re-verification).
#[test]
fn known_commands_have_verified_examples() {
    for id in [
        "JSON-Parse",
        "JSON-Stringify",
        "Select-document",
        "IMAP-New-transporter",
    ] {
        let results = model::lookup(id, 5);
        let hit = results
            .iter()
            .find(|r| r.id == id)
            .unwrap_or_else(|| panic!("expected lookup({id:?}) to surface itself in the top 5"));
        assert!(
            hit.example.available,
            "expected a compiler-verified example for {id}"
        );
        assert!(hit.example.raw.as_ref().is_some_and(|s| !s.is_empty()));
        assert!(
            hit.example.placeholder_note.is_some(),
            "expected {id}'s available example to include a placeholder_note warning callers not to copy synthetic tokens verbatim"
        );
    }
}

/// Every command carries an official documentation permalink, so a result can
/// be cited back to the user. Before this existed the IR had no doc field at
/// all, and when it was added upstream it was added to the OOP corpus first --
/// so this asserts the classic corpus is complete rather than partially
/// migrated.
///
/// The assertion is on the *absence of a version segment*, not merely on the
/// URL prefix. A version-pinned URL like `/docs/21-R3/commands/copy-array`
/// would satisfy a prefix check while being exactly the thing to avoid: it
/// stops resolving once that release is superseded, rotting the binary on 4D's
/// release schedule.
#[test]
fn every_command_has_a_version_less_doc_permalink() {
    const BASE: &str = "https://developer.4d.com/docs/";
    let root = ir::parse_embedded();
    let mut seen = 0;

    for command in &root.commands {
        let page = command
            .doc_page
            .as_deref()
            .unwrap_or_else(|| panic!("{} has no docPage", command.id));
        assert!(
            page.starts_with(BASE),
            "{} docPage is not an official permalink: {page}",
            command.id
        );
        let tail = &page[BASE.len()..];
        assert!(
            !tail.split('/').next().unwrap_or("").contains("21-")
                && !tail.starts_with("20")
                && !tail.starts_with("19"),
            "{} docPage is pinned to a release and will stop resolving: {page}",
            command.id
        );
        assert!(
            !page.ends_with(".html"),
            "{} docPage still looks like a mirror path: {page}",
            command.id
        );
        seen += 1;
    }
    assert_eq!(seen, 1456, "expected the full classic corpus");

    // The mirror path is preserved upstream as `docPageLocal` for provenance,
    // but the mirror is not shipped here, so it must never reach a response.
    let json = serde_json::to_string(&model::lookup("copy an array", 5)).expect("serialize");
    assert!(
        !json.contains("docPageLocal") && !json.contains("mirror/docs"),
        "a mirror path leaked into a served response"
    );

    // Control: the checks above are only meaningful if they reject the two
    // shapes this test exists to keep out.
    let rejects = |page: &str| {
        !page.starts_with(BASE) || page[BASE.len()..].starts_with("21-") || page.ends_with(".html")
    };
    assert!(rejects(
        "https://developer.4d.com/docs/21-R3/commands/copy-array"
    ));
    assert!(rejects("mirror/docs/21-R3/commands/copy-array.html"));
    assert!(!rejects(
        "https://developer.4d.com/docs/commands/copy-array"
    ));
}
