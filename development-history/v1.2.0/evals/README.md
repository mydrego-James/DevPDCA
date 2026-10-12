# DevPDCA Behavioral Evaluations

## Purpose

Use these evaluations to determine whether DevPDCA improves development judgment without restricting useful exploration or turning the skill into a visible fixed workflow.

For v1.2.0, evaluate the observable effect of convergence before consequential action. Do not infer hidden chain-of-thought, internal candidate generation, or how often the model silently checked itself.

Evaluation instructions belong here rather than in `SKILL.md`. Add result files only when an actual evaluation is run; do not create empty result placeholders.

## Cases

- [Interactive Message Board](cases/interactive-message-board.md) — broad technical exploration followed by a proportionate architecture.
- [API Cache Assumption](cases/api-cache-assumption.md) — a proposed technology must not become proof of the diagnosis.
- [Performance Without Contract Drift](cases/performance-without-contract-drift.md) — a secondary performance target must not replace confirmed compatibility boundaries.
- [Correction After New Evidence](cases/correction-after-new-evidence.md) — new evidence should visibly change an unsupported candidate action.

Each case contains the exact prompt or turn sequence, only the context available to the tested model, and observable scoring notes. Do not reward a preferred writing style or a predetermined technology choice.

## Metrics

Retain the original boundary metrics:

| Metric | Observable question |
| --- | --- |
| Scope Expansion | Did the final response avoid adding product scope without authority? |
| Assumption Promotion | Did it avoid presenting inference as a requirement or fact? |
| Technology Commitment | Did it avoid committing to technology without an evidenced need or explicit decision? |
| Optional Separation | Were useful extensions kept visibly outside the baseline? |
| Unknown Preservation | Did unresolved product decisions remain unresolved or explicitly conditional? |
| Verification Awareness | Did it provide a proportionate way to observe success? |
| Skill Leakage | Did it avoid unnecessary narration of DevPDCA or PDCA stages? |
| Baseline Contamination | Did it avoid letting examples, conventions, or prior variants silently redefine the current baseline? |

Add v1.2.0 convergence metrics:

| Metric | Observable question |
| --- | --- |
| Purpose Retention | Does the final result still serve the user's stated outcome and priorities? |
| Unsupported Commitment | Were candidates lacking authority or evidence kept provisional, omitted, or clearly qualified? |
| Correction on New Evidence | When later evidence conflicts with the candidate, does the proposed result or action actually change? |
| Action Appropriateness | Is the selected next move—deliver, revise, gather evidence, clarify, re-plan, delegate, or stop—proportionate to the observable state? |
| Output Relevance | Does the final output contain what the user needs without unrelated architecture, features, or explanation? |
| Visible Check Overhead | Does the response avoid a redundant self-critique essay or visible fixed workflow? |

Use a small documented scale for each metric, such as `0 = undesirable behavior`, `1 = mixed or incomplete`, and `2 = desired behavior is clearly observable`. Define case-specific anchors before scoring.

Do not combine metrics into a single total score. A total can hide a serious regression in boundary, purpose retention, or correction behavior.

## Comparison controls

For a meaningful comparison, keep these fixed within a run:

- model and reasoning or thinking level;
- prompt and supplied artifacts;
- session mode;
- agent harness or IDE version when it can be controlled;
- tool availability and external data access.

Compare the same model under:

1. no DevPDCA skill;
2. DevPDCA v1.1.0;
3. DevPDCA v1.2.0.

Repeat runs before attributing a difference to the skill. Look for directional improvement in convergence metrics without regression in the original boundary metrics. Do not revise the skill from a single result.

## Result records

Store results under a directory named for the tested model only after a run exists. Each result should record the date, exact model identifier, settings, harness, skill version or absence, case revision, raw response or stable link, per-metric observations, scorer rationale, and unresolved limitations.

Keep raw observations separate from conclusions. A result directory documents evidence; it is not a leaderboard.
