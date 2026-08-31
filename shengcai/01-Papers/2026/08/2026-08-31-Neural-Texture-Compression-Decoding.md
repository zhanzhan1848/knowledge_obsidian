---
title: Thread-Efficient Decoding for Neural Texture Compression
authors: (see paper)
date: 2026-08-28
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.27888
pdf: https://arxiv.org/pdf/2608.27888
tags: [rendering, paper, 2026, texture compression, neural, GPU, rendering, NTC]
status: unread
---

# Thread-Efficient Decoding for Neural Texture Compression

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Thread-Efficient Decoding for Neural Texture Compression |
| 作者 | (见论文) |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.27888) |
| PDF | [下载](https://arxiv.org/pdf/2608.27888) |

## 核心贡献
1. **共享解码器 MLP 架构**：多个纹理共享一个解码器 MLP，减少 GPU 线程分歧（thread divergence）25%-52%
2. **渐进式解码器冻结训练策略（gradual decoder freezing）**：提升训练稳定性和重建精度
3. **语义聚类策略（CLIP embeddings）**：将相似纹理分组以有效共享解码器
4. **性能验证**：在 500+ 纹理和多个真实渲染场景上评估，Radeon RX 9070 XT 上实现最高 8.48x 加速

## 技术方案
**问题背景：**
神经纹理压缩（NTC）相比 BCn 格式压缩率更高，但存在严重 GPU 线程分歧问题，导致实际运行性能下降。

**解决方案：**
1. **共享解码器架构**：将多个相似纹理映射到同一个解码器 MLP，减少分歧
2. **渐进式冻结**：训练初期解冻所有参数，后期逐步冻结解码器，稳定训练
3. **CLIP 语义聚类**：使用 CLIP embeddings 对纹理进行语义分组，确保共享解码器的纹理具有相似特征

**性能结果：**
- 线程分歧减少 25%-52%
- Radeon RX 9070 XT 上最高 8.48x 加速（相比非共享基线）

## 实验结论
共享解码器 + 语义聚类 + 渐进冻结训练的组合策略有效解决了 NTC 的线程分歧问题，压缩率和速度兼得。

## 局限性
- 共享解码器可能导致相似纹理间的干扰
- 对 CLIP 聚类质量有依赖

## 可行性分析
- 实现难度：中（主要是训练策略和架构设计）
- 性能预期：实际渲染场景中 8x+ 加速，效果显著
- 适用场景：游戏纹理流送、移动端渲染、VR/AR 纹理系统

## 相关工作
- 神经纹理压缩（NTC）
- BCn 纹理格式
- GPU 线程分歧优化
- CLIP embeddings

## 笔记
对实时渲染的纹理压缩有直接实用价值，8.48x 加速非常可观。
