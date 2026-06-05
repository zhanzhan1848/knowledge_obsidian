# You Only Index Once: Cross-Layer Sparse Attention with Shared Routing

## 基本信息
| 标题 | 值 |
|------|-----|
| 链接 | [原文](https://arxiv.org/abs/2606.06467) |
| arXiv | arXiv:2606.06467 |
| 代码 | - |
| 领域 | Transformer 架构优化 / Attention 机制 |

## 核心贡献

1. **Cross-Layer Sparse Attention (CLSA)**: 在 YOCO 等 KV-sharing 架构上，共享 KV cache 和路由索引。单索引器计算一次 top-k token 选择，结果跨所有 cross-decoder 层复用。

2. **效率突破**: 在 128K 上下文下实现 **7.6× decoding speedup** 和 **17.1× 整体 throughput 提升**，同时保持近乎无损的模型质量。

3. **解决 token sparse attention 的核心痛点**: 传统 token sparse 方法需要对完整 cache 做 top-k 路由，在多 layer 解码时重复计算开销大。CLSA 通过跨层共享索引将路由开销摊销。

## 模型架构

基于 YOCO 的 cross-attention 架构：
- **Self-decoder**: 首先编码输入序列，构建共享 KV cache
- **Cross-decoder**: 多层 cross-attention，读同一份 KV cache
- **Query-aware indexer**: 一次计算 token-level top-k 路由索引，跨所有 cross-decoder 层共享

关键设计原则：当多个 decoder 层从同一份 memory 读取时，路由决策也应绑定到该 memory 并跨层共享。

## 实验结果

| 指标 | 结果 |
|------|------|
| Decoding speedup (128K) | 7.6× |
| Overall throughput (128K) | 17.1× |
| 质量 | 与 dense baseline 近乎无损 |

## 核心公式

单索引器生成的 token-level top-k 路由索引：
- 一次计算，跨层复用
- 保留 token-sparse attention 的细粒度选择性

## 局限性

- 依赖 KV-sharing 架构（如 YOCO）
- 共享路由索引对 attention 行为影响需进一步验证

## 相关工作

- YOCO (KV-sharing cross-attention)
- 传统 block-sparse attention（加速高但质量损失大）
- 传统 token-sparse attention（质量高但路由开销大）

## 关键词
`attention mechanism` `transformer` `sparse attention` `KV cache` `long-context inference` `LLM`
