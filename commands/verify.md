# verify

External fact-checking against primary sources via web search. This is different from the research phase. Research verifies claims against research.md. Verify checks claims against the actual published sources — URLs, DOIs, publication venues. It runs on a near-final draft when the article is close to publication.

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

3. **Present to author.** Claims verified, unverified, or contradicted. Characterisation mismatches. Specific fixes needed. Whether the draft is cleared for publication from a factual accuracy standpoint.

Verify is additive — it does not clear `artefacts/evaluations/`. Its output sits alongside existing evaluations.

## Output

- `artefacts/evaluations/forte-fact-checker-verify.md`

## Settlement condition

All scoped claims verified externally. Characterisation mismatches identified. The author has a clear picture of factual accuracy.

## Boundary

External fact-checking only. Research assembly is `research`. Evaluation of other dimensions is `mob`. Prose is `draft`.

Does not clear turn.md — turn.md survives evaluation passes and is cleared by the next generative command (/revise or /draft) that executes the directive.
