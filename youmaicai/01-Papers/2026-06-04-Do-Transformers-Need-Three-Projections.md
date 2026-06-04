# Do Transformers Need Three Projections? Systematic Study of QKV Variants

## 元信息
| 标题 | Do Transformers Need Three Projections? Systematic Study of QKV Variants |
|------|------|
| 作者 | Ali Kayyam, Anusha Madan Gopal, M Anthony Lewis |
| 链接 | [原文](https://arxiv.org/abs/2606.04032) |
| arXiv | arXiv:2606.04032 |
| 代码 | [GitHub](https://github.com/anushamadan02/Do-Transformers-Need-3-Projections) |
| 领域 | cs.LG, cs.AI, cs.CL |
| 发表 | 2026-06-01 |
| 会议 | ICML 2026 |

## 核心贡献
1. 系统评估三种 projection sharing 约束：Q-K=V、Q=K-V、Q=K=V
2. 发现这些变体在性能和标准 Transformer 相当甚至更好
3. **Q-K=V projection sharing 可实现 50% KV cache  reduction，仅有 3.1% perplexity 下降**
4. 结合 GQA/MQA 使用：Q-K=V + GQA-4 → 87.5% cache reduction；Q-K=V + MQA → 96.9% cache reduction
5. 揭示了 projection sharing 作为 attention 中 weight tying 的未被充分探索的方向

## 方法

### 三种变体
| 变体 | 描述 | 问题 |
|------|------|------|
| Q-K=V | Key-Value 共享 projection | 性能最佳 |
| Q=K-V | Query-Key 共享 projection | 破坏 attention 方向性 |
| Q=K=V | 三者全共享（单 projection） | 需要 2D positional encoding 恢复不对称性 |

### 核心洞察
- Q-K=V 保持质量的原因：keys 和 values 可以占据相似的表示空间，且 attention 在低秩 regime 运行
- Q=K=V（单 projection）需要非对称 attention，通过 2D positional encoding 实现

## 实验
- Synthetic tasks, vision (MNIST, CIFAR, TinyImageNet, anomaly)
- Language modeling: 300M 和 1.2B 参数模型，10B tokens
- ICML 2026 接收

## 相关标签
#transformer #attention #inference-optimization #KV-cache #edge-deployment #ICML2026