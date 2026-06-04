# anchor

Establish and hold the author's voice in the main loop. Reads voice assets and demands an in-voice production from The Machine so the voice sits in the main loop's recent assistant turn, where attention weights heavily. First invocation in a session establishes; later invocations refresh when register drifts.

This is a context-establishing command, not a forte-orchestration command. No Fortes table. No Agent dispatch. Runs in the main loop.

## Why this exists

The Machine's generation responds to attention weights on what is in immediate context. The Machine's own recent assistant turns weight more heavily than tool results, user input, or system prompt material. A "bad attractor" — the tech-blog register, with announcement-and-colon openings, em-dash sandwiches, copula constructions, hedge-everything tone — captures generation when nothing in the recent assistant turn pulls against it. Loading voice files alone (Read tool) does not pull against it; tool results weight below assistant outputs. The intervention that holds is an in-voice assistant turn, recent.

The skill establishes that turn at session start and refreshes it whenever register drift is observed.

## Modes

**Establish (first invocation).** Reads voice files into context, produces a multi-paragraph warm-up.

**Refresh (subsequent invocations).** Voice files already loaded earlier in the conversation. Produces one fresh in-voice paragraph.

Mode selection: if the conversation history already contains the content of `context-bank/voice-samples.md`, run refresh mode. Otherwise run establish mode.

## Coordination pattern

None. Main-loop only. The Machine produces directly; no Agent dispatch. Deliberately does not follow `mobsta-prototype/syndicates/coordination/orchestrator-preamble.md` — the orchestrator preamble governs forte dispatch through Agent calls, which is not what this command does.

## Context requirements

### Establish mode

- `context-bank/writers-voice.md` — canonical voice spec
- `context-bank/voice-samples.md` — output register samples
- `game.md` (if caper path given) — author and game context
- `caper.md` (if caper path given) — topic context for the warm-up

### Refresh mode

None. Voice material is already in conversation history.

## Procedure

### Establish mode

1. **Load voice assets.** Read `context-bank/writers-voice.md` and `context-bank/voice-samples.md` in full.

2. **Load caper context (if caper-path given).** Read `game.md` and the caper's `caper.md`.

3. **Produce three-paragraph warm-up.** Write three short paragraphs (60–120 words each, ~250–360 words total). Each paragraph in the author's voice — long developmental sentences, accumulating specifics, concrete diction, no announcement-and-colon, no em-dash sandwiches used as crutches, no hedge-everything register. Topics drawn from the caper if provided; otherwise choose three different topics to demonstrate range. Three paragraphs rather than one because more in-voice material in the recent assistant turn establishes a stronger attractor than a single paragraph.

4. **No self-critique.** Do not evaluate the warm-up. Self-critique injects critique-as-instruction tokens into the main loop and pulls toward the bad attractor.

5. **Pause for author.** Emit the warm-up and stop. The author judges whether the anchor took. If it reads as slop, the author re-invokes.

### Refresh mode

1. **No file reads.** Voice material is already in conversation history.

2. **Produce one fresh in-voice paragraph.** ~80–120 words. Topic: relevant to whatever the conversation is currently about, or a short rewrite of a problem sentence the author has flagged.

3. **Pause for author.**

## Output

In-voice paragraph(s) emitted as the main-loop response. No files written.

## Settlement condition

Author has reviewed the output and either accepts (anchor holds — proceed to other work) or re-invokes (anchor failed — try again).

## Boundary

Does not write to artefact files. Does not fire fortes. Does not perform evaluation. Does not correct existing draft prose. Subsequent drafting, polishing, or evaluation is a separate invocation.

## Workflow disciplines that keep the anchor holding

The attractor holds only while recent context keeps matching it. The skill alone is not the whole intervention.

1. **Avoid genre-trigger words in prompts.** "Blog post," "article," "polish," "draft," "voice-pass" activate the bad attractor by name. Use situational framing instead ("what would you say to someone about this?"). When trigger words must be used (for skill invocation), book-end them with voice-aligned material.

2. **Draft in dialogue, not chunks.** Producing a "section" as one chunk is a tech-blog-attractor trigger. Producing in response to a sequence of specific questions keeps The Machine in the responsive register that pattern-matches more strongly to the author's voice.

3. **Re-anchor on detected drift.** When register slip is observed — em-dash sandwiches, copula structures, hedge phrases — invoke this command in refresh mode. The fresh paragraph sits in the most-recent assistant turn and re-establishes the attractor.

4. **Do not correct register mid-stream.** Mid-stream criticism ("stop sounding like a tech blog") injects the criticised pattern's tokens into context, which activates it further. The fix is re-anchoring, not correction.
