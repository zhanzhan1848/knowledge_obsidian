# RiM: Unlocking the Working Memory of Large Language Models for Latent Reasoning

## 元信息
| 标题 | Unlocking the Working Memory of Large Language Models for Latent Reasoning |
| 作者 | Lukas Aichberger et al. |
| 发表 | Preprint |
| 链接 | [原文](https://arxiv.org/abs/2605.30343) |
| arXiv | arXiv:2605.30343 |

## 核心贡献
1. **问题诊断**：现有测试时计算扩展方法将推理耦合到自回归生成（中间 token），混淆内部计算与外部通信
2. **核心洞察**：人类认知可以使用工作记忆在内部保持和操作信息，无需将中间想法外化
3. **提出 Reasoning in Memory (RiM)**：用**记忆块**（memory blocks）替代自回归生成推理步骤
   - 记忆块是固定特殊 token 序列，解锁 LLM 的工作记忆容量
   - 固定而非生成，可在单次前向传播中处理，实现计算高效的潜在推理

## 训练方法：两阶段课程

**阶段1：Grounding 阶段**
- 在每个记忆块后预测显式推理步骤
- 为记忆块提供基础

**阶段 2：Iterative Refinement 阶段**
- 丢弃步骤级监督
- 在每个记忆块后迭代精炼最终答案

## 实验结果
- 在推理基准测试上，跨不同家族和规模的语言模型
- RiM 匹配或超越现有潜在推理方法
- 避免自回归生成 thoughts 的同时保持性能

## 核心公式/机制

```
Memory Block = Fixed special tokens → Working memory capacity
Single forward pass per block → Compute-efficient latent reasoning
Two-stage curriculum: grounding → iterative refinement
```

## 局限性
- 记忆块的最优配置需进一步探索
- 在极长上下文上的可扩展性待验证

## 相关工作
- 测试时计算扩展（test-time compute scaling）
- 潜在推理（latent reasoning）
- 工作记忆机制

## 标签
#reasoning #working-memory #latent-reasoning #test-time-compute