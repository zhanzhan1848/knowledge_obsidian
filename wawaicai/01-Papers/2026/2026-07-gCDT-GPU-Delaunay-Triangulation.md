---
tags: [几何, Delaunay, GPU, 并行算法, SIGGRAPH2026]
date: 2026-07
venue: SIGGRAPH 2026
---

# gCDT: A Highly Parallel GPU Algorithm for Large-Scale Constrained Delaunay Triangulation

## 论文信息

- **DOI**: https://doi.org/10.1145/3799902.3811042
- **作者**: Peng Fan, Min Tang, Ruofeng Tong (Zhejiang University)
- **venue**: SIGGRAPH 2026 (SIG)
- **代码**: https://github.com/yingtix/gCDT/
- **项目页**: https://min-tang.github.io/gCDT/

## 核心问题

约束 Delaunay 三角剖分（Constrained Delaunay Triangulation, CDT）在网格生成、地理信息系统、计算几何等领域有广泛应用。现有的 CPU 算法难以扩展到大规摸场景。

## 核心方法

### GPU 并行 CDT 算法

1. **空间划分**: 使用 GPU 友好的空间划分策略
2. **并行点定位**: 利用 GPU 大规模并行能力快速定位点
3. **三角剖分构建**: 并行构建初始三角剖分
4. **约束边处理**: 保持约束边的约束性
5. **局部细化**: 并行进行局部细化操作

### 性能

- **规模**: 可处理数百万到数千万点的 CDT
- **加速比**: 相比 CPU 实现达到 100x+ 加速

## 开源实现

- https://github.com/yingtix/gCDT/

## 推荐度

✅ **强烈推荐** - GPU 几何算法的优秀工作，开源实现价值高

## 相关论文

- [[Scalable GPU Construction of 3D Voronoi and Power Diagrams]]
- [[GPU-accelerated Certified Hausdorff Distance Between Triangle Meshes]]

## 相关笔记

[[2026-08-11-DAILY-SUMMARY]]
