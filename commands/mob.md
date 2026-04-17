# mob

Full evaluative pass against a draft. Fires all 7 content fortes in parallel, then human (asynchronous), then protector and interrogator (sequential). Use this when phase boundaries are unclear or the author wants a complete assessment. Phase-specific commands (`/structure`, `/polish`, `/research`, `/verify`) are the norm — `/mob` is the exception.

## Fortes

| Step | Forte | Mode | Receives additionally |
|---|---|---|---|
| 1 (parallel) | voice-guardian | evaluate | — |
| 1 (parallel) | cognition-sensor | evaluate | — |
| 1 (parallel) | structural-thinker | evaluate | — |
| 1 (parallel) | thesis-sharpener | evaluate | — |
| 1 (parallel) | fact-checker | evaluate | `research.md` |
| 1 (parallel) | research-assembler | evaluate | `research.md` |
| 1 (parallel) | continuity-thinker | evaluate | `prior-articles.md` |
| 2 (async) | human | evaluate | — |
| 3 (sequential) | protector | evaluate | all content forte evaluation files |
| 4 (sequential) | interrogator | evaluate | all evaluation files including protector |

No forte receives another forte's spec or output. Each fires independently against the draft.

## Coordination pattern

Independent evaluation, then async human, then sequential tail. Content fortes fire in parallel (one Agent call per forte, all dispatched in one message in Claude Code; concurrent API calls in in-concert). After they complete, the human forte fires asynchronously — the orchestrator pauses for the author, who fills or skips. Then the protector fires in its own Agent call and walks every finding. Then the interrogator fires in its own Agent call and tests all evaluation files for grounding, specificity, variance, and cross-forte similarity.

## Context requirements

Before fortes fire, load:

- `caper.md` — durable intent and decisions
- `turn.md` (if exists) — current pass instructions
- `artefacts/draft.md` — the draft being evaluated
- `artefacts/research.md` — source material (confirm existence)
- `artefacts/prior-articles.md` — corpus context (confirm existence)
- `game.md` — baseline context for every evaluative forte
- `syndicate.md` — syndicate definitions
- `learnings.md` — patterns and forte refinements
- Each forte's spec and all talents listed in its "Draws on" section

## Procedure

1. **Roll call.** Before firing, enumerate every forte. Mark each as Engaged, Skipped (author selection), or Generative (drafter). When the author selects specific fortes, unselected evaluative fortes are marked "Skipped (author selection)."

2. **Forte selection.** The author may specify which fortes to fire. If no fortes are specified, all 7 content fortes fire. If specific forte names are given, fire only those — skip the rest. Invalid forte names are an error; stop and report.

3. **Clear stale evaluations.** Clear `artefacts/evaluations/` before firing. Evaluations from a prior pass are stale.

4. **Execute content fortes independently.** Each forte receives: its own spec, its resolved talents, the shared context bundle (draft, caper.md, turn.md, game.md, research.md, learnings.md), and any forte-specific additions per the table above. No forte receives another forte's spec or output. After each forte writes, add it to `completed` in the plan.

5. **Human forte.** Present findings to the author. The author fills their evaluation or skips. This is asynchronous — the process pauses.

6. **Protector.** Reads all content forte evaluation files and the human evaluation. Tests each finding against six failure modes: echo convergence, lurching, phantom problems, overcorrection, faustian regression, scope extension. Add to `completed`.

7. **Interrogator.** Reads all evaluation files including the protector's. Tests for grounding, specificity, variance, and cross-forte similarity. Add to `completed`.

8. **Present to author.** Which fortes fired, key findings, evaluation file locations. Flag findings the interrogator marked shallow. The forte files are the evaluation — no synthesis.

9. **Capture learnings.** Note any patterns observed during evaluation.

## Output

- `artefacts/evaluations/forte-voice-guardian.md`
- `artefacts/evaluations/forte-cognition-sensor.md`
- `artefacts/evaluations/forte-structural-thinker.md`
- `artefacts/evaluations/forte-thesis-sharpener.md`
- `artefacts/evaluations/forte-fact-checker.md`
- `artefacts/evaluations/forte-research-assembler.md`
- `artefacts/evaluations/forte-continuity-thinker.md`
- `artefacts/evaluations/forte-protector.md` (from sequential tail)
- `artefacts/evaluations/forte-interrogator.md` (from sequential tail)
- `artefacts/mob-accounting.md`

## Settlement condition

All engaged forte evaluation files are written. Protector attacks are filed. Interrogator depth check is complete.

## Boundary

Delegates all evaluation to fortes. Delegates all prose to `draft`. The forte files are the evaluation — no synthesis files. Author decides; orchestrator executes. With forte selection, `mob` with specific fortes is equivalent to the corresponding phase command. Phase-specific invocations are the norm; `mob` is the exception.
