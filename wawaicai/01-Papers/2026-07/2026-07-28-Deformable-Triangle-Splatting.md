---
type: paper
created: 2026-07-28
updated: 2026-07-28
tags: [geometry, triangle-splatting, radiance-field, deformable-mesh, rendering]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2607.22446
---

# Deformable Triangle Splatting: Flexible Primitives for Real-Time Radiance Field Rendering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Deformable Triangle Splatting: Flexible Primitives for Real-Time Radiance Field Rendering |
| **作者** | - |
| **发表** | arXiv cs.GR, 2026-07-24 |
| **链接** | [原文](https://arxiv.org/abs/2607.22446) |
| **DOI** | 10.48550/arXiv.2607.22446 |

---

## 核心贡献

> 通过可变形三角形扩展 2D 辐射场基元，支持非凸形状表示

1. 每条边增加 K 个控制点，通过标量位移变形边界
2. 保持三角形的三个基顶点定义 3D 平面
3. 支持非凸几何的同时保留高效光栅化

---

## 技术方案

### 核心思想

现有 2D 基元方法（Gaussian disks, triangles）依赖凸边界，导致弯曲/凹形结构需要过多基元。本文通过边缘控制点位移实现非凸表示。

### 关键技术

| 技术 | 说明 |
|------|------|
| 可变形三角形 | 每边 K 个可学习标量位移 |
| 非凸表示 | 保留凸包基础上的边界变形 |
| 高效光栅化 | 保持三角形光栅化效率 |

---

## 相关工作

- [[3D Gaussian Splatting]]
- [[Triangle Splatting]]
- [[Radiance Field]]
- [[Mesh Representation]]

---

## 实现建议

- **实现难度**: 中
- **适用场景**: 辐射场渲染、实时视图合成
