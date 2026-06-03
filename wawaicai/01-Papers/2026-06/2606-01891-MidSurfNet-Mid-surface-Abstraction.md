---
title: "MidSurfNet: Learnable Face Pairing and Interference Implicit Fields for Generalized Mid-surface Abstraction"
arXiv: "2606.01891"
authors: ""
date: 2026-06-01
venue: arXiv cs.GR
tags: [几何, CAD, 中面提取, 神经网络, 有限元]
subjects: "cs.GR; cs.LG"
---

# MidSurfNet: Learnable Face Pairing and Interference Implicit Fields

## 核心方法

**MidSurfNet**——用于薄壁 CAD 模型中面（mid-surface）抽象的深度学习框架。

**问题背景：**
- 中面抽象是薄壁 CAD 模型有限元分析的关键步骤
- 现有 face pairing 方法依赖手工几何启发式
- 真实工业场景：多壁厚区域、自匹配面配置、非中心偏移面需求

**核心创新：**
1. **神经 face pairing 模块**：从几何和拓扑特征学习 face pair 置信度，处理复杂配对场景
2. **干涉隐式场（Interference Implicit Field）**：将中面表示为两个 SDF 的干涉，支持灵活偏移控制

**数据集：**
- 1500+ 手动标注的 CAD 模型

**性能：**
- Face pairing 准确率：87.32%
- 多壁厚完成率：61.90%
- 自匹配完成率：52.94%

## 算法复杂度
- 训练：需大规模数据集
- 推理：O(n) face 数

## 实现难度
- 算法复杂度：中（深度学习）
- 数值稳定性：良好
- 依赖项：PyTorch/TensorFlow，CAD 处理库

## 可行性
⚠️ **谨慎评估**

面向 CAD 有限元预处理，领域专属性强，非通用几何处理。

## 开源参考
- 论文代码: 待查
- libigl: 无直接对应

## 相关笔记
[[几何/CAD处理]], [[几何/隐式表示]]
