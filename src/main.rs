use fourd_language_classic::{cli, server};
use std::process::ExitCode;

fn main() -> ExitCode {
    let args: Vec<String> = std::env::args().skip(1).collect();

    let Some(subcommand) = args.first() else {
        print_usage();
        return ExitCode::from(2);
    };

    let rest = &args[1..];
    let code: u8 = match subcommand.as_str() {
        "query" => match cli::parse_args(rest) {
            Ok(parsed) => cli::run(parsed) as u8,
            Err(e) => {
                eprintln!("error: {e}");
                print_usage();
                2
            }
        },
        "serve" => match server::parse_args(rest) {
            Ok(parsed) => server::run(parsed) as u8,
            Err(e) => {
                eprintln!("error: {e}");
                print_usage();
                2
            }
        },
        "-h" | "--help" | "help" => {
            print_usage();
            0
        }
        other => {
            eprintln!("error: unknown subcommand: {other}");
            print_usage();
            2
        }
    };

    ExitCode::from(code)
}

fn print_usage() {
    eprintln!(
        r#"4d-language-classic: deterministic natural-language lookup for the 4D classic-language command reference.

USAGE:
    4d-language-classic query "<natural language query>" [--limit N] [--json]
    4d-language-classic serve [--port 8080]

EXAMPLES:
    4d-language-classic query "how do I read a json file"
    4d-language-classic query "open a file dialog" --limit 3 --json
    4d-language-classic serve --port 8080
    curl "http://localhost:8080/lookup?q=parse+json&limit=3""#
    );
}
