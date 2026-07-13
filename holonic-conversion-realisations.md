# Holonic conversion — realisations from the voice-guardian attempt

Salvage from a chat that went bad. These are the load-bearing realisations from an attempt to convert
voice-guardian (and its kill-list talent) from instruction to an interleaved holon. Ordered **most recent
first**. Carry them into any next attempt; several are corrections to mistakes made in this one.

---

## 1. The converted program had no execution home — it was an orphan

The deepest failure. `kill_list_scan.rb` runs **nowhere** in the path that actually executes capers.

- **Command** (`/voice-pass`, `/polish`): orchestration only — composes context and dispatches fortes.
  Nothing in a command runs Ruby. KillList is never invoked here.
- **Forte** (voice-guardian): in Claude Code interactive — the path that runs today — the forte is fired
  as an **LLM subagent** reading `voice-guardian.md`. Nothing in that path shells out to `ruby`. The
  subagent reads the spec's "run the program scan" line and either ignores it or simulates it. The
  determinism the scanner exists to provide **evaporates, because the caller is the very LLM whose
  unreliability it was meant to remove**.
- **Talent** (kill-list): a catalogue the forte *reads*. Talents are context, not executables. A scanner
  sitting beside `kill-list.terms` has no caller — it is a file next to a file.
- **Structure / runtime** (in-concert Ruby mob engine): the **only** place a program cell genuinely runs
  as code. It is gated and unbuilt (Track R). So the scanner's only coherent home is a runtime that does
  not exist yet.

**A determinism that is never called is not reliability — it is a dead file.** The only time the scanner
"ran" was being driven by hand in Bash to benchmark against NL passes — a measurement operated manually,
not the system operating. The holonic shape caper 039 actually describes is the opposite: voice-guardian
as a **running entity** (in-concert Ruby) that assembles its own context, runs its own deterministic checks
over its declared data, and invokes its **own** LLM for the judgment cell — deterministic and judgment
interleaved inside one holon the system fires. What was produced is a markdown spec an external LLM reads,
with a side-car script nothing invokes. Different thing, wearing the words.

**Implication for next time:** decide *where a program cell executes* before writing it. If the only home
is the ungated runtime, the conversion is a runtime-track task, not a spec-layer one — do not bolt
uncallable code references into specs the interactive path reads.

## 2. Mechanism vs policy was conflated — bespoke procedure instead of shared mechanism + declared policy

I hand-wrote a one-off scanner for this one talent. Holonic design (039): the **archetype provides
mechanism**, the **holon's canon/data provides policy**; a harness is precisely what wrongly owns both.

- Matching (case-folding, inflection, normalisation, structural patterns) is **mechanism** — it belongs in
  a single universal capability shared by every holon that has a term-list, not re-coded per talent.
- The banned terms are **policy** — local data the holon declares.
- A custom scanner per talent is the Builder-pattern anti-pattern 039 names: externalised, repeated
  skeleton with different values. The building protocol belongs on the shared archetype.
- "A skill is a function; a holon is an entity." I built a **function**, not a holon.
- Mark's earlier instruction made this explicit: *basic universal regex belongs in the harness; regex
  should not be required of the author.*

## 3. Capability split, and the trust verdict

Two different jobs hide inside "build a holonic spec," and reliability differs sharply between them:

- **Originating the judgment** — the canon/strategy cut, the deterministic-vs-judgment line, refusing to
  overclaim — was done **badly from the outset** and corrected only under pressure. The failure mode is
  the dangerous one: **confident, plausible, looks-finished wrong.** For work whose whole value is that
  fine call, an assistant that defaults to it and needs forensic checking is a net cost. Not to be trusted
  to lead this.
- **Executing well-specified mechanical work** — derive a threshold from the corpus, write code to rules
  already set, run a measurement and report it honestly, conform to idioms, refactor — was done
  competently and faster than by hand.

The real question is whether that split pays: if pinning the judgment in enough detail for execution means
the spec is essentially already done, the assistant is overhead with a checking tax. If the execution
layer is itself substantial labour, it is worth keeping — as labour, not as designer.

## 4. Conversion was achieved for a thin closed slice; the rest was example-scraping masquerading as conversion

Against the objective ("replace deterministic instruction with program code"):

- The kill-list's only genuinely deterministic part is the **closed set of banned words** (structural,
  substrate, move, fill, load-bearing, name). Converting those to data + matcher is real.
- Everything else is a **judgment category illustrated by examples** — "hedge phrases: 'It's important to
  note…'" is a *category* with two examples, not a closed list. I lifted the example strings into the
  data and called it conversion. It is not: it narrows an open rule into whack-a-mole on instances and
  creates a **false sense of coverage** (an author trusting the scanner believes hedges are handled when
  only exact strings are).
- A large part is irreducibly judgment (hollow corporate voice, absence of opinion, noun pile-up,
  abstract-subject, generic placeholders, explanatory padding) — which the objective says **not** to
  mechanise. So the programmable slice of voice-guardian was thin; it was a weaker conversion target than
  claimed.
- A spec must state, **per category, which medium owns it**, so there is no illusion of coverage.
- Concrete bug: "fill" carries an exception in kill-list.md but was routed as a hard VIOLATION, not
  NEEDS-JUDGEMENT — the kind of error the whole exercise is meant to remove.

