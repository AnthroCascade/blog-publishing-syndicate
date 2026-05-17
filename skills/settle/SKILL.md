---
name: settle
description: Reconcile turn.md decisions into caper.md. Removes superseded material, promotes durable decisions, clears consumed turn instructions.
disable-model-invocation: true
argument-hint: "[caper-path]"
---

# /settle — Claude Code Adapter

Implements: coordination command `settle`.
Command spec: `mobsta-prototype/syndicates/coordination/commands/settle.md`

Read the command spec before proceeding.

Follow `mobsta-prototype/syndicates/coordination/orchestrator-preamble.md`.

## Argument parsing

$ARGUMENTS contains the caper path.

## Execution

Follow the command spec procedure. Fire the
settler in its own Agent call.

**Gate check.** If turn.md does not exist, report
"nothing to settle" and stop.

**Settler.** Read settler forte spec and its
talent (context-hierarchy). Compose Agent prompt
with:

- Settler forte spec — inline
- context-hierarchy talent — inline
- caper.md — inline
- turn.md — inline
- draft.md — inline
- research.md — inline (if exists)
- Step label: `[/settle — settler]`
- Instruction: return proposed caper.md, proposed
  turn.md, and classification manifest

Print: `[1/1] Dispatching settler...`

**Author approval.** Present the classification
manifest grouped by action (promotions, removals,
retentions). Author approves, modifies, or rejects
per group. Apply approved changes.
