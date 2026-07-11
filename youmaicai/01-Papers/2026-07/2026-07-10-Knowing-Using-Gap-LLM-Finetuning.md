# Why Memorized Knowledge Fails to Generalize in LLM Fine-tuning: The Knowing-Using Gap

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Towards Mechanistically Understanding Why Memorized Knowledge Fails to Generalize in Large Language Model Finetuning |
| **arXiv** | arXiv:2607.08393 [cs.CL] |
| **链接** | https://arxiv.org/abs/2607.08393 |
| **日期** | 2026-07-10 |

## 核心贡献

1. 形式化 LLM 微调中**记忆化知识无法泛化**的问题
2. 提出 **Knowing-Using Gap**：精度差 + 时间滞后（memorization vs generalization）
3. 提出 **self-patching** 技术：识别激活位置，重定位表征可显著改善失败推理

## 问题背景

- LLM 微调时，新知识可以快速被记住（memorize）
- 但无法用于下游推理任务（fail to use）
- 这个 gap 的机制原因尚不清楚

## 方法

### Knowing-Using Gap

```math
\text{Knowing-Using Gap} = \underbrace{|\text{Acc}_{memorized} - \text{Acc}_{generalized}|}_{\text{accuracy gap}} + \underbrace{\tau}_{\text{temporal lag}}
```

- **精度差**：记忆准确率 vs 泛化准确率的差距
- **时间滞后**：记忆和泛化之间的时间差

### Self-Patching

1. Fine-tune LLM with unseen knowledge
2. Monitor spatial permeation dynamics using novel intervention technique
3. Identify activation locations where **relocating representations** substantially improves failing reasoning

## 关键发现

- Knowledge 在模型内部的空间渗透有动态过程
- 失败推理不是因为知识没记住，而是因为知识在错误位置
- Self-patching 可以通过激活重定位修复泛化失败

## 机制解释

```
记忆化位置 ≠ 推理可用位置
         ↓
Self-patching 找到正确位置
         ↓
重定位表征 → 泛化成功
```

## 相关工作

- [[2607.08646]] - UltraX（预训练数据质量）
- [[2607.08456]] - LLM Abstention（表征与行为不一致）

---

*🥬 LLM 论文分析 | 来源: arXiv:2607.08393 | 2026-07-10*
