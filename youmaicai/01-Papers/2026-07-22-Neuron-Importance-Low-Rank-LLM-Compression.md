---
type: paper
created: 2026-07-22
updated: 2026-07-22
tags: [llm, compression, svd, low-rank, neuron-importance]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2607.18284
---

# Compressing What Matters: Neuron Importance Meets Data-Aware Low Rank Approximation for Language Model Compression

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Compressing What Matters: Neuron Importance Meets Data-Aware Low Rank Approximation for Language Model Compression |
| **作者** | Athanasios Ntovas, Alexandros Doumanoglou, Petros Drakoulis, Dimitris Zarpalas |
| **发表** | IEEE Access (2026) |
| **链接** | [原文](https://arxiv.org/abs/2607.18284) |
| **DOI** | 10.1109/ACCESS.2026.3653132 |
| **代码** | - |

---

## 核心贡献

> 将神经元重要性视角与每层功能等价视角结合于单一目标，提出数据感知的动态压缩率分配算法，在高压缩比下显著优于 SOTA。

1. **结合两种低秩近似视角**：参数重要性 + 每层功能等价，单一目标联合优化
2. **动态压缩率分配**：非均匀分配压缩率，计算高效（优于启发式搜索）
3. 高压缩比下性能显著优于 SOTA

---

## 技术方案

### 核心思想

传统 SVD 低秩近似关注参数重要性或层功能等价性其一，本文将两者结合，并通过动态压缩率分配优化各层压缩比。

### 关键技术

| 技术 | 说明 |
|------|------|
| Neuron Importance + Functional Equivalence | 联合目标函数，同时考虑参数重要性和层功能 |
| Dynamic Compression Rate Allocation | 数据驱动动态分配各层压缩率 |
| SVD-based Matrix Decomposition | 基础压缩手段 |

---

## 实验结论

- **发表**: IEEE Access 2026
- **结果**: 高压缩比下显著优于 SOTA

---

## 局限性

- 主要针对语言模型压缩
- 动态分配算法复杂度待评估

---

## 实现建议

- **实现难度**: 中（SVD + 重要性评估）
- **预期性能**: 高压缩比下保持性能
- **适用场景**: 模型部署压缩
