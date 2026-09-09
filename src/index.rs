//! Deterministic keyword/alias search index over the embedded command IR.
//!
//! No embeddings, no ML, no network calls: this builds a weighted inverted
//! index once (lazily, on first use) from a handful of textual fields per
//! command, and scores queries by simple token-overlap. Ties are always
//! broken by command id so results are stable and reproducible.

use crate::data;
use crate::ir::{self, CommandIr};
use serde_json::Value;
use std::collections::{HashMap, HashSet};
use std::sync::OnceLock;

/// Field weights: how much a query token match in this field contributes to
/// a command's score. Higher weight = stronger signal that the command is
/// what the query is asking about.
const WEIGHT_ID_OR_NAME: f32 = 3.0;
const WEIGHT_THEME_OR_SEMANTIC_ROLE: f32 = 2.0;
const WEIGHT_PARAM_NAME: f32 = 1.0;
const WEIGHT_CONSTRAINT_PROSE: f32 = 0.5;

/// Small, fixed stopword list for natural-language queries like
/// "how do I read a json file". Deliberately conservative (English function
/// words only) so it never eats a real 4D keyword.
const STOPWORDS: &[&str] = &[
    "a", "an", "the", "to", "of", "in", "on", "for", "is", "are", "how", "do", "does", "did", "i",
    "you", "it", "and", "or", "with", "from", "at", "by", "that", "this", "can", "will", "would",
    "should", "get", "using", "use",
];

pub struct CommandRecord {
    pub id: String,
    pub display_name: String,
    pub theme: String,
    pub doc_page: Option<String>,
    pub kind: Option<String>,
    pub overloads: Vec<Value>,
    pub constraints: Vec<String>,
    pub protocol_refs: Option<Value>,
    pub deprecated: Option<Value>,
}

pub struct Index {
    pub commands: HashMap<String, CommandRecord>,
    /// token -> sorted (by command id) list of (command id, accumulated weight)
    inverted: HashMap<String, Vec<(String, f32)>>,
    aliases: HashMap<String, Vec<String>>,
    pub synth_examples: HashMap<&'static str, &'static str>,
}

pub struct ScoredCommand<'a> {
    pub record: &'a CommandRecord,
    pub score: f32,
}

static INDEX: OnceLock<Index> = OnceLock::new();

pub fn get() -> &'static Index {
    INDEX.get_or_init(build_index)
}

/// Look up the top `limit` commands for a free-text query, sorted by
/// (score desc, command id asc).
pub fn search(query: &str, limit: usize) -> Vec<ScoredCommand<'static>> {
    let idx = get();
    let expanded = expand_query_tokens(query, &idx.aliases);

    let mut scores: HashMap<&str, f32> = HashMap::new();
    for tok in &expanded {
        if let Some(postings) = idx.inverted.get(tok) {
            for (id, weight) in postings {
                *scores.entry(id.as_str()).or_insert(0.0) += weight;
            }
        }
    }

    let mut ranked: Vec<(&str, f32)> = scores.into_iter().collect();
    ranked.sort_by(|a, b| {
        b.1.partial_cmp(&a.1)
            .unwrap_or(std::cmp::Ordering::Equal)
            .then_with(|| a.0.cmp(b.0))
    });
    ranked.truncate(limit);

    ranked
        .into_iter()
        .map(|(id, score)| ScoredCommand {
            record: idx
                .commands
                .get(id)
                .expect("scored id must exist in commands map"),
            score,
        })
        .collect()
}

fn build_index() -> Index {
    let root = ir::parse_embedded();
    let aliases = parse_aliases(data::ALIASES_JSON);
    let synth_examples: HashMap<&'static str, &'static str> =
        data::SYNTH_EXAMPLES.iter().copied().collect();

    let mut commands: HashMap<String, CommandRecord> = HashMap::new();
    // token -> command id -> accumulated base weight (before IDF)
    let mut acc: HashMap<String, HashMap<String, f32>> = HashMap::new();
    let total_commands = root.commands.len() as f32;

    for cmd in root.commands {
        index_command(&cmd, &mut acc);
        commands.insert(
            cmd.id.clone(),
            CommandRecord {
                id: cmd.id,
                display_name: cmd.display_name,
                theme: cmd.theme,
                doc_page: cmd.doc_page,
                kind: cmd.kind,
                overloads: cmd.overloads,
                constraints: cmd.constraints,
                protocol_refs: cmd.protocol_refs,
                deprecated: cmd.deprecated,
            },
        );
    }

    // Apply an IDF (inverse document frequency) multiplier per token so that
    // tokens shared by nearly every command (e.g. "file", "object", "value")
    // don't drown out tokens that are actually distinctive of a query's
    // intent (e.g. "json", "imap"). This is the "BM25-style" part of the
    // deterministic keyword scoring: rarity across the corpus matters as
    // much as raw field weight.
    let mut inverted: HashMap<String, Vec<(String, f32)>> = HashMap::new();
    for (token, by_command) in acc {
        let df = by_command.len() as f32;
        let idf = (1.0 + total_commands / df).ln();
        let mut postings: Vec<(String, f32)> = by_command
            .into_iter()
            .map(|(id, base_weight)| (id, base_weight * idf))
            .collect();
        postings.sort_by(|a, b| a.0.cmp(&b.0));
        inverted.insert(token, postings);
    }

    Index {
        commands,
        inverted,
        aliases,
        synth_examples,
    }
}

