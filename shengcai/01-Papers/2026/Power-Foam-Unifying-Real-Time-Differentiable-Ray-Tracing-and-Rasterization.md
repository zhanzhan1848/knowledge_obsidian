---
title: Power Foam: Unifying Real-Time Differentiable Ray Tracing and Rasterization
authors: Shrisudhan Govindarajan, Daniel Rebain, Dor Verbin, Kwang Moo Yi, Anish Prabhu, Andrea Tagliasacchi
date: 2026-04-27
source: arXiv cs.GR
url: https://arxiv.org/abs/2604.24994
pdf: https://arxiv.org/pdf/2604.24994
tags: [rendering, ray-tracing, rasterization, differentiable-rendering, 3DGS, foam, paper, 2026]
status: unread
---

# Power Foam: Unifying Real-Time Differentiable Ray Tracing and Rasterization

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Power Foam: Unifying Real-Time Differentiable Ray Tracing and Rasterization |
| 作者 | Shrisudhan Govindarajan, Daniel Rebain, Dor Verbin, Kwang Moo Yi, Anish Prabhu, Andrea Tagliasacchi |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.24994) |
| PDF | [下载](https://arxiv.org/pdf/2604.24994) |

## 核心贡献
1. **有界幂图 (Bounded Power Diagrams)**：将 Voronoi foam 推广为有界幂图，通过为每个 site 添加可控半径参数，使单元具有空间界限，支持高效的 tile-based 光栅化
2. **有向表面建模 (Oriented Surface Formulation)**：引入有向点表示，将每个单元显式划分为内部和外部区域
3. **几何/外观解耦**：将可微分纹理直接嵌入表面，将几何与外观分离

## 技术方案

### 背景：Radiant Foam
Radiant Foam 使用 Voronoi 图建模 3D 场景，单元定义为：
```math
\mathbf{V}_i = \{\mathbf{x} \in \mathbb{R}^3 : \underset{j}{\operatorname{arg\,min}}\|\mathbf{x} - \mathbf{p}_j\| = i\}
```
优点：相邻单元共享面，支持常数时间 ray walking；缺点：单元可能无界，妨碍高效光栅化

### 核心方法：有界幂图
将 Voronoi 图推广为有界幂图（bounded power diagram），每个单元由 site $\mathbf{p}_i$ 和半径 $r_i$ 参数化：
```math
\mathbf{P}_i = \{\mathbf{x} \in \mathbb{R}^3 : \underset{j}{\operatorname{arg\,min}}\|\mathbf{x} - \mathbf{p}_j\|^2 - r_j^2 = i\}
```
半径影响：(1) 单元间 face 位置（由 radical plane 决定）；(2) 球形边界的定义

### 关键优势
- 球形边界 → 可直接用于 tile-based 光栅化的剪裁
- radical plane 保证非重叠单元间不会产生非局部 face
- 保持 Radiant Foam 的常数时间 ray traversal

### 有向表面建模
为每个单元引入法向量，将表面显式建模为内外区域界面，而非隐式地从密度梯度产生

### 几何/外观解耦
将可微分纹理直接嵌入表面，避免为了表示纹理区域而增加单元数量

## 实验结论
- 保持 Radiant Foam 的常数时间 ray tracing 效率
- 光栅化性能与当前 3DGS 相当
- 支持 fisheye 等复杂投影，与 pinhole render 结果一致

## 局限性
- 依赖于 Delaunay triangulation 的维护
- 训练时仍需避免昂贵的完整 Delaunay 三角剖分

## 可行性分析
- **实现难度**：中
  - 需实现幂图构建和有界单元的 BVH 构建
  - 光栅化部分可参考 3DGS 管线
- **性能预期**：与 Radiant Foam 类似的高效 ray tracing，光栅化接近 3DGS
- **适用场景**：需要同时支持 ray tracing（反射/折射）和光栅化（高速渲染）的实时应用

## 相关工作
- [[Radiant Foam 2025]]
- [[3D Gaussian Splatting 2023]]
- [[3DGUT unified representation]]

## 笔记
本文由 Google DeepMind、Simon Fraser University、UBC、University of Toronto 联合完成。
提供了统一实时可微分渲染的可能性，同时利用 ray tracing 的灵活性和光栅化的高效率。
