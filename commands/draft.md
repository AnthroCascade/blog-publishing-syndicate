# draft

Fire the drafter to produce or redraft an article. The orchestrator composes and delegates — it does not write prose. After the drafter finishes, the voice-guardian runs in revise mode to catch voice violations while the draft is fresh. This is a generative command, not an evaluative one.

## Fortes

| Step | Forte | Mode | Receives additionally |
|---|---|---|---|
| 1 | drafter | draft or redraft | evaluation files (if redrafting), inventory of what's working (if redrafting) |
| 2 | voice-guardian | revise | produced draft, prior-articles, learnings |

## Coordination pattern

Sequential agent-per-forte. The drafter fires in its own Agent call and produces the draft. Then voice-guardian fires in its own Agent call in revise mode — it evaluates and applies surgical fixes in one pass.

## Context requirements

Follow `coordination/orchestrator-governance.md` → "Generative forte context rules" for drafter context loading. The drafter and voice-guardian have different context needs.

**For the drafter (generative):**

The drafter operates at two levels: analytical instructions that tell it what to do, and voice samples that show it how the output should sound. These sit in the same context window and the model has no built-in way to keep them apart. Each file carries its own context-level declaration — the orchestrator does not stamp labels on content. The governance is in the files, not in the assembly.

Context sections:

- `corpus/voice-samples.md` — carries its own output-register declaration
- Drafter forte spec and talents from "Draws on" (section-filtered per spec) — each carries its own instruction-register declaration
- `game.md` — to forte-baseline marker only
- `caper.md` — durable intent and decisions
- `turn.md` (if exists) — current pass instructions
- `artefacts/draft.md` — current draft (if redrafting)
- `artefacts/research.md` — source material
- All files in `artefacts/evaluations/` — forte findings to incorporate (if redrafting)
- `learnings.md` — patterns and forte refinements
- Do NOT load `writers-voice.md` — analytical markers compete with demonstrated voice

Load voice-samples.md last, immediately before the generation prompt, so the output register is closest to the point of generation. Recency in context strengthens influence on the output.

**For the voice-guardian (evaluative):**

- `corpus/voice-samples.md` — for gestalt comparison
- `corpus/writers-voice.md` — analytical markers
- Voice-guardian forte spec and all talents from its "Draws on" section
- `artefacts/prior-articles.md` — corpus context
- `learnings.md` — patterns

## Procedure

1. **Assemble prior-articles.md (if absent).** If `artefacts/prior-articles.md` does not exist, the orchestrator produces it before firing the drafter. Find the most recent `prior-articles.md` from another caper in the same game. Read it, add any articles published since, and write to the current caper's `artefacts/prior-articles.md`. If no prior version exists, build from scratch by reading published drafts from other capers and summarising core argument, key concepts, and corpus positioning for each.

2. **Inventory what's working (redraft only).** When a current draft exists, the orchestrator reads it and produces a paragraph-level inventory of what's working before firing the drafter. Be specific — name what makes each passage good. Format: `Para 3: Opening claim — direct, grounded, voice-clean`. The drafter uses this to decide what to protect.

3. **Fire drafter.** The drafter receives: its forte spec, talents, current draft (if redrafting), inventory (if redrafting), evaluation findings, caper decisions, current pass instructions. It drafts the full article (or specified section) and returns the text. The orchestrator writes it to `artefacts/draft.md`.

4. **Clear stale evaluations.** After writing the new draft, clear `artefacts/evaluations/`. Evaluations produced against the previous draft are stale.

5. **Fire voice-guardian in revise mode.** Voice-guardian receives: its forte spec (revise mode section), all talents from "Draws on," voice-samples.md, writers-voice.md, the produced draft (inline — it returns amended text), prior-articles path, learnings path. Instruction: run the gestalt gate first. If the draft fails at the gestalt level (no person present, AI-default register throughout), return the draft unchanged with a single finding — the drafter needs to regenerate, not the guardian needs to edit. If the gestalt passes, proceed to the evaluation protocol: apply surgical fixes, return amended draft text, a change manifest, and unresolved flags needing author decision.

6. **Write outputs.** If the gestalt gate passed: amended draft text replaces the drafter's version at `artefacts/draft.md`. Change manifest and unresolved flags go to `artefacts/evaluations/forte-voice-guardian.md`. If the gestalt gate failed: the draft stays as-is. The gestalt failure finding goes to `artefacts/evaluations/forte-voice-guardian.md`. The orchestrator reports the failure to the author — the draft needs regeneration, not revision.

7. **Present to author.** Report what voice-guardian amended (from manifest), what it flagged as needing author decision (unresolved flags), or the gestalt failure. If voice-guardian found nothing, state that explicitly — it is signal, not silence.

8. **Capture learnings.** Note patterns observed during drafting. Check whether unresolved flags or recurring surgical fixes already appear in `learnings.md`. If yes, note that the pattern recurred and suggest propagating it to spec.

## Output

- `artefacts/draft.md`
- `artefacts/prior-articles.md` (if assembled)
- `artefacts/evaluations/forte-voice-guardian.md`

## Settlement condition

Draft written. Voice-guardian revise pass complete. Stale evaluations cleared.

## Boundary

Delegates all prose to the drafter. Evaluation is separate — `mob`, `polish`, `structure`, or `verify` after drafting. Do not suggest `polish` after drafting — voice-guardian has already run in revise mode.
