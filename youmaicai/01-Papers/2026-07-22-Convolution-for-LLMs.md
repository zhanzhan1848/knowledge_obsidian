---
type: paper
created: 2026-07-22
updated: 2026-07-22
tags: [llm, transformer, convolution, attention, inductive-bias]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2607.18413
---

# Convolution for Large Language Models

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Convolution for Large Language Models |
| **作者** | Yuchuan Tian, Yingte Shu, Wei He, Shuo Zhang, Tianchen Zhao, Chao Xu, Xinghao Chen, Yunhe Wang, Hanting Chen, Yu Wang |
| **发表** | arXiv cs.CL (2026) |
| **链接** | [原文](https://arxiv.org/abs/2607.18413) |
| **DOI** | 10.48550/arXiv.2607.18413 |
| **代码** | - |

---

## 核心贡献

> 研究轻量级 depthwise 卷积为 Transformer 提供局部归纳偏置，在 Qwen3 模型上验证，增加不到 0.01% 参数即可提升 7 个下游基准的平均准确率。

1. **Macro-level 消融**：比较 17 个位置的卷积插入，发现最优位置是 **QKV 投影后、attention 之前**
2. **Micro-level 偏好**：residual depthwise convolution，kernel size **k=3**，无需额外 normalization 或 activation
3. **参数开销极小**：仅增加不到 **0.01%** 参数
4. **表示级分析**：卷积使重复 token ID 对其直接上下文更敏感

---

## 技术方案

### 核心思想

Transformer 的 self-attention 提供全局 token 交互，但不显式编码自然语言的局部性。Depthwise convolution 可补充局部归纳偏置，且参数开销极小。

### 关键发现

- **最优插入位置**：QKV 投影后、attention 前
- **最优配置**：Residual depthwise conv, k=3, 无额外 norm/activation
- **效果**：7 个下游基准平均准确率提升

---

## 实验结论

- **数据集**: 7 个下游基准
- **模型**: Qwen3（多个规模）
- **结果**: 平均准确率提升，参数增加 <0.01%

---

## 局限性

- 主要在 Qwen3 验证，泛化性待验证
- 提升幅度相对较小
- 对长文本任务的效果待验证

---

## 实现建议

- **实现难度**: 低（标准 depthwise conv 插入）
- **预期性能**: 轻微提升，尤其对短程依赖任务
- **适用场景**: 对推理效率敏感的部署
