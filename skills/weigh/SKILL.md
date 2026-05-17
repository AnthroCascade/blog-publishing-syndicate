---
name: weigh
description: Test whether a caper idea can survive investment before committing research or drafting effort.
disable-model-invocation: true
argument-hint: "[caper-path] [deep]"
---

# /weigh — Claude Code Adapter

Implements: blog-publishing command `weigh`.
Command spec: `mobsta-prototype/syndicates/blog-publishing/commands/weigh.md`

Read the command spec before proceeding.

Follow `mobsta-prototype/syndicates/coordination/orchestrator-preamble.md`.

## Argument parsing

$ARGUMENTS contains the caper path followed by an
optional depth flag.

- `/weigh 023` — Level 1 (quick assessment)
- `/weigh 023 deep` — Level 2 (research-informed)

**First token:** always the caper path.
**Second token (optional):** `deep` triggers Level 2.
Default is Level 1. If a token other than `deep` is
given, report the error and stop.

## Execution

Follow the command spec procedure. Fire the
pragmatic-sceptic in its own Agent call.

Read pragmatic-sceptic forte spec and resolved
talents. Compose Agent prompt with: spec, talents,
caper.md, game.md. Step label:
`[/weigh — pragmatic-sceptic]`. For Level 2,
the Agent uses WebSearch and WebFetch for landscape
and counterargument research.
