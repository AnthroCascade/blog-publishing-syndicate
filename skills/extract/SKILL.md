---
name: extract
description: Extract conversation history from Claude Code sessions into readable markdown transcripts.
argument-hint: "[SEARCH_TERM] [--list] [--all] [--out DIR]"
---

# Extract Conversations

Extracts human/assistant conversation history from Claude Code session files into readable markdown.

## Usage

`/extract` — extract the current session
`/extract SEARCH_TERM` — extract latest matching session (auto-routes output)
`/extract SEARCH_TERM --list` — list matching sessions without extracting
`/extract SEARCH_TERM --all` — extract all matching sessions
`/extract SEARCH_TERM --out DIR` — override output directory

## Procedure

Run the extraction:

- No arguments: `python3 ~/.claude/tools/extract-conversation.py`
- With arguments: `python3 ~/.claude/tools/extract-conversation.py --find $ARGUMENTS`

Report: how many sessions found, where extracted to.

## Output routing

When `--out` is not specified, the tool auto-routes:
1. Searches the project for a directory matching the search term that contains `artefacts/` (holonic unit)
2. If found: outputs to `{match}/artefacts/transcripts/`
3. If not found: falls back to `{project-root}/_transcripts/`

## What it extracts

- Human messages (text only)
- Assistant messages (text only)
- Thinking blocks (chain-of-thought reasoning)

## What it strips

- Tool use / tool result blocks
- System reminders, IDE tags, command tags

## Matching

Searches **human messages only** — not system context, CLAUDE.md, MEMORY.md, or tool results.

## Output

One markdown file per session: `session-YYYY-MM-DD-SESSIONID.md`. Re-running overwrites existing files.
