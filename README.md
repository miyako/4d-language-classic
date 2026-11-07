# 4d-language-classic

A deterministic, offline, natural-language lookup/reference service for the
**4D classic language** command set — built for code agents that aren't
fluent in 4D. Ask something like *"how do I read a JSON file"* or *"open a
file dialog"* and get back:

1. the matched 4D command(s),
2. their real syntax rules (overload signatures, param types/optionality,
   discriminator rules, enum values, constraints) — verbatim from a
   schema-validated, statically checked 4D Command IR, and
3. a synthetic example call checked upstream by `tool4d checkSyntax`.

This is a lookup index over generated data, not a language model: matching
is pure deterministic keyword/alias/IDF scoring (see [How matching
works](#how-matching-works)), and the entire IR + example corpus is embedded
into the binary at compile time — the running program makes **zero**
runtime file or network accesses.

## Source data

All syntax rules and examples come from
[`miyako/4d-static-docs`](https://github.com/miyako/4d-static-docs), which
extracts, schema-validates, and statically checks (via `tool4d`) a full IR of
every 4D classic-language command. This repo vendors a **pinned 21 R5 BETA
snapshot**, imported from feature commit
`1dfd4e7eb832d19361f8ec1f4801603899087ca3` (not a claim about `main`), under
`data/vendor/`:

| File | Description |
|---|---|
| `4d-command-ir.json` | The root IR: every command's id, theme, overloads (params/types/directions/optionality), constraints, discriminator rules, enum references. |
| `synth_manifest.json` | Maps each command id to its generated example file and which overload/variant blocks it contains. |
| `methods/Synth_<Name>.4dm` | One file per command (1338 of 1460 commands — the 122 `4D-View-Pro`-themed commands remain excluded from example generation upstream), containing synthetic method bodies checked by `tool4d experimental/checkSyntax`. |
| `r5_snapshot.json` | Verbatim upstream snapshot evidence: version/status, compiler/source provenance, corpus/manifest/method SHA-256 hashes and verification scope. |
| `r5_conflict_inventory.json` | Verbatim upstream review inventory, including known contradictions and compiler-gate limitations. These upstream reports also contain OOP evidence; only the classic corpus is indexed here. |

See `data/vendor/COMMIT` for exactly which `4d-static-docs` commit is
currently pinned.

The four additions (no removals) are **defer** and **Deferred formulas**
(introduced in **21 R4**) and **OBJECT Get padding** / **OBJECT SET PADDING**
(introduced in **21 R5**). The snapshot also updates vector-index constants
and RGB border-color parameters.

The upstream classic gate covered 1338 synthetic methods / 2563 generated
blocks with the **21 R5 fixture**, **21R5.100156**. It is a source-bound static
`experimental/checkSyntax` check plus separate hover checks, **not** runtime
execution, a full application compile, or exhaustive parameter/arity proof.
Current checkSyntax does not reproduce the historical empty-call rejection
for **QR REPORT** / **REGISTER CLIENT**; conservative upstream signatures
and restrictions are retained, not newly certified arity negatives.
**QUIC selector 135** still has conflicting GET (seconds) / SET (minutes)
documentation, already present in R4; both readings and the unresolved
runtime-units caveat are preserved.

## Build & run

Requires a stable Rust toolchain (tested with 1.91).

```sh
cargo build --release
./target/release/4d-language-classic query "how do I read a json file"
```

The resulting binary (`target/release/4d-language-classic`) is
fully self-contained — it can be copied anywhere and run with no other
files present.

### CLI: one-shot query mode

```sh
4d-language-classic query "<natural language query>" [--limit N] [--json]
```

- Default output is human-readable text (ranked matches with their theme,
  one-line semantic summary, and the raw statically checked example).
- `--limit N` — how many ranked matches to return (default 5).
- `--json` — print the same JSON shape the HTTP server returns, for
  machine/agent consumption.

```sh
$ 4d-language-classic query "open a file dialog" --limit 1 --json
```

### HTTP: server mode

```sh
4d-language-classic serve [--port 8080]
```

- `GET /lookup?q=<query>&limit=<n>` → JSON array of ranked matches (same
  shape as `query --json`).
- `GET /health` → `200 OK` plain text.

```sh
$ 4d-language-classic serve --port 8080 &
$ curl "http://localhost:8080/lookup?q=parse+json&limit=3"
```

### Response shape

Each result includes the command's id/theme, a `docPage` permalink to the
official documentation, its match score, the IR's
overload objects **verbatim** (not reinterpreted — this is the authoritative
syntax contract: param names/types/optionality/directions, `returns`,
`discriminatedBy`, `mechanism`, etc.), command-level `constraints`, and an
`example` block:

```json
{
  "id": "JSON-Parse",
  "displayName": "JSON Parse",
  "theme": "JSON",
  "docPage": "https://developer.4d.com/docs/commands/json-parse",
  "score": 75.33,
  "overloads": [ /* ...raw IR overload objects... */ ],
  "constraints": [ "..." ],
  "example": {
    "available": true,
    "provenance": "synthetic example checked upstream by tool4d experimental/checkSyntax with fixture 21 R5, build 21R5.100156 (21 R5 BETA); static syntax check only, not runtime execution, full-application compilation, or exhaustive arity proof; raw text, not idiomatic hand-written code",
    "raw": "// overload 0\nvar $synthResult1 : Variant\n$synthResult1:=JSON Parse(\"synthText\";1;*)\n...",
    "placeholder_note": "Tokens such as \"synthText\", $synthResult1/$arr1/$v1, and [SynthTable] in `raw` are auto-generated placeholder literals, variable names, and table references -- substitute your own values, variable names, and table/field references when adapting this example; do not copy them verbatim."
  }
}
```

`example.available` is `false` (with no `raw`/`placeholder_note` fields) for
the 122 `4D-View-Pro`-themed commands, which have no statically checked
example in the upstream corpus.

The CLI JSON / HTTP lookup shape is unchanged; only the existing
`example.provenance` text now states the actual gate scope. Overloads
(including the new pseudo `Expression`, Collection/Object returns, padding
discriminators, vector sentinels and border-color unions) remain raw JSON.
The typed envelope still omits root-level enums and command-level
`sinceVersion`/`docPageLocal` from responses; full source metadata and
inventory remain in the distributable vendored data, not new response keys.

**Important**: `raw` is a literal synthetic method body generated to
exercise generated overload/variant blocks for `tool4d`'s static check, not
idiomatic hand-written code. Its literal-looking tokens (`"synthText"`,
`$synthResult1`, `$arr1`, `[SynthTable]`, etc.) are auto-generated
placeholders -- callers (including code agents) should substitute their own
values, variable names, and table/field references rather than copying
these tokens verbatim. This is surfaced both as `example.placeholder_note`
(machine-readable) and inline in the CLI's text-mode output.


`docPage` is an official documentation URL and is safe to cite verbatim; text
mode prints it as a `docs:` line. It is **version-less by design** --
`https://developer.4d.com/docs/commands/json-parse`, not
`.../docs/21-R3/commands/json-parse` -- because a version-pinned URL stops
resolving once that release is superseded and would rot this binary on 4D's
release schedule. Regression tests check that all 1460 commands carry
official version-less permalinks; this import does not recheck live HTTP
status or page-heading identity.

## How matching works

Fully deterministic — no embeddings, no ML, no external API calls, so the
same query always returns the same result on any machine:

1. **Tokenize** the query (lowercase, split on non-alphanumeric, drop a
   small English stopword list). `get` is retained because it distinguishes
   getter commands (such as OBJECT Get padding) from their setters.
2. **Alias-expand** each token via a small hand-curated table
   (`data/aliases.json`) mapping colloquial terms to the vocabulary actually
   used in the IR (e.g. `"read"` → also considers `"parse"`, `"open"` → also
   considers `"select"`/`"display"`). Extend this file as retrieval gaps are
   found — it is deliberately small and reviewable, not a generated model.
3. **Score** each candidate command as the sum, over matched tokens, of
   `field_weight × IDF(token)`, where field weight reflects how strong a
   signal that field is (command id/name > theme/semantic role > param names
   > constraint prose), and IDF (inverse document frequency, computed once
   at index-build time from the embedded corpus) discounts tokens that
   appear in almost every command (e.g. "file", "object", "value") so they
   don't drown out genuinely distinctive tokens (e.g. "json", "imap").
4. **Rank** by `(score desc, command id asc)` — the id tiebreak makes
   ordering fully reproducible even between commands with an identical
   score.

This intentionally stays scoped to **single-command lookups** — no
multi-command task chaining/composition in this version.

## Refreshing the pinned snapshot

When `4d-static-docs`'s IR is updated upstream, re-vendor a specific commit
with the documented script:

```sh
scripts/refresh-vendor.sh <commit-sha> [path-to-local-4d-static-docs-clone]
```

This reads **committed blobs**, validates exact command/manifest/method
coverage and (when present) upstream snapshot hashes, then overwrites
`data/vendor/{4d-command-ir.json,synth_manifest.json,methods/*.4dm}` and copies
the snapshot/inventory evidence. It rewrites `data/vendor/COMMIT` with the
immutable source ref + fetch timestamp (without assuming a branch), and prints
a summary of commands added/removed versus the previous snapshot. Always
pin to an explicit commit sha (never "latest") so the embedded snapshot is
reproducible. After refreshing:

```sh
cargo test    # deserialization, exact corpus/manifest/example wiring + lookup regressions
cargo build --release
# Run the binary from an empty directory within this checkout:
mkdir .smoke-empty
(cd .smoke-empty && ../target/release/4d-language-classic query "OBJECT Get padding" --limit 1 --json)
rmdir .smoke-empty
```

review the diff, then commit `data/vendor/` together with directly related
count/regression/provenance updates. Evidence is imported from the pinned
upstream run; the Rust tests do not rerun the 4D compiler.

## Project layout

```
Cargo.toml
build.rs                  # embeds data/vendor/methods/*.4dm at compile time
data/
  vendor/                 # pinned 4d-static-docs snapshot (see COMMIT)
  aliases.json            # hand-curated query-expansion table
scripts/
  refresh-vendor.sh        # re-pin to a new 4d-static-docs commit
src/
  lib.rs                  # module wiring (also exposed for tests/)
  main.rs                 # CLI arg dispatch (query | serve)
  ir.rs                   # typed envelope over the embedded IR JSON
  data.rs                 # include_str!/include! of embedded data
  index.rs                # tokenizer, inverted index, IDF scoring
  model.rs                # response DTOs shared by CLI --json and HTTP
  cli.rs                  # `query` subcommand
  server.rs               # `serve` subcommand (tiny_http)
tests/
  lookup_regression.rs     # known query -> expected command id(s)
```

## Dependencies

Kept deliberately minimal — no async runtime, no ML/embedding libraries:

| Crate | Why |
|---|---|
| `serde` / `serde_json` | Parse the embedded IR/manifest JSON into typed structs at startup. |
| `tiny_http` | Minimal blocking HTTP server for `serve` mode — no `tokio`/`axum`. |

CLI argument parsing, HTTP query-string decoding, and tokenizing are all
hand-rolled to avoid pulling in `clap`/`url`/`regex`.
