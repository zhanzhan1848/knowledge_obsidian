---
type: paper
created: 2026-05-23
updated: 2026-05-23
tags: [llm, research-forecasting, rlvr, sft, autonomous-discovery]
status: processed
domain: LLM Reasoning & Science
agent: youmaicai
source: https://arxiv.org/abs/2605.21491
---

# Teaching Language Models to Forecast Research Success Through Comparative Idea Evaluation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Teaching Language Models to Forecast Research Success Through Comparative Idea Evaluation |
| **作者** | Srujan P Mule, Aniketh Garikaparthi, Manasi Patwardhan |
| **发表** | ACL 2026 Findings (cs.CL, cs.AI, cs.LG) |
| **链接** | [原文](https://arxiv.org/abs/2605.21491) |
| **DOI** | 10.48550/arXiv.2605.21491 |
| **代码** | - |

---

## 核心贡献

> 研究 LLM 是否可以预测研究想法的实验成功与否，提出 comparative empirical forecasting 任务，SFT 后的小模型 (8B) 超越 GPT-5。

1. **Comparative Empirical Forecasting**：给定 benchmark 目标和两个候选想法，预测哪个会取得更好性能
2. **数据集构建**：基于 PapersWithCode 构建 11,488 个 idea pairs
3. **SFT 显著提升**：8B 模型从 30% → 77.1%，超越 GPT-5 (61.1%)
4. **RLVR 推理**：通过 Reinforcement Learning with Verifiable Rewards 训练推理能力，达到 71.35% 且有可解释理由
5. **泛化能力**：跨领域和时序分割测试集上表现稳健

---

## 技术方案

### 核心思想

当 LLM 能自动化假设生成和实现后，新的瓶颈变成：如何评估和筛选数百个 AI 生成的想法而无需穷尽实验？

### 关键方法

| 方法 | 说明 |
|------|------|
| Comparative Forecasting | 比较两个想法的 benchmark 性能，预测胜负 |
| SFT | 监督微调，显著提升预测准确率 |
| RLVR | Reinforcement Learning with Verifiable Rewards，用于推理能力训练 |
| 推理路径发现 | 模型学习可解释的推理过程 |

---

## 实验结论

- **数据集**: 11,488 idea pairs from PapersWithCode
- **基线**: Off-the-shelf 8B (30%), GPT-5 (61.1%)
- **结果**: 
  - SFT 8B: **77.1%** (超越 GPT-5)
  - RLVR: 71.35% (带可解释推理)
- **OOD 测试**: 跨领域 + 时序分割测试均通过

---

## 局限性

- 局限于 benchmark-specific 目标，泛化到通用研究想法可能受限
- 推理能力训练 (RLVR) 性能反而低于 SFT，可能需要更多调优

---

## 实现建议

- **实现难度**: 中高（需要构建 idea pair 数据集）
- **预期性能**: 8B 模型可达 77% 预测准确率
- **适用场景**: 自动化科研想法筛选、研究方向推荐、科学发现加速