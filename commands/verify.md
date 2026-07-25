# verify

External fact-checking against primary sources via web search. Verify checks claims against actual published sources — URLs, DOIs, publication venues. Runs on a near-final draft.

## Fortes

| Step | Forte | Mode | Receives additionally |
|---|---|---|---|
| 1 | fact-checker | verify (web search) | `research.md`, scoped verify targets |

## Coordination pattern

Single-agent. The fact-checker fires once with web search access.

## Context requirements

Before the fact-checker fires, load:

- `caper.md` — durable intent
- `turn.md` (if exists) — current pass instructions
- `artefacts/draft.md` — the draft to verify
- `artefacts/research.md` — source material (confirm existence)
- `artefacts/evaluations/forte-fact-checker.md` (if exists) — prior research-phase findings, used to scope what needs external verification
- `game.md` — baseline context
- Fact-checker forte spec (verify mode section) and all talents from its "Draws on" section

## Procedure

1. **Scope the search.** Read the prior fact-checker evaluation (if it exists). The fact-checker forte's verify-mode protocol defines what to scope and what to skip. Hold the verify targets — these are the claims that need external source checking.

2. **Fire fact-checker with web access.** The fact-checker receives research.md and the scoped verify targets. It web-searches only the scoped targets. For each, it reports: verified, unverified, or contradicted. It flags characterisation mismatches (e.g. "one thing" when the source describes two).

3. **Present to author.** In plain English — no forte jargon. See `author-register.md`. Claims verified, unverified, or contradicted. Characterisation mismatches. Specific fixes needed. Whether the draft is cleared for publication from a factual accuracy standpoint.

4. **Record participation.** Append a `/verify` entry to `artefacts/mob-accounting.md` per the mob-accounting protocol (`coordination/talents/mob-accounting.md`): the fact-checker engaged (verify mode) and its output file, the counts verified / unverified / contradicted, any characterisation watch-notes deferred to the author, and the subversion flag (none — the roster is the fact-checker alone). Append; do not overwrite. Verify is an evaluation phase, so the ledger entry is not optional.

Verify is additive — it does not clear `artefacts/evaluations/`. Its output sits alongside existing evaluations.

## Output

- `artefacts/evaluations/forte-fact-checker-verify.md`
- `artefacts/mob-accounting.md` — participation entry appended (per the mob-accounting protocol)

## Settlement condition

All scoped claims verified externally. Characterisation mismatches identified. The author has a clear picture of factual accuracy. Participation recorded in `artefacts/mob-accounting.md`.

## Boundary

External fact-checking only. Research assembly is `research`. Evaluation of other dimensions is `mob`. Prose is `draft`.

Does not clear turn.md — turn.md survives evaluation passes and is cleared by the next generative command (/revise or /draft) that executes the directive.
