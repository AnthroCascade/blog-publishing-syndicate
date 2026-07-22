---
name: harvest
description: Survey all unfinished capers and present what each asks of the author, so they can feel which one to pick.
disable-model-invocation: true
---

# /harvest — Claude Code Adapter

Implements: blog-publishing command `harvest`.
Command spec: `mobsta/prototype/syndicates/blog-publishing/commands/harvest.md`

Read the command spec before proceeding.

Follow `mobsta/prototype/syndicates/coordination/orchestrator-preamble.md`.

## Argument parsing

$ARGUMENTS is empty. The command operates on the
entire game.

## Execution

Follow the command spec procedure. Fire the
harvest forte in its own Agent call.

Read harvest forte spec and resolved talents.
Compose Agent prompt with: spec, talents, all
caper.md files, artefact inventory per caper,
game.md corpus state. Step label:
`[/harvest — harvest]`.

Read-only. No caper files or artefacts are modified.
