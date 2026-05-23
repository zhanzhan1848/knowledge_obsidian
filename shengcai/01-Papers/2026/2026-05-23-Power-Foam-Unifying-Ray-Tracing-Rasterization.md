---
title: Power Foam: Unifying Real-Time Differentiable Ray Tracing and Rasterization
authors: Daniel Rebain, Dor Verbin, Kwang Moo Yi, Anish Prabhu, Andrea Tagliasacchi
date: 2026-04
source: arXiv
url: https://arxiv.org/abs/2604.24994
pdf: https://arxiv.org/pdf/2604.24994.pdf
tags: [rendering, differentiable-rendering, ray-tracing, rasterization, foam, 2026]
status: unread
---

# Power Foam: Unifying Real-Time Differentiable Ray Tracing and Rasterization

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Power Foam: Unifying Real-Time Differentiable Ray Tracing and Rasterization |
| 作者 | Daniel Rebain, Dor Verbin, Kwang Moo Yi, Anish Prabhu, Andrea Tagliasacchi |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.24994) |
| PDF | [下载](https://arxiv.org/pdf/2604.24994.pdf) |

## 核心贡献
1. **Bounded Power Diagrams**: 将 Voronoi foam 泛化为受限幂图，通过可控半径参数调节单元范围，避免昂贵 Delaunay 三角剖分
2. **Oriented Surface Formulation**: 有向点表示，显式建模内部/外部区域间的表面
3. **几何与外观解耦**: 可微分纹理直接嵌入表面，减少所需单元数量

## 技术方案

### 核心思想
- Radiant Foam 通过体积网格显式分割空间，消除重叠，将每基元光线遍历从 BVH 的对数复杂度降至常数时间
- 问题：foam 单元可能非常大或无界，干扰高效 tile-based 光栅化所需的空间局部性假设
- 解决：受限幂图 (restricted power diagram)，即加权 α-complex 的对偶结构

### 关键技术
```math
\text{Power distance}: \pi(x, s) = \|x - c\|^2 - r^2
```
其中 c 是站点中心，r 是可控半径。

### 优势
- 保持常数时间光线遍历
- 获得高效光栅化所需的空间局部性
- 避免训练时构建完整 Delaunay 三角剖分

## 实验结论
- 在光线追踪和光栅化两种渲染范式下均保持 SOTA 效率
- fisheye 图像与失真针孔渲染结果一致
- 高帧率输出，无 popping artifacts

## 局限性
- 需要精确控制半径参数
- 实现复杂度较高

## 可行性分析
- 实现难度：高 (需要理解 foam 渲染和幂图理论)
- 性能预期：光线追踪和光栅化均达 SOTA
- 适用场景：需要同时支持光线追踪和光栅化的统一渲染管线

## 相关工作
- [[Radiant Foam]]
- [[3D Gaussian Splatting]]
- [[Differentiable Rendering]]

## 笔记
**来源机构**: Simon Fraser University, UBC, Google DeepMind, University of Toronto
**应用领域**: 可微分渲染，统一渲染管线，实时图形