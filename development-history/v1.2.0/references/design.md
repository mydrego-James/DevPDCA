# Design Judgment

## Read this when

Read this when choosing architecture, interfaces, dependencies, infrastructure, or another technical approach that could materially affect scope, cost, or future constraints.

Do not read it for routine, local, reversible implementation details within a clear design.

## Core idea

Explore technical options as broadly as useful, then commit only to the smallest sufficient design that serves the confirmed purpose, fits the existing system, and preserves implementation freedom where possible.

## Signals

- The proposed solution is much larger than the problem.
- A familiar or fashionable technology is treated as a requirement.
- Infrastructure is added without an evidenced operational need.
- A technical choice changes product behavior or business rules.
- Existing contracts are being replaced before they are understood.
- The design has no clear requirement source or verification path.

## Guidance

Start from the outcome and constraints. Consider multiple technical responses when that improves the decision, then converge on a proportionate design before it becomes a commitment. Understand the surrounding contract before replacing existing behavior. Prefer choices that are reversible when evidence is weak and expose decisions that would create lasting product or operational obligations.

Complexity is justified by a confirmed need, observed constraint, or measurable tradeoff—not by familiarity, popularity, or theoretical cleanliness. REST, microservices, Redis, Kubernetes, cloud deployment, and containers are options, not universal baselines.

## Avoid

- Architecture by trend or habit.
- Suppressing useful alternatives merely because they are not yet selected.
- Converting a technical preference into a product requirement.
- Designing for unconfirmed scale, availability, security, or integration needs.
- Optimizing elegance while losing the intended outcome.

## Return to core

Check that the design remains inside the confirmed boundary and has an observable way to demonstrate that it serves the purpose.
