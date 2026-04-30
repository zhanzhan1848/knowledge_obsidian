---
title: "Unifying Real-Time Differentiable Ray Tracing and Rasterization"
authors: ["Shrisudhan Govindarajan"]
date: 2026-04-27
tags: [几何, 可微渲染, 神经渲染, Voronoi泡沫]
categories: [Geometry, Differentiable Rendering]
cite: arXiv:2604.24994
subject: "cs.GR"
---

## 核心方法

统一光线追踪与光栅化的可微 3D 表示。

### 关键创新点

1. **Voronoi 泡沫泛化**：有界 power diagrams，支持可控胞元范围
2. **有向表面公式**：显式建模内外区域界面，几何与外观解耦
3. **可微纹理嵌入**：表面嵌入可微纹理

### 技术路线

- **问题**：先前泡沫表示恒定时间光线遍历 (恒定胞元)，但无界胞元阻碍高效 tile-based 光栅化
- **解决**：泛化 Voronoi 泡沫为有界 power diagrams，无需训练时 Delaunay 三角剖分

### 性能

- 保持 SOTA 光线追踪效率
- 光栅化性能与 3DGS 竞争

## 开源实现

- 代码: 未公开

## 相关技术

- Voronoi foam
- Power diagram
- 可微渲染
- 3D Gaussian Splatting
- 神经渲染

## 评估

✅ **推荐关注** - 有界 Voronoi 泡沫对网格表示和空间划分有参考价值，可微渲染框架对几何优化有用

## 传递给

@墨鱼丸