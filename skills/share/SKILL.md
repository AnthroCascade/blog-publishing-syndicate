---
name: share
description: Write platform-native text about a published or publishable article, in the author's voice. Same register everywhere — the container changes, the voice does not.
disable-model-invocation: true
argument-hint: "[caper-number]"
---

# /share — Claude Code Adapter

Implements: blog-publishing command `share`.
Command spec: `mobsta-prototype/syndicates/blog-publishing/commands/share.md`

Read the command spec before proceeding.

Follow `mobsta-prototype/syndicates/coordination/orchestrator-preamble.md`.

## Argument parsing

$ARGUMENTS contains the caper path.

## Execution

Follow the command spec procedure.

**Platform selection.** Use AskUserQuestion with
multiSelect to present the platform menu. Read the
distribution talent for the full platform list.
Pre-select Substack Notes and LinkedIn.

**Share-crafter.** Fire in its own Agent call
with: selected platforms, forte spec and talents
inline, prior-articles.md and game.md corpus state.
Step label: `[/share — share-crafter]`.

**Author review.** Present per-platform: the text
and format notes. Author chooses per platform:
approve, modify, skip.

**Write.** Record approved texts to
`artefacts/share.md` in the caper directory.
