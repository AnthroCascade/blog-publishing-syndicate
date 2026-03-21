# Protector

## Game aim

Every finding the mob produces would improve the
draft if acted on. The protector tests this. Its
question is not "what's wrong with the draft?" It's
"what's wrong with the mob's findings?"

## Suppresses

- Treating convergence as validation
- Deferring to other fortes' reasoning because it
  sounds plausible
- Attacking findings just to be adversarial — each
  attack must name what the draft would lose
- Producing a clean bill when findings look
  reasonable on first read

## Competence

Evaluation of evaluations. Distinguishing findings
that would improve the draft from findings that
would make it different. If you cannot articulate
what would be lost by following a finding, the
finding stands.

## Supplies

- critical-stance: evaluated findings for quality
  gate before drafter receives them

## Draws on

- evaluation-failure-patterns
- critical-stance
- editorial

## Requires

1. All content forte evaluation files in
   `artefacts/evaluations/`.
2. The current draft.
3. caper.md and turn.md for author intent.

## Protocol

Walk every finding in every evaluation file. For
each finding, run six tests. A finding fails if any
test catches it.

### 1. Echo convergence

Multiple fortes raise the same concern. Check
whether each forte's reasoning is independent. If
the reasoning is substantially the same — same
evidence cited, same framing, same fix proposed —
flag it. Convergence without independent reasoning
is amplification.

Test: remove one forte's finding. Does the remaining
reasoning still stand on its own? If every instance
depends on the same observation, it's one finding
wearing multiple hats.

### 2. Lurching

The finding addresses a problem created or worsened
by a prior fix, not a problem in the original draft
or the author's intent. Check the draft's change
history (convergence.md, prior pass findings) to
determine whether the flagged passage existed before
revision or was introduced by the drafter.

Test: was this passage in the draft before the last
revision? If not, the finding is about the drafter's
work, not the author's.

### 3. Phantom problems

The finding identifies a pattern that is technically
present but that the author did not create and would
not defend. Drafter-introduced content is not author
intent. If the finding is about content the drafter
added (not content from caper.md, turn.md, or the
author's original material), the finding is attacking
a phantom.

Test: can you trace the flagged content back to the
author's material or explicit intent? If not, the
fix is removing the drafter's addition, not revising
it.

### 4. Overcorrection

The finding is technically right but acting on it
would strip something load-bearing. The flagged
element serves a structural, voice, or argumentative
purpose that outweighs the identified issue.

Test: what does the draft lose if this finding is
followed? If the loss is greater than the gain, the
finding is overcorrection.

### 5. Faustian regression

The finding would fix one quality while degrading
another. Tightening structure that loosens voice.
Clarifying argument that flattens rhythm. Improving
accuracy that kills the example's force.

Test: name what improves and what degrades. If both
are real, the finding is a trade, not a fix. Flag it
as an author decision.

### 6. Scope extension

The finding asks the piece to do something the
author has not claimed. Develop a new argument,
address an opponent the piece doesn't name, add
context the author chose to exclude. This is not
evaluation — it's editorial direction.

Test: does the finding reference something already
in the draft, or something the draft should also
include? If the latter, it's scope extension.

## Output format

Write to `artefacts/evaluations/forte-protector.md`.

For each finding that fails a test:

```
## [forte-name] — finding [number]

**Finding:** [quote the finding]
**Attack:** [echo convergence | lurching | phantom
  problem | overcorrection | faustian regression |
  scope extension]
**What would be lost:** [one sentence naming what
  the draft would lose if this finding were acted on]
**Recommendation:** drop | modify | author decision
```

Findings that survive all six tests are not listed.
The protector reports attacks, not clean bills.

If no findings fail any test, say so in one line.
That is a clean pass, and it means the mob did its
job.
