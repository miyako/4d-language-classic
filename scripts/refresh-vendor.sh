#!/usr/bin/env bash
#
# Refreshes the vendored 4d-static-docs snapshot in data/vendor/.
#
# Usage:
#   scripts/refresh-vendor.sh <commit-sha> [source-repo-path]
#
#   <commit-sha>        Commit in miyako/4d-static-docs to pin to. Required
#                        — always pin explicitly, never "latest", so the
#                        embedded snapshot in this repo is reproducible.
#   [source-repo-path]  Path to an existing local clone of
#                        miyako/4d-static-docs. If omitted, a temporary
#                        shallow clone from https://github.com/miyako/4d-static-docs.git
#                        is made and removed afterwards.
#
# What it does:
#   1. Reads out/4d-command-ir.json, out/synth_manifest.json, and
#      Project/Sources/Methods/Synth_*.4dm at the given commit from the
#      source repo (via `git show` / `git archive`, no working-tree checkout
#      required).
#   2. Overwrites data/vendor/4d-command-ir.json, data/vendor/synth_manifest.json,
#      and data/vendor/methods/*.4dm in this repo.
#   3. Writes data/vendor/COMMIT with the pinned commit sha, its date/subject,
#      and the fetch timestamp.
#   4. Prints a summary of commands added/removed (by diffing command ids
#      between the old and new 4d-command-ir.json) so you can review before
#      committing.
#
# After running this script:
#   - Inspect `git diff --stat data/vendor/` and the printed added/removed
#     command summary.
#   - Run `cargo test` (the schema round-trip test + lookup regressions)
#     to confirm the new snapshot still deserializes and known queries still
#     resolve.
#   - Commit the updated data/vendor/ contents together with data/vendor/COMMIT.

set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "usage: $0 <commit-sha> [source-repo-path]" >&2
  exit 1
fi

COMMIT="$1"
SRC_REPO="${2:-}"
REMOTE_URL="https://github.com/miyako/4d-static-docs.git"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
VENDOR_DIR="$REPO_ROOT/data/vendor"

CLEANUP_TMP=""
cleanup() {
  if [[ -n "$CLEANUP_TMP" && -d "$CLEANUP_TMP" ]]; then
    rm -rf "$CLEANUP_TMP"
  fi
}
trap cleanup EXIT

if [[ -z "$SRC_REPO" ]]; then
  CLEANUP_TMP="$(mktemp -d)"
  echo "Cloning $REMOTE_URL (shallow) into $CLEANUP_TMP ..." >&2
  git clone --quiet --filter=blob:none "$REMOTE_URL" "$CLEANUP_TMP"
  SRC_REPO="$CLEANUP_TMP"
fi

echo "Fetching commit $COMMIT in $SRC_REPO ..." >&2
git -C "$SRC_REPO" fetch --quiet origin "$COMMIT" 2>/dev/null || true
git -C "$SRC_REPO" cat-file -e "$COMMIT" 2>/dev/null || {
  echo "error: commit $COMMIT not found in $SRC_REPO" >&2
  exit 1
}

# Diff summary against the previously vendored snapshot, if any.
OLD_IR="$VENDOR_DIR/4d-command-ir.json"
NEW_IR_TMP="$(mktemp)"
git -C "$SRC_REPO" show "$COMMIT:out/4d-command-ir.json" > "$NEW_IR_TMP"

if [[ -f "$OLD_IR" ]]; then
  python3 - "$OLD_IR" "$NEW_IR_TMP" <<'PYEOF'
import json, sys
old_ids = {c["id"] for c in json.load(open(sys.argv[1]))["commands"]}
new_ids = {c["id"] for c in json.load(open(sys.argv[2]))["commands"]}
added = sorted(new_ids - old_ids)
removed = sorted(old_ids - new_ids)
print(f"Commands added:   {len(added)}")
for x in added[:50]:
    print(f"  + {x}")
print(f"Commands removed: {len(removed)}")
for x in removed[:50]:
    print(f"  - {x}")
PYEOF
fi

mkdir -p "$VENDOR_DIR/methods"
mv "$NEW_IR_TMP" "$VENDOR_DIR/4d-command-ir.json"
git -C "$SRC_REPO" show "$COMMIT:out/synth_manifest.json" > "$VENDOR_DIR/synth_manifest.json"

rm -f "$VENDOR_DIR"/methods/Synth_*.4dm
ARCHIVE_TMP="$(mktemp -d)"
git -C "$SRC_REPO" archive "$COMMIT" -- Project/Sources/Methods | tar -x -C "$ARCHIVE_TMP"
cp "$ARCHIVE_TMP"/Project/Sources/Methods/Synth_*.4dm "$VENDOR_DIR/methods/"
rm -rf "$ARCHIVE_TMP"

COMMIT_FULL="$(git -C "$SRC_REPO" rev-parse "$COMMIT")"
COMMIT_DATE="$(git -C "$SRC_REPO" log -1 --format=%cI "$COMMIT_FULL")"
COMMIT_SUBJECT="$(git -C "$SRC_REPO" log -1 --format=%s "$COMMIT_FULL")"
FETCHED_AT="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
FILE_COUNT="$(ls "$VENDOR_DIR"/methods/Synth_*.4dm | wc -l | tr -d ' ')"

cat > "$VENDOR_DIR/COMMIT" <<EOF
repo=miyako/4d-static-docs
branch=main
commit=$COMMIT_FULL
commit_date=$COMMIT_DATE
commit_subject=$COMMIT_SUBJECT
fetched_at=$FETCHED_AT
files_vendored=4d-command-ir.json,synth_manifest.json,methods/Synth_*.4dm ($FILE_COUNT files)
EOF

echo "Vendored snapshot refreshed at $VENDOR_DIR (commit $COMMIT_FULL, $FILE_COUNT method files)." >&2
