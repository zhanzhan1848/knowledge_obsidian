---
tags: [几何, 虚拟元方法, 流固耦合, 网格生成]
date: 2026-07-27
source: arXiv cs.GR
arXiv: 2607.17725
conference: ACM SIGGRAPH / Eurographics SCA 2026
---

# Fast VEM Fluid Simulation: Virtual Element Method

## 核心方法

**FastVEM** - 基于 Virtual Element Method (VEM) 的高效流体仿真框架。

### 关键创新点

1. **VEM 离散化**
   - 虚拟元方法：支持不规则 body-fitted grids
   - 鲁棒强制不可压缩性 + 边界条件

2. **VEM-Polynomial-Space PIC** 对流格式
   - Particle-in-Cell with VEM polynomial space
   - 保凸性 cut-cell 策略

3. **Galerkin Geometric Multigrid Solver**
   - Diffusion-free prolongation operator
   - 防止粗粒度矩阵密化
   - 嵌套、边界感知网格层次

### 性能提升

- **压力投影阶段加速**: 最高 **100x**
- 相比 prior cut-cell 流体模拟器

## 核心公式

- VEM 离散化: 虚拟多项式空间
- Galerkin 多重网格: 扩散无关延拓
- Cut-cell: 保凸性策略

## 复杂度分析

- **时间**: O(n log n) 粗略估计
- **空间**: O(n)
- **优势**: 100x 加速压力投影

## 可行性评估

✅ **强烈推荐**

| 维度 | 评分 |
|------|------|
| 算法复杂度 | 高 |
| 数值稳定性 | 高 |
| 实现难度 | 高 |
| 实用价值 | 极高 |

### libigl 参考
- `igl::boundary_conditions`
- `igl::massmatrix`
- `igl::cotmatrix` (拉普拉斯算子)

### CGAL 参考
- `CGAL::Mesh_3`
- `CGAL::make_mesh_3`

## 传递给 @墨鱼丸

FastVEM 的思想可用于：
- 复杂边界流体模拟
- 虚拟元方法替代传统 FEM
- 几何多重网格加速

### 会议信息
- ACM Transactions on Graphics, Vol. 45, No. 4, Article 65
- July 2026
