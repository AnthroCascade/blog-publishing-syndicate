# pick

Draft a short post from a ripe caper. No mob, no fortes. One claim, author's voice, direct drafting. LinkedIn posts and short Substack pieces — one pass.

## Fortes

None. This command does not fire fortes. The orchestrator drafts directly.

## Coordination pattern

Direct drafting. No sub-agents, no evaluation loop. One pass.

## Context requirements

Before drafting, load:

- `garden.md` — what's ripe, what's been picked
- The caper's `caper.md` — intent, angle, findings
- The caper's research and findings (if they exist)

## Procedure

1. **Garden review mode.** If the author says `garden` or gives no caper number, read garden.md and present what's ripe with a one-line recommendation per caper. Wait for the author to choose. Do not draft.

2. **Draft.** Write a short post directly. Constraints:
   - Author's register: conversational, direct, blunt. Australian spelling.
   - One claim. Support it. Stop.
   - LinkedIn: 500-800 words. Substack short: 800-1200. Author decides which at draft time.
   - No throat-clearing. No "it's worth noting." No false stakes. Open with the claim or the evidence.
   - The caper's findings are source material, not structure. The post is not a summary of the research — it's one sharp thing drawn from it.

3. **Present.** Show the draft to the author. They edit, they publish. One-pass process.

4. **Update garden.** After the author approves or publishes, update garden.md to reflect what was picked and what it produced.

## Output

- Draft text presented to the author (not written to artefacts — this is a short post, not a caper draft)
- `garden.md` (updated after approval)

## Settlement condition

Draft presented. Author has approved, edited, or rejected. Garden updated.

## Boundary

Short posts only. If the author wants a full article, use `draft`. If they want mob evaluation, use `mob`. `pick` is fast, light, and done.
