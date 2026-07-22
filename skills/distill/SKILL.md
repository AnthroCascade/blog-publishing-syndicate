---
name: distill
description: Compact a skill, forte, or talent file — reduce volume while preserving imperatives, requirements, and interconnections. Presents before/after for author approval.
disable-model-invocation: true
argument-hint: "[file-path | skills | fortes | talents | all]"
---

# /distill — Claude Code Adapter

Implements: coordination command `distill`.
Command spec: `mobsta/prototype/syndicates/coordination/commands/distill.md`

Read the command spec before proceeding.

Follow `mobsta/prototype/syndicates/coordination/orchestrator-preamble.md`.

## Argument parsing

$ARGUMENTS is one of:

- **File path** — distill a single file
- **`skills`** — all skill SKILL.md files in this game
- **`fortes`** — all forte specs in the domain syndicate
- **`talents`** — all talent specs in the domain syndicate
- **`all`** — skills, then fortes, then talents

## Target resolution

- **skills:** Glob `.claude/skills/*/SKILL.md`
- **fortes:** Read syndicate.md, glob `fortes/*.md`
- **talents:** Glob `talents/*.md` in the syndicate

## Execution

Follow the command spec procedure. Fire
spec-distiller in its own Agent call per target file.

Read spec-distiller forte spec. For each target file:
- Read file contents
- Read related files in "Draws on" chain
- Compose Agent prompt with: spec, target file
  contents, related files. Step label:
  `[/distill — spec-distiller]`
- Instruction: return proposed distillation

Process files sequentially. Present each file's
changes individually for author approval (approve,
modify, skip) before moving to the next.
