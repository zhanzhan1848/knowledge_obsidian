---
tags: [几何重建, 点云, MLS, 稀疏采样, 表面重建]
---

# Lipschitz Extension Initialization for Moving Least Squares Reconstruction from Sparse Irregular Samples

## 论文信息

| 属性 | 内容 |
|------|------|
| arXiv | [2609.02918](https://arxiv.org/abs/2609.02918) |
| 分类 | cs.GR, eess.SP |
| 日期 | 2026-09-04 |

## 核心问题

从稀疏不规则采样进行移动最小二乘(MLS)重建时，稳定性和重建精度不足。

## 核心方法

1. **Lipschitz扩展初始化**（2012年提出，GVF/Gradually Varied Functions）
2. 作为MLS重建的预处理步骤
3. AI辅助数学规划和软件开发实现

## 关键创新点

- 重提Lipschitz扩展思想用于现代无网格重建
- 显著改善稀疏不规则采样下MLS的稳定性和重建精度
- 为更鲁棒的表面重建提供初始化基础

## 算法复杂度

- Lipschitz扩展初始化：O(n log n)
- MLS重建：O(nk) where k is basis size

## 开源实现

- 待发布

## 相关笔记

[[WildFab-Multi-Axis-3D-Printing-Wild-Models]]

## 可行性分析

✅ **推荐实现**

- 表面重建基础方法
- Lipschitz连续性保证数值稳定性
- 可与libigl/CGAL集成进行基准测试
