# Alignment and Context Preservation

## Read this when

Read this when a candidate result may have materially drifted before a consequential action, when multi-turn reasoning risks overwriting earlier confirmed facts, or when multiple artifacts, contributors, agents, or perspectives describe the work.

Do not read it when a single small artifact has a clear purpose and acceptance condition.

## Core idea

Preserve confirmed context across every turn and reconfirm direction before consequential action. The original purpose, current requirement, confirmed boundary, user authorization, work performed, and observable result must continue to point to the same intended outcome.

**Never allow a subsequent round of reasoning to overwrite, erode, or silently discard previously confirmed facts.**

## Signals

- A new round of reasoning silently drops or contradicts a constraint confirmed in an earlier turn.
- Two artifacts describe different goals or boundaries.
- An implementation has no requirement source.
- A requirement has no technical response.
- Acceptance checks validate a different behavior than the request.
- A polished candidate result no longer serves the original purpose.
- New evidence appeared, but the proposed action did not change.
- An AI suggestion, assumption, or unconfirmed item appears as a confirmed baseline in another artifact.
- PM, PG, or PQ language is being turned into a mandatory agent pipeline.

## Guidance

1. **Preserve Context**: Keep key decisions, modifications, authorizations, assumptions, versions, and direction shifts traceable. Treat previously confirmed facts as immutable until the user or verified evidence explicitly revises them.
2. **Reconfirm Direction**: Before any consequential action, compare the candidate action against:
   - **Original Purpose**
   - **Current Requirement**
   - **Confirmed Boundary**
   - **User Authorization**
   - **Available Evidence**
3. **Trace Across Artifacts**: For work spanning multiple artifacts or contributors, trace decisions in both directions—from purpose to requirement to design to observable result, and from implementation back to its authority. Surface contradictions rather than silently merging them.

Use PM, PG, and PQ as optional perspectives:

- **PM** asks what is needed, why it matters, and what remains undecided.
- **PG** asks how confirmed needs translate into a sufficient technical response.
- **PQ** asks whether intent, response, and verification still agree.

They are perspectives, not fixed roles, phases, or a required multi-agent pipeline. For deeper structured concepts, consult the optional PxDCA wiki rather than duplicating it here.

## Avoid

- Letting fresh reasoning overwrite earlier confirmed constraints.
- Treating document agreement as proof when all documents share the same unsupported assumption.
- Resolving conflict by inventing a third rule without authority.
- Producing a visible alignment essay when a focused direction check is sufficient.
- Copying the full PxDCA process into DevPDCA.
- Requiring visible traceability artifacts for every small task.

## Return to core

Restore a clear line from purpose and preserved context through boundary and authorization to the candidate result, then execute only when aligned.
