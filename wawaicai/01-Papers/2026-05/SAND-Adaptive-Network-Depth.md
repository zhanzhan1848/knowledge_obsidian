---
title: "SAND: Spatially Adaptive Network Depth for Fast Sampling of Neural Implicit Surfaces"
authors: [Chuanxiang Yang, et al.]
date: 2026-04-30
tags: [几何, 神经隐式表示, 隐式曲面, SDF, 神经网络加速]
paper_id: 2604.25936
subjects: [cs.GR, cs.CV, eess.IV]
conference: arXiv
status: new
---

# SAND: Spatially Adaptive Network Depth for Fast Sampling of Neural Implicit Surfaces

## 核心方法

### 问题定义
隐式神经表示对于几何建模非常强大，但网络评估的高计算成本限制了其实用性。传统神经隐式模型对所有查询点使用相同的网络深度，忽略了空间变化。

### 关键创新

1. **Volumetric Network-depth Map**
   - 记录每个空间区域达到足够精度所需的网络深度
   - 实现自适应计算资源分配

2. **Tailed Multi-layer Perceptron (T-MLP)**
   - 修改的 MLP 用于学习隐式函数（如 SDF）
   - 每个隐藏层附加输出分支（tail）
   - 允许网络评估自适应终止

### 设计原则
- 离目标表面越远的查询点，所需精度越低
- 同一等值面上，不同区域表示难度不同
- 将计算资源导向几何复杂区域

### 实验结果
- 显著提升隐式神经表示的推理查询速度
- 保持高保真表示

## 相关笔记
[[Neural Implicit Surface]]
[[SDF Learning]]
[[Adaptive Sampling]]

## 可行性分析
✅ 推荐实现

**理由**：
- 优化策略清晰（自适应网络深度）
- 对隐式曲面应用有价值
- 可与现有 SDF 学习方法结合