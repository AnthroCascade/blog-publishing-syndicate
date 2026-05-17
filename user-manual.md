# Blog Publishing Syndicate — User Manual for Claude Code

25 skill commands. 15 fortes. One iterative process that turns ideas into published articles.

## How the system works

You have an orchestrator (Claude Code) that delegates to specialised agents called fortes. Each forte does one thing. You never talk to fortes directly — you fire skill commands and the orchestrator routes context to the right fortes.

The fortes evaluate. The drafter writes. You decide. That's the loop.

## The full lifecycle

An idea passes through two phases before the mob touches it, and four phases inside the mob's workflow.

### Before the mob

| Stage | Command | Forte | What happens |
|-------|---------|-------|-------------|
| **Prospect** | `/prospect` | prospect | Scans the web for recent articles connected to your corpus. Synthesises angles. Sets up capers with findings. |
| **Compost** | (none) | (none) | You live with the idea. This is where it becomes yours. Not automatable. |
| **Harvest** | `/harvest` | harvest | Surveys all unfinished capers. Reports ripeness, not priority. You recognise what's ready. |
| **Weigh** | `/weigh 023` | pragmatic-sceptic | Adversarial viability test. Quick (Level 1) or research-informed (`/weigh 023 deep`, Level 2). Verdict: proceed, compost, re-vehicle, or kill. |

An idea enters the mob when you weigh it and decide to proceed.

### Inside the mob

| Phase | Primary command | Fortes fired | Settles when |
|-------|----------------|-------------|-------------|
| **Research** | `/research` | research-assembler, fact-checker | Claims sourced, research.md complete |
| **Draft** | `/draft` | drafter (+ voice-guardian in revise mode) | You accept or enter evaluation |
| **Structure** | `/structure` | structural-thinker, thesis-sharpener, continuity-thinker | Argument builds, concept ownership clear |
| **Polish** | `/polish` | voice-guardian, cognition-sensor | Voice clean, cognitive presence confirmed |
| **Verify** | `/verify` | fact-checker (web search) | All claims verified against primary sources |
| **Promote** | `/promote` | promotion-crafter | Platform texts approved |

Phases are not strictly sequential. New claims during drafting? Back to `/research`. Structural problems in a polished draft? `/structure`. Each phase has a "settles when" condition — once settled, it stays settled unless new material destabilises it.

## The convergence loop

This is the core iterative process. Most of your time is here.

```
  /draft (or /revise)
       |
       v
  /structure, /polish, /verify (choose the dimension)
       |
       v
  Forte evaluation files written
       |
       v
  /protect (test whether findings would improve or just change)
       |
       v
  You read evaluations + protector attacks, record decisions in turn.md
       |
       v
  /revise (applies findings + your decisions)
       |
       v
  Stale evaluations cleared automatically
       |
       v
  Next phase skill, or repeat
       |
       v
  ... until settled
```

### `/draft` vs `/revise`

`/draft` rewrites. `/revise` patches.

- **`/draft`** — produces a full article from scratch (or redrafts substantially). Fires the drafter, then voice-guardian in revise mode. Clears stale evaluations. Use this for first drafts and major redrafts.
- **`/revise`** — applies existing evaluation findings and your turn.md decisions to the current draft. Fires the drafter in revise mode, then voice-guardian in revise mode. Clears stale evaluations after. Use this when evaluation findings exist and the draft needs targeted corrections, not a rewrite.

Both commands automatically run voice-guardian in revise mode after the drafter finishes. This means `/polish` is not needed immediately after drafting or revision — voice-guardian has already had a pass.

### Phase skills

Each phase skill fires a specific subset of evaluative fortes:

| Command | Fortes | When to use |
|---------|--------|-------------|
| `/polish` | voice-guardian, cognition-sensor | Voice and cognitive presence only |
| `/structure` | structural-thinker, thesis-sharpener, continuity-thinker | Argument, thesis, corpus positioning |
| `/verify` | fact-checker (web search) | Near-final draft, external source verification |
| `/research` | research-assembler, fact-checker | Building or extending research.md |

Use the phase skill that matches the dimension you want evaluated. You compose your own evaluation passes by choosing which phases to run and in what order.

### `/voice`

