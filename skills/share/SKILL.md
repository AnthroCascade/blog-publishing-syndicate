---
name: share
description: Write platform-native text about a published or publishable article, in the author's voice. Same register everywhere — the container changes, the voice does not.
disable-model-invocation: true
argument-hint: "[caper-number]"
---

# /share — Claude Code Adapter

Implements: blog-publishing command `share`.
Command spec: `syndicates/blog-publishing/commands/share.md`

Read the command spec before proceeding.

Follow `syndicates/coordination/orchestrator-preamble.md`.

## Argument parsing

$ARGUMENTS contains the caper path.

## Execution

The command spec owns the procedure. The adapter adds
only the Claude Code mechanic: each forte runs in its
own Agent call, with its spec, talents, and context
composed inline.

Fire the **share-crafter** as one Agent call — resolved
platforms, forte spec and talents inline,
prior-articles.md and game.md corpus state. Step label:
`[/share — share-crafter]`. Write its output where the
command spec directs.
