---
tags: [几何处理, 点云, 网格处理, 3D打印, 路径规划]
---

# WildFab: Multi-Axis 3D Printing from Models in the Wild

## 论文信息

| 属性 | 内容 |
|------|------|
| arXiv | [2609.02413](https://arxiv.org/abs/2609.02413) |
| 分类 | cs.GR, cs.RO |
| 日期 | 2026-09-02 |
| 会议 | - |

## 核心问题

真实世界的几何模型（非流形结构、solid-shell组合）难以直接用于多轴3D打印，需要耗时的几何修复。

## 核心方法

1. **混合查询表示**：
   - 神经符号距离场 (UDF) - 提供可微分表面距离和方向查询
   - 正则化广义卷绕数场 (reg-GWN) - 解决UDF近表面歧义，提供可靠表面定位和实/空指示

2. **高精度空间刀轨计算**：
   - 在优化引导场等值面和reg-GWN梯度幅值脊之间迭代投影点

3. **粗到细碰撞检测**：
   - UDF拒绝初筛潜在碰撞
   - reg-GWN精确验证固体和壳体组件的碰撞对

## 关键创新点

- 端到端设计到3D打印工作流
- 处理非流形参数曲面、体素化拓扑优化结果、隐式模型、原始扫描点云、非水密网格
- 神经UDF + reg-GWN混合表示解决几何歧义

## 算法复杂度

- 时间复杂度：迭代投影优化 O(n log n) per iteration
- 空间复杂度：UDF/reg-GWN场存储 O(n³)

## 开源实现

- 待发布

## 相关笔记

[[Lipschitz-MLS-Reconstruction-Sparse-Samples]]
[[PointGT-Point-Based-Geometry-Texture-Editing]]
[[TileGS-Tile-Local-Depth-Binning-Gaussian-Splatting]]

## 可行性分析

✅ **推荐实现**

- 点云处理 + 网格修复 + 路径规划
- 混合表示（UDF + GWN）思路可用于其他几何处理任务
- libigl 可用于基础网格操作验证
