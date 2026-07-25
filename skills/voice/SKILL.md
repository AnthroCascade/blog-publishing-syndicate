---
name: voice
description: Fire voice-guardian in revise mode directly against the current draft. Applies surgical voice fixes, reports what changed, flags what needs author decision. No prior evaluation files required.
disable-model-invocation: true
argument-hint: "[caper-path]"
---

# /voice — Claude Code Adapter

Implements: blog-publishing command `voice-pass`.
Command spec: `syndicates/blog-publishing/commands/voice-pass.md`

Read the command spec before proceeding.

Follow `syndicates/coordination/orchestrator-preamble.md`.

## Argument parsing

$ARGUMENTS contains the caper path.

## Execution

Follow the command spec procedure. Fire each
voice-guardian pass in its own Agent call.

Read voice-guardian forte spec (revise mode section)
and talents: voice-craft, cognition-sensing,
editorial, critical-stance. Compose Agent prompt with:

- Full voice-guardian forte spec — inline
- voice-craft, cognition-sensing, editorial,
  critical-stance talents — inline
- Current draft — inline
- prior-articles.md — inline (if exists)
- caper.md contents — inline
- learnings.md — inline (if exists)
- Step label: `[/voice — voice-guardian]`
- Instruction: run the evaluation protocol, apply
  surgical fixes, write amended draft to
  `artefacts/draft.md`, write manifest and unresolved
  flags to `artefacts/evaluations/forte-voice-guardian.md`

If the command spec calls for a protector tail after
the voice loop, fire the protector in its own Agent
call.
