# U-OPSD: Unsupervised On-Policy Self-Distillation

## 元信息
| 标题 | On-Policy Self-Distillation without Any Supervision |
|------|-------|
| 作者 | Bingyang Wang et al. |
| 链接 | [原文](https://arxiv.org/abs/2608.06296) |
| arXiv | arXiv:2608.06296 |
| 领域 | cs.LG |

## 核心贡献
1. 提出 **U-OPSD**：首个完全无监督的 on-policy 自我蒸馏方法，仅使用模型自身生成
2. 利用 **内部一致性（internal consistency）** 而非外部监督信号
3. 核心观察：模型会对自身「自信地错误」的地方产生不一致的多个 rollout

## 方法
1. 采样多个 rollouts，通过多数投票构造伪解决方案（在自洽阈值下）
2. 将 teacher 分布条件设定为最短伪解决方案
3. 将其蒸馏到最长错误完成的 prefix 上——使模型精确修正「自信地错误」的区域

## 实验结果
- 多个基准、模型、训练设置一致超越基线，持平或超越有监督方法（OPSD、GRPO）
- AIME24/AIME25/HMMT25/MATH500/AMC23：Qwen3 非思考模式 4B/8B 分别提升 8.5% 和 10.7%
- 超越 OPSD 平均 3.2% (4B) 和 2.3% (8B)

## 关键洞察
真正 self-distillation 可通过「内部一致性」实现，无需外部 ground truth 或更大模型引导
