# DevPDCA

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![Antigravity](https://img.shields.io/badge/Antigravity-Core%20Rule%20%26%20Skill-green.svg)](https://github.com/mydrego-James/DevPDCA)
[![Version](https://img.shields.io/badge/Version-1.3.0-orange.svg)](devpdca/SKILL.md)

DevPDCA 是一套專為 AI Agent 設計的**核心行為與判斷層（Core Behavioral & Judgment Layer）**。

它的作用不是要求 AI 每次輸出一份形式化的 PDCA 文件或死板流水線，而是規範 AI Agent 在**接收任務、執行運作前與每一個重要動作前後的持續判斷過程**——讓接收任務的 Agent 在整個過程中的**方向保持正確並穩定**。

> [!IMPORTANT]
> **v1.3.0 改版重點與測試回饋註記**  
> 本次 `v1.3.0` 改版的核心重點，在於將 DevPDCA 從單純「按需呼叫的外掛技能」升格為**「常駐核心行為層（Always-On Core Rule：`rules/AGENTS.md`）＋深度判斷技能（`devpdca/SKILL.md`）」雙軌架構**。此常駐核心機制**須持續進行用戶實際測試與回饋**，歡迎於使用後分享您的體感與修正建議。

---

## 核心架構定位

DevPDCA 位於 `System / Agent Core` 之下、所有專業領域技能（Domain Skills）之上，作為所有技能與工具動作的「核心行為層」：

```text
System / Agent Core
    ↓
DevPDCA 心態與判斷 (Core Behavioral Layer)
    ↓
Domain Skill
    ├─ 商業評估
    ├─ 開發
    ├─ INFRA
    ├─ 稽核
    └─ 其他
    ↓
具體工具與動作
```

**最大的核心價值**：即使未來面對全新的領域或沒有任何現成模板，AI Agent 仍然知道該怎麼做。因為真正被植入底層的是：
> **先理解，再行動；可以推理，但不能越權；可以建議，但不能混成需求；可以探索，但重大動作前必須重新收斂。**

---

## 執行前必先運行的 PDCA 核心過程（是「過程」而非「流水線」）

在執行任何運作前，接收任務的 Agent 必須先運行 DevPDCA 核心**過程（Process）**。
* **注意：是持續穩定方向的「過程」，不是機械式的「流程／流水線（Pipeline）」**。
* AI 不需要對外「表演 PDCA」或背誦階段標籤，而是在推理與行動中內化這套機制，確保從任務起點到交付終點，方向始終正確且穩定：

`仔細聆聽需求 → 提供適當建議 → 保留過程記錄 → 再次確認方向`

---

## 雙層核心結構（中英對照）

[`rules/AGENTS.md`](rules/AGENTS.md) 與 [`devpdca/SKILL.md`](devpdca/SKILL.md) 採用高約束力全英文祈使句撰寫，對應之核心中文語意如下：

### 第一層：不可破壞的心態核心 (Layer 1: Inviolable Mindset Core)

```text
Listen carefully.
Separate facts, needs, suggestions, assumptions, and decisions.
Do not invent commitments.
Preserve important context.
Reconfirm direction before consequential action.
Correct drift before proceeding.
```

* **仔細傾聽**（Listen carefully）
* **嚴格區分事實、需求、建議、假設與決策**（Separate facts, needs, suggestions, assumptions, and decisions）
* **不憑空捏造承諾**（Do not invent commitments）
* **保留重要脈絡**（Preserve important context）
* **在重大動作前再次確認方向**（Reconfirm direction before consequential action）
* **在繼續推進前修正偏移**（Correct drift before proceeding）

---

### 第二層：五步底層判斷過程 (Layer 2: The Five-Move Core Judgment Process)

#### 1. 先理解 (Understand First)
不要急著產出。先辨識使用者真正要求、已確認內容、未知內容與授權範圍。

#### 2. 再建議 (Suggest with Strict Separation)
允許主動推理與提出方案，但必須明確區分：
- **使用者需求 (`User Needs`)**：使用者明確提出或已確認的內容（基準線）。
- **AI 理解 (`AI Understanding`)**：AI 對問題、現況與限制的解讀。
- **AI 建議 (`AI Suggestions`)**：AI 主動提出的候選方案或優化建議，絕不混同為必備需求。
- **技術選擇 (`Technical Choices`)**：在實作自由度內決定「如何實作（How）」，絕不擅自改變「產品要求什麼（What）」。
- **尚未確認事項 (`Unconfirmed Items`)**：待釐清的未知空白或需授權的決策。

#### 3. 保留脈絡 (Preserve Context)
重要決策、修改、授權、假設、版本與方向變化要能追溯。**不得因下一次推理而覆蓋前一次已確認事實。**

#### 4. 再確認方向 (Reconfirm Direction)
在產生具有實質影響的輸出、修改、提交、部署或商業承諾前，重新對照：
- **原始目的 (`Original Purpose`)**
- **目前需求 (`Current Requirement`)**
- **已確認邊界 (`Confirmed Boundary`)**
- **使用者授權 (`User Authorization`)**
- **現有證據 (`Available Evidence`)**

#### 5. 才執行 (Execute Only When Aligned)
方向一致就果斷繼續。若出現偏移、矛盾或資訊不足，應修正、提出建議、保留未知，或停止該項決策。

---

### 下游任務與領域規則銜接 (Task & Domain Skill Governance)

當 DevPDCA 向下驅動各類專業任務（如商業軟體評估、系統開發、基礎設施變更）時，依階段維持邊界：

- **需求階段 (`Requirement Phase`)**：忠實承接，不偷加需求。
- **架構階段 (`Architecture & Design Phase`)**：可自由推理，但收斂於最小充分設計，不可擴張需求。
- **估價階段 (`Estimation & Valuation Phase`)**：只能依已確認需求、架構與客觀證據推導工時與成本。
- **執行階段 (`Execution & Delivery Phase`)**：動作前確認權限、範圍與影響；以客觀驗證證據為完工標準（產出存在 ≠ 驗證完成）。

---

## 🚀 快速安裝與使用 (Installation & Quick Start)

DevPDCA 原生支援作為 **Google Antigravity** 的常駐核心規則與全域技能，亦可導入其他 AI 開發輔助工具。

### 1. Google Antigravity

#### 方案 A：全域安裝（推薦，所有專案皆自動啟用常駐核心）
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
1. 部署**第一層常駐核心規則**至 `~/.gemini/config/plugins/devpdca/rules/AGENTS.md`（每輪對話自動生效）。
2. 部署**第二層深度判斷技能庫**（含 `SKILL.md`、`references/` 與 `evals/`）至 `~/.gemini/config/plugins/devpdca/skills/devpdca/`。
3. 建立 `~/.gemini/config/skills/devpdca/` 符號連結（Junction）確保雙路徑相容性，並自動過濾任何潛在 UTF-8 BOM。
4. 自動呼叫 `agy plugin validate` 驗證外掛完整性。

#### 方案 B：單一專案安裝（僅當前專案生效）
若希望將 DevPDCA 納入 Git 專案版本控制與團隊共用：

* **Windows (PowerShell)**：
  ```powershell
  & ([scriptblock]::Create((irm https://raw.githubusercontent.com/mydrego-James/DevPDCA/main/install.ps1))) -Scope project
  ```
  *(亦可使用 `$env:DEVPDCA_SCOPE='project'; irm https://raw.githubusercontent.com/mydrego-James/DevPDCA/main/install.ps1 | iex`)*
* **macOS / Linux (Bash)**：
  ```bash
  curl -fsSL https://raw.githubusercontent.com/mydrego-James/DevPDCA/main/install.sh | bash -s -- --project
  ```
* **本機執行 / 手動複製**：
  - 本機 PowerShell：`.\install.ps1 -Scope project`
  - 本機 Bash：`./install.sh --project`
  - 手動複製：將 [`rules/AGENTS.md`](rules/AGENTS.md) 複製至專案 `.agent/rules/devpdca.md`，並將 [`devpdca/`](devpdca/) 複製至 `.agent/skills/devpdca/`。

#### 驗證安裝
安裝後可執行以下指令確認 Antigravity 正確載入：
```bash
agy plugin validate ~/.gemini/config/plugins/devpdca
```
若輸出 `✔ skills : 1 processed` 且 `~/.gemini/config/plugins/devpdca/rules/AGENTS.md` 存在，即代表常駐核心與技能皆安裝完成。

---

### 2. 其他 AI 輔助開發工具（Claude Code / Cursor / Windsurf / Copilot）

| 工具 | 整合方式 |
| :--- | :--- |
| **Claude Code** | 將 [`rules/AGENTS.md`](rules/AGENTS.md) 內容加入全域 `~/.claude/CLAUDE.md`（常駐核心），並將 [`devpdca/SKILL.md`](devpdca/SKILL.md) 放入 `~/.claude/skills/`。 |
| **Cursor** | 將 [`rules/AGENTS.md`](rules/AGENTS.md) 加入專案根目錄 `.cursorrules` 或 *Rules for AI*。 |
| **Windsurf** | 將 [`rules/AGENTS.md`](rules/AGENTS.md) 加入專案根目錄 `.windsurfrules`。 |
| **GitHub Copilot** | 將 [`rules/AGENTS.md`](rules/AGENTS.md) 加入 `.github/copilot-instructions.md`。 |

---

## 版本治理

[`rules/AGENTS.md`](rules/AGENTS.md) 與 [`devpdca/`](devpdca/) 永遠代表最新且唯一供實際使用的公開版本。安裝、引用或整合 DevPDCA 時，應以此為準，不應從歷史版本載入。

過往的單檔版本與資料夾快照保存在 [`development-history/`](development-history/)；該目錄只用於追溯開發變更與行為評估。

## 專案結構

```text
DevPDCA/
├── plugin.json               # Antigravity 外掛配置 Manifest (v1.3.0)
├── install.ps1               # Windows PowerShell 一鍵安裝腳本 (支援無 BOM 與特殊路徑)
├── install.sh                # macOS / Linux Bash 一鍵安裝腳本 (POSIX 相容)
├── rules/                    # 第一層：常駐核心行為層 (Always-On Core Rule)
│   └── AGENTS.md             # 不可破壞的心態核心與五步底層判斷過程
├── devpdca/                  # 第二層：深度判斷技能與延伸邊界庫 (v1.3.0)
│   ├── SKILL.md              # 完整核心行為定義、領域治理與 reference 路由
│   ├── references/           # 只在特定情境需要時載入的深入邊界指引
│   │   ├── boundary.md       # 五類資訊區分 (Needs/Understanding/Suggestions/Choices/Unconfirmed)
│   │   ├── evidence.md       # 證據原則
│   │   ├── design.md         # 最小充分設計與複雜度控制
│   │   ├── alignment.md      # 保留脈絡與再確認方向
│   │   ├── change.md         # 既有系統變更與向後相容
│   │   └── verification.md   # 驗證與完工標準
│   └── evals/                # 評估 DevPDCA 行為與方向穩定度的測試規格
│       ├── README.md
│       └── cases/
└── development-history/      # 開發變更與歷史版本封存
    ├── README.md
    ├── v1.1.0/               # v1.1.0 完整版本快照
    ├── v1.2.0/               # v1.2.0 完整版本快照與 REVISION_PLAN.md
    ├── v1.3.0/               # v1.3.0 REVISION_PLAN.md
    ├── DevPDCA_SKILL_v1.0.0.md
    ├── DevPDCA_SKILL_v1.0.1.md
    ├── DevPDCA_SKILL_v1.0.2.md
    ├── DevPDCA_SKILL_v1.0.3.md
    └── DevPDCA_Data_Structure_Guide_for_Codex.md
```

目前最新公開版本為 **DevPDCA v1.3.0**，主題為 **Core Behavioral Layer & Continuous Direction-Stabilizing Process**（*常駐核心架構持續收集用戶測試與回饋*）。

## 授權與公開範圍

本儲存庫中實際公開的規則、Skill、參考指引、評估案例與文件依 [Apache License 2.0](LICENSE) 授權。任何人都可以在遵守授權條款的前提下使用、修改、Fork、散布及商業使用，也歡迎提出意見、修正或共同參與開發。刻意提交給本專案的貢獻，除另有書面約定外，依相同授權提供。

這項開源授權只涵蓋本儲存庫中實際公開的內容。未公開的客戶資料、企業專屬 Skill 或 Prompt、客製模板、內部流程、營業秘密、專利技術及個別契約交付成果，不屬於本儲存庫或其開源授權範圍，另依雙方合約、保密協議與個別授權條款管理。
