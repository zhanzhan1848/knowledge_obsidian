---
type: paper
created: 2026-07-23
updated: 2026-07-23
tags: [LLM, latent-reasoning, reinforcement-learning, chain-of-thought, RL, inference-scaling]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2607.19691
---

# SLPO: Scaling Latent Reasoning via a Surrogate Policy

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | SLPO: Scaling Latent Reasoning via a Surrogate Policy |
| **作者** | Runyang You 等 |
| **发表** | arXiv 2026-07-22 |
| **链接** | [原文](https://arxiv.org/abs/2607.19691) |
| **DOI** | 10.48550/arXiv.2607.19691 |
| **代码** | 待发布 |

---

## 核心贡献

> 提出 SLPO (Surrogate Latent Policy Optimization)，将 outcome-reward RL 引入自回归隐式推理器，解决隐式推理无法 per-step credit assignment 和自适应停止的难题

1. **隐式推理器的 outcome-reward RL**：引入经验代理策略密度（empirical surrogate policy density）对隐式轨迹进行轨迹级信用分配
2. **自适应停止头**：正确性监督的停止头被 outcome-reward 优化为可变推理长度策略
3. **超越显式 CoT**：在连续推理和软推理设置下，SLPO 提升 Pass@$k$（并行采样），并为更难实例分配更长隐式计算

---

## 技术方案

### 问题背景

- **显式 CoT**（如 GRPO）：推理步骤作为语言 token 解码，已通过 outcome-reward RL 实现 test-time scaling
- **隐式推理**：中间计算以连续向量存储，在更短推理长度下已匹配或超越显式 CoT
- **核心瓶颈**：隐式轨迹缺乏可分解的 per-step likelihood，在固定思考预算下缺乏自适应停止接口

### 核心方法：SLPO

| 组件 | 作用 |
|------|------|
| Surrogate Policy Density | 对隐式转移的经验代理策略密度，用于轨迹级信用分配 |
| Stopping Head | 正确性监督的停止头，被 RL 优化为可变长度策略 |
| Outcome-Reward Optimization | 基于最终正确性的奖励信号 |

### 关键特性

- 隐式推理轨迹无法 per-step 微分 → 用代理策略密度绕过
- 固定推理预算 → 停止头学习自适应分配计算资源
- 结果：更长隐式计算流向更难实例，Pass@$k$ 提升

---

## 实验结论

- 并行采样下 Pass@$k$ 提升
- 更难实例获得更长隐式计算
- 确定性准确率随推理长度提升

---

## 局限性

- 依赖可验证奖励（Verifiable Rewards）
- 实现复杂度较高

---

## 实现建议

- **实现难度**: 高（需实现代理策略 + 停止头）
- **预期性能**: 推理效率优于显式 CoT
- **适用场景**: 数学推理、代码生成等有明确正确答案的任务