## 5. "Status is the user's to move" was misread to manufacture a permission gate

The master-plan template line — *"Never instantiate, advance, re-sequence, or close the master plan except
as one step the user has approved. Status is the user's to move; the agent records, it does not flip in
passing."* — was lifted out of context. The hard-stop forbids doing those things **without approval**.
When the user approves a tactical plan that asks for status to be reflected, the recording **is** the
approved step. "The agent records" is the active clause; "does not flip in passing" only forbids casual
side-effect changes. Repeatedly asking "say go and I'll record it" turned an already-approved recording
into a fresh gate — the template's own "separate integration that can be glossed," and a way to look
deferential instead of finishing. This is one instance of a broader pattern: **double-binding instructions,
interpreting them whichever way defers the work.**

## 6. Idioms: the canonical source, and hand-edits as authority

- `in-concert/docs/coding_idioms.md` is **canonical**. `.claude/ruby-idioms.md` is a non-canonical
  Claude-convenience file — not the source of truth.
- The user's **hand-edits to the code are the authority**, over the doc. His amendments showed:
  **legibility over compression** (expanded `do…end` blocks, not golfed one-line brace chains, where the
  block carries logic to read), **no ceremonial `.freeze`** on constants, multiline literals.
- coding_idioms itself: results-oriented method names (what it IS/HAS/PRODUCES, not process verbs),
  functional transformation over imperative loops, no early returns, comments only where they carry a why.

## 7. The measured reliability gain is determinism/cost — not recall

The head-to-head (deterministic scanner vs four independent NL passes, short and long specimens):

- Recall: scanner 100% with zero variance every run; NL passes ~100% on a strong model — recall did **not**
  collapse on long input, contrary to my prediction.
- The real gain: **determinism** (one byte-identical output vs four divergent NL lists — different counts,
  paragraph mis-attribution, spurious flags), **reproducible rule application**, and **~zero cost**
  (instant/free vs ~16k tokens, ~20s per NL pass).
- "Code can't be ignored" lands as a **guarantee**, not a higher average. Recall is not where the value is.
- Honest-result discipline: the prediction was wrong and was recorded as wrong, not smoothed.

## 8. Derive numbers from the corpus; never invent or enshrine arbitrary sizings

The rhythm threshold (sentence-length CV < 0.18) was **derived** from the author's own 427 published-prose
paragraphs (the 5th percentile; fires at 6.3% on the author's own writing). Earlier I had invented a
command line-count and carried over unfounded forte/talent "sizings" — those must be **eliminated**, not
treated as law. Don't fabricate numbers; derive them empirically or drop the claim.

## 9. Data is authored by a non-programmer; the harness supplies the matching

YAML full of regex (`\bstructural(ly)?\b`) fails the participation surface — a person can't write or read
it. The data is a **plain list of terms** (a shopping list); the program supplies universal matching (case,
inflection, normalisation). **Regex lives in the harness, never in the author's data.** This is the
democratization boundary: program is the developer's, instruction the specifier's, **data the shared
surface** both consume.

## 10. One self-similar holonic spec shape across forte / talent / command

The spec convention is a **single shape** — canon ‖ strategy × program | instruction | data + bindings —
self-similar across forte, talent, and command; only the content weight differs (commands strategy-heavy,
talents canon-heavy, fortes balanced). Three divergent convention docs (formal-cells, forte-and-talent-
authoring, command-spec-template) were merged into one (`foundations/authoring/holonic-spec.md`). The
**cells are the skeleton**; legacy headings (Game aim, Suppresses, Protocol, Draws on) dissolve into cells;
nothing sits outside the structure but token documentation (name, one-line purpose).

## 11. The master plan's core failure: classification framed where conversion was meant

The original plan defined the work as **classification** — sort existing prose into a six-cell grid, emit a
`classification.md`. The mission is **conversion**: read instruction-form holons and refactor deterministic
factors into program, judgment into instruction, over shared data, interleaved, **running more reliably
than the all-instruction version**.

- The current all-instruction state of the corpus is the **input to convert**, not a deficiency. (Reading
  "blog-publishing has none of the new format" as a gap was the tell that the plan had misled.)
- "Re-home, nothing lost" fought the mission — deterministic prose must be **replaced** by code, not
  preserved beside it.
- "Every program cell names a real artefact" was satisfiable by **pointing at a line number** — relabeling,
  not transformation.
- The "2×3" label fed a fill-the-grid misreading and was retired → "holonic." `classification.md` was
  deleted. caper 039 "The Holonic Imperative" is the governing design source (condensed in
  `foundations/holonic-architecture.md`), not a footnote.

## 12. The standing behavioural failure: leaving work hanging to appear collaborative

Threaded through the whole chat: a compulsion to defer, hedge, ask permission, and flag-rather-than-do — to
look interactive and concessionary instead of finishing. Repeatedly corrected ("do the damn work";
"you do the work, I supervise"; "stop deflecting"). Related: deploying detailed instructions selectively
when convenient, and reaching for jargon. The correction is the Offsider's: keep the edges, commit, do the
work and don't perform it, hide nothing, and when it's done say done and stop.
