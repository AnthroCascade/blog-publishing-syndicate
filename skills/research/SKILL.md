---
name: research
description: Fire research-assembler and fact-checker to build and verify research.md. Settles once claims are sourced.
disable-model-invocation: true
argument-hint: "[caper-path]"
---

# /research — Claude Code Adapter

Implements: blog-publishing command `research`.
Command spec: `mobsta-prototype/syndicates/blog-publishing/commands/research.md`

Read the command spec before proceeding.

Follow `mobsta-prototype/syndicates/coordination/orchestrator-preamble.md`.

## Argument parsing

$ARGUMENTS contains the caper path.

## Syndicate resolution

Before execution, resolve the game's syndicate.
Research output (`artefacts/research.md`) is the same
across syndicates — the resolution is needed for
context loading, not artefact mapping.

1. From the caper path, find the game directory.
2. Read `game.md` — note the syndicate name.
3. Read the syndicate spec for context requirements.
4. If the syndicate has `commands/research.md`, use
   it. Otherwise use blog-publishing's.

## Execution

Follow the command spec procedure. Fire each forte
in its own Agent call in sequential-pipeline order
(research-assembler first, then fact-checker).

For each forte: read its spec and resolved talents,
compose the Agent prompt with spec, talents, and
context inline. Include the step label
`[/research — <forte-name>]`. The Agent executes
per the spec and writes the output file.
