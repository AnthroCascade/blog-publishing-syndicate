# finalize

Run deterministic publication-prep on the current draft. No fortes, no LLM calls. The command exists because the LLM drafter regenerates straight ASCII quotes under regeneration pressure regardless of spec instruction — the piece's own thesis applied to its own output. Deterministic code does not negotiate.

Currently scoped to typographic quote conversion. More deterministic publication-prep checks (en-dashes in ranges, ASCII ellipsis conversion, Markdown lint) may be added over time.

## What it runs

| Step | Tool | Mode |
|---|---|---|
| 1 | `tools/smart-quotes.py` | in-place conversion on `artefacts/draft.md` |

## Context requirements

Before running, load:

- `artefacts/draft.md` — the draft being finalised

That is all. The step does not consult caper.md, turn.md, research.md, or any forte spec. It is a mechanical pass on prose.

## Procedure

1. **Confirm target.** Resolve the caper path from `$ARGUMENTS`; target file is `<caper-path>/artefacts/draft.md`.

2. **Check baseline.** Run `python3 mobsta-prototype/tools/smart-quotes.py --check <target>` first. Report the count of straight doubles and straight apostrophes.

3. **Apply conversion.** Run `python3 mobsta-prototype/tools/smart-quotes.py <target>`. The script writes in place and reports how many characters were converted.

4. **Verify clean.** Run `--check` again. Report confirmation.

5. **Present to author.** One line summary: how many doubles and apostrophes converted; confirmation that the file is now clean.

Do not fire agents. Do not write evaluation files. This is a deterministic pass.

## Output

- `artefacts/draft.md` — in-place conversion, typographic quotes throughout.

## Settlement condition

`smart-quotes.py --check <target>` returns exit 0.

## Boundary

Mechanical publication prep only. Voice is `polish` or `voice-pass`. Facts are `verify`. Prose is `draft`. Promotional text is `promote`.

Does not fire fortes. Does not consume or produce evaluation files. Does not clear `artefacts/evaluations/`. Does not clear `turn.md`.

## When to run

After `/polish` (or `/mob`), before `/promote`. The piece is voice-clean and fact-verified; you want the text typographically clean before generating platform promotion text or pasting to Substack.

Running `/finalize` on an earlier draft is fine but wasteful — the drafter regenerates prose that will need re-finalising. Run it when the prose has settled.