fn index_command(cmd: &CommandIr, acc: &mut HashMap<String, HashMap<String, f32>>) {
    // Dedup tokens within a single field invocation so a word repeated
    // several times in one long description string doesn't out-accumulate a
    // word that appears once but in a more distinctive field (e.g. the id).
    let mut add = |text: &str, weight: f32| {
        let unique: HashSet<String> = tokenize(text).into_iter().collect();
        for tok in unique {
            *acc.entry(tok)
                .or_default()
                .entry(cmd.id.clone())
                .or_insert(0.0) += weight;
        }
    };

    add(&cmd.id, WEIGHT_ID_OR_NAME);
    add(&cmd.display_name, WEIGHT_ID_OR_NAME);
    add(&cmd.theme, WEIGHT_THEME_OR_SEMANTIC_ROLE);

    let mut semantic_roles = Vec::new();
    let mut param_names = Vec::new();
    for overload in &cmd.overloads {
        extract_strings_by_key(overload, "semanticRole", &mut semantic_roles);
        extract_strings_by_key(overload, "name", &mut param_names);
    }
    for s in &semantic_roles {
        add(s, WEIGHT_THEME_OR_SEMANTIC_ROLE);
    }
    for s in &param_names {
        add(s, WEIGHT_PARAM_NAME);
    }
    for s in &cmd.constraints {
        add(s, WEIGHT_CONSTRAINT_PROSE);
    }
}

/// Recursively collects every string value found under the given object key,
/// anywhere in `value`. Used to pull `semanticRole`/param `name` strings out
/// of the otherwise-untyped `overloads` JSON without modeling its full union
/// schema.
fn extract_strings_by_key(value: &Value, key: &str, out: &mut Vec<String>) {
    match value {
        Value::Object(map) => {
            for (k, v) in map {
                if k == key {
                    if let Value::String(s) = v {
                        out.push(s.clone());
                    }
                }
                extract_strings_by_key(v, key, out);
            }
        }
        Value::Array(items) => {
            for item in items {
                extract_strings_by_key(item, key, out);
            }
        }
        _ => {}
    }
}

/// Lowercases and splits on non-alphanumeric boundaries, dropping stopwords
/// and single-character tokens (the `*` flag param name and similar noise).
fn tokenize(text: &str) -> Vec<String> {
    text.to_lowercase()
        .split(|c: char| !c.is_alphanumeric())
        .filter(|t| t.len() >= 2 && !STOPWORDS.contains(t))
        .map(|t| t.to_string())
        .collect()
}

/// Tokenizes the query, then expands each token via the alias table,
/// returning a deduplicated set (order doesn't matter — score accumulation
/// is order-independent and each distinct token contributes at most once per
/// command).
fn expand_query_tokens(query: &str, aliases: &HashMap<String, Vec<String>>) -> HashSet<String> {
    let mut expanded = HashSet::new();
    for tok in tokenize(query) {
        if let Some(extra) = aliases.get(&tok) {
            for e in extra {
                expanded.insert(e.clone());
            }
        }
        expanded.insert(tok);
    }
    expanded
}

fn parse_aliases(json: &str) -> HashMap<String, Vec<String>> {
    let raw: HashMap<String, Value> =
        serde_json::from_str(json).expect("embedded data/aliases.json failed to parse");
    raw.into_iter()
        .filter(|(k, _)| !k.starts_with('_'))
        .filter_map(|(k, v)| {
            let list = v
                .as_array()?
                .iter()
                .filter_map(|x| x.as_str().map(str::to_string))
                .collect();
            Some((k, list))
        })
        .collect()
}
