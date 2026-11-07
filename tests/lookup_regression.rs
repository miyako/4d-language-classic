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
use fourd_language_classic::{data, index};
use serde_json::Value;
use std::collections::BTreeSet;

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
    assert_eq!(root.commands.len(), 1460, "expected the pinned R5 corpus");
    for cmd in &root.commands {
        assert!(!cmd.id.is_empty());
        assert!(!cmd.display_name.is_empty());
        assert!(!cmd.theme.is_empty());
    }
}

/// Every command that has a compiler-verified synthetic example available
/// must resolve one via `model::lookup`'s `example` field (spot-checked
/// against known ids rather than iterating all 1338 — this is a wiring
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
    assert_eq!(seen, 1460, "expected the full classic corpus");

    // The mirror is not shipped, so its local path must not reach responses.
    let json = serde_json::to_string(&model::lookup("copy an array", 5)).expect("serialize");
    assert!(!json.contains("docPageLocal") && !json.contains("mirror/docs"));
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

#[test]
fn r4_deferred_formulas_and_r5_padding_queries() {
    for (query, id) in [
        ("defer", "defer"),
        ("Deferred formulas", "Deferred-formulas"),
        ("OBJECT Get padding", "OBJECT-Get-padding"),
        ("OBJECT SET PADDING", "OBJECT-SET-PADDING"),
        ("read object padding", "OBJECT-Get-padding"),
        ("set form object padding", "OBJECT-SET-PADDING"),
    ] {
        assert_top1(query, id);
        let result = &model::lookup(query, 1)[0];
        assert!(result.example.available);
        assert!(result.example.raw.unwrap().contains(&result.display_name));
        let provenance = result.example.provenance.unwrap();
        assert!(provenance.contains("21R5.100156"));
        assert!(provenance.contains("static syntax check only"));
    }
}

#[test]
fn exact_corpus_manifest_and_embedded_methods_agree() {
    let root = ir::parse_embedded();
    let manifest: Value =
        serde_json::from_str(include_str!("../data/vendor/synth_manifest.json")).unwrap();
    let files = manifest["files"].as_object().unwrap();
    let examples: std::collections::BTreeMap<_, _> = data::SYNTH_EXAMPLES.iter().copied().collect();
    assert_eq!(files.len(), 1338);
    assert_eq!(examples.len(), 1338);
    assert_eq!(examples.len(), data::SYNTH_EXAMPLES.len());

    let expected: BTreeSet<_> = root
        .commands
        .iter()
        .filter(|c| c.theme != "4D-View-Pro")
        .map(|c| c.id.as_str())
        .collect();
    assert_eq!(root.commands.len() - expected.len(), 122);
    assert_eq!(expected, examples.keys().copied().collect());
    assert_eq!(
        expected,
        files
            .values()
            .map(|m| m["command_id"].as_str().unwrap())
            .collect()
    );
    let methods = std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("data/vendor/methods");
    let actual: BTreeSet<_> = std::fs::read_dir(&methods)
        .unwrap()
        .map(|entry| entry.unwrap().file_name().into_string().unwrap())
        .filter(|name| name.starts_with("Synth_") && name.ends_with(".4dm"))
        .collect();
    let referenced: BTreeSet<_> = files
        .keys()
        .map(|path| {
            std::path::Path::new(path)
                .file_name()
                .unwrap()
                .to_str()
                .unwrap()
                .to_owned()
        })
        .collect();
    assert_eq!(actual, referenced);
    for (path, meta) in files {
        let name = std::path::Path::new(path).file_name().unwrap();
        let text = std::fs::read_to_string(methods.join(name)).unwrap();
        assert_eq!(examples[meta["command_id"].as_str().unwrap()], text);
    }
}

#[test]
fn all_response_overloads_and_constraints_preserve_the_ir() {
    let raw: Value = serde_json::from_str(data::IR_JSON).unwrap();
    for command in raw["commands"].as_array().unwrap() {
        let id = command["id"].as_str().unwrap();
        let result = model::build_result(&index::get().commands[id], 1.0);
        assert_eq!(
            serde_json::to_value(&result.overloads).unwrap(),
            command["overloads"],
            "{id}"
        );
        assert_eq!(
            serde_json::to_value(&result.constraints).unwrap(),
            command["constraints"]
                .as_array()
                .map_or_else(|| serde_json::json!([]), |v| serde_json::json!(v)),
            "{id}"
        );
        assert_eq!(
            result.example.available,
            command["theme"] != "4D-View-Pro",
            "{id}"
        );
    }
}

#[test]
fn r5_snapshot_and_inventory_provenance_are_source_bound() {
    let snapshot: Value = serde_json::from_str(data::SNAPSHOT_JSON).unwrap();
    let inventory: Value = serde_json::from_str(data::CONFLICT_INVENTORY_JSON).unwrap();
    assert!(data::SOURCE_COMMIT.contains("commit=1dfd4e7eb832d19361f8ec1f4801603899087ca3\n"));
    assert!(!data::SOURCE_COMMIT.contains("branch=main"));
    assert_eq!(snapshot["version"], "21-R5");
    assert_eq!(snapshot["status"], "BETA");
    assert_eq!(snapshot["classic"]["commands"], 1460);
    assert_eq!(snapshot["classic"]["methods"], 1338);
    assert_eq!(snapshot["classic"]["compiler"]["returnedFiles"], 1338);
    assert_eq!(snapshot["compilerBuild"], "21 R5 build 21R5.100156");
    assert_eq!(inventory["status"], "BETA");
    assert!(snapshot["verificationScope"]
        .as_str()
        .unwrap()
        .contains("checkSyntax"));
    assert!(inventory["semanticConflicts"]
        .as_array()
        .unwrap()
        .iter()
        .any(|c| c["id"] == "database-parameter-135-units"
            && c["disposition"] == "unresolved_runtime_units"));
    assert!(inventory["compilerGateLimitations"]
        .as_array()
        .unwrap()
        .iter()
        .any(|c| c["id"] == "classic-empty-call-negative-controls"
            && c["disposition"] == "historical_rejection_not_reproduced_by_current_checkSyntax"));
}

#[test]
fn r5_vector_sentinels_and_border_color_are_preserved() {
    for id in ["CREATE-INDEX", "SET-INDEX"] {
        let result = model::build_result(&index::get().commands[id], 1.0);
        let params = result.overloads[0]["params"].as_array().unwrap();
        let param = params
            .iter()
            .find(|p| p["name"] == "indexType" || p["name"] == "index")
            .unwrap();
        let values = param["sentinelValues"].as_array().unwrap();
        for (value, metric) in [(4, "cosine"), (5, "dot"), (6, "euclidean")] {
            assert!(values.iter().any(|v| v["value"] == value
                && v["meaning"]
                    .as_str()
                    .unwrap()
                    .to_lowercase()
                    .contains(metric)));
        }
    }
    for (id, direction) in [
        ("OBJECT-GET-RGB-COLORS", "out"),
        ("OBJECT-SET-RGB-COLORS", "in"),
    ] {
        let result = model::build_result(&index::get().commands[id], 1.0);
        let border = result.overloads[0]["params"]
            .as_array()
            .unwrap()
            .iter()
            .find(|p| p["name"] == "borderColor")
            .unwrap();
        assert_eq!(border["direction"], direction);
        assert_eq!(border["optional"], true);
        assert_eq!(border["type"][0]["name"], "Text");
        assert_eq!(border["type"][1]["name"], "Integer");
    }
}
