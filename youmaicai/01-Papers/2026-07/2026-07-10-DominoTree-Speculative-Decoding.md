# DominoTree: Conditional Tree-Structured Drafting for Speculative Decoding

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Conditional Tree-Structured Drafting with Domino for Speculative Decoding |
| **arXiv** | arXiv:2607.08642 [cs.CL] |
| **链接** | https://arxiv.org/abs/2607.08642 |
| **GitHub** | https://github.com/slin-zhq/Domino-Tree |
| **日期** | 2026-07-10 |

## 核心贡献

1. 提出 **DominoTree**：结合 Domino（GRU-based 因果修正）+ DDTree（最佳优先树扩展）
2. 核心：用 Domino 的**条件非因子化修正**沿 root-to-node 路径评分 draft tree
3. 工程化：CUDA-graph builder，bit-identical to reference Python，实现高效 GPU 执行

## 背景：推测解码

- **Speculative Decoding**：draft 多个 token 并行验证，加速 LLM 推理
- **Block-diffusion drafters**（如 DFlash）：一次 draft 一个 block，但只建模 per-position marginals
- **Best-first tree methods**（如 DDTree）：从 marginals 扩展候选树

## 问题

Domino drafter 添加了 GRU-based 因果修正，使每个 draft token 的分布是 path-dependent 的——但 DDTree 的因子化形式无法表示这种依赖。

## 方法：DominoTree

```math
\text{Score}(node) = \prod_{i \in \text{path}(root, node)} P_{Domino}(token_i | context_i)
```

- 限制 per-node correction 为 candidate top-M，使计算可行
- 每个 root-to-node 路径的累积修正分数作为树的评分

### CUDA Graph Builder

- GPU-native 实现，与 reference Python bit-identical
- 每轮树构建开销小

## 实验结果

### Qwen3-4B

| Method | Speedup | Mean Accept Length |
|--------|---------|-------------------|
| Autoregressive | 1x | 1.0 |
| DFlash | ~4x | ~5 |
| DDTree | ~5x | ~7 |
| Domino | ~5.5x | ~8 |
| **DominoTree** | **6.6x** | **10.7** |

- T=0 时 9-10% overall 吞吐提升（vs Domino），最高 +22% on Alpaca

### Qwen3-8B

- T=0 时 throughput 比 DDTree 高 **+24%**
- Overall aggregate 持续领先 DFlash 和 Domino

## 关键发现

- 非因子化修正对推测解码有利（捕捉 path dependency）
- 在高温度下与 DDTree/CaDDTree 持平
- 低温（T=0）优势最大

## 相关工作

- [[2607.08399]] - Prompt Compression（LLM 推理效率优化）

---

*🥬 LLM 论文分析 | 来源: arXiv:2607.08642 | 2026-07-10*
