# protect

Standalone protector invocation. The protector walks every finding in every evaluation file and runs six tests. Use after any evaluation command when evaluation files exist.

## Fortes

| Step | Forte | Mode | Receives additionally |
|---|---|---|---|
| 1 | protector | evaluate | all content forte evaluation files, draft, caper.md, turn.md |

## Coordination pattern

Single-agent. The protector fires once against all existing evaluation files.

## Context requirements

Before the protector fires, load:

- `artefacts/draft.md` — the current draft
- All `artefacts/evaluations/forte-*.md` files (excluding `forte-protector.md` if it exists from a prior run)
- `caper.md` — durable intent
- `turn.md` (if exists) — author decisions
- Protector forte spec and all talents from its "Draws on" section

## Precondition

`artefacts/evaluations/` must contain at least one content forte evaluation file (`forte-*.md`, excluding `forte-protector.md` and `forte-interrogator.md`). If empty or only contains protector/interrogator output, report that there are no findings to test and stop.

## Procedure

1. **Check precondition.** Confirm that content forte evaluation files exist. If not, report and stop.

2. **Fire protector.** The protector receives: its forte spec, all talents from "Draws on", the current draft (inline), caper.md contents (inline), turn.md contents (inline, if exists), and all content forte evaluation files. Each forte loads `author-register.md`. Findings are written in plain English. It walks every finding in every evaluation file and runs six tests:
   - **Same finding repeated** — are multiple fortes reporting the same thing in different words?
   - **Chasing the last fix** — is this finding reacting to a prior fix rather than addressing the actual object?
   - **Finding about text the author didn't write** — is this a real problem or a preference masquerading as a finding?
   - **Right but the cost is too high** — would acting on this fix damage what's already working?
   - **Fix one thing, break another** — does fixing this degrade something else?
   - **Scope extension** — is this finding about the article or about a different article the forte wishes existed?

3. **Present attacks.** Findings that failed tests, grouped by source forte, with the attack type and what would be lost. Count of findings that survived all tests (clean pass). If no findings failed any test, state that explicitly — the mob did its job.

4. **Author decides.** Do not recommend dropping or keeping findings. Present the attacks. The author decides.

## Output

- `artefacts/evaluations/forte-protector.md`

## Settlement condition

Every finding in every evaluation file has been tested. Attacks presented to the author.

## Boundary

Tests findings, not the draft. Does not produce editorial findings. If evaluations are shallow, use `interrogate`. If findings are harmful, this is the command.
