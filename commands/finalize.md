# finalize

Run deterministic publication-prep on the current draft. No fortes, no LLM calls.

Currently scoped to typographic quote conversion. More deterministic publication-prep checks (en-dashes in ranges, ASCII ellipsis conversion, Markdown lint) may be added over time.

## What it runs

| Step | Tool | Mode |
|---|---|---|
| 1 | `tools/smart-quotes.py` | in-place conversion on `artefacts/draft.md` |

## Context requirements

Before running, load:

- `artefacts/draft.md` — the draft being finalised

That is all. The step is a mechanical pass on prose.

## Procedure

1. **Confirm target.** Resolve the caper path from `$ARGUMENTS`; target file is `<caper-path>/artefacts/draft.md`.

2. **Check baseline.** Run `python3 mobsta-prototype/tools/smart-quotes.py --check <target>` first. Report the count of straight doubles and straight apostrophes.

3. **Apply conversion.** Run `python3 mobsta-prototype/tools/smart-quotes.py <target>`. The script writes in place and reports how many characters were converted.

4. **Verify clean.** Run `--check` again. Report confirmation.

5. **Present to author.** One line summary: how many doubles and apostrophes converted; confirmation that the file is now clean.

## Output

- `artefacts/draft.md` — in-place conversion, typographic quotes throughout.

## Settlement condition

`smart-quotes.py --check <target>` returns exit 0.

## When to run

After `/polish` (or `/mob`), before `/share`. Run when the prose has settled.
