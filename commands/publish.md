# publish

Record a publication and run the post-publication sequence. The pasting into Substack is manual and stays manual — Substack is a render target, not a system of record. Everything after the paste is bookkeeping that drifts when done by hand: the folder move, the link-map entry, the garden snapshot. This command does that bookkeeping in one pass.

## Fortes

None for the mechanics. The link-map entry's in-voice description lines follow link-map.md rule 6 (author's voice, author's coinages) — drafted in the main loop, approved by the author.

## Inputs

- Caper path
- The live URL and publication date (from the author — the command never assumes a post is live)

## Procedure

1. **Confirm.** Author supplies the live URL and date. No URL, no publish — stop and say what's missing.

2. **Move.** `capers/<caper>/` → `published/<caper>/`. Whole directory, nothing renamed, nothing dropped. If a `turn.md` is pending, surface it before moving — published capers don't owe turns.

3. **Link-map entry.** `published/link-map.md` is the single source of truth for backward links and carries its own governing rules — read them there, follow them exactly (backward only, append-only, 2–3 links, bias to coinage, author's voice in descriptions). Draft the new post's section: slug, URL, date, status, candidate backward links with in-voice description lines, and the `section-markdown` paste block. Present to the author. On approval, append with status `rendered`. The author pastes into Substack and flips the row to `live` — or asks for it now.

4. **Tend.** Refresh the garden snapshot (the `tend` procedure) so the move shows immediately.

5. **Offer the next move.** `share` writes the platform-native announcement texts. Name it; don't run it.

## Output

- `published/<caper>/` (moved)
- `published/link-map.md` (new section, status `rendered`)
- `games/garden.md` (snapshot refreshed)

## Settlement condition

Caper in `published/`. Link-map entry approved and appended. Garden snapshot current. Author knows `share` is the next move.

## Boundary

Records a publication that already happened. Does not draft prose (`draft`), evaluate (`mob`), assess readiness (`ready`), or write share texts (`share`). Does not paste into Substack — the author owns the render.
