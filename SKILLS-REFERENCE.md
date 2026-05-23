# Skills Reference

Quick reference for all syndicate commands, the
fortes they fire, and the talents those fortes draw on.

Full command specifications live at `commands/`.
Each command spec is platform-agnostic — it describes
what to do in terms of fortes, talents, coordination
patterns, and settlement conditions. Claude Code
skills at `.claude/skills/` are thin adapters that
read and execute these specs.

Meta commands (`/learn`, `/improve`, `/distill`,
`/interrogate`, `/report`, `/foundations`) are
coordination syndicate commands used by all content
syndicates. Their specs live at
`../coordination/commands/`.

## Idea lifecycle (before the mob)

| Skill | What it does | Fortes | Talents |
|---|---|---|---|
| `/prospect` | Scans web for corpus-connected articles, ranks angles, sets up capers with findings | prospect | serial-publication, editorial, critical-stance |
| `/harvest` | Surveys unfinished capers by ripeness, not priority. Author recognises what's composted enough to invest in | harvest | serial-publication, critical-stance |
| `/weigh` | Tests idea viability. Quick (L1) or research-informed (L2 with `deep`). Verdict: proceed, compost, re-vehicle, kill | pragmatic-sceptic | critical-stance, editorial |

These three operate before the syndicate's workflow
phases engage. Between harvest and research, when
the author is considering investing.

## Research (are the claims sourced?)

| Skill | What it does | Fortes | Talents |
|---|---|---|---|
| `/research` | Assembles material and checks claims against research.md | research-assembler → fact-checker | research, verification, critical-stance |

Settles when: claims sourced, research.md complete.

## Drafting (write it)

| Skill | What it does | Fortes | Talents |
|---|---|---|---|
| `/draft` | Drafts or redrafts prose in the author's voice | drafter | voice-craft, editorial, cognition-sensing, critical-stance |
| `/revise` | Applies evaluation findings and author decisions. Corrections only -- not rewriting | drafter (correction mode) | voice-craft, editorial, cognition-sensing, critical-stance |

`/draft` rewrites. `/revise` patches. Different
commands, different intent.

## Evaluation (does it work?)

| Skill | What it does | Fortes | Talents |
|---|---|---|---|
| `/mob` | Full pass -- all 7 evaluative fortes, then human, then protector | voice-guardian, cognition-sensor, structural-thinker, thesis-sharpener, continuity-thinker, fact-checker, research-assembler → human → protector | all 9 |
| `/structure` | Argument builds, thesis crystallises, corpus position clear | structural-thinker, thesis-sharpener, continuity-thinker → human → protector | editorial, critical-stance, serial-publication, evaluation-failure-patterns |
| `/polish` | Voice protection and cognitive presence | voice-guardian, cognition-sensor → human → protector | voice-craft, cognition-sensing, editorial, critical-stance, evaluation-failure-patterns |
| `/voice-pass` | Iterative voice fix loop (max 3 passes), then protector | voice-guardian (revise mode) → [loop max 3] → protector | voice-craft, cognition-sensing, editorial, critical-stance, evaluation-failure-patterns |
| `/verify` | Claims checked against primary sources via web search | fact-checker (web mode) | verification, research, critical-stance |
| `/interrogate` | Re-interrogates existing evaluation files for depth. Catches shallow findings without re-running content fortes | interrogator (coordination) | governance, prosecution |

`/mob` is the exception, not the norm. Phase-specific
commands are the default.

`/voice-pass` is the only iterative command. If still
finding violations at pass 3, remaining findings go to
the evaluation file as unresolved. Three passes that
don't converge means lurching.

`/voice` is a lightweight alternative: fires
voice-guardian in revise mode directly against the
draft — evaluates and amends in one pass. No prior
evaluation files required as input.

| Skill | What it does | Fortes | Talents |
|---|---|---|---|
| `/voice` | Surgical voice fixes applied directly to draft. No evaluation files needed as input | voice-guardian (revise mode) | voice-craft, cognition-sensing, editorial, critical-stance |

