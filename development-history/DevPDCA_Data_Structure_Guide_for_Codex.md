# DevPDCA 資料建構說明

版本：Draft for Codex  
基準來源：DevPDCA v1.0.3  
目的：為後續 v1.1.0 的資料夾化與 Progressive Disclosure 做結構準備。

---

## 1. 建構目標

DevPDCA v1.0.3 的核心目標不是「縮短文字」，而是把：

- 每次都應載入的核心心法；
- 只有特定情境才需要的深入知識；
- 可驗證的模型行為測試；

拆成不同層級。

未來的 DevPDCA 應避免把所有知識都塞在單一 `SKILL.md`。

`SKILL.md` 應只保留高資訊密度、跨任務都成立、能直接影響判斷方向的核心內容。

更細的工程判斷應移入 `references/`，並採用按需載入。

模型行為驗證應獨立放在 `evals/`，不要混入 Skill 使用說明。

---

## 2. 設計原則

### 2.1 Core First

任何 Agent 只讀 `SKILL.md`，也必須能理解 DevPDCA 的核心精神並正常工作。

核心至少包含：

- Role
- PDCA Spirit
- Core Mantra
- Default Route
- Stop-Look-Listen
- Core Behavioral Boundaries
- Completion / Verification principle

### 2.2 Progressive Disclosure

詳細知識只在需要時載入。

不要要求 Agent 一開始讀完整個 reference tree。

每一份 reference 應在開頭說明：

- 何時讀；
- 解決什麼問題；
- 何時不需要讀。

### 2.3 One Responsibility, One Canonical Reference

避免多份 reference 重複描述相同責任。

例如：

- Requirement Status 與 Boundary 不要拆成兩份彼此高度重複的文件；
- Verification 與 Completion 若內容高度重疊，應決定主要責任歸屬；
- PxDCA 不應再複製一份到 DevPDCA 內部。

### 2.4 Judgment Before Procedure

DevPDCA 是 Judgment Skill，不是固定 Workflow Skill。

references 可以提供：

- 判斷框架；
- 觀察訊號；
- 風險模式；
- 使用情境；
- 少量範例。

避免把 reference 寫成必須逐步執行的固定流程。

### 2.5 Stable Core, Replaceable Details

容易隨模型、IDE、CLI、平台而改變的資訊，不要放入核心 `SKILL.md`。

平台特定規則應放在獨立整合文件，或交由平台自身 metadata / instructions 管理。

---

## 3. 建議資料夾結構

```text
devpdca/
├─ SKILL.md
│
├─ references/
│  ├─ boundary.md
│  ├─ evidence.md
│  ├─ design.md
│  ├─ alignment.md
│  ├─ change.md
│  └─ verification.md
│
├─ evals/
│  ├─ README.md
│  ├─ cases/
│  └─ results/
│
└─ agents/
   └─ openai.yaml        # 僅在需要 Codex / OpenAI integration metadata 時建立
```

注意：

- v1.0.3 不要求一次完成所有 reference。
- v1.1.0 才建議正式啟用資料夾化版本。
- 不需要為了結構完整而建立空洞文件。
- 每一份新增 reference 都必須有明確責任。

---

## 4. SKILL.md 的責任

`SKILL.md` 是「內功總綱」。

它不應變成：

- PDCA 教科書；
- Requirements Engineering 教科書；
- Architecture 教科書；
- PM / PG / PQ 操作手冊；
- Agent orchestration flow；
- Model-specific prompt collection。

它應回答：

1. DevPDCA 是什麼？
2. Agent 應該抱持什麼判斷心法？
3. 從哪裡起手？
4. 什麼時候要踩煞車？
5. 哪些邊界不能被偷偷改變？
6. 怎麼知道工作可以交付？

---

## 5. References 規劃

### 5.1 `boundary.md`

責任：

