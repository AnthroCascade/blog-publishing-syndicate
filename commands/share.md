# share

Write platform-native text about a published or publishable article. The share-crafter writes as the author on each platform — same voice, same register, same diagnostic stance. The article is linked, not sold.

## Fortes

| Step | Forte | Mode | Receives additionally |
|---|---|---|---|
| 1 | share-crafter | generate | selected platforms, prior-articles, game.md corpus state |

## Coordination pattern

Single-agent. The share-crafter fires once with the author's platform selections.

## Context requirements

Before the share-crafter fires, load:

- `caper.md` — durable intent
- `artefacts/draft.md` — the article to write about
- `artefacts/prior-articles.md` — corpus context (confirm existence)
- `game.md` — corpus state, reader carry-forward
- `syndicate.md` — syndicate definitions
- Distribution talent (`talents/distribution.md` relative to syndicate root) — platform constraints
- Share-crafter forte spec and all talents from its "Draws on" section

## Procedure

1. **Present platform menu.** Read the distribution talent for the full platform list. Present the platforms to the author for selection. Default selections: Substack Notes and LinkedIn. The author adds or removes platforms, then confirms.

2. **Fire share-crafter.** The share-crafter receives selected platforms, the draft, prior-articles, and game.md corpus state. It writes platform-native text for confirmed platforms.

3. **Present to author.** First: the grab passage — the verbatim excerpt the share-crafter identified as the strongest pull from the draft. Then for each platform: the text, and any platform-specific format notes (char counts, link placement). Also present subject line options (3-5) with the share-crafter's top pick and rationale.

4. **Author decides per platform.** The grab passage is context for decisions, not a deliverable — the author may use it as a starting point, ignore it, or let it inform their angle. Approve platform texts (text ready to use), modify (author adjusts, orchestrator records), or skip (platform dropped). The author also selects or modifies a subject line.

5. **Record approved texts.** Write all approved or author-modified texts to `artefacts/share.md`. Include skipped platforms at the end with rationale, so the record shows what was considered and rejected. Include the chosen subject line.

## Output

- `artefacts/share.md`

## Settlement condition

Platform texts written. Author approves. Texts recorded.

## Boundary

Writes platform-native text only. Does not cross-post, publish, or schedule. Evaluation is `mob`. Prose is `draft`.