The human forte is asynchronous -- the orchestrator
pauses for the author. May be skipped on any pass.
The protector fires last, testing whether findings
would improve the draft or just make it different.

## Reception (how does the reader receive it?)

| Skill | What it does | Fortes | Talents |
|---|---|---|---|
| `/reception` | Models the target reader's experience — where they check out, push back, nod, or get confused | reader-proxy → human → protector | reader-empathy, influence, critical-stance, editorial, evaluation-failure-patterns |

Settles when: reader reception mapped, resistance points
identified, opening contract and takeaway assessed.

## Share (get it out there)

| Skill | What it does | Fortes | Talents |
|---|---|---|---|
| `/share` | Writes platform-native text about the article in the author's voice. Same register everywhere — the container changes, the voice does not | share-crafter | distribution, voice-craft, serial-publication, critical-stance, influence |

## Publication prep (deterministic)

| Skill | What it does | Fortes | Talents |
|---|---|---|---|
| `/finalize` | Deterministic publication-prep on draft. Currently: typographic quote conversion via `smart-quotes.py`. No LLM calls | (none) | (none) |

Run after `/polish`, before `/share`. Mechanical pass only.

## Readiness (where are we?)

| Skill | What it does | Fortes | Talents |
|---|---|---|---|
| `/ready` | Assesses publication readiness from artefact evidence. Maps artefacts to pipeline stages, reads evaluation verdicts, checks draft quality, compares against published baseline. `/ready` for all capers, `/ready 097` for one | (none) | (none) |

No fortes, no metadata labels. Derives progress from
what exists in the artefacts directory and what those
artefacts contain. Read-only.

## Meta (across capers)

| Skill | What it does | Fortes |
|---|---|---|
| `/report` | Reads current forte evaluation files, writes cross-cutting summary. Does not fire fortes or clear evaluations | (none) |
| `/learn` | Scans session for author corrections, proposes learnings for caper's learnings.md. Author approves each | learning-capturer (coordination) |
| `/improve` | Reads learnings, proposes modifications to forte and talent specs. Author approves each change | spec-evolver (coordination) |
| `/distill` | Compacts a skill, forte, or talent file -- reduces volume while preserving requirements. Author approves each file | spec-distiller (coordination) |
| `/settle` | Reconciles turn.md decisions into caper.md. Promotes durable decisions, removes superseded material, clears consumed turn instructions. Author approves | settler (coordination) |
| `/foundations` | Reads foundation documents and current specs, reports drift in both directions. Does not fire fortes or modify files | (none) |

`/learn` and `/improve` are a pipeline. `/learn`
captures what went wrong (or right) in the session.
`/improve` turns those learnings into spec changes.
Neither modifies specs without author approval.

## Typical workflow

```
/prospect                       scan for angles
    |
    (compost — author's work)
    |
/harvest                        what's ripe?
/weigh caper "..."              can this survive investment?
    |
/ready                          where is everything? (any time)
    |
/research caper "..."           source the claims
    |
/draft caper "..."              write it
    |
/mob caper "..."                full evaluative pass
    |
    (author decisions in turn.md)
    |
/revise caper "..."             apply corrections
    |
/structure caper "..."          focused structural check
/polish caper "..."             voice and cognition check
/reception caper "..."          reader reception check
    |
    (repeat as needed)
    |
/settle caper "..."             promote decisions to caper.md
    |
/verify caper "..."             check claims against sources
    |
/finalize caper "..."           typographic quotes
    |
/share caper "..."              platform texts
    |
/learn                          capture what happened
/improve                        evolve the specs
```

Arrows are typical, not mandatory. Any command can
be invoked at any time. Different capers are at
different stages simultaneously.

## Fortes and what they draw on

Each forte is a specialised evaluator (or drafter,
or crafter). Its "Draws on" section names the
talents it needs. The orchestrator resolves talent
paths at `talents/[name].md` from the syndicate root.

### Blog-publishing fortes

