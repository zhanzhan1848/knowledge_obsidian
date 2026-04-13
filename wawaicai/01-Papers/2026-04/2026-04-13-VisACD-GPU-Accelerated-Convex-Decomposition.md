---
tags: [几何, 网格处理, 凸分解, GPU加速]
date: 2026-04-13
source: arXiv cs.GR
arXiv_id: 2604.04244
---

# VisACD: Visibility-Based GPU-Accelerated Approximate Convex Decomposition

## 核心方法

近似凸分解（ACD）用于碰撞检测中的几何精度与性能权衡。VisACD 是基于可见性的、旋转等变的、无交叉的 ACD 算法，具有 GPU 加速：

1. **可见性分析** - 利用可见性信息引导凸分解
2. **旋转等变性** - 对输入网格方向不敏感
3. **GPU 加速** - 并行化处理提高效率
4. **无交叉保证** - 保证分解结果无几何交叉

## 创新点

- 可见性驱动的分解策略
- 旋转等变设计 - 减少对模型朝向的敏感性
- 更少的凸部件数量 - 提高效率
- GPU 并行化

## 算法复杂度

- GPU 加速，时间效率优于 prior work
- 空间复杂度取决于输入网格复杂度

## 开源参考

- Subjects: Graphics (cs.GR); Computational Geometry (cs.CG)

## 相关笔记

[[2026-04-13-MeshOn-Intersection-Free-Mesh-Composition]]

## 可行性分析

✅ 推荐实现

**技术概述**: 基于可见性的 GPU 加速近似凸分解，用于碰撞检测

**实现难度**:
- 算法复杂度：中
- 数值稳定性：旋转等变设计提高鲁棒性
- 依赖项：GPU 并行计算库

**推荐结论**: ✅ 推荐实现

**开源参考**:
- libigl: `convex_decomposition` 相关函数
- CGAL: `convex_hull` 包
