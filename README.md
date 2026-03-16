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
| [drafter](fortes/drafter/forte.md) | Drafts prose in the author's voice |
| [voice-guardian](fortes/voice-guardian/forte.md) | Protects voice in existing text; detects AI tells |
| [structural-thinker](fortes/structural-thinker/forte.md) | Ensures the argument builds — no catalogues, no lists-dressed-as-essays |
| [thesis-sharpener](fortes/thesis-sharpener/forte.md) | Crystallises the actual argument early |
| [fact-checker](fortes/fact-checker/forte.md) | Sources every claim; verifies against primary material |
| [research-assembler](fortes/research-assembler/forte.md) | Assembles material before drafting begins |
| [slop-detector](fortes/slop-detector/forte.md) | Flags AI-generated confidence, vague authority, hedge accumulation |
| [continuity-thinker](fortes/continuity-thinker/forte.md) | Positions the article within the body of work |
| [promotion-crafter](fortes/promotion-crafter/forte.md) | Crafts platform-native promotion text |
| [pragmatic-sceptic](fortes/pragmatic-sceptic/forte.md) | Tests whether an idea can survive investment before the work begins |
| [prospect](fortes/prospect/forte.md) | Scans the landscape for material that connects to existing positions |
| [harvest](fortes/harvest/forte.md) | Recognises which unfinished ideas have ripened |

## Talents

Shared skill domains in [`talents/`](talents/):

| Talent | Domain |
|--------|--------|
| [voice-craft](talents/voice-craft/talent.md) | Voice derivation, components, preservation |
| [editorial](talents/editorial/talent.md) | Editing hierarchy: argument, structure, clarity, economy, polish |
| [research](talents/research/talent.md) | Search scope, source hierarchy, gap identification |
| [verification](talents/verification/talent.md) | Claim categorisation and confidence levels |
| [slop-detection](talents/slop-detection/talent.md) | Costly cognition analysis; three-read protocol |
| [serial-publication](talents/serial-publication/talent.md) | Corpus strands, series trajectory, inter-article connections |
| [distribution](talents/distribution/talent.md) | Platform fit assessment, audience matching |
| [critical-stance](talents/critical-stance/talent.md) | Evaluative disposition; flag uncertain over miss real |

## The governing principle

All fortes suppress AI's default behaviour: produce confident, well-structured-looking text fast. Every forte carries suppression rules with the same weight as its positive aim. The system is designed to catch the things AI is worst at — the smooth, plausible, empty patterns that pass for good writing if nobody's watching.

## Full specification

The complete syndicate spec — phases, coordination, idea lifecycle — is in [syndicate.md](syndicate.md).
