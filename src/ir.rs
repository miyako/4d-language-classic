//! Typed envelope over the embedded 4D Command IR.
//!
//! Only the fields needed to build the search index and render results are
//! given concrete types. `overloads` (and everything nested inside it —
//! params, union types, embedded/variadic groups, discriminator rules, enum
//! references, etc.) is kept as raw `serde_json::Value` and echoed back
//! verbatim in lookup responses. This is a deliberate choice: the IR's
//! overload/type-union schema is intentionally rich and evolving, and the
//! whole point of this service is to hand back *exactly* what the IR says,
//! not a lossy reinterpretation of it. Unknown top-level JSON fields (e.g.
//! `enums`, `protocols`, `relationships`) are silently ignored by serde,
//! which keeps this module resilient to additive schema changes upstream.

use serde::Deserialize;
use serde_json::Value;

/// Root shape of `data/vendor/4d-command-ir.json`.
#[derive(Debug, Deserialize)]
pub struct CommandIrRoot {
    pub commands: Vec<CommandIr>,
}

/// One entry from the IR's top-level `commands` list.
#[derive(Debug, Deserialize, Clone)]
pub struct CommandIr {
    pub id: String,
    #[serde(rename = "displayName")]
    pub display_name: String,
    /// e.g. "classic_command".
    #[serde(default)]
    pub kind: Option<String>,
    pub theme: String,
    /// Raw overload objects, echoed verbatim in responses.
    #[serde(default)]
    pub overloads: Vec<Value>,
    /// Command-level prose constraints.
    #[serde(default)]
    pub constraints: Vec<String>,
    /// e.g. `{"multiCallChain": "queryThemeChain"}`. Kept raw/optional since
    /// most commands don't have it.
    #[serde(rename = "protocolRefs", default)]
    pub protocol_refs: Option<Value>,
    #[serde(default)]
    pub deprecated: Option<Value>,
}

/// Parses the embedded IR JSON. Panics on failure — the embedded snapshot is
/// a build-time invariant, not user input, so a parse failure here means the
/// vendored data or this module's structs are out of sync and the binary
/// should not silently serve broken results.
pub fn parse_embedded() -> CommandIrRoot {
    serde_json::from_str(crate::data::IR_JSON)
        .expect("embedded data/vendor/4d-command-ir.json failed to parse against ir.rs structs")
}
