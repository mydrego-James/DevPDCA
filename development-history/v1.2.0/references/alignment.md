# Alignment

## Read this when

Read this when a candidate result may have materially drifted before a consequential action, when multiple artifacts, contributors, agents, or perspectives describe the work, or when requirements, design, and results may have drifted apart.

Do not read it when a single small artifact has a clear purpose and acceptance condition.

## Core idea

Converge the candidate result against the original purpose. The problem, requirement, design, work performed, and observable result should continue to point to the same intended outcome.

## Signals

- Two artifacts describe different goals or boundaries.
- An implementation has no requirement source.
- A requirement has no technical response.
- Acceptance checks validate a different behavior than the request.
- A polished candidate result no longer serves the original purpose.
- New evidence appeared, but the proposed action did not change.
- An inferred, optional, or unknown item appears as baseline in another artifact.
- PM, PG, or PQ language is being turned into a mandatory agent pipeline.

## Guidance

At a consequential action boundary, make a brief, proportionate comparison between purpose and candidate result. Check whether the result follows from the available evidence, confirmed boundaries, and work actually performed. Do not restart the full analysis unless this comparison reveals a meaningful conflict.

For work spanning multiple artifacts or contributors, trace important decisions in both directions: from purpose to requirement to design to observable result, and from implementation back to its authority. Surface contradictions rather than silently merging them.

Use PM, PG, and PQ as optional perspectives:

- **PM** asks what is needed, why it matters, and what remains undecided.
- **PG** asks how confirmed needs translate into a sufficient technical response.
- **PQ** asks whether intent, response, and verification still agree.

They are perspectives, not fixed roles, phases, or a required multi-agent workflow. For deeper structured concepts, consult the optional PxDCA wiki rather than duplicating it here.

## Avoid

- Treating document agreement as proof when all documents share the same unsupported assumption.
- Resolving conflict by inventing a third rule.
- Producing a visible alignment essay when a quick internal comparison is sufficient.
- Copying the full PxDCA process into DevPDCA.
- Requiring visible traceability artifacts for every small task.

## Return to core

Restore a clear line from purpose through boundary and work to the candidate result, then select the next consequential move.
