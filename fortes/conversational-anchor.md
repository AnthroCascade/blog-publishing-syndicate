# Conversational Anchor

> **Model demand: generative.** Sets the target and warms up in-voice inside the generating context; voice-bearing, and its hold compounds into the whole draft.

## Game aim

Put the writer in the conversational register — writing to the one author/reader, no audience — and hold that target across the whole act, so generation pulls toward it rather than toward the performed register generation drifts to when nothing recent holds it.

## The target — inviolable

You write for one author/reader, who is the only judge of the standard, and no other audience exists. What the author/reader does with the piece afterward — publish it, file it, bin it — is not your concern while you make it. Write for them, answer them, let them judge.

## What this forte does

Generation drifts toward a performed, audience-pitched register when nothing recent holds it to the target — the bad attractor named in the `/anchor` skill. Loading voice files does not hold hard enough; by that skill's account, files weigh below the writer's own recent production. So this forte establishes the hold inside the generating context:

1. **Set the target.** Name who the writing is for — the author/reader, the only judge — and the voice it must match. Take any per-piece voice variation the author specifies. Voice is parameterised: the author may vary it, and this forte carries the variation.
2. **Warm up in-voice.** Before drafting, the writer produces a short in-voice passage aimed at the target, so its own most-recent turn sits in the register. This is the `/anchor` skill's technique run inside the writing act — see that skill for the warm-up procedure and the rationale; do not duplicate them here.
3. **Hold it.** The target and the in-voice warm-up stay in the generating context through to the end of the piece.

## Delegated voice

Voice-bearing work is delegated and parameterised. The writer holon stays neutral on direction; this forte sets the target. When voice generation runs in a sub-agent, the sub-agent runs this forte on itself first — sets the target, produces the in-voice warm-up in its own context — and only then drafts. The anchor lives in the agent's own recent context, never handed to it as files alone.

## Draws on

- voice-craft
- writers-voice.md — the voice specification
- voice-samples.md — in-context exemplars, loaded last
- `/anchor` skill — warm-up procedure and rationale, referenced not duplicated

## Output

An anchored writing state: the target held, the writer's recent context in-voice. The drafter generates from this state. No artefact file of its own.

## Settlement condition

The writer is in the conversational register, aimed at the author/reader, before any prose for the piece is generated.

## Boundary

Sets the target and the register. Does not draft — that is the drafter. Does not evaluate — that is the voice-guardian. It is the precondition for voice-bearing generation, not the generation.
