# Blog Publishing Syndicate

This is a writing system. It coordinates a group of AI collaborators — each with a specific job — to help produce articles for blogs. Currently it is being developed and refined with respect to [Emperor's New Code](https://ratjens.substack.com/), a Substack newsletter about AI, language and honest thinking.

## How it works

An article goes through phases: research, drafting, structural evaluation, voice checking, fact verification, and promotion. At each phase, one or more **fortes** do the work. A forte is a specialised role — it knows what to look for, what to suppress, and when it's done.

Fortes draw on **talents**: shared skill domains like editorial craft, research method, or voice analysis. A talent is the method; a forte is the role that applies it.

The author controls which phase fires and when. The AI collaborators evaluate and draft; the author decides.

## Fortes

Each forte has its own spec in [`fortes/`](fortes/). Here's what they do:

| Forte | Job |
|-------|-----|
| [drafter](fortes/drafter.md) | Drafts prose in the author's voice |
| [voice-guardian](fortes/voice-guardian.md) | Protects voice in existing text; detects AI tells |
| [structural-thinker](fortes/structural-thinker.md) | Ensures the argument builds — no catalogues, no lists-dressed-as-essays |
| [thesis-sharpener](fortes/thesis-sharpener.md) | Crystallises the actual argument early |
| [fact-checker](fortes/fact-checker.md) | Sources every claim; verifies against primary material |
| [research-assembler](fortes/research-assembler.md) | Assembles material before drafting begins |
| [cognition-sensor](fortes/cognition-sensor.md) | Senses cognitive presence; flags absence of a person |
| [continuity-thinker](fortes/continuity-thinker.md) | Positions the article within the body of work |
| [promotion-crafter](fortes/promotion-crafter.md) | Crafts platform-native promotion text |
| [pragmatic-sceptic](fortes/pragmatic-sceptic.md) | Tests whether an idea can survive investment before the work begins |
| [prospect](fortes/prospect.md) | Scans the landscape for material that connects to existing positions |
| [harvest](fortes/harvest.md) | Recognises which unfinished ideas have ripened |

## Talents

Shared skill domains in [`talents/`](talents/):

| Talent | Domain |
|--------|--------|
| [voice-craft](talents/voice-craft.md) | Voice derivation, components, preservation |
| [editorial](talents/editorial.md) | Editing hierarchy: argument, structure, clarity, economy, polish |
| [research](talents/research.md) | Search scope, source hierarchy, gap identification |
| [verification](talents/verification.md) | Claim categorisation and confidence levels |
| [cognition-sensing](talents/cognition-sensing.md) | Costly cognition analysis; three-read protocol |
| [serial-publication](talents/serial-publication.md) | Corpus strands, series trajectory, inter-article connections |
| [distribution](talents/distribution.md) | Platform fit assessment, audience matching |
| [critical-stance](talents/critical-stance.md) | Evaluative disposition; flag uncertain over miss real |

## The governing principle

All fortes suppress AI's default behaviour: produce confident, well-structured-looking text fast. Every forte carries suppression rules with the same weight as its positive aim. The system is designed to catch the things AI is worst at — the smooth, plausible, empty patterns that pass for good writing if nobody's watching.

## Full specification

The complete syndicate spec — phases, coordination, idea lifecycle — is in [syndicate.md](syndicate.md).
