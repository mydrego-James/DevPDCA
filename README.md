# DevPDCA

DevPDCA 是一套供 AI 開發代理使用的獨立判斷 Skill，將 Plan-Do-Check-Act（PDCA）的精神融入需求理解、技術規劃、實作、檢查與修正，讓開發工作持續對準真正的問題、可用證據、已確認邊界與可驗證結果。

它不是固定流程、專案管理框架或多 Agent 編排系統。DevPDCA 的目的，是提升 AI 在開發工作中的判斷品質，而不是要求所有任務依序展示 PDCA 步驟。

## 服務範圍

DevPDCA 適用於 AI 協助進行的開發工作，包括：

- 釐清問題、目標、限制與成功條件；
- 區分已確認需求、合理推論、未知事項、可選項目與實作選擇；
- 根據程式碼、文件、測試、紀錄或其他工程證據進行判斷；
- 規劃符合實際需求的最小充分設計；
- 檢查需求、設計、實作與結果是否一致；
- 評估既有系統變更的相容性、影響、可逆性與遷移風險；
- 透過測試、量測、紀錄、審查或使用者驗收確認成果；
- 在發現偏差時修正方向，或明確揭露尚未解決的缺口。

可應用於回答問題、需求分析、技術設計、程式開發、除錯、重構、Code Review、變更評估與交付驗證。

## PDCA 的使用方式

- **Plan**：理解現況、目的、證據、限制、未知事項與成功條件。
- **Do**：依據現有證據與已確認邊界採取適當行動。
- **Check**：將計畫或結果與原始目的、需求邊界及可觀察證據比較。
- **Act**：結果一致時接受；不一致時修正、釐清、重新規劃或揭露缺口。

四者是可重疊、反覆且通常保持隱性的判斷紀律，不是必須逐項執行的固定階段。

> Understand the problem.  
> Act from evidence.  
> Check against the purpose.  
> Correct before delivery.

## 使用邊界

DevPDCA 不會：

- 將推論、慣例或技術偏好自動升格為產品需求；
- 為了看似完整而補造尚未決定的產品行為；
- 預設特定架構、雲端服務、基礎設施或工具鏈；
- 取代專案本身的需求權威、領域知識、測試或驗收責任；
- 強制採用固定 PDCA 流程、審批關卡或多 Agent pipeline；
- 要求依賴 PxDCA、MCP、外部服務或特定模型。

PxDCA 可作為更深入的 PM／PG／PQ、對齊與追溯概念參考，但不是 DevPDCA 的必要依賴。

## 使用

讓支援 `SKILL.md` 的 AI Agent 載入 [`devpdca/`](devpdca/) 目錄即可。核心判斷原則位於 [`devpdca/SKILL.md`](devpdca/SKILL.md)；較深入的工程判斷會依任務需要，從 [`devpdca/references/`](devpdca/references/) 按需載入。

## 專案結構

```text
devpdca/
├─ SKILL.md
├─ references/
│  ├─ boundary.md
│  ├─ evidence.md
│  ├─ design.md
│  ├─ alignment.md
│  ├─ change.md
│  └─ verification.md
└─ evals/
   └─ README.md
```

- `SKILL.md`：跨任務成立的核心判斷原則與 reference 路由。
- `references/`：只在特定情境需要時載入的深入指引。
- `evals/`：評估 DevPDCA 是否實際改善模型行為的測試規格。

目前資料夾版以 DevPDCA v1.0.3 核心為基準。

## 核心原則

Keep known facts known. Keep unknowns unknown. Keep options optional. Use implementation freedom for how, not for what. Verify before claiming completion.
