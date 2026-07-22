---
name: polish
description: Fire voice-guardian and cognition-sensor against a draft. Evaluates voice consistency and cognitive presence.
disable-model-invocation: true
argument-hint: "[draft-file-path]"
---

# /polish — Claude Code Adapter

Implements: blog-publishing command `polish`.
Command spec: `mobsta/prototype/syndicates/blog-publishing/commands/polish.md`

Read the command spec before proceeding.

Follow `mobsta/prototype/syndicates/coordination/orchestrator-preamble.md` and
`mobsta/prototype/syndicates/coordination/commands/evaluation-phase-template.md`.

## Argument parsing

$ARGUMENTS contains the caper path.

## Execution

Follow the command spec and evaluation-phase-template
procedures. Dispatch fortes in groups per
`mobsta/prototype/syndicates/coordination/patterns/independent-evaluation.md`.

### Group 1 — content fortes (parallel)

Compose voice-guardian and cognition-sensor Agent
prompts, then fire both in a single message. Each
prompt includes: forte spec, resolved talents,
shared context bundle, and the step label
`[/polish — <forte-name>]`.

Wait for both to return before proceeding.

### Group 2 — human (async)

Present findings. Author fills or skips.

### Group 3 — protector (sequential)

Fire protector in its own Agent call. Include all
evaluation files. Step label:
`[/polish — protector]`.

### Group 4 — interrogator (sequential)

Fire interrogator in its own Agent call. Include
all evaluation files including protector's.
Step label: `[/polish — interrogator]`.
