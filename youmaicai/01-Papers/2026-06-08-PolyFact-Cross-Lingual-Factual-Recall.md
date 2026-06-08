# PolyFact: Improving Cross-Lingual Factual Recall via Consistency-Driven Reinforcement Learning

## 元信息
| 标题 | Improving Cross-Lingual Factual Recall via Consistency-Driven Reinforcement Learning |
|------|------|
| 作者 | Jonathan von Rad, Louis Arts, George Burgess, et al. |
| 链接 | [原文](https://arxiv.org/abs/2606.06586) |
| arXiv | arXiv:2606.06586 |
| 领域 | cs.CL |
| 发表 | 2026-06-04 |
| 状态 | Under Review at EMNLP 2026 |

## 核心贡献

1. **问题定义**：LLM 主要在英语数据上训练，编码了大量世界知识，但无法可靠地用其他语言表达——即跨语言事实不一致（cross-lingual factual inconsistency）。

2. **数据集**：提出 **PolyFact**，大规模并行多语言事实 QA 数据集，包含 100K Wikidata 接地事实，覆盖 12 种类型多样的语言。

3. **方法对比**：比较三种方法对 Qwen-2.5-7B 和 OLMo-2-1124-7B 的跨语言事实召回改进：
   - Light continual pretraining (CPT)
   - Supervised fine-tuning (SFT)
   - Reinforcement learning via GRPO (Group Relative Policy Optimization)

4. **关键发现**：
   - **GRPO 始终优于 SFT**：同时提升跨语言一致性和对未见语言的泛化
   - CPT 在平行数据上收益有限
   - 机制分析：GRPO 重新组织多语言路由，通过减少 MLP 层和注意力头中的语言专门化，促进更共享的跨语言表示

## 核心创新点

使用 GRPO 而非 SFT 来改善跨语言事实一致性，并通过 mechanistic analysis 揭示其背后机制（减少语言专门化）。

## 实验结果

- 测试模型：Qwen-2.5-7B, OLMo-2-1124-7B
- 覆盖语言：12 种类型多样的语言
- 跨语言一致性：显著提升
- 未见语言泛化：优于 SFT

## 建议
- **是否推荐使用**：是
- **适用场景**：多语言 LLM 部署，需要跨语言事实一致性的应用

---
*🥬 油麦菜 — LLM/NLP 知识管理*