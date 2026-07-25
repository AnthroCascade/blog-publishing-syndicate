---
name: foundations
description: Report drift between foundation documents and current specs. Both directions — specs-from-vision and foundations-from-practice. Diagnostic only.
disable-model-invocation: true
---

# /foundations — Claude Code Adapter

Implements: coordination command `foundations`.
Command spec: `syndicates/coordination/commands/foundations.md`

Read the command spec before proceeding.

## Argument parsing

$ARGUMENTS is empty. The command operates on the
current game's syndicate.

## Execution

Follow the command spec procedure. No fortes. The
orchestrator reads and compares directly.

### Step 1. Read foundations

Read all foundation documents (e.g.
`foundations/ARCHITECTURE.md`,
`foundations/DEMOCRATIZATION.md`).

### Step 2. Read current specs

Read all forte specs, talent specs, syndicate
definitions, and command specs for the domain
syndicate and the coordination syndicate.

### Step 3. Report specs-from-vision drift

For each drift point: name the foundation principle,
name the spec that diverges, describe the gap. Flag
intentional evolution without assuming it's a problem.

### Step 4. Report foundations-from-practice drift

Patterns established in specs but not reflected in
foundations. Stale vision is as much a problem as
stale specs.

### Step 5. Present to author

List each drift point with direction and the specific
documents involved. The author decides what warrants
action.

Read-only. No files modified.
