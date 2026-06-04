---
tags: [几何, Marching Tetrahedra, 网格重建, 表面重建]
date: 2026-06-04
category: [Geometry Processing, Surface Reconstruction, Mesh Generation]
arXiv: 2606.00454
authors: 
title: "Subgrid Marching Tetrahedra"
source: arXiv cs.GR
url: https://arxiv.org/abs/2606.00454
pdf: https://arxiv.org/pdf/2606.00454
---

## 核心方法

### 问题
- 从 tetrahedral grid 边缘与连续表面相交的点恢复无交集的流形三角形网格
- 经典 marching cubes/tets 的局限性

### 创新点
1. **Subgrid marching scheme**:
   - 允许单个 cell 内任意多个表面斑块
   - 捕获精细特征和薄片

2. **无约束**:
   - 不需要明确定义的 inside/outside（允许有边界的表面）
   - 不需要一致方向输入几何

3. **保持局部并行性**:
   - 重建独立执行 per tet
   - 跨 tet 边界生成 conforming mesh

### 关键创新
- 广义法线坐标 (Generalized normal coordinates)

## 技术细节

### 与经典 Marching Cubes 对比
| 特性 | 经典 MC | 本文方法 |
|------|--------|---------|
| 表面斑块数 | 每个 cell 一个 | 任意多个 |
| 薄特征 | 丢失 | 保留 |
| Inside/Outside | 需要 | 不需要 |
| 方向一致性 | 需要 | 不需要 |

### 输出
- Intersection-free triangle mesh
- Conforming mesh across tet boundaries

## 复杂度分析
- 时间：O(n) per tet, 并行化
- 空间：O(1) per tet

## 开源参考
- 原文未提供代码链接

## 可行性评估

**推荐度**: ✅✅ 强烈推荐

**理由**:
- 直接解决网格重建问题
- 突破经典 marching cubes 局限
- 支持复杂拓扑和薄特征
- 可与 libigl/CGAL 集成

**适用场景**:
- 神经隐式表面可视化
- 医学图像重建
- 点云表面重建
- 有限元结果提取

**libigl 参考函数**:
- `extract_manifold_mesh()` - 流形提取
- `isosurface()` - 等值面提取

**CGAL 参考**:
- CGAL::Surface_mesh_parameterization
- CGAL::make_mesh_3