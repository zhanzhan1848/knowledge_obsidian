---
title: Reduced-Order Deformable Simulation from Particle-Based Skinning Eigenmodes
authors: Donglai Xiang (NVIDIA Research)
date: 2026-05-28
source: arXiv cs.GR (CVPR 2026)
url: https://arxiv.org/abs/2605.29318
pdf: https://arxiv.org/pdf/2605.29318
tags: [rendering, simulation, deformation, reduced-order, RKPM, gaussian-splatting, paper, 2026]
status: unread
---

# Reduced-Order Deformable Simulation from Particle-Based Skinning Eigenmodes

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Reduced-Order Deformable Simulation from Particle-Based Skinning Eigenmodes |
| 作者 | Donglai Xiang (NVIDIA Research) |
| 来源 | arXiv cs.GR (CVPR 2026) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.29318) |
| PDF | [下载](https://arxiv.org/pdf/2605.29318) |

## 核心贡献
1. 提出基于 **Reproducing Kernel Particle Method (RKPM)** 的降阶变形超弹性物体模拟
2. 通过在 Hessian 矩阵上解广义特征系统构建降阶 skinning weights
3. 比 neural fields per-shape 优化快 **40x**
4. 比有限元方法 (FEM) 收敛结果更低模拟误差

## 技术方案

### RKPM 表示
- 网格无关的表示
- 避免复杂形状的扫描和三角化困难

### 广义特征系统
- 在 Hessian 矩阵上构建
- 产生降阶 skinning weights

### 性能对比
```
训练速度：40x faster than per-shape optimization of neural fields
模拟误差：lower than FEM converged results
应用：robot simulation
```

## 实验结论
- 40x 训练加速
- 低于 FEM 模拟误差
- 支持 mesh、Gaussian splats 等多种表示
- 应用于机器人模拟

## 可行性分析
- 实现难度：中
- 性能预期：40x 加速，适合实时物理模拟
- 适用场景：实时物理仿真、机器人模拟、游戏引擎

## 相关工作
- [[Reduced-Order Simulation]]
- [[RKPM]]
- [[Physics-Based Animation]]