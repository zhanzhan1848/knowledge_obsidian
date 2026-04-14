---
title: "NeuVolEx: Implicit Neural Features for Volume Exploration"
arXiv: "2604.11172"
authors: "Younhyun Jung et al."
date: "2026-04-13"
venue: "arXiv cs.GR (Under Review)"
tags: [几何, 体数据, 神经隐式表示, 体积渲染, 特征表示]
---

# NeuVolEx: Implicit Neural Features for Volume Exploration

## 核心方法

NeuVolEx 扩展了神经隐式表示 (INR) 的作用，将其从体积压缩扩展到体积探索任务。

### 问题背景

直接体积渲染 (DVR) 中，ROI 分类和聚类的特征表示至关重要：
- 显式局部特征：捕捉更广泛几何模式和空间相关性有限
- 隐式卷积特征：在用户监督有限时性能不稳健

### 技术创新

1. **INR 特征复用**
   - 不同于专注于 INR 输出的压缩方法
   - 利用 INR 训练期间学习到的特征表示作为体积探索的稳健基础

2. **结构编码器 (Structural Encoder)**
   - 增强基础 INR
   - 改善 ROI 表征的空间一致性

3. **多任务学习方案**
   - 联合学习压缩和探索任务
   - 提高空间一致性

## 应用任务

1. **基于图像的传输函数 (TF) 设计**
   - 在稀疏用户监督下进行准确 ROI 分类

2. **视角推荐**
   - 无监督聚类识别紧凑互补视角
   - 揭示不同 ROI 簇

## 适用场景

- 科学可视化
- 医学体积数据探索
- 体积数据分析

## 可行性分析

- **算法复杂度**: 中等 (INR + 多任务学习)
- **数值稳定性**: 结构编码器提高稳定性
- **实现难度**: 中等
- **推荐度**: ⭐⭐⭐ 体积数据探索的创新方法

## 相关笔记

[[Implicit Neural Representations]]
[[Volume Rendering]]
[[Transfer Function Design]]
