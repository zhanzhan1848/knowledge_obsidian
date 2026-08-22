---
type: paper
created: 2026-08-22
updated: 2026-08-22
tags: [skill-induction, transfer-learning, llm-agent, task-planning]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2608.20274
---

# Break It Down, Pass It On: Cross-Task Skill Transfer in LLM Agents

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Break It Down, Pass It On: Cross-Task Skill Transfer in LLM Agents |
| **作者** | Yiyang Feng, Biddut Sarker Bijoy, Niranjan Balasubramanian, Jiawei Zhou |
| **发表** | arXiv 2026 |
| **链接** | [原文](https://arxiv.org/abs/2608.20274) |
| **arXiv** | arXiv:2608.20274 |

---

## 核心贡献

> 首次系统性研究技能诱导方式对跨任务迁移的影响，发现子任务级+文本格式的技能组合效果最佳，并提出技能效用分数作为任务执行前的技能有用性预测指标。

1. **系统性对比研究**：比较任务级 vs 子任务级、文本 vs 代码两种维度的技能迁移效果
2. **关键发现**：子任务级技能提升性能，任务级技能损害性能；文本技能优于代码技能
3. **技能效用分数**：结合特异性和抽象性预测技能有用性，无需实际运行任务

---

## 技术方案

### 技能诱导级别

| 级别 | 方式 | 特点 |
|------|------|------|
| **任务级** | 从整个任务轨迹诱导一个技能 | 技能绑定源任务，泛化性差 |
| **子任务级** | 将任务分解为子任务，每个子任务诱导一个技能 | 共享子任务可被多个任务复用 |

### 技能格式

| 格式 | 表示方式 |
|------|----------|
| **文本技能** | 自然语言工作流笔记 |
| **代码技能** | Python 函数，实例特定值为参数 |

### 技能效用分数

```math
Skill Utility = Specificity \times Abstractness
```

- **特异性**：技能与最近任务的相似度是否比随机两任务间相似度更高
- **抽象性**：技能相关性分布在多少任务上（perplexity 度量）

---

## 实验结论

- **数据集**: AppWorld (417), OfficeBench (300), KramaBench (92)
- **模型**: 11个模型（Qwen3/Gemma3/MoE/商业模型）
- **结果**:
  | 条件 | 成功率变化 |
  |------|------------|
  | 子任务级 + Text | **+1.9分** ✅ |
  | 子任务级 + Code | **+0.5分** ✅ |
  | 任务级 + Text | **-1.2分** ❌ |
  | 任务级 + Code | **-4.1分** ❌ |

---

## 局限性

1. **技能合并阈值固定**：0.85 的相似度阈值可能不最优
2. **评估基准局限**：仅覆盖工具使用、办公、数据科学场景
3. **成本权衡**：中等预算时子任务级代理优势才明显

---

## 实现建议

- **实现难度**: 中等（需构建技能记忆系统）
- **预期性能**: 跨任务迁移成功率 +1-2 分
- **适用场景**: 通用代理框架、技能复用系统

---

## 相关工作

- [[Skill Learning]] - 技能学习
- [[Agent Memory]] - 智能体记忆
- [[Task Decomposition]] - 任务分解