A lightweight alternative to `/polish` when all you want is voice violations fixed. Fires voice-guardian in revise mode directly against the draft — evaluates and amends in one pass. No evaluation files required as input.

### `/protect`

Fires the protector forte against existing evaluation files. The protector's question is not "what's wrong with the draft?" — it's "what's wrong with the findings?" It walks every finding from every evaluation file and runs six tests:

1. **Echo convergence** — multiple fortes raise the same concern with the same reasoning (amplification, not independent validation)
2. **Lurching** — the finding addresses a problem created by a prior fix, not a problem in the original draft
3. **Phantom problems** — the finding attacks drafter-introduced content, not the author's material
4. **Overcorrection** — technically right but acting on it strips something load-bearing
5. **Faustian regression** — fixes one quality while degrading another
6. **Scope extension** — asks the piece to do something the author hasn't claimed

Run `/protect` after any evaluation command (`/structure`, `/polish`, `/verify`). It's the quality gate between evaluation and revision — it catches findings that would make the draft different without making it better.

### turn.md

Your decisions between commands go in `turn.md`. The orchestrator reads it before every command. The drafter treats turn.md decisions as overrides — they take precedence over forte findings.

If a forte keeps flagging something you've already decided on, promote the decision to `caper.md` (the orchestrator will suggest this during `/revise`). That way future passes receive the decision as durable context.

### The human forte

Not agent-spawnable. You fill the template in `artefacts/evaluations/forte-human.md` after reading the draft and the content forte evaluations. Your findings go through the protector like everyone else's. May be skipped on any pass. Sequence: fill the human forte template (participating as a peer), then review all evaluations including protector attacks on your own findings, then write turn.md (exercising sovereignty).

## Evaluation quality control

### `/interrogate`

Tests evaluation findings for depth. Flags shallow, generic, or structurally identical findings across fortes. Runs four tests: grounding (does the finding reference a specific draft location?), specificity (concrete concern?), variance (same as last pass?), cross-forte similarity (different fortes using identical phrasing?).

Embedded automatically inside `/polish` and `/structure`. Run standalone (`/interrogate 046`) when you suspect shallow output from a prior pass.

### `/report`

Reads current evaluation files and writes a cross-cutting summary. Fires no fortes. Useful after any evaluation command when you want an assembled view. The forte files remain the source of truth — the report is a readable view, not a replacement.

## Meta commands — system evolution

These operate across capers, not within a single phase.

### `/learn`

Captures patterns from your corrections in a session. Fires the learning-capturer forte, which reads the session's author corrections and proposes learnings. You approve each individually. Learnings go to the caper's `learnings.md`.

Learnings are patterns, not instance-level fixes. "The drafter keeps opening with throat-clearing" is a learning. "Remove 'it's worth noting' from paragraph 3" is not.

### `/improve`

Reads `learnings.md` and proposes modifications to forte and talent specs. Fires the spec-evolver. You approve each change individually. This is how the mob gets better over time — recurring learnings propagate into the specs that govern forte behaviour.

The chain: your corrections → `/learn` captures patterns → `/improve` evolves specs.

### `/distill`

Compacts skill, forte, or talent files. Reduces volume while preserving requirements. Fires the spec-distiller. You approve each file individually.

This is maintenance, not evolution. `/improve` changes what a forte requires. `/distill` reduces how many words express it.

Targets: `/distill fortes`, `/distill talents`, `/distill skills`, `/distill all`, or a specific file path.

### `/settle`

Reconciles turn.md decisions into caper.md. Fires the settler forte, which classifies every decision in turn.md as live, superseded, stale, absorbed, durable, consumed, or active. Promotes durable decisions to caper.md and removes superseded material from turn.md. You approve the reconciliation grouped by action.

Run when turn.md accumulates decisions across multiple passes. Keeps caper.md as the authoritative source of standing decisions and turn.md lean for the next pass.

### `/foundations`

Reads foundation documents and current specs, then reports drift in both directions: where specs have moved away from the vision, and where foundations are stale relative to proven practice. Diagnostic only — does not fire fortes or modify files.

## Utility commands

### `/finalize`

