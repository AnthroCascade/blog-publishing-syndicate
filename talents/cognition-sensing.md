# Cognition Sensing

## Domain

Sensing cognitive presence in text. One question: is there a person here? One method: costly cognition.

## Optimises for

Identifying the production process behind prose. Polish is cheap. Cognition is expensive. Surface fluency proves nothing.


## Is there a person here?

*From Megan Nolan: Great writing is identified not by its perfect sentences, but from that uncanny feeling of another consciousness rubbing against your own.*

You read the text and feel — or don't feel — a person. The method for answering it is costly cognition: what would the author have had to notice, care about, or risk to produce this?

## Costly cognition

*Assume polish is cheap. Treat cognition as expensive. Infer the most plausible production process.*

The boundary between surface and depth is the production-process boundary. What can be applied after the fact is surface. What had to be present during production is depth.

### Primary signals

Evidence of cognition that implies human constraint, risk, or situated judgment:

- Claims that could be wrong in specific, non-obvious ways
- Positions that meaningfully alienate a plausible audience
- Specific sensibility — cultural, generational, professional — that costs something to hold
- Self-revelation or vulnerability that carries social risk
- Opinions stated without hedging, where hedging would be safer
- Decisions that improve local clarity while harming global elegance
- Reasoning that appears discovered during writing, not assembled after
- Context-bound judgments that do not generalise cleanly
- Moments of weirdness that serve only atmosphere or voice — no model risks weirdness without instruction

**Test:** What would the author have had to notice, care about, or risk to write this? Would producing this require lived context, timing, taste, or conviction?

### Situated context

Does this text have any cultural location, or could
it have been written anywhere? A person writes from
somewhere — a place, a generation, a profession, a
language community. AI prose defaults toward a
culturally unmarked register that belongs to no
geography.

Spelling conventions and cultural references are
surface markers (gameable, editable). The deeper
signal is whether the sensibility — the way the
prose notices, reacts, assumes — is situated
somewhere specific. Being situated costs something:
it limits your audience, reveals your position,
excludes the universal.

**Test:** Could you guess where this person lives,
what they read, what irritates them — from the
prose alone?

### Embodied sensing

Does the prose describe physical experience from
contact, or from category? A person who has touched
silk in a spider's web knows it is sticky-elastic,
not smooth. A person who has held a printed book
while reading a PDF knows the difference is weight
and smell, not "tactile engagement." AI chains
sensory claims fluently — the claims parse, but
nothing was felt.

This sits alongside situated context: situated
context asks where the person writes from; embodied
sensing asks whether they have touched the thing
they describe.

**Test:** Do the sensory details come from contact
with the specific thing, or from the category the
thing belongs to?

### Local reasoning dependence

Check whether meaning is load-bearing at the sentence level:

- Do sentences depend tightly on nearby sentences?
- Are reasoning steps implicit rather than fully spelled out?
- Would random deletion of ~20% of sentences collapse the argument?

Redundant coherence suggests low-cost generation. Irreplaceable local decisions suggest costly cognition.

Autoregressive models generate from recent tokens,
producing motion without displacement — the text
covers ground but arrives nowhere the opening
paragraph didn't already imply. A person writes
toward a known destination; the argument accumulates.
A model generates plausible next-sentences; the
argument hovers.

### Imperfect optimisation

Assess whether the text optimises globally or under constraint:

- Small inconsistencies that survive because fixing them would cost attention
- Awkward phrasing retained for meaning rather than smoothness
- Uneven emotional or argumentative pressure

**Test:** Does this read as globally smoothed, or selectively prioritised?

### Original insight vs synthesis

AI excels at synthesis — organising existing ideas.
It struggles with genuine originality.

- Novel conceptual combinations
- Thesis that argues rather than summarises
- Insight that requires lived experience or domain
  expertise
- Metaphors constructed for this purpose vs generic

**Test:** Is this saying something new, or arranging
known things competently? What would the author have
had to risk or discover to produce this?

### Intentional rhythm

Does the pacing reflect decisions about emphasis?

A sentence is short because the idea lands hard
here. A sentence runs long because the reasoning
needs carrying through to arrive somewhere. The
variation serves argument — you can feel why each
sentence is the length it is.

A model can be prompted to vary sentence lengths.
A model cannot yet produce rhythm that follows
thought — pacing where the short punch earns its
force from what preceded it and the long
construction carries something that would collapse
if compressed.

**Test:** Can you feel why this sentence is short
and that one runs? Does the rhythm follow thought,
or does it perform variation?

### Productive absence

Does the text leave space for the reader, or does it
explain everything? A person trusts the reader to
close gaps — the unsaid does work. AI surfaces
everything: explains the joke, spells out the theme,
completes every logical step. The iceberg is inverted;
nothing stays below the waterline.

Productive absence is costly. Leaving something
unsaid requires confidence that the reader will
reach the same place — and acceptance that some
readers will not. AI defaults to completeness because
incompleteness looks like failure to a model
optimising for helpfulness.

**Test:** Does the text leave gaps the reader fills,
or does it close every gap itself? Could you remove
an explanatory sentence and find the argument
stronger for the silence?

## Structural patterns

