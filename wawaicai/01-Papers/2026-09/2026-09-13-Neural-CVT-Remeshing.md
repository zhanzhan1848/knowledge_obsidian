---
tags: [几何, 重网格化, 网格采样, 深度学习, CVT]
date: 2026-09-13
conference: arXiv cs.GR
---

# Neural Centroidal Voronoi Tessellations

## 论文信息
- **arXiv**: [2609.08497](https://arxiv.org/abs/2609.08497)
- **PDF**: [pdf](https://arxiv.org/pdf/2609.08497)
- **作者**: Jiacheng Xu et al.
- **日期**: 2026-09-08
- **主题**: Learning-based surface CVT solver for isotropic remeshing

## 核心方法

### 问题背景
Centroidal Voronoi Tessellation (CVT) 是高质量曲面采样和各向同性重网格化的基础原语。传统求解器每步优化需要重复构建 Restricted Voronoi Diagrams (RVDs) 并在表面胞上积分，计算代价高昂。

### 核心创新
**Neural CVT** — 用**循环神经优化器**替代昂贵的几何计算，将 CVT 优化加速 1-2 个数量级，同时保持几何保真度。

### 技术框架
1. **输入表面** → 采样稠密点云
2. **图神经网络编码器** → 提取多尺度几何描述符
3. **轻量循环优化器** → 在少量迭代中精化种子点位置
   - 聚合插值表面特征 + 优化历史
   - 预测每种子点的位移
4. **自监督训练** — 使用 CVT 目标函数促进均匀分布和特征对齐

### 泛化能力
- 跨有机形状和 CAD 形状泛化
- 支持未见几何、初始化策略、种子密度
- 产生各向同性、特征保持的重网格，与 SOTA 离线优化方法相当

## 算法复杂度
- 优化速度：比传统方法快 10-100x
- 内存：循环优化器记忆轻量
- 精度：保持几何保真度

## 开源实现
- 代码和训练模型将开源发布

## 关键公式/技术点
- RVD (Restricted Voronoi Diagram) 构造 → 被图神经网络替代
- 循环优化器聚合多尺度几何特征
- CVT 目标：均匀分布 + 特征对齐（自监督）

## 相关笔记
[[2026-09-04-MeshFlow-Equivariant-Flow-Matching]]
[[2026-09-08-Lipschitz-MLS-Reconstruction-Sparse-Samples]]

## 可行性分析
- ✅ **推荐实现** — 加速效果显著，方法清晰
- libigl 参考：`remesh_along_isocontour`, `quadric_error_simplification`
- CGAL 参考：`Alpha_shape_3` for surface sampling
