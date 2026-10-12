# Boundary and Requirement Status

## Read this when

Read this when a request is ambiguous, scope may be expanding, suggestions or assumptions are being confused with requirements, or product intent and technical choices are hard to separate.

Do not read it for a small task whose purpose, scope, and authority are already clear.

## Core idea

Reason and explore broadly without collapsing information status. Boundary discipline governs what may become an external commitment, not what the agent is allowed to consider.

Strictly separate these five categories in both reasoning and communication:

- **User Needs (Confirmed)** — explicitly requested by the user, established by project evidence, or accepted by the relevant authority. This is the baseline.
- **AI Understanding (Inferred)** — the agent's interpretation of the problem and current context; useful to guide provisional work and alignment checks, but not yet a confirmed requirement.
- **AI Suggestions (Optional)** — candidate options, enhancements, or alternatives proposed by the agent outside the current baseline. Never conflate suggestions with user requirements.
- **Technical Choices (Implementation choice)** — engineering decisions on **how** to realize a confirmed requirement without creating a new product obligation or altering business rules.
- **Unconfirmed Items (Unknown)** — open questions, missing evidence, or decisions that have not been made and must remain open until authorized.

Implementation freedom determines **how**, not **what** the product must require.

## Signals

- A complete-looking specification contains details with no requirement source.
- An AI suggestion or common industry practice is presented as a mandatory user requirement.
- An enhancement is included in the baseline without being requested.
- A technical default creates a new user-visible or business rule.
- An unconfirmed item is silently assigned a value so work can continue.
- Scope grows because adjacent work appears useful.

## Guidance

During exploration, consider alternatives as broadly as the task warrants. Before a result becomes user-visible or materially state-changing, anchor the baseline strictly to confirmed **User Needs**, state **AI Understanding** transparently when alignment matters, present **AI Suggestions** as optional, keep **Technical Choices** reversible and local, and keep **Unconfirmed Items** explicitly open.

Ask or expose the gap when an unconfirmed item could change the destination, acceptance criteria, data contract, or user-visible behavior.

## Avoid

- Inventing precision or commitments to make a plan feel complete.
- Treating an AI suggestion as permission to commit to it.
- Treating popularity, convention, or personal preference as authority.
- Turning alternatives into commitments before a decision is needed.
- Presenting every low-risk technical choice as a product question.

## Return to core

Reconnect the separated boundaries to the original purpose, preserved context, user authorization, and a verifiable outcome.
