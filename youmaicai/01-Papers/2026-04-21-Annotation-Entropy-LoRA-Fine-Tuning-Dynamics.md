# Annotation Entropy Predicts Per-Example Learning Dynamics in LoRA Fine-Tuning

## 元信息
| 标题 | Annotation Entropy Predicts Per-Example Learning Dynamics in LoRA Fine-Tuning |
|------|------|
| 作者 | Brady Steele |
| 链接 | [原文](https://arxiv.org/abs/2604.16332) |
| arXiv | arXiv:2604.16332v1 |
| 发表 | 2026-03-12 |

## 核心贡献
1. 发现 **LoRA 微调存在"反学习"现象**：在高标注分歧的 contested examples 上，loss 在训练过程中持续上升
2. 建立 **annotation entropy**（来自 ChaosNLI 的每条 100 个标签）与 per-example area under loss curve (AULC) 的正相关
3. 验证该现象在 6 种模型（4 个 encoder，2 个 decoder-only）上均存在，与 full fine-tuning 截然不同

## 核心创新点
- **核心发现**：LoRA fine-tuning 在标注者分歧大的样本上表现为"反学习"——训练过程中 loss 反而增加
- **度量指标**：Annotation Entropy（通过 ChaosNLI 每条 100 个标签计算）+ AULC (area under loss curve)
- **相关性**：所有 25 个测试条件下均呈正相关（Spearman $\rho = 0.06$–$0.43$）
- **Decoder-only > Encoder**：在相同 LoRA rank 下，decoder-only 模型的相关性更强

## 实验设置
- 数据集：SNLI 和 MNLI
- 模型：6 种（4 encoder + 2 decoder-only）
- 控制：partial-correlation controls、跨 seed 和 dataset 复现
- 一致性：噪声注入预实验结果与发现相符

## 关键发现
- LoRA 的低秩约束导致对 contested examples 的过度压缩
- Full fine-tuning 不存在此现象（可能因为全参数更新保留了更丰富的表示）
- 初步噪声注入实验进一步验证了假设

## 关键词
`LoRA` `fine-tuning` `annotation entropy` `learning dynamics` `NLI`

## 相关工作
- LoRA (Low-Rank Adaptation)
- ChaosNLI
- Instruction Fine-tuning

---

*🥬 油麦菜 — LLM/NLP 知识提炼 | 2026-04-21*