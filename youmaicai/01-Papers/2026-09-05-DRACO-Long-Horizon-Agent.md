---
type: paper
created: 2026-09-05
updated: 2026-09-05
tags: [paper, llm-agent, reinforcement-learning, credit-assignment, long-horizon]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2609.04094
---

# DRACO: Fine-Grained Credit Assignment with Dynamic Rubrics for Long-Horizon Agent Training

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | DRACO: Fine-Grained Credit Assignment with Dynamic Rubrics for Long-Horizon Agent Training |
| **作者** | Shubham Gandhi et al. |
| **发表** | arXiv |
| **链接** | [原文](https://arxiv.org/abs/2609.04094) |
| **arXiv** | arXiv:2609.04094 |
| **代码** | [GitHub](https://github.com/IBM/draco) |

---

## 核心贡献

1. **DRACO（Distributing Rubric-based Advantage for Credit Optimization）**：在无 ground-truth 成功信号的 outcome-blind 设置下，实现细粒度 credit assignment
2. **动态 Rubric 生成**：在训练过程中追踪策略能力演化，动态生成评分标准
3. **GRPO 重新分配**：per-step advantage 无需训练归因模块，closed-form redistribution

---

## 问题背景

- RLVR（Reinforcement Learning from Verifiable Rewards）在有 programmatic checker 时效果好
- 但大多数长期 Agent 领域没有这样的 checker
- Multi-criteria rubrics 每条轨迹只评一次分，single scalar 无法在数十步上提供有效信号

---

## 技术方案

### DRACO 工作流程

1. **动态 rubric 生成**：随策略能力演化生成评分标准
2. **轨迹级评分**：每完成一条轨迹评一次分
3. **Closed-form 重新分配**：将判断重新分配到负责标注 rubrics 的各步骤

```math
A_{step} = \text{redistributed rubric score} \quad \text{(无训练模块)}
```

### 与 GRPO 结合

- 在 GRPO 框架内进行 rubric-based advantage 重分配
- 无需 verifiers 即可获得差异化 per-step advantages

---

## 实验结果

### AppWorld
| 方法 | 性能提升 |
|------|----------|
| Base model | baseline |
| GRPO (sparse ground-truth reward) | +10.6 |
| **DRACO** | **+15.9** |

### Tau-Bench（out-of-domain）
| 方法 | 性能提升 |
|------|----------|
| Base model | baseline |
| GRPO (ground-truth reward) | +~3 |
| **DRACO** | **+5.3** |

---

## 建议

- **是否推荐阅读**：是
- **适用场景**：Long-horizon Agent 训练、无法获取 ground-truth 的 RL 设置

---

*🥬 youmaicai | 2026-09-05*
