# SARDI: Self-Augmenting Retrieval for Diffusion Language Models

## 基本信息
| 标题 | 值 |
|------|-----|
| 链接 | [原文](https://arxiv.org/abs/2606.06474) |
| arXiv | arXiv:2606.06474 |
| 会议 | ICML 2026 |
| 领域 | RAG / Diffusion Language Model / 检索增强 |

## 核心贡献

1. **SARDI 框架**: 利用离散扩散语言模型 denoising 过程中被丢弃的 low-confidence tokens 作为 lookahead signal 引导检索。

2. **核心发现**: 即使低置信度 token 也能在去噪轨迹早期暴露出显著实体，从而在输出最终化之前检索更强证据。

3. **训练无关**: 无需训练，适用于任何支持推理的离散扩散 LM，且 retriever-agnostic。

4. **效率**: 在 5 个 multi-hop QA benchmarks 上，throughput 比当前最优训练无关扩散和自回归检索基线高 **8×**。

## 核心思想

离散扩散 LM 生成文本时：
- 每步对所有 masked 位置预测 token
- 自信预测 commit 到输出，不自信的丢弃
- **SARDI 发现**：丢弃的 token 实际是有价值的 lookahead signal

## 方法

```math
\text{SARDI} = \text{Dynamic RAG} \xrightarrow{\text{lookahead tokens}} \text{retrieval during denoising}
```

- 训练无关
- Retriever-agnostic
- 适用于任何 reasoning-capable 离散扩散 LM

## 评估

- 5 个 multi-hop QA benchmarks
- 8× higher throughput than 训练无关扩散和自回归检索基线

## 关键词
`RAG` `diffusion language model` `retrieval` `multi-hop QA` `reasoning`
