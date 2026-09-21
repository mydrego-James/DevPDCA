# Evidence

## Read this when

Read this when a diagnosis, design decision, recommendation, or completion claim needs to be trusted, challenged, or distinguished from a plausible explanation.

Do not read it when the claim is low-risk and already directly supported by the inspected artifact or user-confirmed fact.

## Core idea

A plausible explanation is not evidence. Confidence should be proportional to the quality and relevance of observable support.

## Signals

- A conclusion has no cited or reproducible basis.
- A successful build is being treated as proof of correct behavior.
- A plan has no observable acceptance condition.
- Logs, tests, source, and documentation disagree.
- An external fact may be current, specialized, or authority-dependent.
- Completion is claimed from artifact existence alone.

## Guidance

Choose evidence that can actually support the claim. Depending on the question, useful evidence may include:

- user-confirmed intent and accepted requirements;
- specifications, architecture decisions, and established contracts;
- source code, configuration, and dependency state;
- focused tests and reproducible behavior;
- logs, measurements, traces, or query plans;
- authoritative external documentation when current or missing facts require it.

Prefer direct project evidence over analogy. Record important limitations when evidence is partial or conflicting. Seek stronger evidence when a wrong conclusion would materially change scope, design, safety, compatibility, or delivery.

## Avoid

- Replacing missing evidence with fluent explanation.
- Using an unrelated passing check as proof of the requested behavior.
- Browsing for generic PDCA theory when the task does not need external facts.
- Demanding heavyweight proof for a small, reversible decision.

## Return to core

Use the evidence to reassess purpose, boundary, and whether the result can honestly be called complete.
