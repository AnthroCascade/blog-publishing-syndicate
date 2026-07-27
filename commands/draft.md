# draft

Fire the drafter to produce or redraft an article. The orchestrator delegates — it does not write prose. After the drafter finishes, the voice-guardian runs in revise mode.

## Fortes

| Step | Forte | Mode | Receives additionally |
|---|---|---|---|
| 1 | drafter | draft or redraft | evaluation files (if redrafting), inventory of what's working (if redrafting) |
| 2 | voice-guardian | revise | produced draft, prior-articles, learnings |

## Coordination pattern

Sequential agent-per-forte. The drafter fires in its own Agent call and produces the draft. Then voice-guardian fires in its own Agent call in revise mode — it evaluates and applies surgical fixes in one pass.

## Artefact mapping

- **Target file.** The filename given as the second argument, resolved under the caper's `artefacts/`. When no filename is given, the target is `artefacts/draft.md`. "The target file" below always means this.
- Primary output: the target file
- Voice-guardian reads/writes: the target file

## Context requirements

The drafter's forte spec declares its own context needs. The drafter and voice-guardian have different context needs.

**For the drafter (generative):**

Read thoroughly and comply with:

- `conversational-anchor` forte spec — run it on yourself BEFORE generating: hold the target (one author/reader, no audience), produce the in-voice warm-up in your own context, then draft. Inviolable; no cold generation without anchoring first.
- `voice-samples.md` — use as exemplars of writer's voice to model all writing/communication
- `writers-voice.md` — writer's declared style, to guide all writing/communication
- Drafter forte spec and talents from "Draws on" (section-filtered per spec) — each contains critical intructions that must complied with
- `game.md` — to forte-baseline marker only
- `caper.md` — durable intent and decisions
- `turn.md` (if exists) — current pass instructions
- the target file — current content (if redrafting)
- `artefacts/research.md` — source material
- All files in `artefacts/evaluations/` — forte findings that must be incorporated in drafting/writing
- `learnings.md` — findings ot be followed in conintuous improvement processes

Load voice-samples.md `writers-voice.md` and last immediately before the generation prompt.

**For the voice-guardian (evaluative):**

- `voice-samples.md` — for gestalt comparison
- `writers-voice.md` — analytical markers
- Voice-guardian forte spec and all talents from its "Draws on" section
- `artefacts/prior-articles.md` — corpus context
- `learnings.md` — patterns

## Procedure

1. **Assemble prior-articles.md (if absent).** If `artefacts/prior-articles.md` does not exist, the orchestrator produces it before firing the drafter. Find the most recent `prior-articles.md` from another caper in the same game. Read it, add any articles published since, and write to the current caper's `artefacts/prior-articles.md`. If no prior version exists, build from scratch by reading published drafts from other capers and summarising core argument, key concepts, and corpus positioning for each.

2. **Inventory what's working (redraft only).** When the target file already holds content, the orchestrator reads it and produces a paragraph-level inventory of what's working before firing the drafter. Be specific — name what makes each passage good. Format: `Para 3: Opening claim — direct, grounded, voice-clean`. The drafter uses this to decide what to protect. When the target file is empty or absent, this is a cold draft from source — skip the inventory.

3. **Fire drafter.** The drafter receives: its forte spec, the `conversational-anchor` forte spec, talents, current draft (if redrafting), inventory (if redrafting), evaluation findings, caper decisions, current pass instructions. It first self-anchors per `conversational-anchor` — sets the target and produces the in-voice warm-up in its own context — then drafts the piece (or specified section) and returns the text. The orchestrator writes it to the target file.

4. **Clear stale evaluations.** After writing the new draft, clear `artefacts/evaluations/`. Evaluations produced against the previous draft are stale.

5. **Leave turn.md in place.** It persists for author review and is overwritten only when a new directive is written. See `syndicates/coordination/patterns/turn-taking.md` → "turn.md write discipline."

6. **Fire voice-guardian in revise mode.** Voice-guardian receives: its forte spec (revise mode section), all talents from "Draws on," voice-samples.md, writers-voice.md, the draft (inline — it returns amended text), prior-articles path, learnings path. Instruction: run the gestalt gate first. If the draft fails at the gestalt level (no person present, AI-default register throughout), return the draft unchanged with a single finding — the drafter needs to regenerate. If the gestalt passes, proceed to the evaluation protocol: apply surgical fixes, return amended draft text, a change manifest, and unresolved flags needing author decision.

7. **Write outputs.** If the gestalt gate passed: amended text replaces the drafter's version at the target file. Change manifest and unresolved flags go to `artefacts/evaluations/forte-voice-guardian.md`. If the gestalt gate failed: the draft stays as-is. The gestalt failure finding goes to `artefacts/evaluations/forte-voice-guardian.md`. The orchestrator reports the failure to the author — the draft needs regeneration.

8. **Present to author.** In the author's voice and register. See `syndicates/coordination/talents/author-register.md` and `syndicates/coordination/fortes/synthesiser.md` → "Caper-aligned presentation." See also `syndicates/blog-publishing/talents/caper-aligned-findings.md`. The voice-guardian's flagged items must include What this connects to in the caper and What this does to the article's main claim per the talent — name those when presenting. Report:

   1. **What the voice-guardian changed.** In author's voice and register — say what phrase was edited and to what.
   2. **What the voice-guardian flagged for author decision.** Each flag as: the phrase, the recommendation, why.
   3. **The resolution path, named as the default.** Two options exist — name the skill path first with consequence framing, name the manual path as the alternative:
      - **Skill path:** write decisions into `turn.md`, fire `/revise <caper>`. This overwrites the draft with the drafter's revisions, preserves turn.md and research, reversible via git.
      - **Manual path:** edit the draft directly in the IDE. No skill fires; no file overwrite by an agent; reversible via git.
   4. **What happens if the author does nothing.** The flags persist; the next evaluation pass may surface them again.

   If voice-guardian found nothing, state "Clean pass. No voice edits." Gestalt failure means the draft needs regenerating — say that plainly.

10. **Capture learnings.** Note patterns observed during drafting. Check whether unresolved flags or recurring surgical fixes already appear in `learnings.md`. If yes, note that the pattern recurred and suggest propagating it to spec.

## Output

- the target file (`artefacts/draft.md` by default)
- `artefacts/prior-articles.md` (if assembled)
- `artefacts/evaluations/forte-voice-guardian.md`

## Settlement condition

Draft written. Voice-guardian revise pass complete. Stale evaluations cleared. turn.md left in place for author review.

## Boundary

Delegates all prose to the drafter. Evaluation is separate — `mob`, `polish`, `structure`, or `verify` after drafting.