---
tags: [几何, 网格处理, 内蕴网格, 测地线]
date: 2026-07-08
source: arXiv
categories: [cs.CG]
---

# Intrinsic Meshing of Closed Surfaces Using Geodesic Distances

## 核心方法

提出一种**内蕴三角剖分**方法，用于闭合离散曲面的网格构建：

- **边对应最短测地线路径**，而非传统欧氏边
- **面分解为继承自底层网格的几何基元**
- 通过局部优化操作构建：边交换、边分裂、边折叠、三角形分裂
- **不修改原始几何**，直接在曲面上操作

## 关键技术

### 测地线计算
- **连续 Dijkstra 方法**精确计算测地距离
- **A* 搜索策略**加速，将计算成本降至标准传播的约 **3%**

### 网格质量控制
- 通过**特征长度场**控制元素大小
- 基于**角度标准**强制网格质量（源自内蕴距离）

## 创新点

1. **同时支持细化 (refinement) 和粗化 (coarsening)**，克服了先前基于可展三角形方法的局限性
2. 为**高阶网格生成**提供自然基础，绕过"先构造线性网格再弯曲"的传统流程
3. 验证于 Thingi10K 数据集的近 **5,000** 个复杂几何模型

## 算法复杂度

- 测地线计算：A* 加速后为标准方法的 3%
- 空间复杂度：O(n) where n = 顶点数量

## 开源实现

- 待补充 (arXiv PDF 可用)

## 相关笔记

[[2026-07-08-ExMesh-Topology-Adaptation]]
[[2026-05-13-FA-QEM-Mesh-Simplification]]

## 元信息

- **arXiv**: [2607.04989](https://arxiv.org/abs/2607.04989)
- **作者**: Tim Gabriel, Jean-François Remacle, Christophe Geuzaine
- **提交日期**: 2026-07-06
- ** Subjects**: Computational Geometry (cs.CG)
