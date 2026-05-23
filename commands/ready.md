# ready

Assess publication readiness of one or all capers by reading artefact evidence. Does not fire fortes. Does not read or trust metadata labels — derives progress from what exists in the artefacts directory and what those artefacts contain.

## Modes

- `/ready` — all unfinished capers, sorted by nearness to publication
- `/ready 097` — single caper, detailed assessment

## Fortes

None. The orchestrator reads and assembles directly.

## Coordination pattern

Single-agent, read-only. No files written.

## Pipeline stages

The syndicate's workflow phases, mapped to artefact evidence:

| Phase | Evidence of completion | Settled when |
|---|---|---|
| Research | `artefacts/research.md` has content; `evaluations/forte-research-assembler.md` and/or `evaluations/forte-fact-checker.md` exist | Claims sourced, research.md populated |
| Draft | `artefacts/draft.md` exists | Prose exists |
| Structure | `evaluations/forte-structural-thinker.md`, `evaluations/forte-thesis-sharpener.md`, `evaluations/forte-continuity-thinker.md` exist | Argument evaluated |
| Polish | `evaluations/forte-voice-guardian.md`, `evaluations/forte-cognition-sensor.md` exist | Voice and cognition evaluated |
| Reception | `evaluations/forte-reader-proxy.md` exists | Reader experience mapped |
| Verify | `evaluations/forte-fact-checker-verify.md` exists | Claims verified against primary sources |

## Additional artefact signals

These don't map to a single phase but indicate progress:

| Artefact | Signal |
|---|---|
| `artefacts/prior-articles.md` | Corpus context assembled |
| `artefacts/evaluations/forte-protector.md` | Protector has fired (governance) |
| `artefacts/evaluations/forte-interrogator.md` | Depth check done (governance) |
| `artefacts/mob-accounting.md` | Full mob has run |
| `turn.md` | Author decisions/corrections exist |
| `learnings.md` | Learning captured from session |
| Multiple draft files (draft.md, draft-v2.md, etc.) | Revision cycles |

## Quality signals

Existence is necessary but not sufficient. Read artefacts for these quality indicators.

### Evaluation verdict extraction

Evaluation files do not use a consistent verdict format.
Scan for verdict using this priority order:

1. **Frontmatter field.** If the file has YAML frontmatter
   with a `verdict:` key, use it. Canonical when present.
2. **First heading containing "gestalt" or "verdict".**
   Read the line immediately after it. Common patterns:
   `PASS`, `**PASS**`, `PASS.`, `Gestalt gate: PASS`,
   `**Verdict: CORROBORATED with characterisation mismatches**`.
3. **First line matching the regex**
   `(?i)(PASS|FAIL|NEEDS\s*WORK|WARNING|CORROBORATED|VERIFIED)`
   — use as fallback.

Record the extracted verdict verbatim. If no verdict is
found after all three attempts, record `NO VERDICT FOUND`
— do not infer one.

### Draft quality markers

Read draft.md. Grep for:
- `<WARNING>` blocks — unresolved warnings
- `[NEEDS:]` or `[TODO]` — gaps the author flagged
- `[LACHLAN:]` or similar contributor placeholders

Record the count of each marker type. Zero is the target.

### Turn.md correction verification

If turn.md exists, read it. For each factual correction
(numbers, names, dates, attributions):

1. Extract the specific claim and the correction.
2. Grep draft.md for the old (incorrect) value.
3. If the old value is found, record as **unapplied**.
   If not found (or the corrected value is present),
   record as **applied**.

Report: N applied, M unapplied. List each unapplied
item by name.

### Preflight/mob-accounting verdicts

If mob-accounting.md exists, read it for overall verdict
using the same extraction protocol as evaluation files.

## Remaining-work assessment

Do not score capers numerically. A point system rewards
artefact accumulation, not publication distance. Capers
take different paths — 097 bypassed half the pipeline
via a human collab pack and was closer to done than
capers with full evaluation sets.

Instead, for each caper produce a **remaining-work list**:
the specific items that must be completed before
publication. Each item is one of:

