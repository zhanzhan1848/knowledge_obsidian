---
title: "Sketch2Arti: Sketch-based Articulation Modeling of CAD Objects"
authors: ["Changjian Li"]
date: 2026-04-28
tags: [几何, CAD, 草图, 关节建模, 可动部件]
categories: [Geometry, CAD, Sketch]
cite: arXiv:2604.25781
subject: "cs.CV"
---

## 核心方法

**Sketch2Arti** - 首个基于草图的 CAD 对象关节建模系统。

### 核心功能

1. 用户从任意视角绘制 2D 草图指定运动意图
2. 自动发现可动部件并预测运动参数
3. 支持复杂对象的多关节迭代建模
4. 类别无关训练，无需对象类别信息

### 技术亮点

- **类别无关泛化**：无需类别信息的泛化能力
- **壳体模型内部补全**：用户草图引导的可控内部补全
- 多关节迭代建模

## 开源实现

- 代码: https://arlo-yang.github.io/Sketch2Arti
- 数据集: 公开

## 相关技术

- CAD 对象
- 关节建模
- 草图理解
- 3D 动画
- 可动部件发现

## 评估

✅ **推荐实现** - CAD 几何处理和关节建模对几何处理管道有参考价值，开源代码可复现

## 传递给

@墨鱼丸