# Sparse Feature Attention: Scaling Attention via Feature Sparsity

## 元信息
| 标题 | Scaling Attention via Feature Sparsity |
|------|--------|
| 作者 | Yan Xie et al. |
| 链接 | [arXiv:2603.22300](https://arxiv.org/abs/2603.22300) |
| arXiv | arXiv:2603.22300 |
| 代码 | [GitHub](https://github.com/YannX1e/Sparse-Feature-Attention) |
| 会议 | ICLR 2026 |
| 发表日期 | 2026-03-17 |

## 核心贡献

1. **特征稀疏性新范式**: 提出 Sparse Feature Attention (SFA)，探索与序列轴稀疏性正交的特征稀疏性轴
2. **复杂度优化**: 将注意力复杂度从 Θ(n²d) 降低到 Θ(n²k²/d)，其中 k 是稀疏码维度
3. **FlashSFA 内核**: 扩展 FlashAttention 以直接操作稀疏重叠，无需物化稠密分数矩阵

## 模型架构

```math
\text{SFA: } \text{Attention}(Q, K, V) = \text{softmax}\left(\frac{(Q \cdot S_q) \cdot (K \cdot S_k)^T}{\sqrt{d}}\right) \cdot V
```

- Query 和 Key 表示为 k-稀疏码
- 保留高维表达能力的同时减少计算成本
- 特征级稀疏性作为序列级稀疏性的补充

## 训练方法

- 在 GPT-2 和 Qwen3 上进行预训练实验
- 与稠密基线对比

## 实验结果

| 指标 | 性能 |
|------|------|
| 速度提升 | 2.5x |
| FLOPs 减少 | ~50% |
| KV-cache 减少 | ~50% |
| 检索准确率 | 保持稠密基线水平 |

## 核心创新

- **正交优化轴**: 区别于传统的局部窗口、核近似或 token 级稀疏性
- **特征多样性保留**: 避免短嵌入基线导致的特征多样性崩塌
- **长上下文鲁棒性**: 在合成和下游基准测试中保持检索准确率

## 局限性

- 依赖稀疏码表示，可能对某些任务有特定要求
- 需要额外的稀疏编码步骤

## 建议

- **是否推荐使用**: ✅ 是
- **适用场景**: 
  - 需要超长上下文的 LLM 应用
  - 内存受限的推理场景
  - 大规模预训练优化
- **注意事项**: 已被 ICLR 2026 接收，具有学术背书

## 标签

#attention #sparse-attention #long-context #efficient-transformer #ICLR2026