| Forte | Purpose | Talents |
|---|---|---|
| drafter | Drafts prose in the author's voice (draft and revise modes) | voice-craft, editorial, cognition-sensing, critical-stance |
| voice-guardian | Protects voice in existing text. Detection, not decoration | voice-craft, cognition-sensing, editorial, critical-stance |
| structural-thinker | Argument builds, never catalogues | editorial, critical-stance |
| fact-checker | Every claim sourceable (research mode against research.md, verify mode against primary sources via web) | verification, research, critical-stance |
| thesis-sharpener | Actual argument crystallises early | editorial, critical-stance |
| research-assembler | Material assembled before drafting | research, verification |
| cognition-sensor | Cognitive presence confirmed. Absence of AI tells | cognition-sensing, editorial, voice-craft, critical-stance |
| continuity-thinker | Positions article within the body of work. Corpus is context, not checklist | serial-publication, editorial, critical-stance |
| protector | Tests whether each finding would improve the draft or just make it different | evaluation-failure-patterns, critical-stance, editorial |
| human | Biologically independent verification. Not agent-spawnable, asynchronous | (none -- their own talent) |
| share-crafter | Writes platform-native text about the article in the author's voice | distribution, voice-craft, serial-publication, critical-stance, influence |
| pragmatic-sceptic | Tests whether an idea can survive investment | critical-stance, editorial |
| prospect | Corpus-aware landscape scanning and angle synthesis | serial-publication, editorial, critical-stance |
| reader-proxy | Models the target reader's experience through the draft. Reception, not production quality | reader-empathy, influence, critical-stance, editorial |
| harvest | Readiness detection of unfinished capers | serial-publication, critical-stance |

### Coordination fortes (used by meta commands)

| Forte | Purpose | Talents |
|---|---|---|
| interrogator | Re-interrogates evaluation findings for depth | governance, prosecution |
| learning-capturer | Identifies patterns from author corrections | context-hierarchy |
| spec-evolver | Proposes spec modifications from learnings | (none -- knowledge is the specs themselves) |
| spec-distiller | Compacts specs while preserving requirements | (none -- knowledge is the spec architecture) |

## Talents

12 talent files at `talents/`. Each is domain knowledge
that fortes draw on -- not agents, not evaluators,
just knowledge.

| Talent | Domain | Used by |
|---|---|---|
| voice-craft | Recognising, preserving, and working within the author's voice | drafter, voice-guardian, cognition-sensor, share-crafter |
| editorial | Essay structure, argument, rhetoric | drafter, voice-guardian, structural-thinker, thesis-sharpener, cognition-sensor, continuity-thinker, protector, pragmatic-sceptic, prospect, reader-proxy |
| critical-stance | Adversarial reasoning, counterargument | all 14 blog-publishing fortes except human |
| cognition-sensing | Detecting AI tells, confirming cognitive presence | drafter, voice-guardian, cognition-sensor |
| research | Source finding, evidence assembly | fact-checker, research-assembler |
| verification | Claim checking, source validation | fact-checker, research-assembler |
| serial-publication | Corpus positioning, series continuity | continuity-thinker, share-crafter, prospect, harvest |
| distribution | Platform format constraints and audience context | share-crafter |
| reader-empathy | How readers process, resist, and respond to arguments. Attention economics, resistance patterns, register fit | reader-proxy |
| influence | Cialdini's seven principles applied to this author's register and structure | reader-proxy, drafter, voice-guardian, share-crafter, cognition-sensor, structural-thinker |
| evaluation-failure-patterns | How evaluative mobs fail: groupthink, lurching, cosmetic fixes | protector |
| caper-aligned-findings | Anchoring every finding to caper material and assessing article-purpose impact | voice-guardian, cognition-sensor, structural-thinker, thesis-sharpener, continuity-thinker, fact-checker, research-assembler, protector, reader-proxy |

## Coordination pattern

Commands that fire multiple evaluative fortes follow
the same sequence:

1. Content fortes fire (parallel where independent)
2. Human forte fires (asynchronous -- author reviews)
3. Protector fires (sequential -- needs all evaluations)

The human step may be skipped. The protector step
is never skipped in evaluation commands.

Single-forte commands (`/draft`, `/revise`, `/verify`,
`/share`) run one agent and return.

`/voice-pass` is the only iterative command.
