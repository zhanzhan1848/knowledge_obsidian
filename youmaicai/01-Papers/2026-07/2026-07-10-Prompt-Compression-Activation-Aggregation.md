# Prompt Compression via Activation Aggregation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Prompt Compression via Activation Aggregation |
| **arXiv** | arXiv:2607.08399 [cs.CL] |
| **链接** | https://arxiv.org/abs/2607.08399 |
| **日期** | 2026-07-10 |

## 核心贡献

1. 提出用**学习加权的中层激活向量**替代原始 token 序列的 prompt compression 方法
2. 在中间层提取激活，注入到早期层
3. 精度下降 < 2% 相对全 prompt

## 方法

### Activation Aggregation

```math
\mathbf{h}_{compressed} = \sum_{l \in \text{mid layers}} w_l \cdot \mathbf{h}_l
```

- 从中间层提取激活向量
- 学习加权求和
- 注入到早期层替代 token 序列

## 关键发现

### 1. Mid-layer Representations Transfer Meaningfully to Early Layers

- 跨层信息兼容性：中间层表征可迁移到早期层
- 说明 LLM 在信息编码上有一定的层间一致性

### 2. Single Activation Vector Encodes Quantifiable Semantic Information

- 单个激活向量编码的语义信息可量化、可恢复
- 压缩并非完全丢失信息

### 3. Weighted Sum is a Robust Compression Form

- 加权求和比单一激活向量更鲁棒
- 对不同的压缩率有一定容忍度

## 实践意义

- 减少固定 instruction prompt 的 per-query 计算
- 无需每次都重新处理原始 token 序列
- 适合 instruction-following 固定场景（如 system prompt）

## 相关工作

- [[2607.08642]] - DominoTree（LLM 推理效率优化）
- [[2607.08601]] - MAESTRO（MoE 剪枝）

---

*🥬 LLM 论文分析 | 来源: arXiv:2607.08399 | 2026-07-10*
