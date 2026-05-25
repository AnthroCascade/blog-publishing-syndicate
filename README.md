# Blog Publishing Syndicate

A writing system that coordinates specialised AI collaborators to produce articles for [Emperor's New Code](https://ratjens.substack.com/), a Substack newsletter about AI, language and honest thinking.

The AI collaborators evaluate and draft. You decide. That's the loop.

---

## Quick orientation

**Fortes** are specialised roles — each knows what to look for, what to suppress, and when it's done. Specs in [`fortes/`](fortes/).

**Talents** are shared skill domains (editorial craft, voice analysis, research method) that fortes draw on. A talent is the method; a forte is the role that applies it. Specs in [`talents/`](talents/).

**Commands** are what you type. Each command fires one or more fortes and produces artefacts. You never talk to fortes directly — you fire commands and the orchestrator routes.

---

## Starting the process

You can enter the system at three points depending on where the idea is.

### No idea yet — scan the landscape

Run `/prospect`. It scans the web for recent material that connects to your existing corpus, synthesises angles, and sets up capers with findings. After prospecting, you compost — live with the ideas. This part is yours and cannot be automated.

### Ideas exist but you're not sure which to invest in

Run `/harvest`. It surveys all unfinished capers and reports which ones have ripened — which ideas you've internalised enough that your voice can carry them. Harvest reports readiness, not priority.

When one looks ripe, run `/weigh <caper>` to test viability. The pragmatic-sceptic gives an adversarial verdict: proceed, compost, re-vehicle, or kill. Add `deep` for a research-informed assessment.

### Ready to write

Once you've decided to proceed with a caper, the workflow phases begin. Start with `/research <caper>`.

---

## The workflow: what to do and what comes next

### Phase 1 — Research

**Command:** `/research <caper>`
**What it does:** Assembles source material into research.md and checks claims against it.
**Settled when:** Claims sourced, research.md complete.
**If satisfied → move to:** `/draft <caper>`

### Phase 2 — Draft

**Command:** `/draft <caper>`
**What it does:** Produces a full article in your voice. Automatically runs voice-guardian in revise mode after the drafter finishes — so voice gets a first pass without you asking.
**Settled when:** Draft written and you accept it (or decide to evaluate).
**If satisfied → you could stop here** (see [valid stopping points](#valid-stopping-points)), or move to evaluation.

### Phase 3 — Evaluate

This is where most of your time goes. You choose which dimension to evaluate:

| Command | What it evaluates | Fortes fired |
|---------|-------------------|--------------|
| `/structure <caper>` | Argument, thesis, corpus position | structural-thinker, thesis-sharpener, continuity-thinker |
| `/polish <caper>` | Voice fidelity, cognitive presence | voice-guardian, cognition-sensor |
| `/reception <caper>` | How the target reader experiences the draft | reader-proxy |
| `/mob <caper>` | Everything at once (the exception, not the norm) | all 7 evaluative fortes |

Each of these writes evaluation files to `artefacts/evaluations/`. After any evaluation command, the human forte template is available for you to fill in — your own findings go through the same process as everyone else's.

**After any evaluation command → run:** `/protect <caper>`. The protector tests whether findings would actually improve the draft or just make it different. This is the quality gate between evaluation and revision.

**After protect → you read** the evaluation files and protector attacks, then record your decisions in `turn.md`.

**After recording decisions → run:** `/revise <caper>`. This applies your turn.md decisions and the evaluation findings to the current draft. It patches — it doesn't rewrite. Stale evaluations are cleared automatically.

**After revise → decide:** Is this dimension settled? If yes, move to the next dimension or to verification. If not, run the evaluation command again.

This is the convergence loop:

```
evaluate (choose the dimension)
    ↓
/protect (test finding quality)
    ↓
read evaluations + protector attacks, write turn.md
    ↓
/revise (apply corrections)
    ↓
settled? → next phase
not settled? → evaluate again
```

### Phase 4 — Verify

**Command:** `/verify <caper>`
**What it does:** Fact-checker searches the web to verify claims against primary sources. This is external verification — different from `/research`, which works against your own research.md.
**Settled when:** All claims verified.
**If satisfied → move to:** `/finalize <caper>`

### Phase 5 — Finalize

**Command:** `/finalize <caper>`
**What it does:** Deterministic publication prep. Currently: converts straight quotes to typographic curly quotes. No AI involved — runs `smart-quotes.py`.
**Settled when:** `smart-quotes.py --check` exits 0.
**If satisfied → move to:** `/share <caper>`

### Phase 6 — Share

**Command:** `/share <caper>`
**What it does:** Writes platform-native promotional text about the article in your voice (LinkedIn, Twitter, etc.). Same register everywhere — the container changes, the voice does not.
**Settled when:** You approve the texts.

---

## Valid stopping points

Not every article needs to go through every phase. Here's where you can legitimately stop and what that conclusion means.

| Stop after | What you have | When this makes sense |
|------------|--------------|----------------------|
| `/draft` | A complete draft, voice-checked once | Quick piece, low stakes, your voice carried it on the first pass |
| `/revise` (convergence loop done) | A draft that's survived evaluation and correction | The article is solid but you're publishing on Substack directly without promotional text |
| `/finalize` | A publication-ready article with clean typography | You'll write your own promotional text or don't need it |
| **`/share`** | **Article + platform texts** | **The standard finish line for a publishable piece** |

`/share` is the last command in the article's production workflow. After share, the article is done.

---

## The very last commands you could run

After `/share`, two system-evolution commands are available. These operate across your whole practice, not on a single article:

1. **`/learn`** — Captures patterns from your corrections during the session. "The drafter keeps opening with throat-clearing" is a learning. You approve each one individually.
2. **`/improve`** — Reads the learnings and proposes modifications to forte and talent specs. This is how the system gets better over time.

`/learn` then `/improve` is the absolute end of the line. Nothing comes after `/improve`. The chain is: your corrections → `/learn` captures patterns → `/improve` evolves the specs.

Two housekeeping commands can run at any point:

- **`/settle <caper>`** — When turn.md accumulates decisions across multiple passes, this promotes durable ones to caper.md and clears the rest. Keeps turn.md lean.
- **`/distill`** — Compacts bloated forte, talent, or skill specs. Maintenance, not evolution.

---

## Lightweight alternatives

Not everything needs the full workflow.

**`/pick`** — Fast drafting for short posts. No mob, no evaluation passes. `/pick garden` to see what's ripe. `/pick <caper>` to draft a short post (LinkedIn 500-800 words, Substack short 800-1200 words). If it needs a mob, it's not a `/pick`.

**`/voice`** — Surgical voice fixes in one pass. Fires voice-guardian in revise mode directly against the draft. No evaluation files needed. Lighter than `/polish`.

**`/voice-pass`** — Iterative voice fix loop (max 3 passes). If still finding violations at pass 3, remaining findings are flagged as unresolved — three passes that don't converge means the fixes are chasing each other.

---

## Status and readiness

**`/ready`** — Assesses publication readiness from artefact evidence. No fortes, no AI judgment — derives progress from what exists in the artefacts directory. `/ready` for all capers, `/ready <caper>` for one. Run any time.

**`/report`** — Reads current evaluation files and writes a cross-cutting summary. Useful after any evaluation command when you want an assembled view.

**`/interrogate`** — Tests evaluation findings for depth. Flags shallow, generic, or identical findings across fortes. Already embedded in `/polish` and `/structure`; run standalone when you suspect shallow output.

---

## All fortes

| Forte | Job | Fired by |
|-------|-----|----------|
| [drafter](fortes/drafter.md) | Drafts prose in the author's voice (draft and revise modes) | `/draft`, `/revise` |
| [voice-guardian](fortes/voice-guardian.md) | Protects voice in existing text; detects AI tells | `/polish`, `/voice`, `/voice-pass`, auto after `/draft` and `/revise` |
| [structural-thinker](fortes/structural-thinker.md) | Ensures the argument builds — no catalogues, no lists-dressed-as-essays | `/structure` |
| [thesis-sharpener](fortes/thesis-sharpener.md) | Crystallises the actual argument early | `/structure` |
| [fact-checker](fortes/fact-checker.md) | Sources every claim (research mode); verifies against primary sources (verify mode) | `/research`, `/verify` |
| [research-assembler](fortes/research-assembler.md) | Assembles source material before drafting begins | `/research` |
| [cognition-sensor](fortes/cognition-sensor.md) | Senses cognitive presence; flags absence of a person | `/polish` |
| [continuity-thinker](fortes/continuity-thinker.md) | Positions the article within the body of work | `/structure` |
| [reader-proxy](fortes/reader-proxy.md) | Models the target reader's experience through the draft | `/reception` |
| [protector](fortes/protector.md) | Tests whether findings would improve the draft or just make it different | `/protect`, auto after multi-forte evaluation commands |
| [share-crafter](fortes/share-crafter.md) | Writes platform-native text about the article in the author's voice | `/share` |
| [pragmatic-sceptic](fortes/pragmatic-sceptic.md) | Tests whether an idea can survive investment | `/weigh` |
| [prospect](fortes/prospect.md) | Scans the landscape for material that connects to existing positions | `/prospect` |
| [harvest](fortes/harvest.md) | Recognises which unfinished ideas have ripened | `/harvest` |
| [human](fortes/human.md) | Biologically independent verification from the author (asynchronous, not agent-spawnable) | template in `artefacts/evaluations/` |

## All talents

Shared skill domains in [`talents/`](talents/):

| Talent | Domain |
|--------|--------|
| [voice-craft](talents/voice-craft.md) | Voice derivation, components, preservation |
| [editorial](talents/editorial.md) | Editing hierarchy: argument, structure, clarity, economy, polish |
| [research](talents/research.md) | Search scope, source hierarchy, gap identification |
| [verification](talents/verification.md) | Claim categorisation and confidence levels |
| [cognition-sensing](talents/cognition-sensing.md) | Costly cognition analysis; three-read protocol |
| [serial-publication](talents/serial-publication.md) | Corpus strands, series trajectory, inter-article connections |
| [distribution](talents/distribution.md) | Platform format constraints and audience context |
| [critical-stance](talents/critical-stance.md) | Evaluative disposition; flag uncertain over miss real |
| [reader-empathy](talents/reader-empathy.md) | How readers process, resist, and respond to arguments |
| [influence](talents/influence.md) | Cialdini's principles applied to this author's register |
| [evaluation-failure-patterns](talents/evaluation-failure-patterns.md) | How evaluative mobs fail: repeated findings, chasing fixes, cosmetic fixes |
| [caper-aligned-findings](talents/caper-aligned-findings.md) | Anchoring every finding to caper material and article purpose |

---

## The governing principle

All fortes suppress AI's default behaviour: produce confident, well-structured-looking text fast. Every forte carries suppression rules with the same weight as its positive aim. The system catches the things AI is worst at — the smooth, plausible, empty patterns that pass for good writing if nobody's watching.

---

## Further reading

- [syndicate.md](syndicate.md) — Complete system specification: phases, coordination patterns, idea lifecycle, forte structure
- [user-manual.md](user-manual.md) — Detailed command reference with the convergence loop, turn.md usage, and worked workflows
- [SKILLS-REFERENCE.md](SKILLS-REFERENCE.md) — Quick-reference table of every command with its fortes and talents
