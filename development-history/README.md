# 開發變更版本歷程

本目錄保存 DevPDCA 的歷史版本與結構演進文件，供差異比較、設計追溯與行為評估使用。

這裡的檔案不是目前公開 Skill 的安裝入口。最新且唯一供實際使用的版本永遠位於 [`../devpdca/`](../devpdca/)，入口為 [`../devpdca/SKILL.md`](../devpdca/SKILL.md)。

## 版本歷程

| 版本 | 定位 | 主要變更 |
| --- | --- | --- |
| [v1.0.0](DevPDCA_SKILL_v1.0.0.md) | 初始版本 | 建立以 PDCA 精神支援開發判斷的基礎概念。 |
| [v1.0.1](DevPDCA_SKILL_v1.0.1.md) | 單檔擴充版 | 補強 AI Role、工作判斷、證據與交付前檢查。 |
| [v1.0.2](DevPDCA_SKILL_v1.0.2.md) | 單檔完整基準 | 明確區分需求狀態、輸出邊界與 PM／PG／PQ 視角。 |
| [v1.0.3](DevPDCA_SKILL_v1.0.3.md) | 精簡核心基準 | 收斂核心心法、Default Route 與行為邊界，為資料夾化做準備。 |
| [v1.1.0](../devpdca/SKILL.md) | 最新公開版本 | 採用資料夾化、按需 references 與獨立 evals；位於 `devpdca/`。 |

## 結構演進文件

- [`DevPDCA_Data_Structure_Guide_for_Codex.md`](DevPDCA_Data_Structure_Guide_for_Codex.md)：由 v1.0.3 單檔核心轉為 v1.1.0 資料夾結構時使用的規劃文件。

## 維護原則

- `devpdca/` 永遠維持最新公開版本。
- 歷史檔案一旦封存，不再回頭修改其內容。
- 發布新版本時，先更新並驗證 `devpdca/`；需要保留快照時，再將被取代的版本加入本目錄。
- 歷史版本只用於追溯、比較與 eval，不與最新版同時作為 canonical Skill。
