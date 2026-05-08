# prospect

Scan the web for recent articles that connect to the existing corpus, propose angles, and set up capers with findings.

## Fortes

| Step | Forte | Mode | Receives additionally |
|---|---|---|---|
| 1 | prospect | search and synthesise | all caper.md files, game.md corpus state |

## Coordination pattern

Single-agent with parallel web search. The prospect forte extracts thematic strands from the corpus, then parallel search agents scan the web across those strands. The forte synthesises and ranks the results.

## Context requirements

Before the prospect forte fires, load:

- `game.md` — corpus state, author voice, process learnings
- Every `capers/*/caper.md` — to understand what's been written, what's in progress, what angles are already claimed
- Prospect forte spec and all talents from its "Draws on" section

## Procedure

1. **Load corpus context.** Read game.md and every caper.md in the game. This tells the forte what positions are already staked, what's in progress, and what angles are claimed.

2. **Extract thematic strands.** The prospect forte analyses the corpus context and identifies thematic strands — the threads running through the body of work that can connect to external material.

3. **Parallel web search.** Launch parallel searches across the thematic strands the forte identifies. Each search covers recent articles (last 6 months). Each returns: title, source, date, URL, and a 2-3 sentence summary of the key argument. Searches do not duplicate across strands.

4. **Synthesise and rank.** Once all searches return, the prospect forte applies its angle synthesis and ranking protocol. Present a summary table ranking all angles, then expand each with full synthesis — how the external material connects to the corpus, what the angle is, why it's worth pursuing.

5. **Author chooses.** Present the angles to the author. Wait for selection.

6. **Set up capers.** For each selected angle, create a caper directory with a caper.md containing: intent, status ("Findings gathered. Not yet researched or drafted."), angle, corpus reach, and findings (all relevant sources with title, source, date, URL, and summary). The caper number is the next available number across all games.

## Output

- `capers/[NNN]-[slug]/caper.md` (one per selected angle)

## Settlement condition

Angles presented. Author has selected. Capers set up with gathered findings.

## Boundary

Scans and proposes angles. Author chooses which to pursue. Creates only caper.md per selected angle — no research.md, no draft, no evaluations. Research comes later via `research`.
