---
name: ready
description: Assess publication readiness from artefact evidence. Pipeline progress, not metadata.
disable-model-invocation: true
argument-hint: "[caper-number]"
---

# /ready — Claude Code Adapter

Implements: blog-publishing command `ready`.
Command spec: `mobsta-prototype/syndicates/blog-publishing/commands/ready.md`

Read the command spec before proceeding.

## Argument parsing

$ARGUMENTS is optional.

- `/ready` — assess all unfinished capers
- `/ready 097` — assess a single caper in detail

**First token (optional):** caper number. Resolves
to `capers/<number>-*/` by glob. If multiple matches,
report the ambiguity and stop. If no match, report
and stop.

## Execution

Follow the command spec procedure. No fortes. The
orchestrator reads and assembles directly.

### Single caper mode

Read all artefacts in the caper directory. Follow
the command spec's single-caper procedure: inventory,
map to pipeline stages, read evaluation verdicts,
check draft quality, check turn.md corrections,
compare against published baseline.

### All capers mode

For each unfinished caper (everything in `capers/`
not in `published/`), run the lightweight all-capers
procedure from the command spec.

Read-only. No caper files or artefacts are modified.
