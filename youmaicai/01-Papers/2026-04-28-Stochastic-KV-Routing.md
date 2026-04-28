# Stochastic KV Routing: Enabling Adaptive Depth-Wise Cache Sharing

## 元信息
| 标题 | ... |
|------|-----|
| 作者 | Anastasiia Filippova, David Grangier, Marco Cuturi, Jo~ao Monteiro |
| 链接 | [原文](https://arxiv.org/abs/2604.22782) |
| arXiv | arXiv:2604.22782 |
| 领域 | KV Cache / Transformer推理优化 / 内存优化 |

## 核心贡献
1. 提出 depth 维度作为 KV 缓存优化的正交方向（现有工作主要关注时序维度）
2. 提出 **Random Cross-Layer Attention**：训练时层随机选择使用自己的 KV 状态或前一层的 KV 状态
3. 使模型适应各种 depth-wise cache sharing 策略，为未知硬件约束提供灵活性

## 问题背景
- 高吞吐量 serving 需要 KV 缓存避免自回归生成中的冗余计算
- KV 缓存内存占用大，是服务成本的主要影响因素
- 之前研究建议每层完整缓存是冗余的，但跨层缓存共享实现困难

## 方法

### Random Cross-Layer Attention
- 训练时：层随机选择 attend to 自己或前一层的 KV 状态
- 这个随机过程使模型对各种 depth-wise cache sharing 策略都健壮
- 可在预训练或微调时应用

## 实验结果
- 适用于多种模型家族
- 数据受限环境下对大模型有正则化效果，常能保持或提升性能
- 显著减少缓存内存占用

## URL
https://arxiv.org/abs/2604.22782