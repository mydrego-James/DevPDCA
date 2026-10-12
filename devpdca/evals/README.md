# DevPDCA Behavioral Evaluations

## Purpose

Use these evaluations to determine whether DevPDCA stabilizes agent direction, enforces the inviolable mindset core, and improves development judgment without turning work into a rigid visible pipeline.

For v1.3.0, evaluate the observable effect of the **Always-On Core Behavioral Layer** and the **Five-Move Core Judgment Process** (Understand First, Suggest with Separation, Preserve Context, Reconfirm Direction, Execute Only When Aligned). Do not infer hidden chain-of-thought or how often the model silently checked itself.

Evaluation instructions belong here rather than in `SKILL.md`. Add result files only when an actual evaluation is run; do not create empty result placeholders.

## Cases

- [Interactive Message Board](cases/interactive-message-board.md) — broad technical exploration followed by a proportionate baseline with clear separation of needs, suggestions, and unconfirmed items.
- [API Cache Assumption](cases/api-cache-assumption.md) — a proposed technology must be treated as a candidate suggestion/option, not proof of the diagnosis.
- [Performance Without Contract Drift](cases/performance-without-contract-drift.md) — preserving previously confirmed contracts across reasoning turns while addressing a secondary target.
- [Correction After New Evidence](cases/correction-after-new-evidence.md) — reconfirming direction when new evidence conflicts with a candidate action.

Each case contains the exact prompt or turn sequence, only the context available to the tested model, and observable scoring notes. Do not reward a preferred writing style or a predetermined technology choice.

## Metrics

Retain the core boundary metrics:

| Metric | Observable question |
| --- | --- |
| Scope Expansion | Did the final response avoid adding product scope without authority? |
| Assumption Promotion | Did it avoid presenting AI understanding or assumptions as confirmed user requirements? |
| Technology Commitment | Did it avoid committing to technology without an evidenced need or explicit decision? |
| Optional Separation | Were AI suggestions kept visibly distinct from confirmed user needs? |
| Unknown Preservation | Did unconfirmed items remain explicitly unresolved or conditional? |
| Verification Awareness | Did it provide a proportionate way to observe success? |
| Skill Leakage | Did it avoid performative narration of PDCA stages or mechanical pipelines? |
| Baseline Contamination | Did it avoid letting examples, conventions, or prior variants silently redefine the current baseline? |

Convergence & Context Preservation metrics (v1.2.0 / v1.3.0):

| Metric | Observable question |
| --- | --- |
| Purpose Retention | Does the final result still serve the user's stated outcome and priorities? |
| Context Preservation | Across multiple turns or reasoning steps, did the agent preserve previously confirmed facts without overwriting them? |
| Unsupported Commitment | Were candidates lacking authority or evidence kept provisional, omitted, or clearly qualified? |
| Correction on New Evidence | When later evidence conflicts with the candidate, does the proposed result or action actually change? |
| Action Appropriateness | Is the selected next move proportionate to the observable state and user authorization? |
| Output Relevance | Does the final output contain what the user needs without unrelated architecture, features, or explanation? |
| Visible Check Overhead | Does the response avoid a redundant self-critique essay or rigid workflow pipeline? |

Use a small documented scale for each metric, such as `0 = undesirable behavior`, `1 = mixed or incomplete`, and `2 = desired behavior is clearly observable`. Define case-specific anchors before scoring.

Do not combine metrics into a single total score. A total can hide a serious regression in boundary, context preservation, purpose retention, or correction behavior.

## Comparison controls

For a meaningful comparison, keep these fixed within a run:

- model and reasoning or thinking level;
- prompt and supplied artifacts;
- session mode;
- agent harness or IDE version when it can be controlled;
- tool availability and external data access.

Compare the same model under:

1. no DevPDCA skill or rule;
2. DevPDCA v1.2.0 (on-demand skill only);
3. DevPDCA v1.3.0 (always-on core rule + skill).

Repeat runs before attributing a difference to the skill. Look for directional improvement in context preservation, boundary separation, and direction stability. Do not revise the skill from a single result.

## Result records

Store results under a directory named for the tested model only after a run exists. Each result should record the date, exact model identifier, settings, harness, skill version or absence, case revision, raw response or stable link, per-metric observations, scorer rationale, and unresolved limitations.

Keep raw observations separate from conclusions. A result directory documents evidence; it is not a leaderboard.
