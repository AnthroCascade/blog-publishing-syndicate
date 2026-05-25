# findings

Surface the argument the evidence wants to make. Post-research, pre-compost. The findings-synthesiser reads research.md and caper.md, maps the default argument shape, assesses evidence strength, identifies where the author's angle departs from the literature, and names the composting question.

## Fortes

| Step | Forte | Mode | Receives additionally |
|---|---|---|---|
| 1 | findings-synthesiser | synthesis | — |

## Coordination pattern

Single-agent. One forte, one Agent call.

## Context requirements

Before the forte fires, load:

- `caper.md` — intent, angle, corpus reach, key research, author decisions
- `artefacts/research.md` — assembled and verified research material
- `game.md` — up to the forte baseline marker
- Each talent from the forte's "Draws on" section

## Precondition

`artefacts/research.md` must exist. If it doesn't, tell the author to run `/research` first.

## Procedure

1. **Check precondition.** Verify research.md exists.

2. **Fire findings-synthesiser.** The forte reads the research material and the caper's angle. It produces a four-part synthesis: default argument, evidence strength map, departures, composting question.

3. **Present to author.** Relay the forte's output inline. No file written. The synthesis is ephemeral — it captures what the evidence currently says. Once the author composts and the angle shifts, the synthesis is stale.

## Output

Conversational only. No artefact file.

## Settlement condition

Default argument mapped. Evidence strength assessed per claim. Departures from caper angle identified. Composting question named.

## Boundary

Reads research. Does not evaluate drafts, fire the mob, gather new sources, or prescribe what the author should think. The gap between findings and the author's own thinking is composting — and composting can't be automated.
