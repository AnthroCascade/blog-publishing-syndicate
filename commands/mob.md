# mob

Full evaluative pass against a draft. All 7 content fortes in parallel, then human (asynchronous), then protector and interrogator (sequential). Phase-specific commands (`/structure`, `/polish`, `/research`, `/verify`) are the norm; `/mob` is the exception.

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

Each forte receives another forte's spec or output.

## Coordination pattern

Independent evaluation, then async human, then sequential tail. Content fortes fire in parallel (one Agent call per forte, all dispatched in one message in Claude Code; concurrent API calls in in-concert). After they complete, the human forte fires asynchronously — the orchestrator pauses for the author, who fills or skips. Then the protector fires in its own Agent call and walks every finding. Then the interrogator fires in its own Agent call and tests all evaluation files for grounding, specificity, variance, and cross-forte similarity.

## Artefact mapping

- the file fortes evaluate: `artefacts/draft.md`

## Context requirements

Before fortes fire, load:

- `caper.md` — durable intent and decisions
- `turn.md` (if exists) — current pass instructions
- The resolved primary output — the content being evaluated
- `artefacts/research.md` — source material (confirm existence)
- `artefacts/prior-articles.md` — corpus context (confirm existence)
- `game.md` — baseline context for every evaluative forte
- `syndicate.md` — syndicate definitions
- `learnings.md` — patterns and forte refinements
- The syndicate's artefact format section
- Each forte's spec and all talents listed in its "Draws on" section

## Procedure

1. **Roll call.** Before firing, enumerate every forte. Mark each as Engaged, Skipped (author selection), or Generative (drafter). When the author selects specific fortes, unselected evaluative fortes are marked "Skipped (author selection)."

2. **Forte selection.** The author may specify which fortes to fire. If no fortes are specified, all 7 content fortes fire. If specific forte names are given, fire only those — skip the rest. Invalid forte names are an error; stop and report.

3. **Clear stale evaluations.** Clear `artefacts/evaluations/` before firing.

4. **Execute content fortes independently.** Each forte receives: its own spec, its resolved talents, the shared context bundle, and any forte-specific additions per the table above. After each forte writes, add it to `completed` in the plan.

5. **Human forte.** Present findings to the author. The author fills their evaluation or skips.

6. **Protector.** Reads all content forte evaluation files and the human evaluation. Tests each finding against six failure modes: echo convergence, lurching, phantom problems, overcorrection, faustian regression, scope extension. Add to `completed`.

7. **Interrogator.** Reads all evaluation files including the protector's. Tests for grounding, specificity, variance, and cross-forte similarity. Add to `completed`.

8. **Translate before presenting.** Before the synthesis is shown to the author, rewrite in plain language per `syndicates/coordination/talents/author-register.md` (hard gate). Forte names themselves may appear once in a "which fortes fired" footer; nowhere else. Section labels in the synthesis describe what the *article* needs, not which forte said what.

9. **Present to author.** In the author's register. Group by what the article needs, not by which forte said what. See `syndicates/coordination/talents/author-register.md` and `syndicates/coordination/fortes/synthesiser.md` → "Caper-aligned presentation." See also `syndicates/blog-publishing/talents/caper-aligned-findings.md`.

   Report in this order:

   1. **What the article needs to land its central claim.** Lead here. Name the central claim from caper.md in plain language. For each finding, name the passage and explain how the fix serves the caper's stated intent.
   2. **What protects the work already done.** Voice and accuracy housekeeping the author can take or defer.
   3. **What's mechanical.** Typos, formatting, source cleanup. One line each.
   4. **Where the call belongs to the author.** Trade-offs flagged by the mob, named in the article's own terms — what it gains and loses with each path.
   5. **Findings to discount.** Anything the meta-evaluation marked shallow or argued against. Brief — author can override.
   6. **Which fortes fired** and where the evaluation files live (paths for direct reading when detail matters). One line.
   7. **The resolution path, named as the default.**
      - **Skill path:** write decisions into `turn.md`, fire `/revise <caper>`. This overwrites the primary output with decisions and findings applied, clears evaluations (they have been consumed), preserves turn.md and research, reversible via git.
      - **Manual path:** edit the primary output directly, or work through specific findings phase-by-phase with `/structure <caper>` or `/polish <caper>` to re-scope.
   8. **What happens if the author does nothing.** Evaluations remain on disk as current context for the next generative command. They will be cleared the next time `/revise` or `/draft` fires against this caper.

   Lead with the article's stated purpose. End with the resolution path that serves it. `/revise` is the default resolution for a mob pass.

10. **Capture learnings.** Note any patterns observed during evaluation.

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

Delegates all evaluation to fortes. Delegates all prose to `draft`. Author decides; orchestrator executes.

Does not clear turn.md — turn.md survives evaluation passes and is cleared by the next generative command (/revise or /draft) that executes the directive.
