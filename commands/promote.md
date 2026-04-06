# promote

Generate platform-specific promotional text for a publishable article. The promotion-crafter assesses platform fit and crafts text in the author's voice for each selected platform.

## Fortes

| Step | Forte | Mode | Receives additionally |
|---|---|---|---|
| 1 | promotion-crafter | generate | selected platforms, prior-articles, game.md corpus state |

## Coordination pattern

Single-agent. The promotion-crafter fires once with the author's platform selections.

## Context requirements

Before the promotion-crafter fires, load:

- `caper.md` — durable intent
- `artefacts/draft.md` — the article to promote
- `artefacts/prior-articles.md` — corpus context (confirm existence)
- `game.md` — corpus state, reader carry-forward
- `syndicate.md` — syndicate definitions
- Distribution talent (`talents/distribution.md` relative to syndicate root) — platform list and guidance
- Promotion-crafter forte spec and all talents from its "Draws on" section

## Procedure

1. **Present platform menu.** Read the distribution talent for the full platform list. Present the platforms to the author for selection. Default selections: Substack Notes and LinkedIn. Available platforms include Twitter/X, Hacker News, Reddit, Mastodon/Bluesky, Dev.to. The author adds or removes platforms, then confirms.

2. **Fire promotion-crafter.** The promotion-crafter receives selected platforms, the draft, prior-articles, and game.md corpus state. It assesses fit and crafts text for confirmed platforms only.

3. **Present to author.** For each platform: fit assessment (strong, possible, or skip), rationale, promotional text (if strong or possible), and platform-specific guidance. Also present subject line options (3-5) with the promotion-crafter's top pick and rationale.

4. **Author decides per platform.** Approve (text ready to use), modify (author adjusts, orchestrator records), or skip (platform dropped from this promotion). The author also selects or modifies a subject line.

5. **Record approved texts.** Write all approved or author-modified texts to `artefacts/promotion.md`. Include skipped platforms at the end with rationale, so the record shows what was considered and rejected. Include the chosen subject line.

## Output

- `artefacts/promotion.md`

## Settlement condition

Platform texts generated. Strategy approved by author. Approved texts recorded.

## Boundary

Generates platform-specific promotion text only. Does not cross-post, publish, or schedule. Evaluation is `mob`. Prose is `draft`.
