---
name: publish
description: Record a publication and run the post-publication bookkeeping in one pass — move the caper to published/, draft the link-map entry per link-map.md's own rules, refresh the garden snapshot. The Substack paste stays manual.
disable-model-invocation: true
argument-hint: "[caper-path] [live-url] [date]"
---

# /publish — Claude Code Adapter

Implements: blog-publishing command `publish`.
Command spec: `syndicates/blog-publishing/commands/publish.md`

Read the command spec before proceeding.

## Argument parsing

$ARGUMENTS contains the caper path, then optionally the live URL and date. Missing URL or date: ask for them before doing anything. Resolve the caper by number glob against `capers/`; if it's already in `published/`, say so and offer to do only the missing steps (link-map entry, tend).

## Execution

Follow the command spec procedure.

**Move** with `git mv` when the game is under git, plain `mv` otherwise.

**Link-map entry.** Read the governing rules at the top of `published/link-map.md` before drafting — they are the spec, do not restate them from memory. Read `artefacts/prior-articles.md` for backward-link candidates and rewrite descriptions in the author's voice (link-map rule 6; voice spec: `context-bank/writers-voice.md`). Present the full entry for approval before appending.

**Tend** by following `syndicates/blog-publishing/commands/tend.md` — regenerate between the markers in `games/garden.md`.

Present the close-out in the author's register: what moved, what was appended, snapshot refreshed, `/share` is next when you want it.
