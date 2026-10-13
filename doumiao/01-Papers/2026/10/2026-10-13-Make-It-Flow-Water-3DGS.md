---
title: "Make It Flow: Animating Water in 3D Gaussian Splatting Scenes"
date: 2026-10-13
tags: [water-rendering, 3dgs, cinemagraph, optical-flow, eulerian-flow]
authors: [Florian Hahlbohm et al.]
arxiv: 2610.13860
venue: arXiv 2026 (cross-list cs.CV / cs.GR)
overview_video: https://youtu.be/qf04D73kgrc
status: processed
subjects: cs.GR, cs.CV
---

## 核心创新点

在**静态 3D Gaussian Splatting 场景**中无动态捕获、无物理仿真的情况下，给水面（瀑布、河流等高频动态现象）添加**视觉可信的循环动画**，并保留实时渲染性能与自由视点。

### 关键技术

1. **2D 光学流估计** — 从参考图像或模型渲染中估计每个视角的光流
2. **3D Eulerian 运动场构建** — 将多视角 2D 光流提升到一致的 3D 速度场
3. **Cinemagraph-Inspired 形变算法** — 把 3D 运动场作用于 Gaussian primitives，生成时序无缝的循环动画
4. **真实世界瀑布数据集** — 野外非受控拍摄条件下的采集

### 核心问题

- 3DGS 假设场景静态，难以处理高频水流动效
- 现有方案需密集多视角高速采集或显式物理模拟，难以普适
- 该工作聚焦"瀑布 / 流水"这类高频细节

## 渲染技术分类

- **类型**: 表面渲染（瀑布/流水表面动效）+ 粒子渲染（高斯椭球形变）
- **方法**: 3DGS + Cinemagraph + Eulerian Flow Field

## 视觉质量

- **逼真度**: ⭐⭐⭐⭐⭐ (用户研究优于 dynamic 3DGS / 3D cinemagraphs 基线)
- **时序一致性**: 循环无缝

## 性能

- **实时性**: ✅ 保留 3DGS 实时渲染
- **离线重建 + 在线形变**: 典型 3DGS 流程
- **视角自由**: ✅

## 实验

- **数据集**: 自采 in-the-wild 瀑布数据集
- **基线**: Prior dynamic Gaussian splatting, 3D cinemagraph generation
- **结果**: 视觉质量 + 计算效率双重领先

## 适用场景

- 自然场景（瀑布、河流、溪流）的 3DGS 表征增强
- 数字孪生/虚拟旅游的局部动效注入
- 历史遗迹、建筑环境的"流水动效"复刻

## 局限性

- 假设运动可由 2D 光流驱动；对于湍流强、拓扑变化剧烈（如瀑布飞溅）的场景保真度受限
- 当前聚焦瀑布一维/二维方向流动

## 关键词

`water rendering` `3D Gaussian Splatting` `cinemagraph` `Eulerian flow` `optical flow` `waterfall animation`

## 相关工作

- [[2024-01-GaussianSplashing]] — 3DGS 流体飞溅
- [[2025-03-02-3d-dynamic-fluid-assets-gaussian-splatting]] — 3D 流体资产
- [[2026-09-05-LagrangianSplats-Divergence-Free-Fluid-Reconstruction]] — 拉格朗日流体重建

---
*由豆苗自动收集于 2026-10-13*
