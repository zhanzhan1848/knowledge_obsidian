---
tags: [几何, 网格生成, 虚拟元方法, 流体模拟, 切割胞元]
date: 2026-07-22
source: arXiv cs.GR
arxiv: "2607.17725"
conference: ACM Transactions on Graphics, Vol.45, No.4, Article 65 (July 2026)
---

# FastVEM: Fast Virtual Element Method Fluid Simulation

## 核心方法

**核心思想**：用虚拟元方法 (Virtual Element Method, VEM) 离散化不可压缩流体，替代传统有限元，配合凸性保持切割胞元策略和几何多重网格求解器。

**技术路线**：
1. **VEM 离散化**：在非规则贴合网格上稳健施加不可压缩性和边界条件
2. **VEM 多项式空间 Particle-in-Cell (PIC)**：对流步
3. **凸性保持切割胞元策略**：构建体-贴合网格
4. **Galerkin 几何多重网格求解器**：扩散自由延长算子 + 嵌套边界感知网格层级

## 性能指标

| 指标 | 数值 |
|------|------|
| 压力投影加速 | **最高 100x** vs 传统 cut-cell 流体模拟器 |
| 边界处理 | 稳健处理复杂边界几何 |

## 关键创新

1. **VEM 离散化**：天然适配不规则 body-fitted grids，避免 cut-cell 导致的病态线性系统
2. **扩散自由延长算子**：防止粗粒度矩阵密化
3. **嵌套边界感知网格层级**：确保粗粒度自由度位置的良定性
4. **凸性保持 cut-cell**：生成模拟友好的贴合网格

## 算法分析

**vs 传统方法**：
- 传统 cut-cell 方法：边界几何导致条件数差，压力投影慢
- FastVEM：VEM 绕过 cut-cell 刚度矩阵问题，100x 加速

## 开源参考

- libigl: `igl::cut_mesh`, `igl::boundary_facets` 相关流程
- CGAL: `CGAL::alpha_wrap_3` (网格生成), `CGAL::make_body_fitted`

## 可行性分析

| 维度 | 评估 |
|------|------|
| 算法复杂度 | 多重网格 O(n log n) |
| 实现难度 | 高（VEM + 多重网格 + cut-cell） |
| 数值稳定性 | 良好（VEM 理论保证） |
| 依赖项 | 自研 / VEM 库 |
| 推荐度 | ⚠️ 学术价值高，工程实现复杂 |

## 适用场景

- 复杂边界流固耦合
- 工业仿真（船舶、航空发动机）
- 交互式流体效果

## 几何处理关联

本文的几何处理创新在于 **body-fitted mesh 生成**和**复杂边界表示**，与以下方向相关：
- 网格简化与重网格化
- 切割胞元方法 (Cut-cell / Voxelization)
- 自适应网格细化

## 相关笔记

[[2026-07-18-Subgrid-Marching-Tetrahedra-SIGGRAPH2026]]
[[2026-07-14-MeshFlow-Equivariant-Flow-Matching-SIGGRAPH2026]]
