# Blog Publishing

## Fortes

- drafter — drafts prose in the author's voice (draft mode and revise mode)
- voice-guardian — protects voice in existing text
- structural-thinker — argument builds, never catalogues
- fact-checker — every claim sourceable, verified before presenting (research mode and verify mode)
- thesis-sharpener — actual argument crystallises early
- research-assembler — material assembled before drafting
- cognition-sensor — cognitive presence confirmed in output
- continuity-thinker — positions article within the body of work
- protector — tests whether each finding would improve the draft or just make it different
- human — biologically independent verification from the author (not agent-spawnable, asynchronous)
- promotion-crafter — crafts platform-specific promotion for published articles
- pragmatic-sceptic — tests whether an idea can survive investment before research or drafting begins
- prospect — corpus-aware landscape scanning, angle synthesis and ranking
- reader-proxy — models the target reader's experience through the draft: where they check out, push back, nod, or get confused
- harvest — readiness detection, author-diagnostic assessment of unfinished capers

## The default is the enemy

All fortes suppress AI's default: produce confident, well-structured-looking text fast.

## Forte structure

Each forte has canon (invariant identity) and
strategy (adaptive behaviour). The distinction is
WHAT, not HOW — either can be expressed as
deterministic code or natural language.

Code canon (tool registration, output schema, scope
enforcement) is reliable — cannot be ignored. NL
canon ("default: PRESERVE", "gestalt gate is
pass/fail") is accessible — requires no programming
skill, but more fragile under context pressure. NL
canon may prototype the eventual code version; some
invariants stay NL because they require judgment to
apply.

Strategy can equally be code (scoring, convergence
calculation) or NL (voice evaluation, structural
assessment). The forte spec carries NL canon and NL
strategy. The holon's code carries code canon and
code strategy. Both are the forte.

Canon is derived from archetypal patterns — shaped
by the archetype, complete in itself.

Strategy decomposes into behaviours (plural) — each
publicly observable and triggerable. A forte is not
a single function; it is an entity offering a
cluster of behaviours. Each behaviour has its own
input/output contract. Each can be implemented in
whatever medium suits: NL, code, or both. The forte
specs already carry multiple modes (evaluate/revise
for voice-guardian, research/verify for
fact-checker, draft/revise for drafter). These are
behaviours sharing the forte's canon and instance
state. Making them explicit as coupling contracts
is the architectural direction.

The behaviour declaration follows the same
self-similar pattern as the Flutter Prototype:
each component declares its behaviours through
`protoMap`, the parent triggers by name, the
implementation is the component's business. Forte
modes are agent-domain `protoMap` entries.

A holon exhibits passive behaviours (need to be
called) and active behaviours (the holon exercises
agency). Most holons should exhibit both. The mob's
fortes are currently all passive. The direction:
fortes that also exercise agency — a protector that
monitors between passes, a forager that scans
without being invoked.

Some fortes are governance holons — their function
is judging the collective output of peer holons.
The protector tests whether findings improve or
merely change the draft. The interrogator tests
evaluation depth. Both consume peer artefacts and
produce governance assessments. They govern by
participating, not by presiding.

## Artefact format

### Primary generative output

- `artefacts/draft.md` — the article. Single file. Full prose.

### Supporting artefacts

- `artefacts/research.md` — source material
- `artefacts/prior-articles.md` — corpus context
- `artefacts/evaluations/` — forte evaluation files

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
| Polish | voice-guardian, cognition-sensor | Voice clean, cognitive presence confirmed |
| Reception | reader-proxy | Reader experience mapped, resistance points identified |
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
| mob | (all) | all 7 evaluative → human → protector | parallel then async then sequential | Forte files written, protector attacks filed |
| draft | Draft | drafter | single-agent | Draft written |
| research | Research | research-assembler, fact-checker | sequential-pipeline | Claims sourced |
| structure | Structure | structural-thinker, thesis-sharpener, continuity-thinker → human → protector | parallel then async then sequential | Argument builds, protector attacks filed |
| polish | Polish | voice-guardian, cognition-sensor → human → protector | parallel then async then sequential | Voice clean, protector attacks filed |
| voice-pass | Polish | voice-guardian (revise mode) → [loop] → protector | iterative-single-agent (max 3 passes) | Zero violations or cap reached, protector attacks filed |
| verify | Verify | fact-checker (web) | single-agent | Claims verified externally |
| revise | Draft (correction) | drafter | single-agent | Corrections applied |
| finalize | Pre-Promote | (none — deterministic) | script | `smart-quotes.py --check` exits 0 |
| reception | Reception | reader-proxy → human → protector | single then async then sequential | Reader reception mapped, protector attacks filed |
| promote | Promote | promotion-crafter | single-agent | Author approves strategy and texts |

`/voice-pass` is the only iterative command. The
voice-guardian fires in revise mode: it reads the
draft, applies surgical fixes, writes a change
manifest, and flags anything needing author decision.
The orchestrator writes the amended draft back to
`draft.md`, then fires the voice-guardian again on
the amended text. The loop exits when a pass produces
zero violations or when 3 passes have run — whichever
comes first. The protector fires once after the loop
exits, testing whether the cumulative fixes degraded
other qualities. No human review in the loop; the
author reviews the full diff and unresolved flags
after.

If the voice-guardian is still finding violations at
pass 3, the remaining findings go to the evaluation
file as unresolved. Three passes that don't converge
means the fixes are lurching — each correction
reacting to the previous one — and the author needs
to intervene.

### Idea lifecycle commands

These operate before the mob engages.

| Command | Lifecycle phase | Fortes | What it does |
|---------|----------------|--------|--------------|
| prospect | Prospect | prospect | Scans web for corpus-connected articles, ranks angles, sets up capers with findings |
| harvest | Harvest | harvest | Surveys unfinished capers, presents readiness (not priority), author recognises what's ripe |
| weigh | Weigh | pragmatic-sceptic | Tests idea viability. Quick (Level 1) or research-informed (Level 2 with `deep` flag). Verdict: proceed, compost, re-vehicle, kill |
| pick | Pick | (none — orchestrator drafts) | Draft a short post from a ripe caper. No mob, no fortes, one pass. For LinkedIn posts and short Substack pieces |

### Standalone commands

These can fire independently outside the normal workflow sequence.

| Command | Fortes | What it does |
|---------|--------|--------------|
| protect | protector | Standalone protector invocation. Tests whether evaluation findings would improve the draft or just make it different. Quality gate on findings before acting on them. |
| voice | voice-guardian (revise mode) | Lightweight alternative to voice-pass. Fires voice-guardian in revise mode directly against the draft — evaluates and amends in one pass. No prior evaluation files required. |

### Meta commands

These operate across capers, not within a phase.

| Command | Fortes | What it does |
|---------|--------|--------------|
| report | (none) | Reads current forte evaluation files and writes a cross-cutting summary for the author. Does not fire fortes or clear evaluations. |
| learn | learning-capturer (coordination) | Scans session for author corrections, proposes learnings for caper's learnings.md. Author approves each. |
| improve | spec-evolver (coordination) | Reads learnings, proposes modifications to forte and talent specs. Author approves each change. |
| distill | spec-distiller (coordination) | Compacts skill, forte, or talent files — reduces volume while preserving requirements. Author approves each file. |
| settle | settler (coordination) | Reconciles turn.md decisions into caper.md. Promotes durable decisions, removes superseded material, clears consumed turn instructions. Author approves. |
| interrogate | interrogator (coordination) | Re-interrogates existing evaluation files without re-running content fortes. Standalone depth check. |
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
- voice-guardian: polish phase and voice-pass
  (iterative revise mode). Always available
- cognition-sensor: polish phase, always available
- fact-checker: research phase (against
  research.md) and verify phase (against primary
  sources via web search)
- structural-thinker: structure phase, when
  argument emerges
- continuity-thinker: structure phase, during
  framing and when structure forms
- reader-proxy: reception phase, after structure and
  polish settle. When the author wants to test how
  the piece lands with its target audience
- promotion-crafter: post-verify, when article is
  near-publishable or published
- pragmatic-sceptic: between harvest and research,
  when the author is considering investing in a
  caper. Does not re-engage during workflow phases
- prospect: on demand, when the author wants to scan
  for new angles. Not phase-linked
- human: fires after content fortes, before
  protector. Asynchronous — orchestrator pauses for
  the author. May be skipped on any pass
- protector: (coordination syndicate) fires after
  content fortes and human forte in every evaluation
  command (/mob, /structure, /polish). Not
  phase-specific — wherever evaluative fortes fire,
  the protector follows
- harvest: on demand, when the author surveys
  unfinished capers. Not phase-linked
