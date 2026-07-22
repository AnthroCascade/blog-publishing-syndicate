---
name: learn
description: Fire learning-capturer to identify patterns in author corrections and write to learnings.md.
disable-model-invocation: true
argument-hint: "[caper-path]"
---

# /learn — Claude Code Adapter

Implements: coordination command `learn`.
Command spec: `mobsta/prototype/syndicates/coordination/commands/learn.md`

Read the command spec before proceeding.

Follow `mobsta/prototype/syndicates/coordination/orchestrator-preamble.md`.

## Argument parsing

$ARGUMENTS contains the caper path.

## Execution

Follow the command spec procedure.

**Session summary composition.** The learning-capturer
can't access the conversation transcript. The
orchestrator reviews its own conversation context and
writes a concise summary: what the author corrected,
pushed back on, decided and why, flagged as recurring.
Be specific. Quote the author where possible. Name
which forte or output was being corrected.

If the session contains no author corrections or
pushback, say so and stop.

**Learning-capturer.** Fire in its own Agent call.
Compose Agent prompt with:
- Forte spec (inline)
- context-hierarchy talent (inline)
- Session summary (inline — primary input)
- learnings.md contents (inline)
- Evaluation file contents (if any, inline)
- caper.md (inline)
- game.md process learnings section (inline)
- Step label: `[/learn — learning-capturer]`
- Instruction: return proposed learnings

Print: `[1/1] Dispatching learning-capturer...`

**Author approval.** Present each proposed learning
individually. Author chooses: approve, modify, reject.
Write approved learnings to caper's `learnings.md`.
