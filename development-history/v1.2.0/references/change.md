# Existing-System Change

## Read this when

Read this before modifying established behavior, interfaces, data, configuration, dependencies, or architecture where compatibility or migration matters.

Do not read it for net-new, isolated work with no surrounding contract.

## Core idea

A change is defined not only by the desired new state, but also by its impact on existing contracts and the path from old to new.

## Signals

- Callers, stored data, integrations, or operational tooling may depend on current behavior.
- The change is hard to reverse or requires coordinated rollout.
- A schema, API, file format, event, or configuration contract will change.
- Tests describe behavior that the new design would invalidate.
- Migration, fallback, or mixed-version behavior is unknown.
- The surrounding system has not been inspected.

## Guidance

Understand the current contract before replacing it. Inspect relevant callers, data flows, tests, configurations, and operational dependencies. Distinguish intended breaking changes from accidental incompatibility.

Scale the analysis to the risk. Consider compatibility, reversibility, migration, rollout, and recovery when they can materially affect users or systems. Prefer reversible or staged choices when uncertainty remains, but do not invent migration machinery where no existing state or consumer requires it.

## Avoid

- Assuming a cleaner replacement is behaviorally equivalent.
- Treating compilation or a passing unit test as complete impact analysis.
- Adding compatibility requirements without evidence of existing consumers.
- Designing every change as if it were a high-scale production migration.

## Return to core

Confirm that the change serves the original purpose, respects known contracts, and can be verified in the resulting system.
