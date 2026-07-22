#!/usr/bin/env bash
#
# install-skills.sh — sync blog-publishing skill adapters into the project's
# .claude/skills/ so their slash commands are registered.
#
# .claude/skills/ holds *copies* of the adapters in this syndicate's skills/.
# Without a copy, a skill marked `disable-model-invocation: true` (e.g. /anchor,
# /foundations) has no trigger at all. This script keeps the copies in step with
# source so adding or editing a skill never silently fails to install.
#
# Usage:
#   ./install-skills.sh            # additive: copy new + update changed (default)
#   ./install-skills.sh --prune    # also remove installed skills absent from source
#   ./install-skills.sh --dry-run  # report what would change, touch nothing
#
# Flags combine, e.g. --prune --dry-run.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$SCRIPT_DIR/skills"
# Workspace root is four levels up: blog-publishing -> syndicates -> prototype -> mobsta -> workspace.
REPO_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"
DST="$REPO_ROOT/.claude/skills"

PRUNE=0
DRY_RUN=0
for arg in "$@"; do
  case "$arg" in
    --prune)   PRUNE=1 ;;
    --dry-run) DRY_RUN=1 ;;
    *) echo "unknown flag: $arg" >&2; exit 2 ;;
  esac
done

[ -d "$SRC" ] || { echo "source skills dir not found: $SRC" >&2; exit 1; }
mkdir -p "$DST"

run() { [ "$DRY_RUN" -eq 1 ] && echo "  would: $*" || "$@"; }

added=0 updated=0 unchanged=0 pruned=0

# A skill is any source subdir containing SKILL.md (skips loose files like the
# skill-relationships diagrams).
for skill_path in "$SRC"/*/; do
  [ -f "$skill_path/SKILL.md" ] || continue
  name="$(basename "$skill_path")"
  target="$DST/$name"

  if [ ! -d "$target" ]; then
    echo "+ add     $name"
    run cp -R "$skill_path" "$target"
    added=$((added + 1))
  elif ! diff -rq "$skill_path" "$target" >/dev/null 2>&1; then
    echo "~ update  $name"
    run rm -rf "$target"
    run cp -R "$skill_path" "$target"
    updated=$((updated + 1))
  else
    unchanged=$((unchanged + 1))
  fi
done

if [ "$PRUNE" -eq 1 ]; then
  for target in "$DST"/*/; do
    [ -d "$target" ] || continue
    name="$(basename "$target")"
    if [ ! -f "$SRC/$name/SKILL.md" ]; then
      echo "- prune   $name (not in source)"
      run rm -rf "$target"
      pruned=$((pruned + 1))
    fi
  done
fi

echo
suffix=""; [ "$DRY_RUN" -eq 1 ] && suffix=" (dry-run)"
echo "added=$added updated=$updated unchanged=$unchanged pruned=$pruned$suffix"
[ "$PRUNE" -eq 0 ] && echo "note: run with --prune to remove installed skills no longer in source"
