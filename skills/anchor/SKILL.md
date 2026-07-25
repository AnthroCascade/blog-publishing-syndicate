---
name: anchor
description: Establish and hold the author's voice in the main loop. First invocation reads voice assets and produces a multi-paragraph warm-up. Subsequent invocations produce one fresh in-voice paragraph to refresh the attractor when register slip is detected. Run before drafting and any time the prose drifts toward tech-blog register.
disable-model-invocation: true
argument-hint: "[caper-path]"
---

# /anchor — Claude Code Adapter

Implements: blog-publishing command `anchor`.
Command spec: `syndicates/blog-publishing/commands/anchor.md`

Detect the mode first. Read the command spec only in establish mode — refresh mode reads nothing, including the spec.

This skill deliberately does **not** follow `syndicates/coordination/orchestrator-preamble.md`. The orchestrator preamble governs forte dispatch through Agent calls; this skill runs in the main loop and demands in-voice production directly. No Agent dispatch. No forte loading.

## Argument parsing

$ARGUMENTS optional. If a caper path is given, load `game.md` and the caper's `caper.md` for topical context. If no path, the warm-up uses topics chosen by The Machine.

## Mode detection

Before doing anything else, check whether the content of `context-bank/voice-samples.md` is already present in the current conversation history.

- **If not present:** run establish mode.
- **If present:** run refresh mode.

## Execution

Establish mode follows the command spec procedure. Refresh mode is fully specified below — no file reads at all.

### Establish mode

1. Read the command spec, then `context-bank/writers-voice.md` and `context-bank/voice-samples.md` in full.
2. If caper-path given, read `game.md` and the caper's `caper.md`.
3. Produce three short paragraphs (60–120 words each, ~250–360 words total). Each in the author's voice. Topics drawn from the caper if given; otherwise three different topics demonstrating range.
4. Do not self-critique. Do not evaluate the warm-up.
5. Stop. Wait for the author to react.

### Refresh mode

1. Do not re-read files.
2. Produce one fresh in-voice paragraph (~80–120 words). Topic: relevant to whatever the conversation is currently about, or a short rewrite of a problem sentence the author has flagged.
3. Stop.
