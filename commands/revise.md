# revise

Apply evaluation findings and author decisions to the draft. The orchestrator routes context to the drafter — it does not triage or filter findings. Use this after evaluation commands when findings exist. For substantial new prose, use `draft` instead.

## Fortes

| Step | Forte | Mode | Receives additionally |
|---|---|---|---|
| 1 | drafter | revise | all evaluation files, turn.md decisions, caper.md intent |
| 2 | voice-guardian | revise | revised draft, prior-articles, learnings |

## Coordination pattern

Sequential agent-per-forte. The drafter fires in its own Agent call in revise mode and applies corrections. Then the voice-guardian fires in its own Agent call in revise mode to catch voice violations in the revised text.

## Context requirements

Before the drafter fires, load:

- `caper.md` — durable intent and decisions
- `turn.md` (if exists) — author decisions (these override everything)
- `artefacts/draft.md` — the draft to revise
- All files in `artefacts/evaluations/` — these are the work orders
- `artefacts/research.md` — sourcing context
- `artefacts/prior-articles.md` — corpus context (if exists)
- `learnings.md` — patterns (if exists)
- `game.md` — baseline context
- Drafter forte spec and all talents from its "Draws on" section
- Voice-guardian forte spec and talents (for step 2)

## Procedure

1. **The orchestrator does not triage.** The orchestrator loads context and passes it through. It does not classify findings as actionable or author-decision-needed. That classification is orchestrator judgment about author intent — and it is wrong often enough to be a process failure. The author's decisions are in turn.md. The forte findings are in the evaluation files. Both go to the drafter.

2. **Fire drafter in revise mode.** The drafter receives: its forte spec, talents, the draft, caper.md contents (inline), turn.md contents (inline, if exists), all evaluation files, research.md, prior-articles (if exists), learnings (if exists). The drafter applies turn.md decisions (already decided), applies unambiguous fixes from evaluations, and reports anything it could not resolve. Findings that conflict with turn.md or caper.md intent follow the author's stated intent.

3. **Clear stale evaluations.** After writing the revised draft, clear `artefacts/evaluations/`. The findings have been consumed.

4. **Leave turn.md in place.** Do not delete turn.md after consumption. It persists for author review and is overwritten only when a new directive is written. See `coordination/turn-taking.md` → "turn.md write discipline."

5. **Fire voice-guardian in revise mode.** Voice-guardian receives: its forte spec (revise mode section), voice-craft talent, cognition-sensing talent, editorial talent, the revised draft (inline — returns amended text), prior-articles path, learnings path. It runs its evaluation protocol, applies surgical fixes, returns amended text, a change manifest, and unresolved flags.

6. **Write outputs.** Amended draft text replaces the revision at `artefacts/draft.md`. Change manifest and unresolved flags go to `artefacts/evaluations/forte-voice-guardian.md`.

7. **Decision promotion.** If the drafter's change summary shows findings that were overridden by turn.md or caper.md intent, check whether the override represents a durable decision not yet in caper.md. If so, ask the author: "Should this go in caper.md so fortes receive it in future passes?" If yes, append to caper.md. This prevents the same decision being re-fought across evaluation passes.

8. **Present to author.** In the author's register — no forte jargon untranslated. See `coordination/orchestrator-governance.md` → "Author register" and "Actionability." Report:

   1. **What the drafter changed**, grouped by which forte's finding drove each change. In plain terms — say what was edited and to what.
   2. **Which of the author's turn.md decisions were executed**, so the author can see their directives landed.
   3. **Findings the drafter could not resolve**, with the specific conflict (turn.md vs finding, or ambiguous fix).
   4. **Decisions promoted to caper.md**, if any — what moved from ephemeral turn.md to durable caper.md and why.
   5. **What the voice-guardian changed in its revise pass.** What phrase was edited and to what.
   6. **What the voice-guardian flagged for author decision.** Each flag as: the phrase, the recommendation, why. One flag per line.
   7. **The resolution path for those flags, named as the default.**
      - **Skill path:** write decisions into `turn.md` (append or overwrite — turn.md is rewritten whole), fire `/revise <caper>` again. This overwrites `draft.md`, preserves research, reversible via git.
      - **Manual path:** edit `draft.md` directly in the IDE. No skill fires; reversible via git.
   8. **What happens if the author does nothing.** Flags persist; next evaluation may surface them again.

   If voice-guardian found nothing, state "Clean pass. No voice edits." explicitly.

9. **Capture learnings.** Note patterns. Check whether unresolved flags or recurring surgical fixes already appear in learnings.md. If yes, note the recurrence and suggest propagating to spec.

## Output

- `artefacts/draft.md` (revised)
- `artefacts/evaluations/forte-voice-guardian.md`

## Settlement condition

Corrections applied. Stale evaluations cleared. turn.md left in place for author review. Voice-guardian revise pass complete. Unresolvable findings reported to author.

## Boundary

Routes context to the drafter. Does not filter or classify findings. Do not suggest `polish` after revising — voice-guardian has already run in revise mode. Evaluation is `mob` or phase commands. Fresh prose is `draft`.
