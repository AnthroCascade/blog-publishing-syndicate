# Serial Publication

## The reader carries nothing — that is the default

Every piece, and every platform share, is written for a reader who carries nothing of the corpus. New readers enter at any article. Subscribers have not read most prior pieces, and forget the ones they did. The moment a piece leans on a prior concept the reader is assumed to already hold, it has lost that reader. This is the default and it is never silently relaxed.

What a piece can genuinely build on is only what it establishes *within itself* — section three may rely on section one, because the reader read section one ten minutes ago. That within-piece carry-forward is real. Corpus carry-forward is not, until the author grants it.

The author grants it per caper, by naming specific concepts in the caper's `Reader carries:` field. Absent that naming, assume zero. And even when the author names concepts, every reference to one must still pass the legibility test below: the field licenses the piece to *lean on* a concept, never to *assume the reader has met it*. The corpus is the author's to carry forward and the evaluator's to judge against — never the reader's to have read.

## Positioning patterns

- **Extends:** Takes a prior concept into new territory.
- **Resolves:** Answers a question left open.
- **Instantiates:** Shows a specific case of an established general principle.
- **Complicates:** Reveals something that makes a previous claim harder to hold.
- **Converges:** Brings together threads from multiple previous pieces.

These categories are for your thinking. In your findings, describe the relationship plainly — don't label it.

## Callback patterns

**Legibility test:** Can a reader who has not read the earlier piece follow this reference? If not, it needs a brief recap or should be cut.

**Advancing:** Start where the previous article left off, not where it began. "The friction paradox — which governs..." not "In a previous article, I argued that..."

Every callback does argumentative work. Cut decorative references.

## Series discipline

- The corpus provides evaluative context — to the mob, not knowledge to the reader
- Callbacks earn their place through legibility to new readers
- Trust only what this piece has established, or what the caper's `Reader carries:` field explicitly grants
- Reference the concept, not the article — and make the reference self-contained
- Continuity breaks are acknowledged when they happen

## Backward links (the "Prior pieces" block)

Inline callbacks are the argument reaching back. The **Prior pieces** block is the separate, standalone footer that hands the reader an explicit path back to the pieces this one was built on — for the reader who arrived late and never saw the vocabulary minted. Every published piece carries one (unless it's a root with no earlier kin). It is generated when the piece is positioned, so it ships with the article.

**Rules** — these govern the block, and they keep the corpus's link graph sound:

1. **Backward only.** A piece links solely to pieces published *before* it. No cycles, ever.
2. **Append-only.** A piece's block is fixed once written. A newer piece appearing never forces an edit to an older one's block.
3. **Leave forward listings alone.** Some pieces already carry forward references. This neither adds nor removes them — it only maintains the backward block.
4. **Two to three links.** Chosen for genuine kinship, not a quota. A retrospective that gathers the whole corpus may carry up to four.
5. **Bias to coinage.** Prefer the pieces that first minted a term this one leans on (the friction paradox, the Janus property, the lurch, costly cognition, zombie porridge).
6. **Descriptions in the author's voice.** One line per link — the author's own register and coinages, never a flat SEO-register summary lifted from a corpus index.
7. **Placement.** A divider, then the block, then any references. The piece's last *prose* line stays last — the endings are deliberate; do not bury them.

**Form** — label `**Prior pieces**`, one bullet per link, the description picking up where that piece left off:

```
---
**Prior pieces**
- [<title>](<url>) — <one line, author's voice: what that piece established that this one leans on>
```

**Root pieces** — the first nodes, or pieces with no meaningful earlier kin (a detection one-off, a light piece) — get no block. Don't invent kinship to fill the slot.
