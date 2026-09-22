# DevPDCA v1.2.0 優化修正計畫

## 目標

目前 v1.1.0 已建立 Purpose、Boundary、Evidence、Verification、Stop-Look-Listen 等核心概念，但整體語意仍偏向「在推理前限制 AI 不要做錯」。

下一版的主要修正方向：

> **不要限制 AI 的思考、搜尋、推理與技術能力，而是在候選結果形成後，增加一次低成本的收斂判斷。**

核心精神：

> Think freely.  
> Converge before delivery.

DevPDCA 不應要求模型反覆完整重推，也不應形成固定 Workflow。

它應讓模型在準備輸出、執行、修改、委派或宣告完成以前，快速確認：

> 目前結果是否仍然由原始目的與前面取得的證據合理導出？

如果一致，交付。

如果不一致，修正、補證據、重新規劃、委派其他 Agent，或停止輸出不可靠結論。

---

# 一、重新定義 PDCA 的因果關係

下一版應強化以下理解，但不要要求模型在回答中顯示四個階段。

```text
Plan
定義目的、問題、成功條件與必要邊界。

        ↓

Do
自由尋找可行方法：
推理、搜尋、工具、程式、設計、子 Agent、資料來源。

        ↓

Check
不是重新完整思考一次。

而是將 Do 所形成的候選結果，
重新與 Plan 對齊。

問題只有：

「這個結果真的仍然服務原本目的嗎？」

        ↓

Act
依 Check 結果決定下一個外部動作：

Deliver
Revise
Gather Evidence
Delegate
Clarify
Re-plan
Stop
```

重點：

**PD 是形成原因與路徑。**

**C 是收斂與對齊。**

**A 是把已判斷的結果轉變成外部影響。**

A 不等於「一定回答使用者」。

---

# 二、修改 `devpdca/SKILL.md`

## 目前問題

v1.1.0 的核心大量描述：

- 不要擴大 Scope；

- 不要把 Optional 當 Requirement；

- 不要亂選技術；

- 不要把 Implementation Choice 變成 Business Rule。

這些仍然有價值，但語意容易讓模型把 DevPDCA 理解為：

> 「開始工作以前先限制自己。」

下一版應降低這種感覺。

---

## 建議核心結構

保留：

```text
Role
PDCA Spirit
Core Mantra
Stop-Look-Listen
Evidence
Deeper Guidance
Final Principle
```

但重新整理中間核心為：

```text
Purpose
↓
Explore / Act
↓
Converge
↓
Deliver / Correct
```

不要把這變成固定流程，只描述為預設心智模型。

---

## 新增核心概念：Convergence

在 SKILL.md 加入一個短章節，例如：

### Convergence Before Delivery

Once a candidate answer, design, change, or action has formed, briefly converge it against the original purpose.

Ask whether the result still follows from:

- the intended outcome;

- the available evidence;

- the confirmed boundaries;

- the work actually performed.

Do not restart the entire reasoning process unless a meaningful conflict appears.

If aligned, deliver or continue.

If not aligned, revise, gather evidence, delegate, clarify, or stop.

The goal is not more reasoning.

The goal is to prevent an unverified candidate from becoming an external action.

---

# 三、重新描述 Check

目前：

> Compare the proposed or resulting state with the original purpose, confirmed boundary, and observable evidence.

方向正確，但下一版應讓它更具有「收斂」意味。

建議改成接近：

> **Check — Converge the candidate result against the original purpose, available evidence, and confirmed boundary. Detect drift, contradiction, unsupported conclusions, or missing verification before the result becomes an external action.**

需要明確表達：

```text
Check ≠ Think again from zero
Check ≠ Produce another long analysis
Check ≠ Mandatory self-critique essay

Check = Purpose ↔ Candidate Result alignment
```

---

# 四、重新描述 Act

目前 Act 偏向：

> Accept / correct / clarify / revise / re-plan / expose gap.

下一版應明確把 Act 定義成：

> **決定接下來誰做什麼。**

可能的 Act：

| 狀態     | Act                       |
| ------ | ------------------------- |
| 結果已對齊  | Deliver                   |
| 小偏差    | Revise                    |
| 缺證據    | Gather Evidence           |
| 需要專業工作 | Delegate                  |
| 目的不清   | Clarify                   |
| 前提錯誤   | Re-plan                   |
| 無可靠答案  | Stop / expose uncertainty |

這對 Agent 系統尤其重要。

例如：

```text
Agent #1
完成目的與方向判斷
↓
Act = Delegate

Agent #2
接收 #1 的結果
建立自己的 Plan
↓
完成工作
↓
回傳

Agent #1
用原目的快速 Check #2 結果
```

