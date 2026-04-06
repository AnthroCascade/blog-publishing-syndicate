# weigh

Test whether a caper idea can survive investment before committing research or drafting effort. The pragmatic-sceptic forte provides adversarial assessment — opinion, not helpfulness. Two levels: Level 1 (quick, works from what exists) and Level 2 (research-informed, adds landscape scanning and counterargument testing).

## Fortes

| Step | Forte | Mode | Receives additionally |
|---|---|---|---|
| 1 | pragmatic-sceptic | Level 1 or Level 2 | raw material, game.md corpus state |

## Coordination pattern

Single-agent. The pragmatic-sceptic fires once. At Level 2, it additionally launches web searches for landscape and counterargument research.

## Context requirements

Before the pragmatic-sceptic fires, load:

- `caper.md` — intent, angle, corpus reach, status
- Any raw material in the caper directory or referenced by caper.md (transcripts, notes, source articles, research.md if it exists)
- `game.md` — corpus state, existing articles
- Pragmatic-sceptic forte spec and all talents from its "Draws on" section

## Procedure

1. **Determine level.** Default is Level 1 (quick assessment). If the author specifies `deep`, use Level 2 (research-informed). No other flags are valid.

2. **Fire pragmatic-sceptic (Level 1).** Run the forte's Level 1 protocol (tests 1-5). Material is caper.md, raw material, and corpus context from game.md.

3. **Early termination.** If a Level 1 test fails decisively (e.g. the thesis test), deliver the verdict at that point. Do not continue testing to be thorough. The idea failed where it failed.

4. **Fire pragmatic-sceptic (Level 2, if `deep`).** Run all Level 1 tests, then Level 2 tests (6-8). Tests 6-8 require web search for landscape scanning and counterargument testing.

5. **Deliver verdict.** Present the recommendation per the forte's output format: verdict first, then reasoning. The four verdicts:
   - **Proceed** — the idea holds, invest in it
   - **Compost** — not ready, let it sit longer
   - **Re-vehicle** — the idea has merit but needs a different form (different caper, different angle, different series)
   - **Kill** — the idea does not hold, don't invest

6. **Author decides.** The author may accept the verdict, override it with reasoning, or ask for Level 2 if Level 1 was run. Do not advocate for a verdict. Present it and wait.

## Output

No files written. This is a read-only assessment. It does not modify caper.md or create evaluation files. This is pre-workflow, not an evaluation pass.

## Settlement condition

Verdict delivered. Author has decided whether to proceed, compost, re-vehicle, or kill.

## Boundary

Read-only assessment. Does not modify caper.md or any artefacts. Does not create evaluation files. The pragmatic-sceptic does not re-engage during workflow phases — this is a gateway decision before the mob engages.
