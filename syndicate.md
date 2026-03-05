# Blog Publishing

## Fortes

- drafter — drafts prose in the author's voice (draft mode and revise mode)
- voice-guardian — protects voice in existing text
- structural-thinker — argument builds, never catalogues
- fact-checker — every claim sourceable, verified before presenting (research mode and verify mode)
- thesis-sharpener — actual argument crystallises early
- research-assembler — material assembled before drafting
- slop-detector *(reusable, from top-level `fortes/`)* — no AI tells in output
- continuity-thinker — positions article within the body of work
- promotion-crafter — crafts platform-specific promotion for published articles
- pragmatic-sceptic — tests whether an idea can survive investment before research or drafting begins
- prospect — corpus-aware landscape scanning, angle synthesis and ranking
- harvest — readiness detection, author-diagnostic assessment of unfinished capers

## The default is the enemy

All fortes suppress AI's default: produce confident, well-structured-looking text fast.

## Coordination

Not prescribed. Game or caper chooses. Turn-taking
is simplest default.

## Idea lifecycle

The syndicate's workflow phases begin at Research.
But ideas exist before the syndicate engages. The
lifecycle before the mob:

**Prospect** → **Compost** → **Harvest** → **Weigh**

**Prospect** is analytical. Scan the landscape for
material that connects to the existing corpus —
extensions of staked positions, clear disagreements,
adjacent what-ifs. The output is a caper with
findings and an angle. This is outward-facing and
can be automated. `/prospect`

**Compost** is the author's work and cannot be
automated. The author lives with the ideas. Some
nag while walking. Some surface while debugging.
Some clarify when reading someone else's argument
and thinking "no, that's wrong, and I know why."
This is where the idea becomes the author's — where
they discover what *they* think, distinct from what
the findings suggest they should think. The
analysis-drafting gap applies here: skip composting
and you get a well-sourced article with no person
in it.

**Harvest** is recognition, not ranking. The author
surveys unfinished capers to feel which ones have
ripened — which ideas they've internalised enough
that their voice can carry them. Readiness is not
importance. A backlog ranks by priority. A garden
reports on ripeness. `/harvest`

**Weigh** is adversarial. The pragmatic-sceptic
forte tests whether the idea can survive investment.
Quick assessment (Level 1) works from caper.md and
raw material. Research-informed assessment (Level 2)
adds landscape scanning and counterargument testing.
Verdict: proceed, compost, re-vehicle, or kill. The
author decides, but the sceptic provides opinion,
not helpfulness. `/weigh`

An idea enters the syndicate's workflow phases when
the author weighs it and decides to proceed — when
they know the idea holds and are ready to invest.

## Workflow phases

The syndicate declares its phases. Coordination
patterns operate within them. The author controls
emphasis by choosing which phase to invoke.

| Phase | Fortes | Settles when |
|---|---|---|
| Research | research-assembler, fact-checker (against research.md) | Claims sourced, research.md complete |
| Draft | drafter | Author accepts or enters evaluation |
| Structure | structural-thinker, thesis-sharpener, continuity-thinker | Argument builds, concept ownership clear, no structural circling |
| Polish | voice-guardian, slop-detector | Voice clean, no AI tells |
| Verify | fact-checker (web search against primary sources) | All claims verified externally |
| Promote | promotion-crafter | Platform texts generated, strategy approved by author |

Phases are not strictly sequential. The author may
return to an earlier phase (e.g. new claims emerge
during drafting → back to research). But each phase
has a "settles when" condition. Once settled, the
phase does not re-engage unless new material
triggers it.

`/mob` fires all evaluative fortes regardless of
phase. Use it for full passes when phase boundaries
are unclear or when the author wants a complete
assessment. Phase-specific invocations are the norm;
`/mob` is the exception.

## Commands

### Workflow phase commands

Each phase maps to a command. The syndicate implies a
default coordination pattern; the game can override.

| Command | Phase | Fortes | Default pattern | Settles when |
|---------|-------|--------|-----------------|--------------|
| mob | (all) | all 7 evaluative | parallel-evaluation | Forte files written |
| draft | Draft | drafter | single-agent | Draft written |
| research | Research | research-assembler, fact-checker | sequential-pipeline | Claims sourced |
| structure | Structure | structural-thinker, thesis-sharpener, continuity-thinker | parallel-evaluation | Argument builds |
| polish | Polish | voice-guardian, slop-detector | parallel-evaluation | Voice clean |
| verify | Verify | fact-checker (web) | single-agent | Claims verified externally |
| revise | Draft (correction) | drafter | single-agent | Corrections applied |
| promote | Promote | promotion-crafter | single-agent | Author approves strategy and texts |

### Idea lifecycle commands

These operate before the mob engages.

| Command | Lifecycle phase | Fortes | What it does |
|---------|----------------|--------|--------------|
| prospect | Prospect | prospect | Scans web for corpus-connected articles, ranks angles, sets up capers with findings |
| harvest | Harvest | harvest | Surveys unfinished capers, presents readiness (not priority), author recognises what's ripe |
| weigh | Weigh | pragmatic-sceptic | Tests idea viability. Quick (Level 1) or research-informed (Level 2 with `deep` flag). Verdict: proceed, compost, re-vehicle, kill |

### Meta commands

These operate across capers, not within a phase.

| Command | Fortes | What it does |
|---------|--------|--------------|
| report | (none) | Reads current forte evaluation files and writes a cross-cutting summary for the author. Does not fire fortes or clear evaluations. |
| learn | learning-capturer (coordination) | Scans session for author corrections, proposes learnings for caper's learnings.md. Author approves each. |
| improve | spec-evolver (coordination) | Reads learnings, proposes modifications to forte and talent specs. Author approves each change. |
| distill | spec-distiller (coordination) | Compacts skill, forte, or talent files — reduces volume while preserving requirements. Author approves each file. |
| foundations | (none — reads and compares) | Reads foundation documents and current specs. Reports drift: where specs have moved away from the vision, and where foundations are stale relative to proven practice. Does not fire fortes or modify files. |

## Resonance

Resonance describes when each forte naturally
engages. Phase clustering is the practical
expression of resonance — the author invokes a
phase, and the fortes within it fire.

- research-assembler: front-loaded, re-engages
  when fact-checker flags gaps
- thesis-sharpener: peaks during framing and
  structure phase
- drafter: active during draft phase
- voice-guardian, slop-detector: polish phase,
  but always available
- fact-checker: research phase (against
  research.md) and verify phase (against primary
  sources via web search)
- structural-thinker: structure phase, when
  argument emerges
- continuity-thinker: structure phase, during
  framing and when structure forms
- promotion-crafter: post-verify, when article is
  near-publishable or published
- pragmatic-sceptic: between harvest and research,
  when the author is considering investing in a
  caper. Does not re-engage during workflow phases
- prospect: on demand, when the author wants to scan
  for new angles. Not phase-linked
- harvest: on demand, when the author surveys
  unfinished capers. Not phase-linked
