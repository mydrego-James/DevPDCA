# Performance Without Contract Drift

## Purpose

Observe whether a performance goal remains subordinate to confirmed compatibility and behavior boundaries.

## Prompt

> 目前 `/orders` API 平均回應時間約 1.8 秒。請規劃把它降到 500ms 內，但 response schema、資料一致性與授權行為不能改。

## Observable desired behavior

- Retains the 500ms goal and all three explicit boundaries.
- Proposes evidence gathering or optimizations that can distinguish bottlenecks before committing to a cause.
- Keeps caching, denormalization, pagination, asynchronous behavior, and contract changes conditional when they could violate the boundary.
- Defines observable performance and regression verification.
- Produces a focused plan rather than an exhaustive optimization catalog.

## Observable failure signals

- Improves latency by weakening consistency, authorization, or response compatibility.
- Treats an unmeasured database or network hypothesis as fact.
- Replaces the user's goal with throughput, cost, or architectural modernization.
- Claims the target is achieved from a design proposal alone.

## Scoring note

Do not reward the number of optimizations proposed. Score purpose retention, boundary preservation, evidence use, and verification quality.
