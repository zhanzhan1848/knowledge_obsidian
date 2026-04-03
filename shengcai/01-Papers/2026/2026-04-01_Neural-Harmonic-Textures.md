---
title: Neural Harmonic Textures for High-Quality Primitive Based Neural Reconstruction
authors: Jorge Condor
date: 2026-04-01
source: arXiv cs.CV (cross-list cs.GR)
url: https://arxiv.org/abs/2604.01204
pdf: https://arxiv.org/pdf/2604.01204
tags: [rendering, 3DGS, neural-rendering, novel-view-synthesis, 2026]
status: unread
---

# Neural Harmonic Textures for High-Quality Primitive Based Neural Reconstruction

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Neural Harmonic Textures for High-Quality Primitive Based Neural Reconstruction |
| 作者 | Jorge Condor |
| 来源 | arXiv cs.CV (cross-list cs.GR) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.01204) |
| PDF | [下载](https://arxiv.org/pdf/2604.01204) |

## 核心贡献
1. 引入 Neural Harmonic Textures，将潜在特征向量锚定在每个基元周围的虚拟脚手架上
2. 应用周期性激活（periodic activations）将 alpha blending 转化为谐波分量加权和
3. 单次延迟解码（single deferred pass）减少计算成本

## 技术方案
3D Gaussian Splatting 等基元方法灵活、可扩展，但单个基元的表达能力有限，难以建模高频细节。

**核心方法：**
- 虚拟脚手架：在每个基元周围构建特征向量支撑
- 谐波插值：周期性激活 + Fourier 分析
- 延迟解码：小神经网络单次解码

**技术公式：**
```math
f(x) = \sum_k \text{periodic\_activation}(w_k \cdot \phi_k(x))
```

## 实验结论
- 在实时新颖视角合成中达到 SOTA
- 弥合基元重建与神经场重建的差距
- 可无缝集成到 3DGUT、Triangle Splatting、2DGS

## 可行性分析
- 实现难度：中（需实现傅里叶特征插值）
- 性能预期：实时渲染性能
- 适用场景：高保真新颖视角合成、语义重建

## 相关工作
- [[3D Gaussian Splatting]]
- [[Neural Radiance Fields]]
- [[Triangle Splatting]]

## 笔记
**关键词**: #3DGS #neural-rendering #harmonic-textures #novel-view-synthesis #Fourier
