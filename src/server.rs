//! `serve` subcommand: minimal sync HTTP server (tiny_http, no async
//! runtime) exposing `GET /lookup?q=...&limit=...` and `GET /health`.

use crate::model;
use tiny_http::{Header, Method, Response, Server};

pub struct ServeArgs {
    pub port: u16,
}

pub fn parse_args(args: &[String]) -> Result<ServeArgs, String> {
    let mut port: u16 = 8080;
    let mut i = 0;
    while i < args.len() {
        match args[i].as_str() {
            "--port" => {
                i += 1;
                let val = args.get(i).ok_or("--port requires a value")?;
                port = val
                    .parse()
                    .map_err(|_| format!("invalid --port value: {val}"))?;
            }
            other => return Err(format!("unexpected argument: {other}")),
        }
        i += 1;
    }
    Ok(ServeArgs { port })
}

pub fn run(args: ServeArgs) -> i32 {
    let addr = format!("0.0.0.0:{}", args.port);
    let server = match Server::http(&addr) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("error: failed to bind {addr}: {e}");
            return 1;
        }
    };
    eprintln!("listening on http://{addr}  (GET /lookup?q=..., GET /health)");

    for request in server.incoming_requests() {
        handle_request(request);
    }
    0
}

fn handle_request(request: tiny_http::Request) {
    let method = request.method().clone();
    let url = request.url().to_string();

    if method != Method::Get {
        respond_plain(request, 405, "method not allowed");
        return;
    }

    let (path, query) = split_path_query(&url);

    match path {
        "/health" => respond_plain(request, 200, "ok"),
        "/lookup" => {
            let params = parse_query_string(query);
            let q = params.get("q").cloned().unwrap_or_default();
            if q.trim().is_empty() {
                respond_plain(request, 400, "missing required query parameter: q");
                return;
            }
            let limit: usize = params
                .get("limit")
                .and_then(|s| s.parse().ok())
                .unwrap_or(5);

            let results = model::lookup(&q, limit);
            match serde_json::to_string(&results) {
                Ok(body) => respond_json(request, 200, &body),
                Err(e) => respond_plain(request, 500, &format!("serialization error: {e}")),
            }
        }
        _ => respond_plain(request, 404, "not found"),
    }
}

fn split_path_query(url: &str) -> (&str, &str) {
    match url.split_once('?') {
        Some((p, q)) => (p, q),
        None => (url, ""),
    }
}

/// Minimal `application/x-www-form-urlencoded`-style query string parser:
/// splits on `&`/`=` and percent-decodes each key/value. Deliberately
/// hand-rolled (no `url`/`serde_urlencoded` crate) since it only needs to
/// handle two known parameter names.
fn parse_query_string(query: &str) -> std::collections::HashMap<String, String> {
    let mut map = std::collections::HashMap::new();
    if query.is_empty() {
        return map;
    }
    for pair in query.split('&') {
        let mut parts = pair.splitn(2, '=');
        let key = parts.next().unwrap_or("");
        let value = parts.next().unwrap_or("");
        if key.is_empty() {
            continue;
        }
        map.insert(percent_decode(key), percent_decode(value));
    }
    map
}

fn percent_decode(s: &str) -> String {
    let bytes = s.as_bytes();
    let mut out = Vec::with_capacity(bytes.len());
    let mut i = 0;
    while i < bytes.len() {
        match bytes[i] {
            b'+' => {
                out.push(b' ');
                i += 1;
            }
            b'%' if i + 2 < bytes.len() => {
                let hex = std::str::from_utf8(&bytes[i + 1..i + 3]).ok();
                if let Some(byte) = hex.and_then(|h| u8::from_str_radix(h, 16).ok()) {
                    out.push(byte);
                    i += 3;
                } else {
                    out.push(bytes[i]);
                    i += 1;
                }
            }
            b => {
                out.push(b);
                i += 1;
            }
        }
    }
    String::from_utf8_lossy(&out).into_owned()
}

fn respond_plain(request: tiny_http::Request, status: u16, body: &str) {
    let header = Header::from_bytes(&b"Content-Type"[..], &b"text/plain; charset=utf-8"[..])
        .expect("static header is valid");
    let response = Response::from_string(body)
        .with_status_code(status)
        .with_header(header);
    let _ = request.respond(response);
}

fn respond_json(request: tiny_http::Request, status: u16, body: &str) {
    let header = Header::from_bytes(
        &b"Content-Type"[..],
        &b"application/json; charset=utf-8"[..],
    )
    .expect("static header is valid");
    let response = Response::from_string(body)
        .with_status_code(status)
        .with_header(header);
    let _ = request.respond(response);
}
