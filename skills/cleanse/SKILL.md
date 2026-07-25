---
name: cleanse
description: Clean a conversation transcript by extracting the positive forward thread and stripping corrective noise. Produces a clean transcript for use as fresh context in subsequent sessions.
argument-hint: "[transcript-file-path]"
---

# /cleanse — Claude Code Adapter

Implements: context command `cleanse`.
Command spec: `syndicates/context/commands/cleanse.md`

Read the command spec before proceeding.

## Argument parsing

$ARGUMENTS contains an optional transcript file path.

- If provided: use that file path as the source.
- If not provided: look for the most recent file in
  the current caper's `artefacts/transcripts/`.
- If neither: stop and report — no source found.

## Execution

**[/cleanse — step 1: load]**
Read all files listed in the command spec's context
requirements before proceeding. All of them.

**[/cleanse — step 2: source]**
Determine and read the source transcript.

**[/cleanse — step 3: execute thread-extractor]**
Fire thread-extractor as a sub-agent. Pass inline:
the forte spec, both talent files, and the full
source transcript content.

**[/cleanse — step 4: write output]**
Write clean transcript to `{source-filename}-clean.md`
in the same directory as the source file.

**[/cleanse — step 5: report]**
Report: source path, output path, message counts
(total, signal, bridge, noise).
