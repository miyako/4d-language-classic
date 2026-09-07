//! Response shapes shared by the CLI (`--json`) and HTTP server.

use crate::index::{self, CommandRecord};
use serde::Serialize;
use serde_json::Value;

#[derive(Debug, Serialize)]
pub struct ExampleInfo {
    pub available: bool,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub provenance: Option<&'static str>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub raw: Option<&'static str>,
    /// Explicit, machine-readable warning that `raw`'s literal-looking
    /// tokens (e.g. `"synthText"`, `$synthResult1`, `[SynthTable]`) are
    /// auto-generated placeholders, not required syntax to copy verbatim.
    /// Kept as its own field (rather than folded into `provenance`'s prose)
    /// so a caller can reliably detect/surface it without string-parsing.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub placeholder_note: Option<&'static str>,
}

const PROVENANCE: &str = "compiler-verified synthetic example (tool4d check-syntax via the 4d-static-docs pipeline's stage 6); raw text, not idiomatic hand-written code";

const PLACEHOLDER_NOTE: &str = "Tokens such as \"synthText\", $synthResult1/$arr1/$v1, and [SynthTable] in `raw` are auto-generated placeholder literals, variable names, and table references -- substitute your own values, variable names, and table/field references when adapting this example; do not copy them verbatim.";

#[derive(Debug, Serialize)]
pub struct LookupResult {
    pub id: String,
    #[serde(rename = "displayName")]
    pub display_name: String,
    pub theme: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub kind: Option<String>,
    pub score: f32,
    /// Verbatim overload objects from the IR (params, types, returns,
    /// discriminator rules, etc.) — echoed as-is, not reinterpreted.
    pub overloads: Vec<Value>,
    pub constraints: Vec<String>,
    #[serde(rename = "protocolRefs", skip_serializing_if = "Option::is_none")]
    pub protocol_refs: Option<Value>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub deprecated: Option<Value>,
    pub example: ExampleInfo,
}

pub fn build_result(record: &CommandRecord, score: f32) -> LookupResult {
    let idx = index::get();
    let example = match idx.synth_examples.get(record.id.as_str()) {
        Some(raw) => ExampleInfo {
            available: true,
            provenance: Some(PROVENANCE),
            raw: Some(raw),
            placeholder_note: Some(PLACEHOLDER_NOTE),
        },
        None => ExampleInfo {
            available: false,
            provenance: None,
            raw: None,
            placeholder_note: None,
        },
    };

    LookupResult {
        id: record.id.clone(),
        display_name: record.display_name.clone(),
        theme: record.theme.clone(),
        kind: record.kind.clone(),
        score,
        overloads: record.overloads.clone(),
        constraints: record.constraints.clone(),
        protocol_refs: record.protocol_refs.clone(),
        deprecated: record.deprecated.clone(),
        example,
    }
}

pub fn lookup(query: &str, limit: usize) -> Vec<LookupResult> {
    index::search(query, limit)
        .into_iter()
        .map(|sc| build_result(sc.record, sc.score))
        .collect()
}
