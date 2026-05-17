---
name: finalize
description: Run deterministic publication-prep on the current draft. Converts straight ASCII quotes and apostrophes to typographic quotes. No fortes, no LLM calls. Invoke after /polish, before /promote.
disable-model-invocation: true
argument-hint: "[caper-path]"
---

# /finalize — Claude Code Adapter

Implements: blog-publishing command `finalize`.
Command spec: `mobsta-prototype/syndicates/blog-publishing/commands/finalize.md`

Read the command spec before proceeding.

## Argument parsing

$ARGUMENTS contains the caper path (e.g. `070` for caper `070-unsafe-at-any-speed`).

Resolve to the full path. If the caper is under `mobsta-prototype/games/emperors-new-code/capers/`, the target is `<caper-path>/artefacts/draft.md`.

## Execution

This is a deterministic pass. Do not dispatch agents. Do not write evaluation files.

### Step 1. Baseline check

Run:

```bash
python3 mobsta-prototype/tools/smart-quotes.py --check <target>
```

Report the result. If the file is already clean, state that and stop (no conversion needed).

### Step 2. Convert

If the file is dirty:

```bash
python3 mobsta-prototype/tools/smart-quotes.py <target>
```

The script writes in place and prints a summary (how many doubles and apostrophes converted, any remaining straight quotes).

### Step 3. Verify clean

Run `--check` again. Confirm exit 0.

### Step 4. Report

One short summary to the author:
- Before: N straight doubles, M straight apostrophes
- Converted: N doubles, M apostrophes
- After: clean (or, if not clean, what remains and why — a dirty result after conversion means the script hit a case it couldn't handle, not a tolerance)

## Boundary

Mechanical publication prep only. Voice is `/polish` or `/voice-pass`. Facts are `/verify`. Prose is `/draft`. Promotional text is `/promote`.

Does not fire fortes. Does not consume or produce evaluation files. Does not clear `artefacts/evaluations/`. Does not clear `turn.md`.
