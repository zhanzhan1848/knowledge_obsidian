# QuIDE: Mastering the Quantized Intelligence Trade-off via Active Optimization

## 元信息
| 标题 | QuIDE: Mastering the Quantized Intelligence Trade-off via Active Optimization |
|------|-------|
| 作者 | Xiantao Jiang |
| 链接 | [原文](https://arxiv.org/abs/2605.10959) |
| arXiv | arXiv:2605.10959 |
| 领域 | cs.LG, cs.AI |

## 核心贡献
1. 提出当前缺乏统一指标来评估量化神经网络效率
2. 提出 **QuIDE** 框架，核心是 **Intelligence Index**: I = (C × P) / log₂(T+1)
   - C: 压缩率, P: 精度/性能, T: 延迟
   - 将压缩-精度-延迟权衡折叠为单一 score

## 实验结果

### 六种设置
- SimpleCNN (MNIST, CIFAR)
- ResNet-18 (ImageNet-1K)
- **Llama-3-8B** ← 对 LLM 最相关

### 发现：任务依赖的 Pareto Knee
| 任务 | 最优量化位数 |
|------|------------|
| MNIST | 4-bit |
| 大型 LLM (Llama-3-8B) | 4-bit |
| 复杂 CNN (ResNet-18 on ImageNet) | 8-bit |

### 关键发现
- 4-bit PTQ 在复杂 CNN 任务上灾难性崩溃精度
- Accuracy-gated variant I' 正确标记了原始 I 会奖励的非可行配置

## 关键词
模型量化, 量化评估指标, 压缩-精度权衡, LLM 量化, PTQ