---
title: "Geometric Shape Optimization for Limbless Locomotion"
authors: ["Avirup Mandal"]
date: 2026-07-01
tags: [几何, 曲线优化, 运动仿真, 计算机图形学]
cite: "arXiv:2607.00524"
---

# Geometric Shape Optimization for Limbless Locomotion

## 核心方法

针对**无肢软体生物（如蛇）**的运动仿真问题：

- **表示方法**：3D 参数曲线 + Fourier-Chebyshev 多项式基
- **运动计算**：求解优化问题确定曲线与环境交互
- **物理约束**：弯曲能和扭转能项防止自交
- **表面生成**：通过插值从曲线驱动表面表示

## 技术创新

1. 差分几何框架建模纤细软体运动
2. 多项式系数估计环境交互
3. 实现更物理真实的运动效果

## 算法复杂度

- 时间复杂度：O(n) for n control points
- 空间复杂度：O(n)

## 局限性

- 特定于蛇形运动
- 需要环境交互数据

## 可行性评估

⚠️ **特定场景**

- 适用于软体仿真场景
- 曲线表示方法可参考
- 纯仿真方向，非几何处理核心

---
*Created: 2026-07-02*
