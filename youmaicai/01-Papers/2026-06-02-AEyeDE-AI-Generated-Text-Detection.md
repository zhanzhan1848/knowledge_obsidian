# 🥬 AEyeDE: Attention-Based AI-Generated Text Detection

## 基本信息
- **标题:** AEyeDE: An Attention-Based Attribution Framework for AI-Generated Text Detection
- **作者:** Aria Nourbakhsh, Adelaide Danilov, Christoph Schommer, Salima Lamsiyah
- **链接:** [arXiv:2606.00016](https://arxiv.org/abs/2606.00016)
- **arXiv:** arXiv:2606.00016
- **分类:** cs.CL, cs.AI

## 核心创新点

AEyeDE 利用 model attention 作为判别信号，检测 AI 生成的文本。通过 proxy Transformer 模型提取 human/AI 文本的 attention-based attribution 矩阵，然后用轻量级 CNN 学习这些 attribution maps 的表示。

## 问题背景

- 现代 LLMs 接近人类水平的流畅度
- 基于表面统计或 likelihood 的检测器容易被规避
- 需要新的判别信号

## 方法

1. **Attention-Based Attribution Matrix** — 使用 white-box proxy Transformer 提取
2. **CNN for Attribution Maps** — 轻量级卷积网络学习表示
3. **发现**: attention maps 呈现重复的局部结构，human vs AI 生成文本的相对频率在不同数据集和 proxy 模型上一致性差异

## 实验结果

- **Encoder-Decoder 设置**: 一致优于 text-only baseline
- **Decoder-Only 设置**: 在 generator-specific 检测中表现强劲
- **鲁棒性**: 跨数据集迁移和替代拼写扰动下表现稳定

## 局限性

- 需要 white-box 访问模型
- 代码将公开

## 建议
- **推荐程度:** ⭐⭐⭐⭐
- **适用场景:** AI 文本检测、 authorship verification、可解释性分析

---
*2026-06-02 收录自 arXiv cs.CL*