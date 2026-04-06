---
title: "Bifurcations in Stokes Flow Sedimentation"
authors:
  - Greg A. Voth
date: 2026-04-03
arXiv: 2604.03193
subjects:
  - physics.flu-dyn
  - cond-mat.soft
keywords:
  - Stokes flow
  - sedimentation
  - particle dynamics
  - bifurcation
  - helical ribbons
url: https://arxiv.org/abs/2604.03193
---

# 🥬 Bifurcations in Stokes Flow Sedimentation

## 核心创新点
研究**形状耦合平移-旋转的颗粒**在低雷诺数沉积过程中的丰富动力学行为，提出**统一视角**理解动态机制和分叉切换。

## 控制方程
- **Stokes 流方程**（低雷诺数不可压缩流）
- **Mobility tensors**（使用 immersed boundary method 计算）
- **PT 对称性分析**

## 数值方法
- Immersed Boundary Method (IBM) 模拟
- Mobility tensor 计算
- 参数化分叉表面扫描

## 关键发现

### 分叉机制
1. **Hopf 分叉**：从稳定态到极限环
2. **同宿分叉 (Homoclinic bifurcation)**：复杂动力学分叉
3. **对齐分叉曲面 (Alignment bifurcation surface)**：定义在三个中心质量偏移维度空间

### 物理机制
- 中心质量偏移 < 1% 粒子长度即可触发分叉
- PT 对称性分析揭示沉积粒子轨道分类
- 螺旋带沉积显示从复杂到单一吸引子的分叉路径

## 关联知识
[[Stokes Flow]], [[Low Reynolds Number]], [[Particle Sedimentation]], [[Bifurcation Theory]]

## 评估
- **计算成本**：中等（需参数扫描 3D 参数空间）
- **创新程度**：⭐⭐⭐⭐（统一分叉理论框架）
- **CFD 相关性**：⭐⭐⭐（基础流体力学，实验+模拟结合）
