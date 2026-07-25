---
name: interrogate
description: Test evaluation findings for depth. Flags shallow, generic, or structurally identical findings across forte evaluations.
disable-model-invocation: true
argument-hint: "[caper-path]"
---

# /interrogate — Claude Code Adapter

Implements: coordination command `interrogate`.
Command spec: `syndicates/coordination/commands/interrogate.md`

Read the command spec before proceeding.

Follow `syndicates/coordination/orchestrator-preamble.md`.

## Argument parsing

$ARGUMENTS contains the caper path.

- `/interrogate 046` — interrogate the current
  evaluation files in that caper

## Execution

Follow the command spec procedure. Fire the
interrogator in its own Agent call.

Read the interrogator forte spec at:
`syndicates/coordination/fortes/interrogator.md`

Resolve talents: governance, prosecution (from
coordination syndicate talents). Compose Agent
prompt with: spec, talents, draft, all evaluation
files, caper.md, turn.md. Step label:
`[/interrogate — interrogator]`. The Agent writes
to `artefacts/evaluations/forte-interrogator.md`.

Print: `[1/1] Dispatching interrogator...`
