---
type: paper
created: 2026-07-22
updated: 2026-07-22
tags: [llm, compression, sparsity, pruning, routing]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2607.18280
---

# Beyond Single-Dimensional Compression: The Compound Sparsity Frontier of Large Language Models

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Beyond Single-Dimensional Compression: The Compound Sparsity Frontier of Large Language Models |
| **作者** | Chao Han, Haozhe Hu, Xiaoyu Shen |
| **发表** | arXiv cs.LG (2026) |
| **链接** | [原文](https://arxiv.org/abs/2607.18280) |
| **DOI** | 10.48550/arXiv.2607.18280 |
| **代码** | https://github.com/EIT-NLP/LLM-Pruning |

---

## 核心贡献

> 将静态参数剪枝（低秩近似 + 通道剪枝）与动态 token 级计算剪枝（router 跳过层）结合，提出复合稀疏压缩框架，在相同总稀疏度下优于单一机制压缩。

1. 提出 **Compound Sparsity Framework**：静态压缩（低秩近似 + 通道剪枝）+ 动态计算稀疏（per-token 动态层跳过）
2. 发现 **跨维度干扰**：参数剪枝与 token 跳skip 之间存在相互影响
3. 发现 **近平衡分配**（near-balanced allocation）是最优策略
4. 揭示 **跨维度稀疏边界**（cross-dimensional sparsity boundary）：两种机制组合的极限

---

## 技术方案

### 核心思想

传统 LLM 压缩只关注单一维度（参数剪枝或动态计算跳过），Compound Sparsity 同时控制：
- **参数稀疏度**：通过低秩近似和通道剪枝
- **Token 级计算稀疏度**：通过轻量级 router 动态跳过某些层

### 关键技术

| 技术 | 说明 |
|------|------|
| Low-rank Approximation | SVD 分解权重矩阵，减少参数量 |
| Channel Pruning | 按通道剪枝不重要神经元 |
| Dynamic Layer Skip Router | per-token 决定跳过哪些层，减少计算量 |
| Cross-dimensional Interference | 发现两种稀疏机制之间的相互干扰 |

---

## 实验结论

- **数据集**: 语言理解、建模基准测试（多个 Qwen3 模型）
- **结果**: 复合稀疏在相同总稀疏度下持续优于单一机制，延迟理解任务衰减点，保持更强建模性能

---

## 局限性

- 跨维度稀疏边界最终限制进一步压缩
- 需要预训练的 router 模块
- 主要在 Qwen3 上验证

---

## 实现建议

- **实现难度**: 中（需要 SVD 工具和 router 训练）
- **预期性能**: 高压缩比下保持性能
- **适用场景**: 边缘部署、延迟敏感场景
