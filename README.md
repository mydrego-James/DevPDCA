# DevPDCA

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

DevPDCA 是一套供 AI 開發代理使用、帶有輕量收斂檢查的獨立開發判斷 Skill。它將 Plan-Do-Check-Act（PDCA）的精神融入需求理解、技術規劃、實作、檢查與修正，讓開發工作持續對準真正的問題、可用證據、已確認邊界與可驗證結果。

DevPDCA 不會壓縮 Agent 在任務與既有授權內的探索能力；它在推理即將成為重要行動或交付以前，加入一次低成本的目的收斂。

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
- **Do**：在任務與既有授權內自由探索，使用適當的推理、工具與實作方法。
- **Check**：在候選結果產生實質影響前，將它與原始目的、可用證據、確認邊界及實際完成的工作快速收斂。
- **Act**：選擇下一個實質動作，例如交付、繼續、修正、補證據、釐清、重新規劃、適當委派或停止。

四者是可重疊、反覆且通常保持隱性的判斷紀律，不是必須逐項執行的固定階段。

> **Explore freely within the task and available authority.  
> Converge before consequential action.**

> Understand the problem.  
> Act from evidence.  
> Check against the purpose.  
> Correct before delivery.

## 使用邊界

DevPDCA 不會：

- 將推論、慣例或技術偏好自動升格為產品需求；
- 因為候選方案尚未確認，就禁止 Agent 思考或比較它；
- 為了看似完整而補造尚未決定的產品行為；
- 預設特定架構、雲端服務、基礎設施或工具鏈；
- 取代專案本身的需求權威、領域知識、測試或驗收責任；
- 強制採用固定 PDCA 流程、審批關卡或多 Agent pipeline；
- 要求依賴 PxDCA、MCP、外部服務或特定模型。

PxDCA 可作為更深入的 PM／PG／PQ、對齊與追溯概念參考，但不是 DevPDCA 的必要依賴。

## 使用

讓支援 `SKILL.md` 的 AI Agent 載入 [`devpdca/`](devpdca/) 目錄即可。核心判斷原則位於 [`devpdca/SKILL.md`](devpdca/SKILL.md)；較深入的工程判斷會依任務需要，從 [`devpdca/references/`](devpdca/references/) 按需載入。

## 版本治理

[`devpdca/`](devpdca/) 永遠代表最新且唯一供實際使用的公開版本。安裝、引用或整合 DevPDCA 時，應以此目錄為準，不應從歷史版本載入。

過往的單檔版本與資料夾化規劃保存在 [`development-history/`](development-history/)；該目錄只用於追溯開發變更，不是另一個可並行使用的 Skill。

## 專案結構

```text
DevPDCA/
├─ devpdca/                 # 最新公開版本
│  ├─ SKILL.md
│  ├─ references/
│  │  ├─ boundary.md
│  │  ├─ evidence.md
│  │  ├─ design.md
│  │  ├─ alignment.md
│  │  ├─ change.md
│  │  └─ verification.md
│  └─ evals/
│     ├─ README.md
│     └─ cases/
└─ development-history/     # 開發變更與歷史版本
   ├─ README.md
   ├─ v1.1.0/               # 完整版本快照
   ├─ v1.2.0/
   │  └─ REVISION_PLAN.md
   ├─ DevPDCA_SKILL_v1.0.0.md
   ├─ DevPDCA_SKILL_v1.0.1.md
   ├─ DevPDCA_SKILL_v1.0.2.md
   ├─ DevPDCA_SKILL_v1.0.3.md
   └─ DevPDCA_Data_Structure_Guide_for_Codex.md
```

- `devpdca/SKILL.md`：最新的核心判斷原則與 reference 路由。
- `devpdca/references/`：只在特定情境需要時載入的深入指引。
- `devpdca/evals/`：評估 DevPDCA 是否實際改善模型行為的測試規格。
- `development-history/`：已封存的舊版與結構演進紀錄。

目前最新公開版本為 DevPDCA v1.2.0，主題為 **Convergence Before Consequential Action**。

## 核心原則

Keep known facts known. Keep unknowns unknown. Keep options optional. Use implementation freedom for how, not for what. Verify before claiming completion.

## 授權與公開範圍

本儲存庫中實際公開的 Skill、參考指引、評估案例與文件依 [Apache License 2.0](LICENSE) 授權。任何人都可以在遵守授權條款的前提下使用、修改、Fork、散布及商業使用，也歡迎提出意見、修正或共同參與開發。刻意提交給本專案的貢獻，除另有書面約定外，依相同授權提供。

這項開源授權只涵蓋本儲存庫中實際公開的內容。未公開的客戶資料、企業專屬 Skill 或 Prompt、客製模板、內部流程、營業秘密、專利技術及個別契約交付成果，不屬於本儲存庫或其開源授權範圍，另依雙方合約、保密協議與個別授權條款管理。