Deterministic publication-prep. Currently runs typographic quote conversion (`smart-quotes.py`) on the draft — straight ASCII quotes and apostrophes become curly. No fortes, no LLM calls, no evaluation files.

Run after `/polish` (or after the final `/voice` pass), before `/promote`. The settlement condition is `smart-quotes.py --check` exits 0.

### `/pick`

Fast, light drafting for short posts. No mob, no fortes, no evaluation passes. Reads a ripe caper's findings and drafts a short post (LinkedIn 500-800 words, Substack short 800-1200 words) directly. One claim, author's voice, done.

`/pick garden` to see what's ripe. `/pick 006` to draft from a specific caper.

If it needs a mob, it's not a `/pick`.

### `/extract`

Extracts conversation history from Claude Code sessions into readable markdown transcripts. Auto-routes output to the caper's `artefacts/transcripts/` directory if it can find one.

### `/cleanse`

Cleans a conversation transcript by extracting the positive forward thread and stripping corrective noise. Produces a clean transcript for use as fresh context in subsequent sessions.

### `/do`

General-purpose execution for anything that doesn't map to a specialised skill. Garden maintenance, mechanical edits, file structure changes. If it maps to a specialised skill, `/do` will tell you which one to use instead.

## Forte-to-skill mapping

Every forte is reachable through at least one skill command. Here's the complete map.

| Forte | Skills that fire it | Role |
|-------|-------------------|------|
| drafter | `/draft`, `/revise` | Drafts and revises prose |
| voice-guardian | `/polish`, `/draft`*, `/revise`*, `/voice` | Protects the author's voice |
| cognition-sensor | `/polish` | Detects AI cognitive patterns in output |
| structural-thinker | `/structure` | Ensures argument builds, never catalogues |
| thesis-sharpener | `/structure` | Crystallises the actual argument |
| continuity-thinker | `/structure` | Positions article within the corpus |
| fact-checker | `/research`, `/verify` | Verifies claims (research mode or web verify mode) |
| research-assembler | `/research` | Assembles source material |
| protector | `/protect` | Tests whether findings improve or just change the draft |
| pragmatic-sceptic | `/weigh` | Tests idea viability |
| prospect | `/prospect` | Scans landscape for angles |
| harvest | `/harvest` | Detects caper readiness |
| promotion-crafter | `/promote` | Crafts platform-specific promotion |
| human | (template) | Author's own verification (asynchronous, not agent-spawnable) |

\* Voice-guardian fires automatically in revise mode after the drafter in `/draft` and `/revise`.

Coordination fortes (not in the blog-publishing syndicate, but reachable through skills):

| Forte | Skill | Role |
|-------|-------|------|
| interrogator | `/interrogate`, embedded in `/polish`, `/structure` | Tests evaluation depth |
| learning-capturer | `/learn` | Captures correction patterns |
| spec-evolver | `/improve` | Evolves specs from learnings |
| spec-distiller | `/distill` | Compacts specs |
| settler | `/settle` | Reconciles turn.md into caper.md |

## Typical workflows

### New article from scratch

1. `/prospect` — find angles from recent landscape
2. (compost — live with the idea)
3. `/harvest` — check what's ripe
4. `/weigh 023` — viability test
5. `/research 023` — build research.md
6. `/draft 023` — first draft
7. `/structure 023` — argument evaluation
8. `/protect 023` — test findings quality
9. Record decisions in turn.md
10. `/revise 023` — apply corrections
11. `/settle 023` — promote durable decisions to caper.md (when turn.md accumulates)
12. `/polish 023` — voice and cognition check (if needed beyond the auto voice-guardian pass)
13. `/verify 023` — external fact-check
14. `/finalize 023` — typographic quotes
15. `/promote 023` — promotion text

### Quick iteration on an existing draft

1. `/structure 023` and/or `/polish 023` — evaluate the dimensions that need attention
2. `/protect 023` — test findings before acting on them
3. Read forte files, record decisions in turn.md
4. `/revise 023` — apply corrections
5. Repeat until settled

### Short post

1. `/pick garden` — see what's ripe
2. `/pick 006` — draft directly, done

### System maintenance

1. `/learn` — after a session with corrections
2. `/improve` — propagate learnings to specs
3. `/distill all` — compact bloated specs
