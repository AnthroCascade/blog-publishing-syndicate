# share

Write platform-native text about a published or publishable article. The share-crafter writes as the author on each platform — same voice, same register, same diagnostic stance. The article is linked, not sold — and not re-argued: the text opens the piece, it does not replace it.

## Fortes

| Step | Forte | Mode | Receives additionally |
|---|---|---|---|
| 1 | share-crafter | generate | resolved platforms, prior-articles, game.md corpus state |

## Coordination pattern

Single-agent. The share-crafter fires once for the resolved platforms.

## Context requirements

Before the share-crafter fires, load:

- `caper.md` — durable intent
- `artefacts/draft.md` — the article to write about
- `artefacts/prior-articles.md` — corpus context (confirm existence)
- `game.md` — corpus state (the mob's evaluative context, not reader knowledge; the share text stands alone for a reader who carries nothing — see serial-publication)
- `syndicate.md` — syndicate definitions
- Distribution talent (`talents/distribution.md` relative to syndicate root) — platform constraints
- Share-crafter forte spec and all talents from its "Draws on" section

## Procedure

The skill generates the share content and writes it to the caper's artefacts. The author takes what they want from the file. Do not gate on author sign-off, and do not present approve/modify/skip menus — the file is the deliverable, the author edits it directly.

1. **Resolve platforms.** Default to Substack Notes and LinkedIn. If the invocation names platforms, write for those instead. No interactive menu. The full platform list lives in the distribution talent.

2. **Fire share-crafter.** The share-crafter receives the resolved platforms, the draft, prior-articles, and game.md corpus state. It writes platform-native text for each platform, the grab passage, and subject-line options (3-5, ranked).

3. **Write `artefacts/share.md`.** Record the complete output: the grab passage, every platform's text with its format notes (char counts, link placement), and all subject-line options with the share-crafter's ranking. If the share-crafter judged a platform a poor fit, list it at the end with the rationale so the record shows what was considered and rejected. The author selects a subject line and edits the texts in the file.

## Output

- `artefacts/share.md` — grab passage, per-platform texts with format notes, ranked subject-line options.

## Settlement condition

`artefacts/share.md` written with the grab passage, the per-platform texts, and the subject-line options. The author takes it from there.

## Boundary

Writes platform-native text only. Does not cross-post, publish, or schedule. Evaluation is `mob`. Prose is `draft`.
