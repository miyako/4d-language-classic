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
#                        blob-filtered clone from https://github.com/miyako/4d-static-docs.git
#                        is made in this repository and removed afterwards.
#
# What it does:
#   1. Reads out/4d-command-ir.json, out/synth_manifest.json, and
#      Project/Sources/Methods/Synth_*.4dm at the given commit from the
#      source repo (via `git show` / `git archive`, no working-tree checkout
#      required).
#   2. Overwrites data/vendor/4d-command-ir.json, data/vendor/synth_manifest.json,
#      and data/vendor/methods/*.4dm in this repo.
#   3. Writes data/vendor/COMMIT with the pinned commit sha, its date/subject,
#      and the fetch timestamp. Copies source snapshot/inventory evidence,
#      when present, and verifies their corpus/manifest/method hashes.
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

WORK_DIR="$REPO_ROOT/.refresh-vendor-work.$$"
mkdir "$WORK_DIR"
cleanup() {
  rm -rf "$WORK_DIR"
}
trap cleanup EXIT

if [[ -z "$SRC_REPO" ]]; then
  echo "Cloning $REMOTE_URL into $WORK_DIR/source ..." >&2
  git clone --quiet --filter=blob:none "$REMOTE_URL" "$WORK_DIR/source"
  SRC_REPO="$WORK_DIR/source"
fi

echo "Fetching commit $COMMIT in $SRC_REPO ..." >&2
if ! git -C "$SRC_REPO" cat-file -e "$COMMIT^{commit}" 2>/dev/null; then
  git -C "$SRC_REPO" fetch --quiet origin "$COMMIT"
fi
git -C "$SRC_REPO" cat-file -e "$COMMIT^{commit}" 2>/dev/null || {
  echo "error: commit $COMMIT not found in $SRC_REPO" >&2
  exit 1
}

# Diff summary against the previously vendored snapshot, if any.
OLD_IR="$VENDOR_DIR/4d-command-ir.json"
COMMIT="$(git -C "$SRC_REPO" rev-parse "$COMMIT^{commit}")"
NEW_IR_TMP="$WORK_DIR/4d-command-ir.json"
git -C "$SRC_REPO" show "$COMMIT:out/4d-command-ir.json" > "$NEW_IR_TMP"
git -C "$SRC_REPO" show "$COMMIT:out/synth_manifest.json" > "$WORK_DIR/synth_manifest.json"
git -C "$SRC_REPO" archive "$COMMIT" -- Project/Sources/Methods | tar -x -C "$WORK_DIR"

# Preserve source-bound evidence as committed blobs, not local workspace reports.
for artifact in r5_snapshot.json r5_conflict_inventory.json; do
  if git -C "$SRC_REPO" cat-file -e "$COMMIT:out/$artifact" 2>/dev/null; then
    git -C "$SRC_REPO" show "$COMMIT:out/$artifact" > "$WORK_DIR/$artifact"
  fi
done

python3 - "$WORK_DIR" <<'PYEOF'
import hashlib, json, pathlib, sys
work = pathlib.Path(sys.argv[1])
ir = json.loads((work / "4d-command-ir.json").read_text())
manifest = json.loads((work / "synth_manifest.json").read_text())
commands = {c["id"]: c for c in ir["commands"]}
assert len(commands) == len(ir["commands"]), "duplicate command ids"
files = manifest["files"]
ids = [m["command_id"] for m in files.values()]
expected = {c["id"] for c in commands.values() if c["theme"] != "4D-View-Pro"}
assert len(ids) == len(set(ids)) and set(ids) == expected, "manifest/corpus mismatch"
methods = work / "Project/Sources/Methods"
assert {p.name for p in methods.glob("Synth_*.4dm")} == {
    pathlib.Path(p).name for p in files
}, "method/manifest mismatch"
snapshot = work / "r5_snapshot.json"
if snapshot.exists():
    evidence = json.loads(snapshot.read_text())
    assert evidence["classic"]["commands"] == len(commands)
    assert evidence["classic"]["methods"] == len(files)
    for local, source in [
        ("4d-command-ir.json", "out/4d-command-ir.json"),
        ("synth_manifest.json", "out/synth_manifest.json"),
        ("r5_conflict_inventory.json", "out/r5_conflict_inventory.json"),
    ]:
        assert hashlib.sha256((work / local).read_bytes()).hexdigest() == evidence["artifactsSha256"][source], source
    for path in files:
        source = "Project/" + path
        assert hashlib.sha256((work / source).read_bytes()).hexdigest() == evidence["methodsSha256"][source], source
PYEOF

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
cp "$WORK_DIR/synth_manifest.json" "$VENDOR_DIR/synth_manifest.json"

rm -f "$VENDOR_DIR"/methods/Synth_*.4dm
cp "$WORK_DIR"/Project/Sources/Methods/Synth_*.4dm "$VENDOR_DIR/methods/"
for artifact in r5_snapshot.json r5_conflict_inventory.json; do
  rm -f "$VENDOR_DIR/$artifact"
  if [[ -f "$WORK_DIR/$artifact" ]]; then
    cp "$WORK_DIR/$artifact" "$VENDOR_DIR/$artifact"
  fi
done

COMMIT_FULL="$(git -C "$SRC_REPO" rev-parse "$COMMIT")"
COMMIT_DATE="$(git -C "$SRC_REPO" log -1 --format=%cI "$COMMIT_FULL")"
COMMIT_SUBJECT="$(git -C "$SRC_REPO" log -1 --format=%s "$COMMIT_FULL")"
FETCHED_AT="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
FILE_COUNT="$(ls "$VENDOR_DIR"/methods/Synth_*.4dm | wc -l | tr -d ' ')"

cat > "$VENDOR_DIR/COMMIT" <<EOF
repo=miyako/4d-static-docs
source_ref=$COMMIT_FULL
commit=$COMMIT_FULL
commit_date=$COMMIT_DATE
commit_subject=$COMMIT_SUBJECT
fetched_at=$FETCHED_AT
files_vendored=4d-command-ir.json,synth_manifest.json,methods/Synth_*.4dm ($FILE_COUNT files)
EOF
for artifact in r5_snapshot.json r5_conflict_inventory.json; do
  if [[ -f "$VENDOR_DIR/$artifact" ]]; then
    echo "provenance_artifact=$artifact" >> "$VENDOR_DIR/COMMIT"
  fi
done

echo "Vendored snapshot refreshed at $VENDOR_DIR (commit $COMMIT_FULL, $FILE_COUNT method files)." >&2
