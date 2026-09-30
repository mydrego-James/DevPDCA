# DevPDCA

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![Antigravity](https://img.shields.io/badge/Antigravity-Skill%20%26%20Plugin-green.svg)](https://github.com/mydrego-James/DevPDCA)
[![Version](https://img.shields.io/badge/Version-1.2.0-orange.svg)](devpdca/SKILL.md)

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

---

## 🚀 快速安裝與使用 (Installation & Quick Start)

DevPDCA 原生支援作為 **Google Antigravity** 的全域外掛與專案技能，亦可作為判斷原則導入其他 AI 開發輔助工具。

### 1. Google Antigravity

#### 方案 A：全域安裝（推薦，所有專案皆自動啟用）
在終端機執行對應系統的一鍵安裝指令：

* **Windows (PowerShell)**：
  ```powershell
  irm https://raw.githubusercontent.com/mydrego-James/DevPDCA/main/install.ps1 | iex
  ```

* **macOS / Linux (Bash)**：
  ```bash
  curl -fsSL https://raw.githubusercontent.com/mydrego-James/DevPDCA/main/install.sh | bash
  ```

安裝腳本會自動完成：
1. 下載最新版 DevPDCA（含 `SKILL.md` 與 `references/` 深度指引庫）。
2. 部署至 `~/.gemini/config/plugins/devpdca/` 並配置 `plugin.json`。
3. 建立 `~/.gemini/config/skills/devpdca/` 符號連結（Junction）確保雙路徑相容性。
4. 自動呼叫 `agy plugin validate` 驗證外掛安裝。

#### 方案 B：單一專案安裝（僅當前專案生效）
若希望將 DevPDCA 納入 Git 專案版本控制與團隊共用：

* **Windows (PowerShell)**：
  ```powershell
  irm https://raw.githubusercontent.com/mydrego-James/DevPDCA/main/install.ps1 | iex -Scope project
  ```
* **macOS / Linux (Bash)**：
  ```bash
  curl -fsSL https://raw.githubusercontent.com/mydrego-James/DevPDCA/main/install.sh | bash -s -- --project
  ```
* **手動複製**：
  直接將本倉庫的 [`devpdca/`](devpdca/) 目錄複製到您專案的 `.agent/skills/devpdca/` 即可。

#### 驗證安裝
安裝後可執行以下指令確認 Antigravity 正確載入：
```bash
agy plugin validate ~/.gemini/config/plugins/devpdca
```
若輸出 `✔ skills : 1 processed` 即代表安裝完成。

---

### 2. 其他 AI 輔助開發工具（Claude Code / Cursor / Windsurf 等）

DevPDCA 的判斷原則具有跨工具的普適性：

| 工具 | 整合方式 |
| :--- | :--- |
| **Claude Code** | 將 [`devpdca/SKILL.md`](devpdca/SKILL.md) 內容複製至 `~/.claude/skills/devpdca.md` 或全域 Prompt。 |
| **Cursor** | 將核心原則加入專案根目錄的 `.cursorrules`，或在 Cursor 設定的 *Rules for AI* 中引用。 |
| **Windsurf** | 將核心原則加入專案根目錄的 `.windsurfrules`。 |
| **GitHub Copilot** | 加入專案根目錄 `.github/copilot-instructions.md`。 |

---

## 版本治理

[`devpdca/`](devpdca/) 永遠代表最新且唯一供實際使用的公開版本。安裝、引用或整合 DevPDCA 時，應以此目錄為準，不應從歷史版本載入。

過往的單檔版本與資料夾化規劃保存在 [`development-history/`](development-history/)；該目錄只用於追溯開發變更，不是另一個可並行使用的 Skill。

## 專案結構

```text
DevPDCA/
├── plugin.json               # Antigravity 外掛配置 Manifest
├── install.ps1               # Windows PowerShell 一鍵安裝腳本
├── install.sh                # macOS / Linux Bash 一鍵安裝腳本
├── devpdca/                  # 最新公開版本
│   ├── SKILL.md              # 核心判斷原則與 reference 路由
│   ├── references/           # 只在特定情境需要時載入的深入指引
│   │   ├── boundary.md       # 邊界與需求狀態（區分 Confirmed/Inferred/Unknown）
│   │   ├── evidence.md       # 證據原則
│   │   ├── design.md         # 設計決策與複雜度控制
│   │   ├── alignment.md      # 目的對齊與防偏離
│   │   ├── change.md         # 既有系統變更與向後相容
│   │   └── verification.md   # 驗證與完工標準
│   └── evals/                # 評估 DevPDCA 是否實際改善模型行為的測試規格
│       ├── README.md
│       └── cases/
└── development-history/      # 開發變更與歷史版本
    ├── README.md
    ├── v1.1.0/               # 完整版本快照
    ├── v1.2.0/
    │   └── REVISION_PLAN.md
    ├── DevPDCA_SKILL_v1.0.0.md
    ├── DevPDCA_SKILL_v1.0.1.md
    ├── DevPDCA_SKILL_v1.0.2.md
    ├── DevPDCA_SKILL_v1.0.3.md
    └── DevPDCA_Data_Structure_Guide_for_Codex.md
```

目前最新公開版本為 DevPDCA v1.2.0，主題為 **Convergence Before Consequential Action**。

## 核心原則

Keep known facts known. Keep unknowns unknown. Keep options optional. Use implementation freedom for how, not for what. Verify before claiming completion.

## 授權與公開範圍

本儲存庫中實際公開的 Skill、參考指引、評估案例與文件依 [Apache License 2.0](LICENSE) 授權。任何人都可以在遵守授權條款的前提下使用、修改、Fork、散布及商業使用，也歡迎提出意見、修正或共同參與開發。刻意提交給本專案的貢獻，除另有書面約定外，依相同授權提供。

這項開源授權只涵蓋本儲存庫中實際公開的內容。未公開的客戶資料、企業專屬 Skill 或 Prompt、客製模板、內部流程、營業秘密、專利技術及個別契約交付成果，不屬於本儲存庫或其開源授權範圍，另依雙方合約、保密協議與個別授權條款管理。
