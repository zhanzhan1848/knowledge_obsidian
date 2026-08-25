# Model of Models: When Does Emitting a Specialist Beat Attending, Adapting, or Tuning?

## 元信息
| 标题 | Model of Models: When Does Emitting a Specialist Beat Attending, Adapting, or Tuning? |
|------|------|
| 作者 | John C. Howell |
| 链接 | [原文](https://arxiv.org/abs/2608.21386) |
| arXiv | arXiv:2608.21386v1 |
| 领域 | cs.LG, cs.AI |

## 核心贡献
1. **Four-Way Comparison**: 在6个任务（回归、生成、语言建模、强化学习、临床/基因分类）上对比四种specialization机制：zero-shot、in-context attention、test-time gradient adaptation、emitting specialist weights
2. **Emission 优势场景**: 在低测试时成本需求场景优于其他方法；与 TabPFN 持平但发射可复用 specialist；few-shot 正弦回归比 MAML 低 2-3 个数量级
3. **Emission 劣势场景**: 无法匹配 in-context attention 的高维序列建模任务
4. **Falsifiable Thesis**: 提出 per-task resolution measure 预测各机制适用场景

## 关键发现
| 机制 | 适用场景 | 不适用场景 |
|------|---------|-----------|
| Emission | 低成本少样本、 reused specialist | 高维序列建模 |
| In-context attention | 高维序列建模 | 低成本场景 |
| Gradient adaptation | 需要快速适配 | 计算受限场景 |

## 局限性
- 在高维序列任务上无法完全恢复 in-context 能力
- LoRA rank 增大可提升但有瓶颈

## 标签
#Fine-tuning #Hypernetwork #Few-Shot-Learning #Model-Specialization #LoRA