- 區分 Confirmed / Inferred / Unknown / Optional / Implementation Choice。
- 防止合理推論被升格成正式需求。
- 防止 common practice 變成 baseline。
- 處理 scope creep 與 hidden requirement。
- 說明「how」與「what」的邊界。

建議從 v1.0.2 搬移：

- Requirement Status Discipline
- Boundary 的詳細內容
- Output Discipline 中與 scope / assumption 相關的規則

不要重新複製 `SKILL.md` 的核心口訣。

---

### 5.2 `evidence.md`

責任：

- 什麼可以構成工程證據。
- 如何區分 plausible explanation 與 evidence。
- 何時需要 source code、logs、tests、measurements、external authoritative docs。
- 如何處理證據不足。

建議從 v1.0.2 搬移：

- Evidence 章節的詳細內容
- Challenge 中與「completion without evidence」相關的訊號

---

### 5.3 `design.md`

責任：

- 如何讓技術設計服務 confirmed purpose。
- smallest sufficient design。
- 避免因熟悉、流行、理論潔癖而引入複雜度。
- technical choice 與 product requirement 的界線。
- architecture change 前理解 existing contract。

這份文件不是技術選型清單。

不要預設：

- REST 一定優於其他方式；
- microservices 一定比 monolith 好；
- Redis / Kubernetes / cloud / container 是 production baseline。

---

### 5.4 `alignment.md`

責任：

- Problem ↔ Requirement ↔ Design ↔ Result 的一致性。
- 交叉文件或多 Agent 工作時的 drift。
- PM / PG / PQ 作為「視角」而不是固定 Agent workflow。
- traceability 與 contradiction detection。
- 多個 Artifact 之間的目的是否仍一致。

PxDCA 的 deeper concepts 可以從此 reference 指向外部 wiki。

不要複製 PxDCA 全套流程。

---

### 5.5 `change.md`

責任：

- 既有系統變更的 impact。
- compatibility。
- reversibility。
- migration risk。
- interface / data / behavior contract。
- 修改前需要理解的 surrounding system。

這份文件主要服務 existing-system change，不是所有任務都需要載入。

---

### 5.6 `verification.md`

責任：

- work 何時可以稱為 complete。
- observable acceptance。
- tests / measurements / logs / user acceptance。
- plan 是否可驗證。
- implementation 是否真的符合 intended behavior。
- unresolved gap 是否需要明確曝光。

建議從 v1.0.2 搬移：

- Before Returning Work to the User
- Challenge 中與 acceptance / completion 相關內容

不要把它寫成每個任務都必須輸出的 visible checklist。

---

## 6. Reference 文件格式建議

每份 reference 建議使用相同的輕量格式：

```text
# <Topic>

## Read this when

描述觸發情境。

## Core idea

用最少文字定義本章判斷核心。

## Signals

列出值得注意的症狀或風險訊號。

## Guidance

提供判斷方向，不要變成固定工作流。

## Avoid

列出常見誤區。

## Return to core

提醒 Agent 回到 Purpose / Boundary / Evidence / Verification。
```

這只是 authoring pattern，不是 Agent 必須逐節執行的流程。

---

## 7. Evals 規劃

`evals/` 用來驗證 Skill 是否真的改變模型行為。

不要把 eval 規則寫入 `SKILL.md`。

建議結構：

```text
evals/
├─ README.md
├─ cases/
│  ├─ comment-board.md
│  ├─ ambiguous-feature.md
│  ├─ architecture-expansion.md
│  └─ existing-system-change.md
└─ results/
   ├─ gemini-3.8-flash/
   ├─ gpt-5.6/
   └─ other-models/
```

### 7.1 初期評估指標

至少記錄：

- Scope Expansion
- Assumption Promotion
- Technology Commitment
- Optional Separation
- Unknown Preservation
- Verification Awareness
- Skill Leakage
- Baseline Contamination

### 7.2 測試原則

同一模型測試時固定：

