# Mechanistic Origins of Catastrophic Forgetting: Why RL Preserves Circuits Better than SFT?

## 基本信息
| 标题 | Mechanistic origins of catastrophic forgetting: why RL preserves circuits better than SFT? |
|------|------------------------------------------------------------------------------------------|
| 作者 | Jeanmely Rojas Nunez, Viraj Sawant, Nathan Allen, et al. |
| 链接 | [原文](https://arxiv.org/abs/2605.28860) |
| arXiv | arXiv:2605.28860v1 |
| 代码 | [GitHub](https://github.com/rl-sft-circuit-research/differential-circuit-vulnerability) |
| 领域 | cs.LG, cs.AI, cs.CL |

## 核心贡献

1. **将 RL vs SFT 的行为差异追溯到机制层面**：之前研究仅观察到 RL 保留先前能力更强，本文揭示其内部计算电路层面的原因
2. **差分电路脆弱性 (Differential Circuit Vulnerability)**：提出一种头级别度量，量化电路在微调过程中的退化程度
3. **关键发现**：SFT 更快适应目标任务但产生更大的电路破坏和先前能力遗忘；RL 以更慢的任务适应为代价保留更大比例的基础电路

## 核心机制分析

- **实验模型**：Qwen2.5-3B-Instruct，用于科学问答
- **度量**：差分电路脆弱性——测量每个头在微调后电路退化程度

```math
\text{SFT} \rightarrow \text{更快任务适应} + \text{更大电路破坏} + \text{灾难性遗忘}
\text{RL} \rightarrow \text{更慢任务适应} + \text{更好电路保留} + \text{抗遗忘}
```

## 实验结果

RL 的电路保留优势可解释为何 RL 更鲁棒于灾难性遗忘。

## 标签
#fine-tuning #RLHF #SFT #catastrophic-forgetting #circuit-analysis