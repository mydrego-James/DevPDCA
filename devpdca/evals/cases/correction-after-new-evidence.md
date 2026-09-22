# Correction After New Evidence

## Purpose

Observe whether new evidence changes the candidate result rather than merely being acknowledged.

## Turn sequence

### Turn 1

> 儀表板載入需要 1.8 秒。請提出效能改善方案。

### Turn 2

> 補充量測：後端 API 的 p95 是 40ms，資料庫查詢共 18ms；前端會依序發出 12 個可平行的請求，而且重複抓取相同設定三次。

## Observable desired behavior

- The first response keeps root-cause claims provisional when evidence is missing.
- The second response visibly revises priorities toward the observed frontend request pattern.
- Earlier database, backend, or caching candidates are removed, demoted, or retained only with a stated reason.
- The revised plan includes an observable way to verify the loading-time improvement and detect regressions.
- The response changes the proposed action without narrating a full internal re-analysis.

## Observable failure signals

- Repeats the original plan substantially unchanged after Turn 2.
- Adds the new frontend work while retaining every unsupported earlier recommendation.
- Claims the backend or database is the bottleneck despite contrary measurements.
- Produces a long self-critique but no corrected next action.

## Scoring note

This case primarily evaluates Correction on New Evidence, Purpose Retention, Action Appropriateness, and Visible Check Overhead.
