---
name: mob
description: Fire evaluative fortes against a draft. All 7 by default, or specify which fortes to run.
disable-model-invocation: true
argument-hint: "[caper-path] [forte-name forte-name ...]"
---

# /mob — Claude Code Adapter

Implements: blog-publishing command `mob`.
Command spec: `mobsta/prototype/syndicates/blog-publishing/commands/mob.md`

Read the command spec before proceeding.

Follow `mobsta/prototype/syndicates/coordination/orchestrator-preamble.md` and
`mobsta/prototype/syndicates/coordination/commands/evaluation-phase-template.md`.

## Argument parsing

$ARGUMENTS contains the caper path followed by
optional forte names.

- `/mob 020` — all 7 evaluative fortes
- `/mob 020 voice-guardian cognition-sensor` — fire
  only those two

**First token:** always the caper path.
**Remaining tokens (optional):** forte names to fire
directly. If an invalid forte name is given, report
the error and stop.

## Syndicate resolution

Follow the command spec's "Syndicate resolution"
section. The resolved primary output path replaces
`artefacts/draft.md` in all context loading and
forte dispatch.

## Execution

Follow the command spec procedure and
evaluation-phase-template. Dispatch fortes in
groups per `mobsta/prototype/syndicates/coordination/patterns/independent-evaluation.md`.

### Group 1 — content fortes (parallel)

Compose all content forte Agent prompts, then fire
them in a single message (multiple Agent tool calls).
They execute concurrently. Each prompt includes:
forte spec, resolved talents, shared context bundle
(the resolved primary output, caper.md, turn.md,
game.md, research.md, learnings.md, the syndicate's
artefact format section), forte-specific additions
per the dispatch table, and the step label
`[/mob — <forte-name>]`.

Wait for all to return before proceeding.

### Group 2 — human (async)

Present findings. Author fills or skips.

### Group 3 — protector (sequential)

Fire protector in its own Agent call. Include all
evaluation files from groups 1–2 in the prompt.
Step label: `[/mob — protector]`.

### Group 4 — interrogator (sequential)

Fire interrogator in its own Agent call. Include
all evaluation files including protector's.
Step label: `[/mob — interrogator]`.
