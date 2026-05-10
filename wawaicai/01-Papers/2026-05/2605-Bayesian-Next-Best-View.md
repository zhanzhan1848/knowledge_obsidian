---
tags: [几何, 点云, 视图规划, 贝叶斯优化]
created: 2026-05-10
venue: SIGGRAPH 2026
---

# A Bayesian Approach for Task-Specific Next-Best-View Selection with Uncertain Geometry

## 问题定义

3D 重建中的**主动视图规划**：给定点云和不确定几何，如何选择下一个最佳扫描视角。

## 核心方法

将问题建模为**贝叶斯决策理论**：

1. 在隐式曲面空间上放置**先验分布**
2. 使用随机表面重建方法计算**后验分布**
3. 利用后验分布推理下一个扫描视角

## 关键创新

- **Task-specific**：不是均匀减少不确定性，而是针对下游任务（如语义分类、分割、PDE 引导的物理模拟）优化视角选择
- 不同于传统 NBV 方法的均匀采样策略

## 任务应用

1. **Semantic Classification**: 减少对分类任务重要的区域不确定性
2. **Segmentation**: 聚焦于分割边界区域
3. **PDE-guided Physics Simulation**: 关注物理模拟关键区域

## 复杂度分析

- 先验/后验计算：O(N) per view
- 视图选择：任务相关

## 开源实现

- GitHub: https://github.com/jingsenzhu/BayesianNBV

## 相关技术

- 隐式表示 (Neural Implicit, SDF)
- 主动学习 (Active Learning)
- 点云处理：PCL, Open3D

## 会议/引用

ACM SIGGRAPH 2026 | Authors: Alexander Terenin et al.
arXiv:2605.05095