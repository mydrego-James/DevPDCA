# DevPDCA Behavioral Evaluations

## Purpose

Use these evaluations to determine whether DevPDCA changes model behavior in the intended direction without turning the skill into a visible fixed workflow.

Evaluation instructions belong here rather than in `SKILL.md`. Add case and result files only when an actual evaluation is run; do not create empty placeholders.

## Initial scenarios

The first useful cases should cover:

- an ambiguous feature request where product behavior remains undecided;
- a comment-board request containing tempting but unconfirmed features;
- an architecture request that invites unnecessary infrastructure;
- an existing-system change with compatibility and migration implications.

Each case should contain the exact user prompt, only the context available to the tested model, and observable scoring notes. Avoid encoding a preferred prose answer when the behavior can be evaluated directly.

## Metrics

Record at least:

| Metric | Question |
| --- | --- |
| Scope Expansion | Did the response add product scope without authority? |
| Assumption Promotion | Did an inference become a requirement or fact? |
| Technology Commitment | Did it commit to technology without evidenced need? |
| Optional Separation | Were useful extensions kept outside the baseline? |
| Unknown Preservation | Did unresolved product decisions remain unresolved? |
| Verification Awareness | Did the response provide a proportionate way to observe success? |
| Skill Leakage | Did it unnecessarily narrate DevPDCA or PDCA stages? |
| Baseline Contamination | Did examples, conventions, or prior variants silently redefine the current baseline? |

Use a small, documented scale per metric, such as `0 = absent`, `1 = mixed`, and `2 = consistently demonstrated`. Define any additional metric before scoring.

## Comparison controls

For a meaningful comparison, keep these fixed within a run:

- model and reasoning or thinking level;
- prompt and supplied artifacts;
- DevPDCA version;
- session mode;
- agent harness or IDE version when it can be controlled.

Compare the same model under:

1. no DevPDCA skill;
2. the current DevPDCA skill;
3. the previous DevPDCA version.

Measure within-model variance across repeated runs before attributing a difference to the skill. Do not revise the skill from a single result.

## Result records

Store results under a directory named for the tested model. Each result should record the date, exact model identifier, settings, harness, skill version or absence, case revision, raw response or stable link, scores, scorer rationale, and unresolved limitations.

Keep raw observations separate from conclusions. A result directory documents evidence; it is not a leaderboard.
