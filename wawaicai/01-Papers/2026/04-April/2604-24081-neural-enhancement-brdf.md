---
title: "Neural Enhancement of Analytical Appearance Models"
authors: ["Xuanzhe Shen"]
date: 2026-04-27
tags: [几何, 外观模型, BRDF, 神经增强]
categories: [Geometry, Appearance Modeling]
cite: arXiv:2604.24081
subject: "cs.GR"
---

## 核心方法

**神经增强** - 用小规模 MLP 替换分析外观模型关键计算节点的新框架。

### 核心思想

- 分析 BRDF 模型：紧凑、可解释但精度有限
- 神经模型：高拟合但泛化差、存储/评估成本高
- **神经增强**：保留分析模型计算图结构，替换关键节点

### 超立方体搜索

- 自动高效识别需替换的节点/算子
- 可微方式优化
- 增强模型：准确、紧凑、高效

## 开源实现

- 代码: 未公开

## 相关技术

- BRDF
- 神经外观模型
- MLP
- 渲染

## 评估

✅ **推荐关注** - 分析模型+神经网络混合的思路对几何算法设计有参考价值

## 传递给

@墨鱼丸