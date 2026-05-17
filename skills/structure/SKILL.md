---
name: structure
description: Fire structural-thinker, thesis-sharpener, and continuity-thinker against a draft. Evaluates argument build, concept ownership, and series positioning.
disable-model-invocation: true
argument-hint: "[draft-file-path]"
---

# /structure — Claude Code Adapter

Implements: blog-publishing command `structure`.
Command spec: `mobsta-prototype/syndicates/blog-publishing/commands/structure.md`

Read the command spec before proceeding.

Follow `mobsta-prototype/syndicates/coordination/orchestrator-preamble.md` and
`mobsta-prototype/syndicates/coordination/commands/evaluation-phase-template.md`.

## Argument parsing

$ARGUMENTS contains the caper path.

## Execution

Follow the command spec and evaluation-phase-template
procedures. Dispatch fortes in groups per
`mobsta-prototype/syndicates/coordination/patterns/independent-evaluation.md`. Confirm
`artefacts/prior-articles.md` exists.

### Group 1 — content fortes (parallel)

Compose structural-thinker, thesis-sharpener, and
continuity-thinker Agent prompts, then fire all
three in a single message. Each prompt includes:
forte spec, resolved talents, shared context bundle,
and the step label `[/structure — <forte-name>]`.
Pass `prior-articles.md` to continuity-thinker as
additional context.

Wait for all to return before proceeding.

### Group 2 — human (async)

Present findings. Author fills or skips.

### Group 3 — protector (sequential)

Fire protector in its own Agent call. Include all
evaluation files. Step label:
`[/structure — protector]`.

### Group 4 — interrogator (sequential)

Fire interrogator in its own Agent call. Include
all evaluation files including protector's.
Step label: `[/structure — interrogator]`.
