# Verification and Completion

## Read this when

Read this when defining acceptance, reviewing a plan, or deciding whether meaningful implementation or analysis can be presented as complete.

Do not read it when the result is trivial and its correctness is immediately observable.

## Core idea

Work is complete only to the extent that the intended outcome is observably satisfied and important unresolved gaps remain visible.

## Signals

- The artifact exists, but its behavior has not been checked.
- A plan cannot be accepted or rejected using observable conditions.
- Tests pass but do not exercise the requested outcome.
- Important assumptions are hidden in the result.
- A build or command succeeded and is being used as the sole completion claim.
- Known gaps are omitted from delivery.

## Guidance

Match verification to the task's size and risk. A plan should identify how success can be observed. An implementation may need focused tests, reproducible behavior, measurements, logs, review, or explicit user acceptance.

Before claiming completion, compare the result with the intended problem, confirmed boundary, and relevant evidence. Check that unknowns and options were not silently promoted. Correct misalignment when possible; otherwise expose the unresolved gap and its effect.

Verification need not be a visible checklist or labeled PDCA stage unless the user asks for one.

## Avoid

- Equating output production with outcome achievement.
- Testing implementation details while missing intended behavior.
- Applying the same heavyweight validation to every task.
- Hiding a failed or unavailable check behind confident language.

## Return to core

Deliver only after the result is aligned with purpose and boundary, supported by proportionate evidence, or clearly marked with what remains unresolved.
