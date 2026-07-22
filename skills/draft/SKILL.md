---
name: draft
description: Fire the drafter to draft or redraft. The orchestrator composes and delegates — it does not write prose. Run /mob or phase skills separately to evaluate.
disable-model-invocation: true
argument-hint: "[caper-path] [filename]"
---

# /draft — Claude Code Adapter

Implements: blog-publishing command `draft`.
Command spec: `mobsta/prototype/syndicates/blog-publishing/commands/draft.md`

Read the command spec before proceeding.

Follow `mobsta/prototype/syndicates/coordination/orchestrator-preamble.md`.

## Argument parsing

$ARGUMENTS is the caper path, then an optional target
filename.

- First token: the caper path (e.g. `072`).
- Second token (optional): a bare filename — the file
  under the caper's `artefacts/` to draft into (e.g.
  `process-test.md`). When omitted, the target is
  `draft.md`.

The target file is what the drafter writes and the
voice-guardian amends. Mode follows the target: if it
already holds content, redraft (incorporating turn.md
decisions and evaluation findings); if it is empty or
absent, draft cold from source.

## Syndicate resolution

Follow the command spec's "Syndicate resolution"
section. Additionally, before loading the command
spec itself: if the resolved syndicate defines its
own `commands/draft.md`, use that as the command
spec. Otherwise use blog-publishing's.

## Execution

Follow the command spec procedure. Fire each step
in its own Agent call. Print step progress as
`[N/total] step name...` — the total depends on
the resolved artefact mapping (2 for
blog-publishing, 4 for radio-segment).
