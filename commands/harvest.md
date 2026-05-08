# harvest

Survey all unfinished capers and present what each asks of the author. Classify by readiness, present grouped by readiness category. The author chooses.

## Fortes

| Step | Forte | Mode | Receives additionally |
|---|---|---|---|
| 1 | harvest | assess | all caper.md files, artefact inventory per caper, game.md corpus state |

## Coordination pattern

Single-agent. The harvest forte fires once with the full caper inventory.

## Context requirements

Before the harvest forte fires, read:

- `game.md` — corpus state, existing articles, process learnings
- Every `capers/*/caper.md` — all unfinished capers
- Artefact inventory per caper (which of: research.md, draft.md, evaluation files, etc. exist)
- Harvest forte spec and all talents from its "Draws on" section

## Procedure

1. **Load all capers.** Read every caper.md in the game. Also read game.md for corpus state.

2. **Inventory artefacts.** For each caper, check which artefacts are present: status, research.md, draft.md, evaluation files, code-evidence.md, prior-articles.md, etc.

3. **Fire harvest forte.** Pass the caper inventory and corpus context to the harvest forte. The forte applies its readiness taxonomy and author-diagnostic protocol. It classifies each caper by readiness category.

4. **Present the garden.** Capers grouped by readiness category. For each caper: title and one-line angle, what exists (artefacts present), what the caper asks of the author.

5. **Note inter-caper connections.** After presenting the garden, note connections between capers that might inform the author's choice — e.g. "007 and 009 share findings and could inform each other" or "006 would update the corpus state that 011 depends on."

## Output

No files written. Harvest is a read-only survey presented to the author.

## Settlement condition

All unfinished capers presented. Readiness categories assigned. Inter-caper connections noted. Author has the information to choose.
