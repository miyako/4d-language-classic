//! `query` subcommand: one-shot natural-language lookup, printed as either
//! human-readable text (default) or JSON (`--json`, same shape as the HTTP
//! `/lookup` endpoint).

use crate::model::{self, LookupResult};

pub struct QueryArgs {
    pub query: String,
    pub limit: usize,
    pub json: bool,
}

pub fn parse_args(args: &[String]) -> Result<QueryArgs, String> {
    let mut query: Option<String> = None;
    let mut limit: usize = 5;
    let mut json = false;

    let mut i = 0;
    while i < args.len() {
        match args[i].as_str() {
            "--limit" => {
                i += 1;
                let val = args.get(i).ok_or("--limit requires a value")?;
                limit = val
                    .parse()
                    .map_err(|_| format!("invalid --limit value: {val}"))?;
            }
            "--json" => json = true,
            other => {
                if query.is_some() {
                    return Err(format!("unexpected extra argument: {other}"));
                }
                query = Some(other.to_string());
            }
        }
        i += 1;
    }

    let query = query.ok_or_else(|| "missing query text".to_string())?;
    Ok(QueryArgs { query, limit, json })
}

pub fn run(args: QueryArgs) -> i32 {
    let results = model::lookup(&args.query, args.limit);

    if args.json {
        match serde_json::to_string_pretty(&results) {
            Ok(s) => println!("{s}"),
            Err(e) => {
                eprintln!("error: failed to serialize results: {e}");
                return 1;
            }
        }
        return 0;
    }

    if results.is_empty() {
        println!("No matches for query: {:?}", args.query);
        return 0;
    }

    print_text(&results);
    0
}

fn print_text(results: &[LookupResult]) {
    for (rank, r) in results.iter().enumerate() {
        println!(
            "{}. {} ({})  score={:.2}",
            rank + 1,
            r.display_name,
            r.id,
            r.score
        );
        println!("   theme: {}", r.theme);
        if let Some(page) = &r.doc_page {
            println!("   docs: {page}");
        }
        if let Some(role) = first_semantic_role(r) {
            println!("   {role}");
        }
        match &r.example.raw {
            Some(raw) => {
                println!(
                    "   example (compiler-verified synthetic, see --json for full provenance):"
                );
                println!("   NOTE: \"synthText\", $synthResult1/$arr1/$v1, [SynthTable], etc. below are auto-generated placeholders -- substitute your own values/names, do not copy verbatim.");
                for line in raw.lines() {
                    println!("     {line}");
                }
            }
            None => println!("   example: none available (excluded theme, e.g. 4D View Pro)"),
        }
        println!();
    }
}

fn first_semantic_role(r: &LookupResult) -> Option<String> {
    r.overloads
        .iter()
        .find_map(|ov| ov.get("semanticRole").and_then(|v| v.as_str()))
        .map(str::to_string)
}
