---
name: verify
description: Fire fact-checker with web search against primary sources. External verification of claims in a near-final draft.
disable-model-invocation: true
argument-hint: "[draft-file-path]"
---

# /verify — Claude Code Adapter

Implements: blog-publishing command `verify`.
Command spec: `mobsta/prototype/syndicates/blog-publishing/commands/verify.md`

Read the command spec before proceeding.

Follow `mobsta/prototype/syndicates/coordination/orchestrator-preamble.md`.

## Argument parsing

$ARGUMENTS contains the caper path.

## Execution

Follow the command spec procedure. Fire the
fact-checker in its own Agent call.

Read fact-checker forte spec (verify mode section)
and resolved talents. Compose Agent prompt with:
spec, talents, draft, research.md, scoped verify
targets, caper.md, turn.md. Step label:
`[/verify — fact-checker]`. The Agent uses
WebSearch and WebFetch for external verification.

Web-search only the scoped verify targets. Report
each as: verified, unverified, or contradicted.
Flag characterisation mismatches.
