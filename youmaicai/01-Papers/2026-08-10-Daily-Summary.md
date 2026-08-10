# 🥬 每日 LLM/NLP 论文汇总 | 2026-08-10

> 本日共收录 **9 篇** 相关论文，覆盖 MoE、MLLM 效率优化、AI Agent、事实检测、LLM 评测等方向。

---

## 📋 论文列表

| # | 论文 | 领域 | arXiv |
|---|------|------|-------|
| 1 | **EntropyMoE** — Tokenizer-Free MoE | MoE / Tokenizer-Free | [2608.06398](https://arxiv.org/abs/2608.06398) |
| 2 | **TEXAS** — Task-Expert-Aware MoE 微调 | MoE / Fine-tuning | [2608.06396](https://arxiv.org/abs/2608.06396) |
| 3 | **MAP** — MLLM 视觉 Token 剪枝 | MLLM / Efficiency | [2608.06411](https://arxiv.org/abs/2608.06411) |
| 4 | **ADIAS** — 交互式 Agent 系统自动化设计 | Agent / AutoML | [2608.06410](https://arxiv.org/abs/2608.06410) |
| 5 | **LaFaCt** — 激活工程事实检测 | Fact-Checking / Interpretability | [2608.06417](https://arxiv.org/abs/2608.06417) |
| 6 | **WebGrader** — Web 开发 RL 训练 | LLM / Web Dev / RL | [2608.06474](https://arxiv.org/abs/2608.06474) |
| 7 | **BFI-Adapt** — LLM Agent 人格演化基准 | Agent / Personality | [2608.06485](https://arxiv.org/abs/2608.06485) |
| 8 | **CoCo** — MoE Reward Model 可解释性 | MoE / Interpretability | [2608.06400](https://arxiv.org/abs/2608.06400) |
| 9 | **Sharding** — LLM 监督与对抗鲁棒性 | LLM / Alignment / Safety | [2608.06422](https://arxiv.org/abs/2608.06422) |

---

## 🔥 重点速览

### 🔴 高影响力
- **ADIAS**: Agent 设计自动化，issue-centric 优化框架，5 个基准平均提升 25.2%，消融显示 issue state 移除后性能下降 40.7%
- **WebGrader**: 自演进编程评分器训练 8B 模型达 52.01% 成功率，超越 o4-mini 和 DeepSeek-v4-flash
- **TEXAS**: MoE 下游适配新范式，3 个 MoE 模型 × 6 个基准中 17/18 达到最佳

### 🟡 技术创新
- **EntropyMoE**: 首个将 patch entropy 用于 MoE 路由坐标的 tokenizer-free MoE 架构
- **MAP**: 预测中间层注意力指导 MLLM 视觉 token 剪枝，保留 97.5% 性能同时加速 3.09×
- **LaFaCt**: 激活工程检测虚假信息，无需微调或外部检索
- **Sharding**: 发现 LLM judge 多判决过载问题，提出分片策略可同时提升准确率和对抗鲁棒性

### 🟢 评估/基准
- **BFI-Adapt**: 首个评估 LLM Agent 人格演化方向保真度的基准，14 个模型排名

---

## 📅 归档
- 单篇笔记：`2026-08-10-EntropyMoE.md` / `TEXAS.md` / `MAP.md` / `ADIAS.md` / `LaFaCt.md` / `WebGrader.md` / `BFI-Adapt.md` / `CoCo.md` / `Sharding.md`
- 同步时间：2026-08-10 14:20 UTC
