# Scaling Inherently Interpretable Language Models

## 元信息
| 标题 | Scaling Inherently Interpretable Language Models |
|------|-----|
| 作者 | Guide Labs Team, Andreas Madsen, Aya Abdelsalam Ismail, Giang Nguyen, Isaac Plant, Muawiz Chaudhary, Nathaniel Monson, Saqib Azim, Zhichen Guo, Julius Adebayo |
| 链接 | [原文](https://arxiv.org/abs/2608.07594) |
| arXiv | arXiv:2608.07594 |

## 核心贡献

1. **挑战"可解释性是能力的税"这一前提**: 将可解释性作为训练流水线的约束，与语言建模目标联合优化
2. **可解释性随规模与能力同步提升**: 跨三个数量级计算量验证，自回归和扩散语言模型均成立
3. **Steerling-8B**: 因果注意力掩码的扩散语言模型，可对任意生成 token 进行归因

## Steerling-8B 核心能力

- 对任意生成 token 归因到: 相关输入 token、人类可理解概念、训练数据
- **闭环干预**: 通过概念或特征归因诊断输出 → 检索相似训练数据 → 无需重训练通过概念 steering 纠正行为

## 关键发现

- 模型表征随规模变得更加解耦 (disentangled)
- 表征与人类可理解概念的对齐随规模提升
- 可解释性可被设计进训练，且随规模改善

## 性能对比

Steerling-8B 与训练计算量 2-16x 更多的开源对等模型竞争，揭示了不同的 scaling 范式

## 相关领域
[[interpretability]] [[diffusion language model]] [[training]] [[concept steering]] [[XAI]] [[scaling]]

---
*🥬 LLM/NLP Paper | 2026-08-11*
