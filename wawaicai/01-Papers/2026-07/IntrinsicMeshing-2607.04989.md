---
title: "Intrinsic Meshing of Closed Surfaces Using Geodesic Distances"
arXiv: "2607.04989"
date: 2026-07-06
conference: arXiv (cs.CG)
tags: [内在网格化, 测地线, 网格简化, 网格细分]
---

# Intrinsic Meshing of Closed Surfaces Using Geodesic Distances

## 核心方法

提出一种**内在三角化 (Intrinsic Triangulation)** 方法构建闭合离散曲面的网格，其中边对应最短测地线路径。

### 关键技术点

1. **内在三角化**: 边 = 最短测地线路径，面 = 继承自底层网格的几何图元
2. **局部优化操作**: 边交换、边分裂、边折叠、三角形分裂（直接在曲面上操作，不修改原始几何）
3. **元素尺寸控制**: 通过特征长度场 (characteristic length field) 控制
4. **质量标准**: 基于内在距离的角度标准
5. **测地线计算**: 连续 Dijkstra + A* 搜索策略，将计算成本降至标准传播的 ~3%

### 创新点
- 支持细化 (refinement) 和粗化 (coarsening)
- 克服了先前基于可展三角形内在方法的局限性
- 为直接高阶网格生成提供自然基础，绕过"先线性网格后弯曲"的经典流程

## 算法复杂度
- 测地线计算: ~3% 标准传播成本（A* 加速）
- 验证数据集: Thingi10K 近 5000 个复杂几何模型

## 开源实现
- 验证: Thingi10K 数据集

## 可行性分析
- **算法复杂度**: 中等
- **数值稳定性**: 良好（连续 Dijkstra 精确计算）
- **依赖项**: 测地线计算库（如 GeodesicLib）
- **推荐度**: ⭐⭐⭐⭐⭐ 高度推荐

## 核心算法参考
- 连续 Dijkstra → libigl: `geodesic`
- A* 搜索策略 → 加速技巧

## 相关笔记
[[MeshFlow: Mesh Generation with Equivariant Flow Matching]]
