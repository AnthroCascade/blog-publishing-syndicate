---
name: do
description: Execute a plain-English instruction. Housekeeping, file edits, refactoring, any task that doesn't map to a specialised skill command.
argument-hint: "<plain English instruction>"
---

# Do — General Purpose Execution

For work that doesn't map to a specialised skill.
Garden maintenance, file structure changes,
mechanical edits, status updates, cleanup.

## Usage

`/do add a Published section to all caper.md files`
`/do rename all evaluation directories to evals`
`/do update garden.md to reflect current state`

## Procedure

### 1. Parse the instruction

Read the plain English argument. If ambiguous,
ask one clarifying question. Don't over-interpret.

### 2. Execute

Do the work. Use agents for bulk operations.
Use direct edits for small changes.

No mob. No fortes. No evaluation passes.
This is direct execution of the author's
instruction.

### 3. Report

State what was done. List files modified.
Nothing else.

## Boundary

If the instruction maps to a specialised skill
(`/draft`, `/mob`, `/revise`, etc.), say so and
recommend that skill instead. `/do` is not a
shortcut around the mob.
