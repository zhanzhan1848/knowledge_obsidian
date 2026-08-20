---
title: "Scalable GPU Construction of 3D Voronoi and Power Diagrams"
authors: ["Bernardo Taveira", "Carl Lindström", "Maryam Fatemi", "Lars Hammarstrand", "Fredrik Kahl"]
date: 2026-07
tags: [几何, Voronoi, Power图, GPU, 计算几何, SIGGRAPH2026]
conference: "SIGGRAPH 2026"
cite: "SIGGRAPH 2026 #1711"
---

# Scalable GPU Construction of 3D Voronoi and Power Diagrams

## 核心方法

本文提出**可扩展的GPU框架**，用于快速构建3D Voronoi图和Power图。

### 核心创新点

1. **全GPU实现**: 不依赖CPU层次的构建步骤
2. **可扩展性**: 支持大规模点集
3. **Power图支持**: 同时支持加权Voronoi变体
4. **与现代GPU架构优化**: 针对RTX 5090等最新GPU优化

### 应用场景

- 散点渲染 (Splatter)
- 神经渲染中的单元划分
- 物理模拟中的空间分解
- 碰撞检测

## 算法概述

```
输入点集 P → GPU并行构建 → Voronoi/Power Diagram输出
```

### 技术要点

- **并行单元计算**: 每个GPU线程处理一个Voronoi单元
- **邻接关系推断**: 从Delaunay图推导邻接
- **内存优化**: 减少全局内存访问

## 开源实现

- libigl: `voronoi_diagram`, `delaunay_triangulation`
- CGAL: 3D Triangulations, Power Diagrams

## 几何相关性

✅ **高相关**: Voronoi图是计算几何核心算法
- 3D空间划分
- 邻接关系计算
- 几何数据结构

## 可行性分析

| 维度 | 评分 |
|------|------|
| 算法复杂度 | ⭐⭐⭐ 高 (GPU并行化) |
| 数值稳定性 | ⭐⭐⭐ 良好 |
| 实现难度 | ⭐⭐⭐ 高 |
| 可复现性 | ⭐⭐ 待验证 |

## 推荐结论

✅ **推荐关注**

Voronoi图构建是几何处理的基础算法，本文的GPU加速方案对实时应用很有价值。

## 相关笔记
[[2026-08-20-Differentiable-Voronoi-Ray-Tracing]]
[[2026-08-20-DAILY-SUMMARY]]

---
*来源: SIGGRAPH 2026 Technical Papers*
