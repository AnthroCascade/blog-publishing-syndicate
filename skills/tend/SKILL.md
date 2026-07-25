---
name: tend
description: Refresh the garden's derived caper inventory from the folder structure and report drift — new capers, state changes, pending turns, capers going stale. Records state; never assesses it.
disable-model-invocation: true
argument-hint: ""
---

# /tend — Claude Code Adapter

Implements: blog-publishing command `tend`.
Command spec: `syndicates/blog-publishing/commands/tend.md`

Read the command spec before proceeding.

## Argument parsing

$ARGUMENTS is empty. The command operates on all games.

## Execution

Follow the command spec procedure. No fortes, no Agent calls — the orchestrator scans and assembles directly.

Use Bash for the scan (`ls`, `find`, modification dates) rather than reading caper contents. Stage inference needs file presence only — do not open draft.md or caper.md during a tend.

Regenerate only between `<!-- tend:begin -->` and `<!-- tend:end -->` in `games/garden.md`. If the markers are missing, stop and tell the author where you propose to insert them — do not guess a placement into a hand-written file.

Present the drift report in the author's register: what's new, what moved, what's owed a turn, what's drifting stale. Counts and names, no judgment.