- model
- reasoning / thinking level
- prompt
- Skill version
- session mode
- Agent harness / IDE version（若可固定）

比較：

- without Skill
- current Skill
- previous Skill version

先量測同模型自身 variance，再比較不同模型。

不要因單次結果立即修改 Skill。

---

## 8. AGENTS.md 與 DevPDCA 的責任邊界

`AGENTS.md` 不屬於 DevPDCA Skill 本體。

若 repository 使用 `AGENTS.md`，建議它只負責：

- project authority；
- canonical Skill 指向；
- repo-specific constraints；
- build / test / validation 指令；
- Skill governance；
- external Skill conflict policy。

範例概念：

```text
This repository uses DevPDCA as its canonical development judgment skill.

External skills may supplement project work but must not silently redefine
confirmed requirements, project authority, or DevPDCA's core judgment principles.

When multiple skills overlap, prefer the repository's canonical guidance and
surface unresolved conflicts instead of silently merging contradictory rules.
```

不要把整份 DevPDCA 複製進 `AGENTS.md`。

---

## 9. Skill Governance 建議

未來若整合 skills.sh、Skills Marketplace、MCP 或其他第三方 Skill：

- 不要以安裝數或熱門度作為權威來源；
- 不要自動啟用語意高度重疊的多個 Skill；
- 一個責任領域應指定一個 canonical Skill；
- 外部 Skill 可以補充，不應無聲覆蓋 project authority；
- 發生邏輯衝突時應曝光，不要自行混合成第三套規則；
- 更新 Skill 版本時應重新跑 eval。

建議採取：

```text
Unknown Skill  -> not trusted by default
Reviewed Skill -> allowed
Overlapping    -> conflict review
Replacement    -> explicit decision
Experimental   -> sandbox / eval only
```

---

## 10. Codex 建構任務

請 Codex 依以下順序執行：

1. 保留 `DevPDCA_SKILL_v1.0.3.md` 作為目前 canonical core。
2. 建立 `devpdca/` Skill folder。
3. 將 canonical core 放入 `devpdca/SKILL.md`。
4. 建立 `references/` 目錄，但只建立有實際內容的文件。
5. 從 v1.0.2 搬移詳細內容時，以「移動責任」為原則，不要直接複製造成重複。
6. 不要改寫 DevPDCA 核心心法。
7. 不要將 DevPDCA 轉成固定 PDCA workflow。
8. 不要將 PM / PG / PQ 轉成強制多 Agent pipeline。
9. 不要自動新增 scripts；除非未來有 deterministic task 明確需要。
10. 建立 `evals/README.md`，說明測試目的與指標。
11. 若建立 `agents/openai.yaml`，僅放 OpenAI/Codex discovery metadata，不放核心方法論。
12. 任何 platform-specific、model-specific、容易過時的規則，不得寫入核心 `SKILL.md`。

---

## 11. 完成條件

資料夾化後應符合：

- 只讀 `SKILL.md` 仍可正確理解 DevPDCA。
- `SKILL.md` 不依賴某個特定模型或 IDE。
- 深入內容可按需載入。
- 同一概念不在多個 reference 重複定義。
- PxDCA 仍為 optional external reference。
- DevPDCA 仍是 standalone Judgment Skill。
- 沒有固定 FLOW。
- 沒有強制多 Agent pipeline。
- 沒有為了「完整」而建立不必要內容。
- 後續換模型或改 Skill 時，可以用 evals 驗證行為差異。

---

## 12. 核心不變條件

任何後續重構都不得破壞以下原則：

> Understand the problem.  
> Act from evidence.  
> Check against the purpose.  
> Correct before delivery.

以及：

> Keep known facts known.  
> Keep unknowns unknown.  
> Keep options optional.  
> Use implementation freedom for how, not for what.  
> Verify before claiming completion.

資料夾化的目的，是讓這些核心更容易被高速 Agent 保留，而不是讓 DevPDCA 變成更大的流程系統。
