---
name: revise
description: Apply evaluation findings and author decisions to the draft. The orchestrator routes context to the drafter — it does not triage or filter findings.
disable-model-invocation: true
argument-hint: "[caper-number]"
---

# /revise — Claude Code Adapter

Implements: blog-publishing command `revise`.
Command spec: `mobsta/prototype/syndicates/blog-publishing/commands/revise.md`

Read the command spec before proceeding.

Follow `mobsta/prototype/syndicates/coordination/orchestrator-preamble.md`.

## Argument parsing

$ARGUMENTS contains the caper path.

## Execution

Follow the command spec procedure. Fire each step
in its own Agent call.

**Step 1: Drafter (revise mode).**

Print: `[1/2] Dispatching drafter (revise mode)...`

Read drafter forte spec and all talents from its
"Draws on" section. Compose Agent prompt with this
frame:

- turn.md contains the author's decisions — these
  override everything. Apply them.
- caper.md contains durable intent — findings that
  conflict with stated intent follow the author's
  intent, not the forte's judgment.
- The evaluation files contain forte findings. Apply
  every unambiguous fix. For findings that conflict
  with turn.md or caper.md intent, follow the
  author's stated intent.
- Preserve the author's voice. Do not rewrite
  sections that are not flagged.

Agent prompt includes:
- Forte spec and talents — inline
- Draft — inline
- caper.md, turn.md — inline
- ALL evaluation files — inline
- research.md, prior-articles.md, learnings.md — inline
- Step label: `[/revise — drafter]`
- Instruction: write revised draft to
  `artefacts/draft.md`, report changes and
  unresolvable findings

After the Agent returns, clear stale evaluations
per `mobsta/prototype/syndicates/coordination/commands/evaluation-phase-template.md`. Leave turn.md in
place for author review — do not delete it. See
`mobsta/prototype/syndicates/coordination/patterns/turn-taking.md` → "turn.md write
discipline".

**Step 2: Voice-guardian (revise mode).**

Print: `[2/2] Dispatching voice-guardian (revise mode)...`

Read voice-guardian forte spec (revise mode section)
and talents: voice-craft, cognition-sensing, editorial.
Compose Agent prompt with:

- Full forte spec (with revise mode section) — inline
- voice-craft, cognition-sensing, editorial talents — inline
- Revised draft (read from disk after step 1) — inline
- prior-articles.md, learnings.md — inline
- Step label: `[/revise — voice-guardian]`
- Instruction: write amended draft to
  `artefacts/draft.md`, write manifest to
  `artefacts/evaluations/forte-voice-guardian.md`