- A specific correction or author decision (e.g.
  "verify Stanford [^1] figure")
- A missing pipeline phase that hasn't been run (e.g.
  "`/structure`")
- A structural issue identified by an evaluation (e.g.
  "3 unapplied directives — draft needs rewrite")
- An author-dependent action (e.g. "write personal
  history section, lines 11-33")

Sort capers by remaining-work item count. This is a
rough proxy — a rewrite is heavier than a verify pass —
but the item list is visible, so the author can judge.
When two capers have the same count, the one whose
items are lighter (verification, correction) sorts
above the one whose items are heavier (rewrite,
structural rework).

## Structured checklist output

Every `/ready` invocation produces a checklist table per
caper, not prose. The format:

```
### 097 — The Junior's Junior (2 remaining)

| Phase        | Artefact                    | Present | Verdict         |
|--------------|-----------------------------|---------|-----------------|
| Research     | research.md                 | —       |                 |
| Draft        | draft.md                    | ✓       |                 |
| Draft        | revision files              | ✓       | 3 versions      |
| Corpus       | prior-articles.md           | ✓       |                 |
| Polish       | forte-voice-guardian        | ✓       | PASS            |
| Verify       | forte-fact-checker-verify   | —       |                 |
| Governance   | forte-protector             | —       |                 |
| Author       | turn.md                     | ✓       | 7/7 applied     |
| Quality      | draft markers               | ✓       | 0 warnings      |

Remaining work:
1. Verify Stanford [^1] figure and URL
2. Author accept/reject "hidden curriculum" section

Next step: `/verify 097`
```

For the all-capers view, present a summary table first:

```
| Caper                    | Remaining | Items                               |
|--------------------------|-----------|-------------------------------------|
| 097 The Junior's Junior  | 2         | verify [^1]; accept/reject section  |
| 072 The Hypnotic Machine | 3         | attribution fix; /structure; /mob   |
| ...
```

Then per-caper checklists, sorted by remaining-work
count ascending (fewest items first). Within the same
count, lighter items (verify, correct) sort above
heavier items (rewrite, structural rework).

## Published baseline

Published capers in `published/` are the calibration
target. A typical published caper has: draft.md,
research.md, prior-articles.md, and evaluations covering
voice-guardian, fact-checker-verify, cognition-sensor,
protector, and interrogator.

## Procedure — single caper

1. **Inventory artefacts.** List every file in the caper
   directory and `artefacts/` subdirectory.

2. **Map to pipeline stages.** For each artefact, record
   which checklist row it fills.

3. **Extract evaluation verdicts.** For each evaluation
   file, apply the verdict extraction protocol. Record
   verbatim.

4. **Check draft quality.** Grep draft.md for quality
   markers (`<WARNING>`, `[NEEDS:]`, `[TODO]`,
   contributor placeholders, `<!-- AUTHOR:` HTML
   comment placeholders). Record counts.

5. **Verify turn.md corrections.** For each factual
   correction in turn.md, grep draft.md for the old
   value. Record applied/unapplied per item. For
   non-correction content (structural directives, voice
   decisions), note what the directive says and whether
   the draft appears to comply.

6. **Assess remaining work.** Based on steps 1-5, list
   the specific items remaining before publication.
   Each item is concrete and actionable.

7. **Output checklist.** Produce the structured checklist
   table, remaining-work list, and next step.

## Procedure — all capers

1. **For each unfinished caper**, run the single-caper
   procedure. The verdict extraction and correction
   verification steps are not optional — they are what
   distinguish this from an artefact-existence check.

2. **Assess and sort.** Sort by remaining-work item
   count ascending (fewest first). Within the same
   count, lighter items sort above heavier ones.

3. **Output summary table** then per-caper checklists.

4. **Flag time-sensitive capers.** If caper.md mentions
   time-sensitivity, news hooks, or deadlines, flag
   them regardless of position.

## Output

No files written. Read-only assessment presented to
the author.

## Settlement condition

Every caper assessed from artefact evidence. Remaining
work listed per caper. Sort order visible and
auditable. Author has the information to prioritise.
