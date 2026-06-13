# tend

Refresh the garden's derived inventory from the folder structure, and report the drift. The folder structure is the source of truth — `capers/` = open, `published/` = published, `stale/` = stale. garden.md carries a generated snapshot of that truth so the author never hunts for "the list" again. Tending regenerates the snapshot; it never touches the author's narrative entries.

## Fortes

None. The orchestrator reads and assembles directly. No judgment is exercised — `ready` assesses readiness, `harvest` surfaces what capers ask of the author. Tend records state.

## Inputs

- Every game directory under `games/` that contains `capers/`
- Per caper: the artefact inventory and file modification dates

## Stage inference

A caper's stage is the furthest milestone its artefacts evidence:

| Evidence | Stage |
|---|---|
| `caper.md` only | seed |
| `artefacts/research.md` | researched |
| `artefacts/draft.md` | drafted |
| `artefacts/evaluations/` non-empty | evaluated |
| `artefacts/share.md` | shared |
| lives in `published/` | published |
| lives in `stale/` | stale |

Last-touched is the newest modification date of any file in the caper directory.

## Procedure

1. **Scan.** Walk each game's `capers/`, `published/`, `stale/`. For each caper: number, slug, state, inferred stage, last-touched date, and any `turn.md` present (an unconsumed turn.md means the author owes or is owed a move).

2. **Regenerate the snapshot.** In `games/garden.md`, replace everything between the `<!-- tend:begin -->` and `<!-- tend:end -->` markers with the fresh inventory: one table per game, open capers sorted by last-touched (newest first), then counts for published and stale (full rows only for open capers — published and stale are listed compactly). Nothing outside the markers is touched.

3. **Report drift.** Tell the author what changed since the last tend: new capers on disk not yet in any narrative entry, capers that moved state (open → published, open → stale), open capers with a pending turn.md, and open capers untouched for 30+ days (drifting toward stale — name them, no judgment).

4. **Decisions stay durable.** garden.md carries a `## Cross-caper decisions` section outside the markers. Tend never writes it unprompted. When the author states a cross-caper decision in-session (merge, split, retirement, ordering), append it there — date, decision, one line of why — at the author's word.

## Output

- `games/garden.md` (snapshot regenerated between markers; all other content preserved)

## Settlement condition

Snapshot matches the folder structure. Drift reported. Narrative and decisions untouched.

## Boundary

Records state; does not assess it. Publication readiness is `ready`. What capers ask of the author is `harvest`. Picking is `pick`. Tend writes only `games/garden.md`, only between its markers, plus author-dictated decision entries.
