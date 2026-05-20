---
title: "CelloCut: Constructive Watertight Remeshing via Tetrahedral Cell Cuts"
date: 2026-05-18
authors: Xuan Yang et al.
arXiv: "2605.17853"
tags: [remeshing, watertight, tetrahedral, graph-cut, mesh-reconstruction]
conference: arXiv 2026
---

# CelloCut: Constructive Watertight Remeshing via Tetrahedral Cell Cuts

## 核心思想

**关键洞察**: 水密重网格化应被视为**体积分区问题**而非表面修复任务。

现有方法从局部表面几何推断全局内外分区，对复杂拓扑、大缺失区域会产生双壳等伪影。CelloCut 通过在 Delaunay 四面体剖分空间上做二值标签图割来保证严格水密。

## 算法流程

1. **输入**: 非水密三角网格
2. **Delaunay四面体剖分**: 对整个空间做四面体剖分
3. **图割能量最小化**:
   - 一致性约束保留代理支持的内部证据
   - 加权界面惩罚抑制无支撑的新边界
4. **输出**: 严格水密的网格

## 核心公式

能量函数:
$$E = \sum_{i} D_i(l_i) + \sum_{(i,j)} V_{ij}(l_i, l_j)$$

- $D_i$: 数据项（内部/外部证据）
- $V_{ij}$: 平滑项（界面惩罚）

## 实验数据

| 数据集 | 指标 | 提升 |
|--------|------|------|
| CelloScan | 水密率 | +15% |
| CelloFill | 复杂拓扑 | 显著优于SOTA |
| ModelNet10 | 体积一致性 | 最佳 |

## 开源实现

- 主页: https://rangeryx-66.github.io/CelloCut/

## 可行性评估

- **算法复杂度**: O(n log n) 四面体剖分 + 图割
- **数值稳定性**: 图割保证全局最优
- **依赖项**: CGAL (Delaunay), maxflow/min-cut库
- **推荐度**: ⭐⭐⭐⭐⭐ — 水密网格生成的重大突破

## 技术亮点

1. **范式转变**: 从表面推理 → 体积分区
2. **理论保证**: 严格水密输出，无双壳伪影
3. **通用性**: 处理复杂拓扑、单层结构、大缺失区域

## 相关技术

- [[Winding Numbers]] — 包容查询基础
- [[Graph Cut]] — 能量最小化
- [[Delaunay Triangulation]] — 空间剖分