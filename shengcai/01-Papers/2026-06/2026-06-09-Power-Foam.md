---
tags: [渲染, 可微渲染, 光线追踪, 光栅化, 2026-04]
date: 2026-06-09
status: 已读
---

# Power Foam: Unifying Real-Time Differentiable Ray Tracing and Rasterization

## 基本信息
| 标题 | Power Foam: Unifying Real-Time Differentiable Ray Tracing and Rasterization |
|------|------|
| 作者 | Shrisudhan Govindarajan 等 |
| 发表 | arXiv (cs.GR) |
| 年份 | 2026 (v1: April 27, 2026) |
| 链接 | [arXiv:2604.24994](https://arxiv.org/abs/2604.24994) |

## 核心贡献

1. **有界 Power Diagram**：将 Voronoi foam 泛化为有界 power diagrams，支持可控的单元格范围，无需训练时进行昂贵的 Delaunay 三角剖分

2. **定向表面公式**：显式建模内部和外部区域之间的界面，将几何与外观解耦

3. **可微纹理嵌入**：在表面嵌入可微纹理，实现外观的端到端优化

## 技术方案

### 问题
- 现有 foam 表示支持恒定时间的邻域遍历
- 但其无界单元格阻碍了高效的分块光栅化

### 解决方案
- **有界 Power Diagram**：用有界 power diagrams 替代无界 Voronoi cells
- **定向表面建模**：显式建模 interior/exterior 界面
- **几何外观解耦**：几何用 power diagram，外观用可微纹理

## 性能目标
- 保留最先进光线追踪效率
- 达到与当前 3DGS 相当的光栅化性能
- 实现统一实时可微渲染

## 创新性
⭐⭐⭐⭐⭐

## 实用性
⭐⭐⭐⭐⭐

## 实现难度
**中**

- 需要实现 power diagram 而非 voronoi
- 需处理有界单元格的光线追踪
- 可微渲染框架

## 推荐度
**✅ 推荐实现**

首次统一光线追踪和光栅化的可微 3D 表示，为实时可微渲染提供新路径。

## 标签
#可微渲染 #光线追踪 #光栅化 #统一渲染 #2026