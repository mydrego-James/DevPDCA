# Boundary and Requirement Status

## Read this when

Read this when a request is ambiguous, scope may be expanding, assumptions are becoming requirements, or product intent and implementation choice are hard to separate.

Do not read it for a small task whose purpose, scope, and authority are already clear.

## Core idea

Preserve the status of information. A useful plan can remain incomplete where the product decision is genuinely incomplete.

- **Confirmed** — explicitly stated by the user, established by project evidence, or accepted by the relevant authority.
- **Inferred** — a reasonable interpretation that may guide provisional work but is not yet a requirement.
- **Unknown** — a decision that has not been made or cannot be established from available evidence.
- **Optional** — an extension or alternative outside the current baseline.
- **Implementation choice** — a technical decision used to realize a confirmed requirement without creating a new product obligation.

Implementation freedom determines **how**, not **what** the product must require.

## Signals

- A complete-looking specification contains details with no requirement source.
- Common practice is presented as mandatory.
- An enhancement is included without being requested.
- A technical default creates a new user-visible or business rule.
- An unknown is silently assigned a value so work can continue.
- Scope grows because adjacent work appears useful.

## Guidance

Use confirmed items as the baseline. Mark material inference as provisional, keep unresolved product behavior unresolved, and separate optional extensions from required work.

Make local, reversible implementation choices when the surrounding boundary is clear and the choice does not impose a new contract. Ask or expose the gap when uncertainty could change the destination, acceptance criteria, data contract, or user-visible behavior.

## Avoid

- Inventing precision to make a plan feel complete.
- Treating popularity, convention, or personal preference as authority.
- Turning alternatives into commitments before a decision is needed.
- Presenting every low-risk technical detail as a product question.

## Return to core

Reconnect the chosen boundary to the real purpose, available evidence, and a verifiable outcome.
