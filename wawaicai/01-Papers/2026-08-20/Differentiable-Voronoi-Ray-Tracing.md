---
title: "Differentiable Voronoi Ray Tracing Beyond Rasterization Speeds"
authors: ["Bernardo Taveira", "Carl Lindström", "Joakim Johnander", "Fredrik Kahl"]
date: 2026-08-19
tags: [几何, Voronoi, 光线追踪, 神经渲染, Novel-View-Synthesis]
cite: "arXiv:2608.17682"
---

# Differentiable Voronoi Ray Tracing Beyond Rasterization Speeds

## 核心方法

本文提出 **VoroTracing**，一个可微分的Voronoi光线追踪框架，用于新颖视角合成任务。

### 核心创新点

1. **Voronoi图光线遍历**: 替代BVH层次结构，通过邻接遍历穿过Voronoi单元
2. **紧凑八面体外观纹理**: 减少每条光线-单元交互的外观数据加载
3. **表面集中不透明度**: 促使不透明度集中在表面，实现早期终止
4. **固定预算表示**: 无需剪枝或致密化优化

### 技术细节

- **遍历长度优化**: 减少每条光线的遍历成本
- **内存局部性**: 优化GPU执行
- **八面体映射**: 在单元内允许空间细节
- **Mip-NeRF 360上达到623 FPS** (RTX 5090)

## 算法复杂度

- 时间: O(K) 其中K为遍历的单元数
- 空间: O(N) 其中N为Voronoi单元数量

## 开源实现

- **libigl**: Voronoi图构建相关函数
- **CGAL**: 3D Triangulations
- 代码: https://research.zenseact.com/publications/vorotracing

## 几何相关性

✅ **高相关**: Voronoi图是计算几何的核心结构
- 3D Voronoi图的GPU构建
- 单元邻接关系遍历
- 表面提取

## 可行性分析

| 维度 | 评分 |
|------|------|
| 算法复杂度 | ⭐⭐⭐ 中等 |
| 数值稳定性 | ⭐⭐⭐ 良好 |
| GPU实现难度 | ⭐⭐ 中等 |
| 可复现性 | ⭐⭐⭐ 高 |

## 推荐结论

✅ **推荐实现**

Voronoi图构建是几何处理的基础算法，本文提供了高效的GPU实现方案，值得深入研究。

## 相关笔记
[[2026-08-20-Scalable-GPU-Voronoi-Power-Diagrams]]
[[2026-08-20-DAILY-SUMMARY]]

---
*来源: arXiv cs.GR (2026-08-19)*
