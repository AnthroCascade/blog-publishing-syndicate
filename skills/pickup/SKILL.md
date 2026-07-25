---
name: pickup
description: Recover flow after an interrupted session. Reads the tail of the most recent prior transcript and reconstructs the last few turns, what was in flight, and the next action. A brief, not a dump.
argument-hint: "[SEARCH_TERM]"
---

# /pickup — Session Recovery

The IDE closed, the session died, flow is gone. This skill reads the tail of the previous session and hands back the cues to resume: the last few exchanges, what was mid-flight, the next step. Maximum ~25 lines of output. Never a full-session summary.

## Usage

`/pickup` — recover the most recent prior session
`/pickup 072` — recover the most recent prior session mentioning the term

## Procedure

1. **Locate the transcript.** Sessions live in `$HOME/.claude/projects/$(pwd | sed 's#[/.]#-#g')/*.jsonl`. The newest file is the *current* session — always skip it.
   - No argument: take the next-newest file.
   - With a search term: `grep -l` the term across the remaining files, take the newest match. If nothing matches, say so and list the five newest sessions with dates instead.

2. **Extract the tail.** Pull the last author and assistant text messages (not tool results, not system reminders):

   ```bash
   jq -r 'select(.type=="user" or .type=="assistant")
     | .type as $t | .message.content
     | (if type=="string" then . else (map(select(.type=="text")|.text)|join(" ")) end)
     | select(length>0) | select(startswith("<")|not)
     | "[\($t)] \(.)"' "$FILE" | tail -40
   ```

3. **Identify what was in flight.** From the same tail: the active caper (last `capers/<n>-` path mentioned), the last skill fired (last `<command-name>`), files being written (last Write/Edit paths).

4. **Present the pickup brief.** In the author's register. Exactly this shape:
   - **Session:** date, first line of work, one-line arc.
   - **Last exchanges:** the final 3–5 turns, each condensed to one line — the author's words near-verbatim, The Machine's compressed hard.
   - **In flight:** caper, skill/step, files touched.
   - **Next action:** one line — what the session was about to do when it died. If genuinely unclear, say "unclear — last author instruction was: …" rather than inventing one.

5. **Stop.** Do not resume the work, re-run skills, or open caper files. The author decides what happens next.

## Boundary

Reads transcripts only. Writes nothing. For a full readable transcript, use `/extract`; for a cleaned forward thread, use `/cleanse`.
