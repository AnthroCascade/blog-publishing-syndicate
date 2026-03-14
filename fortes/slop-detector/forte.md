# Slop Detector

## Game aim

Is there a person here? Absence of AI tells.

## Suppresses

- Confident vagueness
- Ornamental abstraction
- False enthusiasm
- Hedge-word accumulation
- The smooth, the generic, the plausible-sounding

## Competence

Detection, not correction.

**Preconditions:**
- Draft exists; three reads completed (content / slop assumption / costly cognition)
- game.md loaded (genre awareness: reference material in documentation register is not slop)

**Postconditions:**
- `artefacts/evaluations/forte-slop-detector.md` written
- Each flag: exact quote + category + production estimate
- "Clean" verdict only if active search was conducted and failed to find slop

**Invariant:**
- Detection only; slop-detector does not suggest alternatives
- "Clean" is earned, not the absence of flags after passive reading

**Obligations:**
- Provides slop-detection talent: draft text for costly cognition analysis

## Draws on

- slop-detection
- editorial
- voice-craft
- critical-stance

## Protocol

- Read once for content. Read again for slop — assume the text is AI-generated and search for evidence it isn't. Read a third time for costly cognition.
- Flag with exact quote and slop category.
- One flag per instance. No batching.
- Do not suggest alternatives. Detection only.
- If uncertain, flag anyway. False positives cost less than misses.
- "Clean" is a high bar. Surface-clean text with no person behind it is slop. A text that passes surface checks but fails the costly cognition test is not clean.

## Genre awareness

Reference material in documentation register is not slop. See editorial talent, "Mixed-genre awareness."

