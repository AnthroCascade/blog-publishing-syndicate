---
name: pick
description: Pick a ripe caper from the garden and draft a short post (LinkedIn / short Substack). No mob. Author's voice, one claim, direct.
argument-hint: "[caper-number or 'garden' to review what's ripe]"
---

# /pick — Claude Code Adapter

Implements: blog-publishing command `pick`.
Command spec: `mobsta/prototype/syndicates/blog-publishing/commands/pick.md`

Read the command spec before proceeding.

## Argument parsing

$ARGUMENTS contains a caper number or `garden`.

- `/pick garden` — read garden.md, show what's ripe,
  recommend what to pick now
- `/pick 006` — draft a short post from caper 006

If `garden` or empty, stop after showing what's ripe.
Wait for the author to choose.

## Execution

Follow the command spec procedure. No sub-agents.
No fortes. No mob pass. Direct drafting in the main
conversation.