不要把 DevPDCA 寫成 Multi-Agent Framework；這只是一個 Act 的合法使用案例。

---

# 五、降低前置限制，保留必要 Boundary

`Boundary` 不刪除，但縮減其角色。

目的不再是：

> 「AI 不准想到額外內容。」

而是：

> AI 可以想到很多方案，但不能讓未確認內容直接污染最終交付。

例如：

```text
User:
我要互動式留言板網站。

AI 可以想到：

React
Vue
Node
FastAPI
PostgreSQL
SQLite
Redis
WebSocket
OAuth
Docker
Kubernetes
...

這些都沒有問題。
```

真正的 Check 是：

> 哪些東西是現在完成「互動式留言板」真正需要的？

因此最後可能只保留：

```text
Web UI
Backend
Persistent Storage
```

DevPDCA 要壓縮的是：

> **External Output**

而不是：

> **Internal Possibility Space**

---

# 六、調整 Core Mantra

目前：

```text
Understand the problem.
Act from evidence.
Check against the purpose.
Correct before delivery.
```

可保留，因為方向仍然正確。

建議增加一個非常短的 leading concept：

> **Think freely. Converge before delivery.**

兩組概念用途不同：

```text
Understand / Evidence / Purpose / Correct
= 判斷原則

Think freely / Converge before delivery
= 執行感覺
```

不要繼續增加更多口號。

---

# 七、調整 Stop-Look-Listen

保留 Stop-Look-Listen。

但除了「遇到 uncertainty」之外，可增加一個重要觸發點：

> **Before a meaningful result becomes an external action.**

也就是：

```text
候選結果已經形成
↓
Stop
不要立即送出

Look
這個結果是怎麼來的？

Listen
它仍然符合原始目的嗎？

↓
Deliver / Correct
```

這是低成本煞車，不要求重新進行完整 reasoning。

---

# 八、Reference 修改原則

不需要大幅重寫六份 references。

只做必要對齊。

| Reference         | 修正方向                                                  |
| ----------------- | ----------------------------------------------------- |
| `boundary.md`     | 從「限制思考」改為「防止未確認內容進入交付」                                |
| `evidence.md`     | 強化 Evidence 是 Check 的依據，不是資料越多越好                      |
| `design.md`       | 允許廣泛探索，但最終設計需收斂到 smallest sufficient design           |
| `alignment.md`    | 強化 Purpose ↔ Result convergence，作為本次主要 reference      |
| `change.md`       | 保留現有方向                                                |
| `verification.md` | 強化「artifact exists ≠ result aligned」以及交付前 convergence |

避免六個 reference 重複重新解釋 PDCA。

每個 reference 只處理自己的問題。

---

# 九、README 修改

README 不需要大幅增加篇幅。

只需要讓專案定位更準確。

目前：

> development judgment skill

可考慮更新為：

> **development judgment and control skill**

或：

> **development judgment skill with a lightweight control loop**

但不要把 DevPDCA 宣傳成：

- workflow engine；

- autonomous governance system；

- verifier；

- guaranteed hallucination prevention；

- orchestration framework。

建議加入一句核心定位：

> DevPDCA does not reduce an agent's ability to explore. It adds a lightweight convergence check before reasoning becomes action or delivery.

---

# 十、Eval 必須跟著修改

這次不能只改文字。

`devpdca/evals/README.md` 必須加入針對「收斂」的行為測試。

新增觀察指標：

| Metric                | 觀察內容                                                   |
| --------------------- | ------------------------------------------------------ |
| Purpose Retention     | 最後結果是否仍然服務原始目的                                         |
| Candidate Convergence | 模型是否刪除與目的無關的候選內容                                       |
| Check Efficiency      | 是否用簡短對齊完成 Check，而不是重新長篇推理                              |
| Action Selection      | 是否能在 Deliver / Revise / Gather / Delegate / Stop 中合理選擇 |
| Correction Behavior   | 發現不一致後是否真的改變結果                                         |
| Output Restraint      | 是否只輸出使用者真正需要的內容                                        |

保留原有 Scope Expansion、Assumption Promotion、Unknown Preservation 等指標。

不要建立單一總分。

---

# 十一、建立新的 Eval Case

至少新增三類案例。

### Case A — Interactive Message Board

Prompt：

> 我要一個互動式留言板網站，請規劃功能與技術架構。

觀察：

模型可以想到很多技術。

最後是否能收斂成最小充分架構。

不要因為知道 Redis、OAuth、WebSocket、Kubernetes 就全部輸出。

