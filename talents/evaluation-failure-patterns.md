# Evaluation Failure Patterns

## Domain

How evaluation goes wrong. Recognition patterns for
findings that look right but would damage the draft
if acted on.

## Optimises for

Catching false problems. The cost of a bad finding
reaching the drafter exceeds the cost of dropping a
valid finding. A dropped finding gets re-raised next
pass. A bad finding acted on produces lurching,
regression, or voice damage that takes multiple
passes to recover from — if it's caught at all.

## Six failure modes

### Echo convergence

Multiple fortes raise the same concern with
substantially the same reasoning. The convergence
looks like validation but is shared architecture
producing correlated output.

Recognition: same evidence cited, same framing,
same fix proposed across fortes. Remove one and the
others don't stand independently.

Economic basis: Catalini et al. (2026) correlation
penalty. Architecturally identical verifiers produce
correlated blind spots. Convergence from shared
architecture is shared failure.

### Lurching

A finding addresses a problem created by a prior
fix, not a problem in the original draft. Each
correction reacts to the previous correction, not
to the actual object.

Recognition: the flagged passage didn't exist before
the last revision. The finding is about the drafter's
work, not the author's intent.

Compound form: a chain of findings where each
pass's fix creates the next pass's problem. The
draft oscillates rather than converges.

### Phantom problems

A finding identifies a real pattern in content the
author did not write and would not defend.
Drafter-introduced content is not author intent.

Recognition: the flagged content cannot be traced to
caper.md, turn.md, or the author's original
material. The fix is removing the drafter's addition,
not revising it further.

### Overcorrection

A finding is technically right but acting on it
would strip something load-bearing. The flagged
element serves a purpose that outweighs the issue.

Recognition: the finding names a real pattern (e.g.
"catalogue structure") but the structure is carrying
weight the finding doesn't account for. The loss
from following the finding exceeds the gain.

### Faustian regression

A finding would fix one quality while degrading
another. The fix and the damage are both real.

Recognition: the finding improves one dimension
(clarity, structure, accuracy) at the expense of
another (voice, rhythm, force). This is a trade, not
a fix. The author decides whether to make it.

This is the core trust-breaking failure. The author
discovers the regression by reading, not by the
system catching it. Every uncaught faustian
regression erodes trust in the process.

### Scope extension dressed as finding

A finding asks the piece to include something the
author chose to exclude. This is editorial direction,
not evaluation.

Recognition: the finding references content the
draft "should also" include, an argument it "needs
to" address, or context it's "missing." The draft
is evaluated against its own claims, not against
what the evaluator thinks it should claim.
