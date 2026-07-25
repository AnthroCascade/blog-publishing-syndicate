---
name: prospect
description: Scan the web for recent articles that connect to the corpus, propose angles, and set up capers with findings.
disable-model-invocation: true
---

# /prospect — Claude Code Adapter

Implements: blog-publishing command `prospect`.
Command spec: `syndicates/blog-publishing/commands/prospect.md`

Read the command spec before proceeding.

Follow `syndicates/coordination/orchestrator-preamble.md`.

## Argument parsing

$ARGUMENTS is empty. The command operates on the
entire game.

## Execution

Follow the command spec procedure. Fire the
prospect forte in its own Agent call.

Read prospect forte spec and resolved talents.
Compose Agent prompt with: spec, talents, game.md,
prior-articles.md, garden.md. Step label:
`[/prospect — prospect]`. The Agent uses WebSearch
and WebFetch for each thematic strand it identifies.

**Caper numbering.** Check ALL game directories
before assigning caper numbers. The next available
number is shared across all games.
