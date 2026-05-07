---
tags: [几何, 隐式曲面, Delaunay, 采样, 网格提取, SIGGRAPH2026]
date: 2026-05-07
source: arXiv cs.GR
---

# ADS: Random Sampling of Occupancy Functions using Adaptive Delaunay Scaffolding

## 核心方法

**Adaptive Delaunay Sampling (ADS)** — 一种同时产生**伪随机采样点**和**连通等值面网格**的新方法。

关键洞察：从初始粗 Delaunay 四面体化开始，重复细化**穿越边**（两端点位于曲面两侧的边），逐步将采样点推向曲面。每次细化使用 Delaunay 准则将新顶点纳入骨架。

## 算法流程

1. **初始粗骨架**：计算点的初始 Delaunay 四面体化
2. **穿越边细化**：找到穿越边（crossing edges），在表面附近添加新点
3. **Delaunay 准则**：将新顶点并入骨架，引入新穿越边
4. **输出**：
   - 细穿越边与OF表面的交点作为采样点
   - Marching Tetrahedra 连接这些采样点生成等值面网格

## 性能对比

- 相比传统 Ray-shooting：产生随机采样但无连通性
- 相比 Grid-based (Marching Cubes)：产生网格偏置的采样
- ADS：伪随机 + 连通等值面，函数评估数量**减少一个数量级**

## 几何相关性

- 隐式占用函数（Occupancy Functions）→ 规则几何表示
- Delaunay tetrahedralization → 自适应采样骨架
- Marching Tetrahedra → 网格提取
- 归一化采样 near 细特征和高曲率区域

## 推荐度

✅ **推荐实现** — SIGGRAPH 2026，函数评估效率提升一个数量级，对神经隐式表面处理很有价值

## 开源参考

- 相关库: CGAL (Delaunay refinement), libigl (marching tetrahedra)