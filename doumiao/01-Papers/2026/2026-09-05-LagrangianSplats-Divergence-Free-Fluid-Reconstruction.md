---
title: "LagrangianSplats: Divergence-Free Transport of Gaussian Primitives for Fluid Reconstruction"
authors:
  - Ningxiao Tao
  - Baoquan Chen
  - Mengyu Chu
date: 2026-07-19
conference: SIGGRAPH 2026
arxiv: 2605.09299
doi: 10.1145/3799902.3811188
github: https://github.com/taoningxiao/LagrangianSplats.git
subjects: cs.GR, cs.LG
tags:
  - fluid reconstruction
  - 3D Gaussian Splatting
  - divergence-free
  - Lagrangian method
  - velocity field
  - fluid simulation
  - volume rendering
---

## 核心创新点

从**稀疏2D视频观测**重建3D流体速度场，同时满足**传输一致性**和**物理有效性**（不可压缩性）。

### 核心技术

1. **Divergence-Free Kernel (DFK) 速度场参数化** — 结构性保证速度场无散度，无需软约束惩罚
2. **Lagrangian 3D Gaussian Splatting 表示** — 用高斯原始量驱动对流
3. **Sliding Window 优化策略** — 有效传播长时域梯度，保证计算可处理性

### 方法对比

| 方法 | 传输一致性 | 物理有效性 | 问题 |
|------|-----------|-----------|------|
| PINF/HyFluid (Eulerian) | 短程对流监督，易陷入局部最优 | 软PINN惩罚 | 缺乏长期时间对应 |
| PICT | 神经轨迹表示 | 过度正则化 | 抑制湍流传输 |
| FluidNexus | 逐帧贪婪估计 | Position-Based Fluid | 丢弃长程梯度 |
| **LagrangianSplats** | **全局传输视角** | **DFK结构保证** | — |

### 关键公式

- DFK 速度场: 连续无散度核表示，内在保证不可压缩性
- Sliding Window: 限制梯度传播到有效时间范围，保持计算可行性
- 重建质量: 37.70 PSNR, 0.9764 SSIM, 0.0758 LPIPS (Biplume数据集)

### 应用场景

- 高保真再模拟 (high-fidelity re-simulation)
- 定量流场分析
- 流体可视化

## 渲染技术分类

- **类型**: 体积渲染 / 粒子渲染 (混合)
- **方法**: 3D Gaussian Splatting + 物理约束

## 评估

- **逼真度**: ⭐⭐⭐⭐⭐ (物理精确)
- **实时性**: 离线重建，非实时
- **创新度**: ⭐⭐⭐⭐⭐ (结构保证散度自由)

## 关键词

`fluid reconstruction` `divergence-free` `3D Gaussian Splatting` `Lagrangian` `velocity field` `sliding window optimization`
