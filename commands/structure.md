# structure

Evaluate argument build, concept ownership, and corpus positioning. Three content fortes execute independently, then human (asynchronous), then protector and interrogator (sequential). This is the structure phase — it tests whether the argument builds, whether the thesis is the author's, and whether the piece sits well within the body of work.

## Fortes

| Step | Forte | Mode | Receives additionally |
|---|---|---|---|
| 1 (parallel) | structural-thinker | evaluate | — |
| 1 (parallel) | thesis-sharpener | evaluate | — |
| 1 (parallel) | continuity-thinker | evaluate | `prior-articles.md` |
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
- `artefacts/prior-articles.md` — corpus context (confirm existence; continuity-thinker requires it)
- `game.md` — baseline context for every evaluative forte
- `syndicate.md` — syndicate definitions
- `learnings.md` — patterns and forte refinements
- Each forte's spec and all talents from its "Draws on" section

## Procedure

1. **Clear stale evaluations.** Clear `artefacts/evaluations/` before firing.

2. **Fire content fortes in parallel.** Each forte receives its own spec, resolved talents, and the shared context bundle. Continuity-thinker additionally receives `prior-articles.md`. No forte receives another forte's spec or output. After each forte writes, add it to `completed` in the plan.

4. **Human forte.** Present findings to the author. The author fills their evaluation or skips.

5. **Protector.** Reads all content forte evaluation files. Tests each finding against six failure modes. Add to `completed`.

6. **Interrogator.** Reads all evaluation files including the protector's. Tests for grounding, specificity, variance, and cross-forte similarity. Add to `completed`.

7. **Present to author.** In the author's register — no forte jargon untranslated. See `coordination/orchestrator-governance.md` → "Author register" and "Actionability." Report:

   1. **Which fortes fired** (structural-thinker, thesis-sharpener, continuity-thinker, human, protector, interrogator). Any skipped and why.
   2. **Key findings from each, in plain terms.** For structural-thinker: where the argument fails to build, or where it catalogues instead of sequences. For thesis-sharpener: whether the claim crystallised and where it drifts. For continuity-thinker: where the piece contradicts or repeats the corpus. Name specific sections.
   3. **Findings the interrogator marked shallow**, with the reason.
   4. **Findings the protector argued against.** Ground stated.
   5. **Evaluation file locations.** The forte files are the evaluation.
   6. **The resolution path, named as the default.**
      - **Skill path:** write decisions into `turn.md`, fire `/revise <caper>`. This overwrites `draft.md` with decisions and findings applied, clears evaluations (consumed), preserves turn.md and research, reversible via git.
      - **Manual path:** edit `draft.md` directly, especially if the findings call for structural rewrite rather than sentence-level surgery.
   7. **What happens if the author does nothing.** Evaluations stay on disk and will be cleared by the next `/revise` or `/draft`.

   Not a menu. `/revise` is the default next step; name it as such.

8. **Capture learnings.** Note any patterns observed.

## Output

- `artefacts/evaluations/forte-structural-thinker.md`
- `artefacts/evaluations/forte-thesis-sharpener.md`
- `artefacts/evaluations/forte-continuity-thinker.md`
- `artefacts/evaluations/forte-protector.md`
- `artefacts/evaluations/forte-interrogator.md`
- `artefacts/mob-accounting.md`

## Settlement condition

Argument builds. Concept ownership is clear. No structural circling. Protector attacks filed.

## Boundary

Evaluates structure, thesis, and continuity only. Voice is `polish`. Facts are `verify`. Prose is `draft`.

Does not clear turn.md — turn.md survives evaluation passes and is cleared by the next generative command (/revise or /draft) that executes the directive.
