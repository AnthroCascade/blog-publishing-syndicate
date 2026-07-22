---
name: reception
description: Fire reader-proxy against a draft. Evaluates reader reception — where the target reader checks out, pushes back, nods, or gets confused.
disable-model-invocation: true
argument-hint: "[draft-file-path]"
---

# /reception — Claude Code Adapter

Implements: blog-publishing command `reception`.
Command spec: `mobsta/prototype/syndicates/blog-publishing/commands/reception.md`

Read the command spec before proceeding.

Follow `mobsta/prototype/syndicates/coordination/orchestrator-preamble.md` and
`mobsta/prototype/syndicates/coordination/commands/evaluation-phase-template.md`.

## Argument parsing

$ARGUMENTS contains the caper path.

## Execution

Follow the command spec and evaluation-phase-template
procedures.

### Group 1 — content forte

Compose reader-proxy Agent prompt. Include: forte
spec, resolved talents, shared context bundle, and
the step label `[/reception — reader-proxy]`.

Wait for it to return before proceeding.

### Group 2 — protector (sequential)

Fire protector in its own Agent call. Include all
evaluation files. Step label:
`[/reception — protector]`.

### Group 3 — interrogator (sequential)

Fire interrogator in its own Agent call. Include
all evaluation files including protector's.
Step label: `[/reception — interrogator]`.
