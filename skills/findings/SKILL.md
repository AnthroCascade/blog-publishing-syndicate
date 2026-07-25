---
name: findings
description: Surface the argument the evidence wants to make. Post-research, pre-compost. Maps default argument shape, evidence strength, author departures. No file output.
disable-model-invocation: true
argument-hint: "[caper-path]"
---

# /findings — Claude Code Adapter

Implements: blog-publishing command `findings`.
Command spec: `syndicates/blog-publishing/commands/findings.md`

Read the command spec before proceeding.

Follow `syndicates/coordination/orchestrator-preamble.md`.

## Argument parsing

$ARGUMENTS contains the caper path.

## Execution

Follow the command spec procedure.

### Step 1. Precondition

Check `artefacts/research.md` exists. If not, tell
the author to run `/research` first and stop.

### Step 2. Fire findings-synthesiser

Fire in its own Agent call. Read findings-synthesiser
forte spec and all talents from its "Draws on"
section. Compose Agent prompt with:

- Full findings-synthesiser forte spec — inline
- All talents from "Draws on" — inline
- caper.md — inline
- artefacts/research.md — inline
- game.md up to forte baseline marker — inline
- Step label: `[/findings — findings-synthesiser]`
- Instruction: produce the four-part synthesis
  (default argument, evidence strength map,
  departures, composting question). No file output.

### Step 3. Present to author

Relay the forte's output inline. No artefact file
written. The synthesis is ephemeral.
