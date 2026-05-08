# voice-pass

Iterative voice repair. The voice-guardian fires in revise mode — it reads the draft, applies surgical fixes, writes a change manifest, and flags anything needing author decision. The orchestrator writes the amended draft back, then fires the voice-guardian again on the amended text. The loop runs until a pass produces zero violations or 3 passes have run. The protector fires once after the loop exits.

## Fortes

| Step | Forte | Mode | Receives additionally |
|---|---|---|---|
| 1 (loop, max 3) | voice-guardian | revise | prior-articles, learnings |
| 2 (after loop) | protector | evaluate | all voice-guardian evaluation output |

## Coordination pattern

Iterative agent-per-forte with sequential tail. Each voice-guardian pass fires in its own Agent call against the amended draft. After the loop exits, the protector fires once in its own Agent call to test whether the cumulative fixes degraded other qualities.

## Context requirements

Before the voice-guardian fires, load:

- `caper.md` — durable intent (voice-guardian uses this to distinguish voice from error)
- `artefacts/draft.md` — the draft to fix
- `artefacts/prior-articles.md` — voice samples (if exists)
- `learnings.md` — for recurring pattern check (if exists)
- `game.md` — baseline context
- Voice-guardian forte spec (revise mode section) and all talents from its "Draws on" section
- Protector forte spec and talents (for step 2)

## Procedure

1. **Fire voice-guardian in revise mode (pass 1).** Voice-guardian receives the draft inline and returns: amended draft text, a change manifest for every fix applied, and unresolved flags for items needing author decision. If no violations found, it returns the draft unchanged and says so.

2. **Write amended draft.** The orchestrator writes the amended text back to `artefacts/draft.md`.

3. **Check loop exit.** If the pass produced zero violations, exit the loop. If 3 passes have run, exit the loop.

4. **Fire voice-guardian again (passes 2–3).** Same as pass 1, but against the amended draft from the previous pass.

5. **Lurching detection.** If the voice-guardian is still finding violations at pass 3, remaining findings go to the evaluation file as unresolved.

6. **Fire protector.** After the loop exits, the protector fires once. It reads all evaluation output and tests whether the cumulative fixes degraded other qualities.

7. **Present to author.** The full diff of all changes across all passes, unresolved flags, and the protector's findings. No human review happens inside the loop — the author reviews everything after.

## Output

- `artefacts/draft.md` (amended)
- `artefacts/evaluations/forte-voice-guardian.md`
- `artefacts/evaluations/forte-protector.md`

## Settlement condition

Zero violations found by a pass, or 3 passes have run. Protector attacks filed. Unresolved flags (if any) are presented to the author.

## Boundary

Voice violations only. Does not evaluate argument, structure, facts, or thesis — those are other fortes. For full evaluation use `mob` or `polish`. For argument use `structure`. For facts use `verify`.
