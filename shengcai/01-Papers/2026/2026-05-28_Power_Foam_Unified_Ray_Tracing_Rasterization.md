---
title: Power Foam: Unifying Real-Time Differentiable Ray Tracing and Rasterization
authors: Shrisudhan Govindarajan et al. (Simon Fraser University, UBC, Google DeepMind, U of Toronto)
date: 2026-04-27
source: arXiv (cs.GR)
url: https://arxiv.org/abs/2604.24994
pdf: https://arxiv.org/pdf/2604.24994
tags: [rendering, differentiable-rendering, ray-tracing, rasterization, foam]
status: unread
---

# Power Foam: Unifying Real-Time Differentiable Ray Tracing and Rasterization

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Power Foam: Unifying Real-Time Differentiable Ray Tracing and Rasterization |
| 作者 | Shrisudhan Govindarajan et al. |
| 来源 | arXiv (cs.GR) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.24994) |
| PDF | [下载](https://arxiv.org/pdf/2604.24994) |

## 核心贡献
1. **Bounded Power Diagrams**: 将 Radiant Foam 的 Voronoi 图推广到受限 power diagram（权值 α-complex 对偶），通过可控半径参数调节 cell 范围，避免无界区域，同时无需在训练时构建昂贵 Delaunay 三角剖分
2. **定向表面建模**: 引入有向点表示，将每个 cell 显式划分为内部和外部区域，直接建模表面
3. **几何/外观解耦**: 在有向点感生的表面上嵌入可微分纹理，将几何与外观分离，显著降低 cell 预算需求

## 技术方案
- 统一 foam-based ray tracing 的常数时间射线遍历与 rasterization 的高效 tile-based culling
- 核心洞察：bounded power diagram 生成球形有界图元，适合 tile-based culling，同时保持空间局部性
- 产生的表示在两种渲染范式下均能保持高帧率一致输出

## 公式
```math
\text{bounded power diagram: dual to weighted } \alpha\text{-complex}
```

## 实验结论
- 在 ray tracing 和 rasterization 两种范式下均达到 SOTA 质量/速度平衡
- 支持 fisheye 相机等极端扭曲视角的精确渲染
- 训练时无需 Delaunay 三角剖分

## 局限性
- 训练复杂度仍较高
- 对极大规模场景的可扩展性待验证

## 可行性分析
- 实现难度：中（算法复杂，但无需特殊硬件）
- 性能预期：统一两种渲染范式，各取所长
- 适用场景：可微分渲染、神经渲染、实时 3D 重建

## 相关工作
- [[Radiant Foam]] [[3DGS]] [[Differentiable Rendering]]

## 笔记
Google DeepMind 参与。可微分渲染+统一渲染范式的新思路，值得深入研究。