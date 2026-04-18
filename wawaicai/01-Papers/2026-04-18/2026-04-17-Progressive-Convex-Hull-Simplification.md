---
tags: [几何, 网格简化, 凸包, 算法]
date: 2026-04-15
source: arXiv cs.GR
paper_id: 2604.14468
authors: Alec Jacobson (Columbia University)
---

# Progressive Convex Hull Simplification

## 核心方法

本文研究将凸包简化为指定数量 half-spaces 的问题，同时最小化添加的体积或表面积。

**关键技术点**：
- 在对偶空间中提出高效 O(n log n) 贪心优化
- 比现有方法在效率、紧密性或安全性上更优
- 适用于碰撞检测、射线相交、距离计算等任务

## 算法复杂度
- **时间复杂度**：O(n log n)
- **空间复杂度**：O(n)

## 创新点
1. **对偶表示**：在 half-space 对偶空间中操作
2. **贪心优化**：高效找到近最优简化
3. **保守简化**：保证简化结果始终包围原始凸包

## 开源实现
- libigl: 可能需要自行实现
- 代码: 待发布

## 可行性分析
- **算法复杂度**：低 (O(n log n) 非常高效)
- **数值稳定性**：高
- **依赖项**：无特殊依赖
- **推荐度**：⭐⭐⭐⭐⭐ Alec Jacobson 团队作品，必读

## 相关笔记
[[2026-04-17-Geometric-Partitioning-BRep-CAD]]
