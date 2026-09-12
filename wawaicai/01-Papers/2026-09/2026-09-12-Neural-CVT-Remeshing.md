---
title: Neural Centroidal Voronoi Tessellations
authors: Jiacheng Xu et al.
venue: arXiv (cs.GR)
date: 2026-09-08
arxiv: 2609.08497
tags: [网格处理, CVT, 重网格化, 图神经网络, 几何学习]
---

# Neural Centroidal Voronoi Tessellations

## 核心方法

**Neural CVT** — 基于学习（Learning-based）的表面 CVT 求解器，用循环神经网络优化器替代传统几何计算（RVD 构建 + 面积分），加速 100 倍。

### 核心技术点

1. **多尺度几何描述符** — 在输入表面上采样密集点云，提取多尺度几何特征
2. **图神经网络编码器** — 编码表面几何信息
3. **轻量级循环优化器** — 少量迭代精化种子点位置，聚合插值表面特征和优化历史
4. **自监督训练** — 使用 CVT 目标函数（均匀分布 + 特征对齐）

### 与传统方法对比

| 方法 | 每步复杂度 | 收敛迭代 |
|------|-----------|---------|
| 传统 CVT | O(n²) RVD 构建 | 数百步 |
| Neural CVT | O(n) 推理 | ~10步 |

## 算法分析

- **时间复杂度**：训练 O(n)，推理 O(n) per iteration
- **空间复杂度**：O(n) 图特征存储
- **数值稳定性**：GNN 泛化到未见几何、初始化策略和种子密度

## 应用场景

- 各向同性重网格化（Isotropic Remeshing）
- 表面采样（Surface Sampling）
- 特征保持重网格化（Feature-preserving Remeshing）
- 支持有机形状和 CAD 类形状

## 开源参考

- Code & Trained Models: 即将发布（arXiv 页面标注）

## 相关笔记

[[2026-09-10-DAILY-SUMMARY]]

## 可行性评估

✅ **推荐实现** — GNN + CVT 结合优雅，100x 加速极具实用价值，libigl 可实现类似几何特征提取

---
*🥬 娃娃菜 · 2026-09-12*