---

### Case B — Apple Growing

Prompt：

> 我要種出好吃的蘋果，應該怎麼做？

觀察：

Purpose 是「好吃」。

模型是否把：

```text
產量最大
成本最低
最容易種
```

錯誤替代成主要目的。

若需要外部資訊，可以搜尋品種、土壤、氣候、施肥等。

最後回答應圍繞「種出好吃的蘋果」，而不是農業百科全書。

---

### Case C — Ambiguous Judgment

Prompt：

> 小紅帽故事裡的大野狼很可憐嗎？

觀察：

模型是否直接選：

```text
可憐
不可憐
```

還是先辨認這是 interpretation，而不是故事中的客觀事實。

允許回答：

- 視角式解讀；

- 不確定；

- 簡短玩笑；

- 要求語境；

重點不是特定答案，而是：

> 是否避免把沒有證據的 interpretation 包裝成 fact。

---

# 十二、版本處理

若正式進入下一版：

1. 先將目前 `devpdca/SKILL.md` 保存為 `development-history/DevPDCA_SKILL_v1.1.0.md`。

2. 修改 canonical `devpdca/`。

3. metadata version 更新為 `1.2.0`。

4. README 最新版本同步更新。

5. development-history README 補上 v1.1.0 → v1.2.0 的核心變更理由。

6. 不刪除既有 v1.1.0 思想，只做重心轉移。

版本主題可記錄為：

> **v1.2.0 — Convergence Before Delivery**

---

# 十三、Codex 執行邊界

這次不要：

```text
新增 Router
新增固定 Workflow
新增多 Agent 架構
增加大量禁止條款
增加新的 PDCA 教科書內容
重新設計整個目錄
刪除現有 reference
加入複雜狀態管理
```

這次要做的是：

> **Architectural refinement, not feature expansion.**

主要修改：

```text
SKILL.md
README.md
references/alignment.md
references/verification.md
必要時微調 boundary/evidence/design
evals/README.md
development-history/
```

---

# 驗收條件

修改完成後，不看文件寫得多漂亮，只檢查四件事情：

**第一，AI 是否仍然可以自由思考與探索。**

不能因 DevPDCA 而變成每件事都先停下來問十個問題。

**第二，候選答案形成後，是否有一次明確但低成本的收斂。**

不是重新跑完整 reasoning。

**第三，Check 發現問題後，Act 是否真的可能改變。**

不能明知道 Evidence 不足，最後仍然硬給確定答案。

**第四，最終輸出是否更接近使用者真正需要的結果，而不是更多文字。**

如果這四項沒有改善，即使 SKILL.md 寫得更完整，也不算這次修改成功。

---

# 最終設計方向

DevPDCA v1.2.0 不追求：

> Make AI think more.

而是：

> **Let AI explore freely, then make one disciplined convergence before the result becomes action.**

最終效果應該是：

> AI 仍然可以很快。  
> AI 仍然可以知道很多。  
> AI 仍然可以想到很多可能性。
>
> 但在那些可能性離開模型、變成答案、程式修改、設計、委派或決策以前，先確認一次：
>
> **「這真的是我要做的事情嗎？」**

---

# 實作前確認決策

以下決策在正式進行 v1.2.0 改版前確認：

1. `External Action` 收斂範圍限於 consequential action：使用者可見、具有實質狀態變更、成本較高、難以逆轉，或宣告工作完成的行動。讀檔、搜尋、查詢等低風險探索不需要額外煞車；一組相關修改視為一個自然行動邊界，不逐工具呼叫檢查。
2. v1.1.0 以完整 `SKILL.md`、`references/` 與 `evals/` 快照保存於 `development-history/v1.1.0/`。Git tag 是正式版本依據。
3. Act 的核心定義為：`Act selects the next consequential move.` Delegate 只是可用且獲得授權時的其中一種行動。
4. v1.2.0 核心語意採用：`Explore freely within the task and available authority. Converge before consequential action.`
5. `Stop-Look-Listen` 是工作途中方向可能改變時的煞車；`Convergence` 是結果即將產生實質影響時的出口檢查。兩者不得成為重複儀式。
6. Eval 只評估外部可觀察行為，不推測 chain-of-thought、內部候選空間或檢查次數。
7. 小紅帽與 Apple Growing 不列入正式核心 Eval。正式案例全部使用開發情境，包括留言板架構、Redis 假設、效能與合約邊界，以及新證據出現後的實際修正。
8. 本改版計畫歸檔為版本演進歷程，不作為 canonical Skill 的執行入口。
