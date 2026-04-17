# research

Build and verify the caper's research material. The research-assembler gathers and structures source material, then the fact-checker verifies claims against it. On subsequent passes, the research-assembler corrects and expands based on prior fact-checker findings before the fact-checker re-verifies.

## Fortes

| Step | Forte | Mode | Receives additionally |
|---|---|---|---|
| 1 | research-assembler | exploratory (first pass) or correction (subsequent) | fact-checker evaluation from prior pass (if subsequent) |
| 2 | fact-checker | research mode | `research.md` |

## Coordination pattern

Sequential agent-per-forte pipeline. Research-assembler fires in its own Agent call first, fact-checker fires in its own Agent call second using the output. The order is fixed — fact-checking without assembled research is meaningless.

## Context requirements

Before fortes fire, load:

- `caper.md` — durable intent, angle, focus areas
- `turn.md` (if exists) — current pass instructions
- `artefacts/research.md` (if exists) — current research material
- `artefacts/evaluations/forte-fact-checker.md` (if exists) — prior fact-checker findings
- `game.md` — baseline context
- `syndicate.md` — syndicate definitions
- Each forte's spec and all talents from its "Draws on" section

## Procedure

1. **Determine pass type.** Check whether `artefacts/research.md` and `artefacts/evaluations/forte-fact-checker.md` already exist. If research.md does not exist, this is a first pass. If both exist, this is a subsequent pass.

2a. **First pass — fire research-assembler.** The research-assembler builds research.md from scratch in exploratory mode. It receives caper.md context and works outward from the caper's angle and focus areas. Output: `artefacts/research.md` and `artefacts/evaluations/forte-research-assembler.md`.

2b. **Subsequent pass — fire research-assembler with corrections.** The research-assembler receives the current research.md, the prior fact-checker evaluation, and the current caper.md (which may have updated focus areas). Its job on a subsequent pass: **correct** (apply fact-checker work orders — remove untraceable claims, fix characterisation mismatches, correct errors, add caveats), **expand** (research new directions from caper.md that the prior pass didn't cover), **report** (state what was corrected, expanded, and what gaps remain). Research.md is updated in place — single mutable file, git handles history.

3. **Fire fact-checker.** The fact-checker verifies claims in research.md. On a subsequent pass, it verifies new and corrected claims. Claims verified clean in a prior pass and unchanged in research.md are settled — do not re-check. Output: `artefacts/evaluations/forte-fact-checker.md`.

4. **Present to author.** Summarise research completeness (gaps, coverage), fact-check results (verified, unverified, errors), and on subsequent passes: what was corrected, expanded, and what remains.

## Output

- `artefacts/research.md`
- `artefacts/evaluations/forte-research-assembler.md`
- `artefacts/evaluations/forte-fact-checker.md`
- `artefacts/code-evidence.md` (if code evidence is gathered)

## Settlement condition

Claims sourced. Research.md complete. Fact-checker findings addressed or flagged.

## Boundary

Builds and verifies research.md only. Web search against primary sources is `verify`. Prose is `draft`. Evaluation of a draft is `mob`.