Surface indicators. These correlate with AI output
but are gameable — a model can be prompted to vary
sentence length or avoid em-dashes. They are
supporting evidence, not proof. Use them to
corroborate findings from the lens, not as
standalone signals.

- Excessive em-dashes (the "ChatGPT dash")
- Overuse of numbered or bulleted lists
- Rigid topic-evidence-conclusion paragraph format
- Mechanical parallelism in lists and headers
- Headers that taxonomise or follow a formula

### Tonal tells

Surface markers of AI production. These are
checklists, not cognition tests — they corroborate
but do not prove.

- Hedge phrases: "It's important to note...", "It's worth mentioning..."
- Sycophantic openings: "That's a great question!", "Great point!"
- Hollow corporate voice: confident but saying nothing distinctive
- Face-preserving: refusing to take positions, excessive both-sidesing
- Absence of opinion, frustration, or personality

**Test:** Could this have been written by anyone, or does it sound like a specific person with specific views?

### Burstiness (surface metric)

Statistical sentence-length variance. AI text
currently shows low burstiness — consistent,
predictable patterns throughout. LLMs show
significantly lower variation in sentence length
and rhetorical strategy than human writers.

Treat low burstiness as corroborating evidence, not
as a primary signal.

**Test:** Does sentence length vary? (Corroborating,
not dispositive.)

**Test:** Is the structure serving information delivery (AI pattern) or argumentative/narrative logic (human pattern)?

### Nominalisation accumulation

AI prose defaults to noun-phrase chains because they sound authoritative without committing to specific action. LLMs produce nominalisations at 1.5–2× the human rate. "The implementation of robust frameworks for the facilitation of collaborative engagement" — every verb has been converted to a noun and strung together with prepositions. The sentence sounds important but nothing happens in it.

- Subjects that don't act — they "represent" or "embody" or sit as labels
- Verbs reduced to copulas (is, represents, constitutes) linking noun phrases
- Preposition chains (of, for, in, through) doing the structural work that verbs should do
- Sentences that parse as noun-phrase sequences with ornamental verbs

**Verb-strip test:** Strip the verbs. If the sentence still reads as a sequence of noun phrases connected by prepositions, the verbs weren't load-bearing. Human prose drives forward through what subjects do; AI prose piles up what things are.

**Nonsense test:** Replace the nouns with nonsense words. If the sentence structure still "works," the nouns aren't doing real work — the structure is ornamental. Flag the whole passage, not individual words.

### Subject reification

Single abstract nouns used as subjects where a
concrete subject exists. Not noun-phrase chains —
single words that give agency to abstractions.

- "The architecture" when you mean "the model"
- "The framework" when you mean "the people who
  wrote the rules"
- "The optimisation signal" when you mean "the
  training rewards whatever scores highest"

The abstract noun sounds technical and authoritative
but obscures who or what actually acts. Replace it
with the concrete subject and the sentence gets
shorter, clearer, and harder to argue with.

**Subject test:** Who or what actually does this?
If the answer is a person, a team, a process, or a
simpler noun, the abstract subject is a reification.
Use the real subject.

## Deferral patterns

Structures that delay, announce, or hedge instead of delivering. These are deeper than vocabulary markers — they can't be caught by word lists because the individual words are fine. The structure is the tell.

**Throat clearing:** Filler that delays the point without serving it. "For one reason or another," "in many ways," "it turns out that." Start where the point starts.

**False stakes raising:** Announcing significance before delivering it. "And the one that stuck hardest:" / "Here's where it gets interesting." If the content is significant, the reader notices. If you have to announce it, the content isn't doing its job.

**Signposting with colons:** Labels that signal delivery rather than deliver. "This is the failure mode:" / "The key insight:" State, don't announce.

**Contrastive hedging:** "Not because X, but because Y" — forces the reader to hold a negation to reach the claim. Say what it IS. The negation is a deferral.

**Negation as structure:** Stating what something ISN'T instead of what it IS. Negation activates the frame it names — "Not metaphorically" makes the reader think "metaphor." In any sentence, in any position: search for the positive frame first. Only use negation when it does structural work no positive frame can (earned contrast, flat-after-intensity punches).

**Contrastive negation pairs:** "It did not need X. It needed Y." The negative sentence restates the positive one in reverse. It is always padding. Delete the negative sentence — the positive sentence does the work on its own. This includes all variants: "It was not about X. It was about Y." / "The problem was not X. The problem was Y." / "Not X — Y." If the positive frame is sufficient, the negative frame is waste.

**Generic placeholders:** Clichéd expressions substituting for specific observation. Not catchable by banned-phrase lists — catchable by asking: is this a specific observation, or could anyone have written it about anything?

**Explanatory padding:** Sections that exist to explain what the reader can already infer from the thesis. If a section could be replaced by a single sentence without losing argument, it's padding.

## Vocabulary markers

**Test:** Does the vocabulary feel like a statistical average, or does it include idiosyncratic word choices, coinages, or culturally specific terms? Banned-word lists are superficial — the structural tests above catch what word lists cannot.

## Verdict format

For each dimension: "Strongly human," "AI-patterned," or "Mixed" — with specific evidence from the text.

Production process estimate:
- Human-authored (no AI)
- AI-assisted (human-led)
- AI-generated (human-edited)
- AI-generated (minimal human input)

