---
name: improve
description: Fire spec-evolver to read learnings and propose modifications to forte and talent specs. Continuous improvement for the mob.
disable-model-invocation: true
argument-hint: "[caper-path]"
---

# /improve — Claude Code Adapter

Implements: coordination command `improve`.
Command spec: `mobsta/prototype/syndicates/coordination/commands/improve.md`

Read the command spec before proceeding.

Follow `mobsta/prototype/syndicates/coordination/orchestrator-preamble.md`.

## Argument parsing

$ARGUMENTS contains the caper path.

## Execution

Follow the command spec procedure.

**Spec-evolver.** Fire in its own Agent call.
Compose Agent prompt with:
- Spec-evolver forte spec (inline)
- learnings.md contents (inline — primary input)
- All forte specs in the domain syndicate (inline)
- All talent specs in the domain syndicate (inline)
- game.md contents (for game-level learnings)
- Step label: `[/improve — spec-evolver]`
- Instruction: return proposals

**Author approval.** Present each proposal
individually per the command spec format. Author
chooses: approve, modify, reject.

**Apply changes.** For each approved proposal: read
target spec, apply exact change, confirm. Print:
`Applied: [forte] / [section]`

**Skill coherence.** After spec changes, assess
downstream skill implications per the command spec.
For each skill discrepancy, present a proposal.
Author chooses: approve, modify, reject, defer.

**Dispositions.** Update learnings.md with each
proposal's disposition per the command spec.
