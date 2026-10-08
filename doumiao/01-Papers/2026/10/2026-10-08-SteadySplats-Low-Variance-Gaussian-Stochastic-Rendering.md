---
title: "SteadySplats: Resampling of Low-Variance Gaussians for High-Fidelity Stochastic Rendering"
date: 2026-10-04
venue: arXiv cs.GR
arxiv: 2610.05576v2
url: http://arxiv.org/abs/2610.05576v2
subjects: cs.GR
tags:
  - 3D Gaussian Splatting
  - stochastic rendering
  - order-independent transparency
  - resampling
  - real-time
  - 3DGS
agent: doumiao
status: processed
---

## 核心创新点

**SteadySplats**：通过**重采样（resampling）**策略同时在**表示层**与**图像合成层**降低 3DGS 随机透明度渲染的**高频噪声**，并基于 Vulkan 实现实用实时渲染器。

### 关键贡献

1. **历史基础空间重采样** — 随机渲染过程中极大加速图像收敛
2. **时序重要性重采样** — 相机运动下保持帧间连贯
3. **颜色正则化器** — 训练时隐式降低视射线方向方差
4. **Vulkan 实时渲染器** — 1 SPP 较前作 **+13 dB PSNR**，收敛到排序 3DGS 时平均 **L1 误差 < 10⁻⁴**

### 解决痛点

| 之前 | 问题 |
|------|------|
| 3DGS + OIT（顺序无关透明度） | 视觉噪声严重 |
| 高样本预算 | 实时不可达 |
| **SteadySplats** | **低样本低噪 + 高保真收敛** |

## 渲染技术分类

- **类型**: 粒子/基元渲染（3DGS）
- **方法**: 随机 OIT + 重要性重采样 + 时空连贯
- **应用**: 实时 3DGS 浏览、透明/体积粒子场景

## 评估

- **逼真度**: ⭐⭐⭐⭐⭐ (L1 < 10⁻⁴ 接近有序透明度)
- **实时性**: ✅ Vulkan 实现，消费 GPU 可用
- **创新度**: ⭐⭐⭐⭐ (重采样视角切入低方差)

## 实现建议

- **着色器复杂度**: 中（Vulkan 渲染通道 + 重采样 kernel）
- **管线要求**: Vulkan 1.x；3DGS 训练管线
- **代码状态**: 工程化实现
- **推荐度**: ✅ 强烈推荐 — 对实时**烟雾/云/透明粒子**3DGS 浏览有直接价值

## 与流体渲染关联

- **3DGS 烟雾**（GauSmoke / LagrangianSplats） — 这些方法在浏览时均面临 OIT 噪声问题，SteadySplats 提供实用方案
- **体积粒子云** — 透明/半透明粒子场景的实时渲染
- **神经辐射场透明体** — 通用

## 关键词

`3DGS` `stochastic rendering` `OIT` `resampling` `Vulkan` `real-time` `cs.GR`