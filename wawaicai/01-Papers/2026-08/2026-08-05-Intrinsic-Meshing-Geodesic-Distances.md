---
tags: [几何, 内在三角化, 测地线, 重网格化]
type: paper
venue: arXiv cs.CG
date: 2026-07-06
---

# Intrinsic Meshing of Closed Surfaces Using Geodesic Distances

## 核心方法

### 问题定义
构建闭合离散曲面的内在三角化，其中边对应最短测地线路径，面分解为继承自底层网格的几何原语。

### 核心算法

**Step 1: 从 watertight input triangulation 出发**

**Step 2: 渐进构建内在网格，通过局部优化操作**
- Edge swaps
- Edge splits
- Edge collapses
- Triangle splits

直接在表面上执行，**不修改原始几何**。

**Step 3: Geodesic Distance Computation**
- Continuous Dijkstra approach
- **A* search strategy 加速** → 仅需约 **3%** 的标准传播成本

**Step 4: Element Size & Quality Control**
- 特征长度场 (characteristic length field) 控制尺寸
- 基于内在距离的角度标准保证质量

### 关键创新

- ✅ 支持 refinement 和 coarsening
- ✅ 克服了基于 developable triangle 的先前内在方法的局限
- ✅ 自然支持 direct high-order mesh generation
- ✅ 绕过经典流程：linear mesh → subsequently curving

### 验证数据集

Thingi10K 近 **5,000** 个几何复杂模型

## 复杂度

- Geodesic computation: **O(3% standard)** via A*
- Local mesh operations: O(log n) per operation

## libigl 参考

相关 libigl 函数：
- `igl::geodesic` - 测地线
- `igl::decimate` - 网格简化
- 本论文方法可增强 intrinsic mesh 处理

## 相关笔记

[[2026-08-05-DAILY-SUMMARY]]

## 技术标签

#intrinsic-triangulation #geodesic #remeshing #mesh-processing #high-order-mesh
