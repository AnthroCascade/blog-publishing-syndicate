# polish

Evaluate voice consistency and cognitive presence. Two content fortes independently, then human (asynchronous), then protector and interrogator (sequential).

## Fortes

| Step | Forte | Mode | Receives additionally |
|---|---|---|---|
| 1 (parallel) | voice-guardian | evaluate | — |
| 1 (parallel) | cognition-sensor | evaluate | — |
| 2 (async) | human | evaluate | — |
| 3 (sequential) | protector | evaluate | all content forte evaluation files |
| 4 (sequential) | interrogator | evaluate | all evaluation files including protector |

## Coordination pattern

Independent evaluation, then async human, then sequential tail. Follows the evaluation phase template. Content fortes execute independently against the draft. Human fires asynchronously. Protector tests findings. Interrogator tests depth.

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

2. **Fire content fortes in parallel.** Voice-guardian and cognition-sensor each receive their own spec, resolved talents, and the shared context bundle. No forte receives another forte's spec or output. After each forte writes, add it to `completed` in the plan.

4. **Human forte.** Present findings to the author. The author fills their evaluation or skips.

5. **Protector.** Reads all content forte evaluation files. Tests each finding against six failure modes. Add to `completed`.

6. **Interrogator.** Reads all evaluation files including the protector's. Tests for grounding, specificity, variance, and cross-forte similarity. Add to `completed`.

7. **Present to author.** In the author's register — no forte jargon untranslated. Group findings by article-purpose impact, not by forte. See `syndicates/coordination/talents/author-register.md` and `syndicates/coordination/fortes/synthesiser.md` → "Caper-aligned presentation." See also `syndicates/blog-publishing/talents/caper-aligned-findings.md`.

   The forte findings include Caper anchor and Article-purpose impact fields. Group by those impact fields:

   1. **What the article needs to land its central claim.** Findings tagged Strengthens or Required-for-purpose.
   2. **What protects the work already done.** Findings tagged Protects (voice, register, accuracy).
   3. **What's mechanical.** Findings tagged Neutral.
   4. **Where the call belongs to the author.** Findings the protector flagged for author decision; converging findings with different anchors.
   5. **Findings the interrogator marked shallow**, briefly.
   6. **Findings the protector argued against**, briefly.
   7. **Which fortes fired** (voice-guardian, cognition-sensor, human, protector, interrogator) and where the evaluation files live.
   8. **The resolution path, named as the default.**
      - **Skill path:** write decisions into `turn.md`, fire `/revise <caper>`. This overwrites `draft.md` with decisions and findings applied, clears evaluations (consumed), preserves turn.md and research, reversible via git.
      - **Manual path:** edit `draft.md` directly in the IDE.
   9. **What happens if the author does nothing.** Evaluations stay on disk and will be cleared by the next `/revise` or `/draft`.

   `/revise` is the default next step.

8. **Capture learnings.** Note any patterns observed.

## Output

- `artefacts/evaluations/forte-voice-guardian.md`
- `artefacts/evaluations/forte-cognition-sensor.md`
- `artefacts/evaluations/forte-protector.md`
- `artefacts/evaluations/forte-interrogator.md`
- `artefacts/mob-accounting.md`

## Settlement condition

Voice is clean. Cognitive presence is confirmed. Protector attacks filed.

## Boundary

Evaluates voice and cognitive presence only. Structure is `structure`. Facts are `verify`. Prose is `draft`.

Does not clear turn.md — turn.md survives evaluation passes and is cleared by the next generative command (/revise or /draft) that executes the directive.
