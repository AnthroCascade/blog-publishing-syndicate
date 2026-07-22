---
name: protect
description: Fire the protector to test whether evaluation findings would improve the draft or just make it different. Runs after any evaluation command.
disable-model-invocation: true
argument-hint: "[caper-path]"
---

# /protect — Claude Code Adapter

Implements: blog-publishing command `protect`.
Command spec: `mobsta/prototype/syndicates/blog-publishing/commands/protect.md`

Read the command spec before proceeding.

Follow `mobsta/prototype/syndicates/coordination/orchestrator-preamble.md`.

## Argument parsing

$ARGUMENTS contains the caper path.

## Execution

Follow the command spec procedure. Fire the
protector in its own Agent call.

Read protector forte spec and all talents from its
"Draws on" section. Compose Agent prompt with:

- Full protector forte spec — inline
- All talents from "Draws on" — inline
- Current draft — inline
- caper.md, turn.md — inline
- All content forte evaluation files — inline
- Step label: `[/protect — protector]`
- Instruction: write to
  `artefacts/evaluations/forte-protector.md`

Print: `[1/1] Dispatching protector...`
