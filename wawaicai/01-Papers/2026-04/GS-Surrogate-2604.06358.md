---
title: "GS-Surrogate: Deformable Gaussian Splatting for Parameter Space Exploration"
arXiv: "2604.06358"
authors: "Ziwei Li et al."
date: "2026-04-07"
venue: "arXiv cs.GR"
tags: [几何, 高斯泼溅, 替代模型, 参数空间探索, 科学可视化]
---

# GS-Surrogate: Deformable Gaussian Splatting for Parameter Space Exploration

## 核心方法

GS-Surrogate 是一种基于**可变形高斯泼溅的可视化替代模型**，用于参数空间探索。

### 问题背景

- 体积模拟数据存储成本高
- 灵活调整可视化设置困难
- 现有方法在图像空间操作，无显式 3D 表示
- Neural Radiance Fields 计算昂贵

### 技术创新

1. **规范高斯场作为基础 3D 表示**
   - 构建规范高斯场作为基础表示
   - 通过序列参数条件变形进行适配

2. **显式公式分离关注点**
   - 将模拟相关变化与可视化特定变化分离
   - 实现高效可控的适配

3. **支持多种可视化任务**
   - 等值面提取
   - 传输函数编辑

## 适用场景

- 科学模拟的后验探索
- 参数敏感性分析
- 交互式可视化

## 可行性分析

- **算法复杂度**: 中等
- **数值稳定性**: 显式公式设计提高稳定性
- **实现难度**: 中等
- **推荐度**: ⭐⭐⭐ 对科学可视化有价值

## 相关笔记

[[Gaussian Splatting]]
[[Scientific Visualization]]
[[Surrogate Models]]
