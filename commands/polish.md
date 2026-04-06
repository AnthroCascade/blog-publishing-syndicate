# polish

Evaluate voice consistency and cognitive presence. Two content fortes fire in parallel, then human (asynchronous), then protector and interrogator (sequential). This is the polish phase — it tests whether the draft sounds like the author and whether cognitive presence is confirmed (not AI default patterns).

## Fortes

| Step | Forte | Mode | Receives additionally |
|---|---|---|---|
| 1 (parallel) | voice-guardian | evaluate | — |
| 1 (parallel) | cognition-sensor | evaluate | — |
| 2 (async) | human | evaluate | — |
| 3 (sequential) | protector | evaluate | all content forte evaluation files |
| 4 (sequential) | interrogator | evaluate | all evaluation files including protector |

## Coordination pattern

Parallel evaluation, then async human, then sequential tail. Follows the evaluation phase template. Content fortes fire simultaneously against the draft. Human fires asynchronously. Protector tests findings. Interrogator tests depth.

## Context requirements

Before fortes fire, load:

- `caper.md` — durable intent and decisions
- `turn.md` (if exists) — current pass instructions
- `artefacts/draft.md` — the draft being evaluated
- `artefacts/research.md` — source material
- `game.md` — baseline context for every evaluative forte
- `syndicate.md` — syndicate definitions
- `learnings.md` — patterns and forte refinements
- Each forte's spec and all talents from its "Draws on" section

## Procedure

1. **Clear stale evaluations.** Clear `artefacts/evaluations/` before firing.

2. **Fire content fortes in parallel.** Voice-guardian and cognition-sensor each receive their own spec, resolved talents, and the shared context bundle. No forte receives another forte's spec or output.

3. **Human forte.** Present findings to the author. The author fills their evaluation or skips.

4. **Protector.** Reads all content forte evaluation files. Tests each finding against six failure modes.

5. **Interrogator.** Reads all evaluation files including the protector's. Tests for grounding, specificity, variance, and cross-forte similarity.

6. **Present to author.** Which fortes fired, key findings, evaluation file locations. Flag findings the interrogator marked shallow. The forte files are the evaluation.

7. **Capture learnings.** Note any patterns observed.

## Output

- `artefacts/evaluations/forte-voice-guardian.md`
- `artefacts/evaluations/forte-cognition-sensor.md`
- `artefacts/evaluations/forte-interrogator.md`
- `artefacts/mob-accounting.md`

## Settlement condition

Voice is clean. Cognitive presence is confirmed. Protector attacks filed.

## Boundary

Evaluates voice and cognitive presence only. Structure is `structure`. Facts are `verify`. Prose is `draft`.
