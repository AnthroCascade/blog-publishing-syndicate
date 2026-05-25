---
name: promote
description: Fire promotion-crafter to generate platform-specific promotional text for a publishable article. Assesses platform fit and crafts text in the author's voice.
disable-model-invocation: true
argument-hint: "[draft-file-path]"
---

# /promote — Claude Code Adapter

Implements: blog-publishing command `promote`.
Command spec: `mobsta-prototype/syndicates/blog-publishing/commands/promote.md`

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

**Promotion-crafter.** Fire in its own Agent call
with: selected platforms, forte spec and talents
inline, prior-articles.md and game.md corpus state.
Step label: `[/promote — promotion-crafter]`.

**Author review.** Present per-platform: fit
assessment, rationale, promotional text, guidance.
Author chooses per platform: approve, modify, skip.

**Write.** Record approved texts to
`artefacts/promotion.md` in the caper directory.
