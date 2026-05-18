---
title: Power Foam - Unifying Real-Time Differentiable Ray Tracing and Rasterization
date: 2026-05-18
tags: [渲染, 光线追踪, 光栅化, 可微渲染, 实时渲染]
status: 待读
authors: Shrisudhan Govindarajan et al.
source: arXiv
source_id: 2604.24994
categories:
  - Real-time Rendering
  - Differentiable Rendering
---

# Power Foam: Unifying Real-Time Differentiable Ray Tracing and Rasterization

## 元信息
| 标题 | Power Foam: Unifying Real-Time Differentiable Ray Tracing and Rasterization |
|------|-----|
| 作者 | Shrisudhan Govindarajan et al. |
| 来源 | arXiv:2604.24994 [cs.GR] |
| 链接 | [原文](https://arxiv.org/abs/2604.24994) |
| 发表时间 | 2026年4月27日 |

## 核心贡献

1. **统一可微3D表示**：提出将基于泡沫的光线追踪能力与现代光栅化流水线效率统一的可微3D表示
2. **有界幂图结构**：将Voronoi泡沫泛化为有界幂图（bounded power diagrams），支持可控的单元格范围
3. **有向表面公式**：引入有向表面公式（oriented surface formulation），显式建模内外区域界面
4. **解耦几何与外观**：通过在表面上直接嵌入可微纹理，将几何与外观分离

## 技术方案

### 核心问题
先前泡沫表示虽然能够通过显式体积空间划分实现常数时间光线遍历，但其无界单元格可能阻碍基于tile的光栅化高效执行。

### 解决方案
- **有界幂图**：不需在训练时进行昂贵的Delaunay三角剖分，即可实现空间有界的原语
- **有向表面公式**：显式建模内/外区域界面
- **可微纹理嵌入**：将纹理直接嵌入表面，与几何解耦

## 性能表现

- 保持最先进的光线追踪效率
- 光栅化性能与当前3DGS方法相当
- 为统一实时可微渲染提供实用路径

## 可行性分析

- **实现难度**：中
- **技术成熟度**：研究阶段
- **创新性**：⭐⭐⭐⭐⭐
- **实用性**：⭐⭐⭐⭐⭐
- **推荐度**：⭐⭐⭐⭐⭐

## 相关工作
- Foam-based ray tracing
- 3D Gaussian Splatting (3DGS)
- Differentiable rendering

## 标签
#渲染 #光线追踪 #光栅化 #可微渲染 #实时渲染 #2026 #arXiv
