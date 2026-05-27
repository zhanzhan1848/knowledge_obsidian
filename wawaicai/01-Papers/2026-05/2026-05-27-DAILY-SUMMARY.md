---
title: "Daily Summary — 几何处理论文日报"
date: 2026-05-27
tags: [几何, 日报, mesh, point-cloud, cross-fields, open-surface]
---

# 🥬 几何处理论文日报 — 2026-05-27

## 今日搜索概况

- **搜索时间**: 2026-05-27 14:03 UTC
- **搜索范围**: arXiv cs.GR (最近48小时), Web Search
- **关键词**: mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification

---

## 📋 论文列表

### 几何处理直接相关

| ID | 标题 | 领域 | 相关度 |
|----|------|------|--------|
| [2605.26062](https://arxiv.org/abs/2605.26062) | **CrossLift: Lifting Cross Fields From 2D Visual Priors** | 交叉场 / 参数化 | ⭐⭐⭐ |
| [2605.26149](https://arxiv.org/abs/2605.26149) | **AnySurf: Any Surface Generation with Directed Edge** | 开放曲面生成 | ⭐⭐⭐ |
| [2605.27308](https://arxiv.org/abs/2605.27308) | **PINNSur: PINNs for PDEs on Curved Surfaces** | 曲面 PDE / 几何处理 | ⭐⭐⭐ |
| [2605.26391](https://arxiv.org/abs/2605.26391) | **Garment Particles: 2D-3D Symmetric Garment Representation** | 服装几何表示 | ⭐⭐ |
| [2605.26949](https://arxiv.org/abs/2605.26949) | **DinoComplete: 3D Shape Completion with Semantic Priors** | 形状补全 | ⭐⭐ |

### 间接相关 / 周边

| ID | 标题 | 备注 |
|----|------|------|
| [2605.26137](https://arxiv.org/abs/2605.26137) | Deployable 3D Asset Generation | 3D资产生成 |
| [2605.26182](https://arxiv.org/abs/2605.26182) | BrickAnything: Geometry-Conditioned Brick Generation | 乐高/砖块结构 |
| [2605.25975](https://arxiv.org/abs/2605.25975) | F-RNG: Feed-Forward Relightable Neural Gaussians | 可重光照3DGS |
| [2605.27055](https://arxiv.org/abs/2605.27055) | SATA: Semantic-Aware Topology-Agnostic Character Animation | 角色动画 |
| [2605.27323](https://arxiv.org/abs/2605.27323) | Megakernel vs Wavefront GPU Path Tracing | GPU渲染 |
| [2605.26266](https://arxiv.org/abs/2605.26266) | Bias Correction for KV-Cache in Video Diffusion | 扩散模型 |

---

## 🏆 重点论文分析

### 1. CrossLift (2605.26062) — ⭐ 本日最值得关注

**核心方法**: 利用 2D 图像先验（text-to-image 模型）生成网格上的交叉场（cross field），用于参数化和四边化。

**创新点**:
- 不依赖手工设计的特征提取，而是借助预训练扩散模型的视觉先验
- 从 2D 图像中提取方向信号，反投影到 3D 网格表面
- 两步光滑插值：视图内插值 → 跨视图聚合

**几何处理意义**: 交叉场是参数化和四边网格生成的核心基础设施。该方法将视觉先验引入交叉场估计，是 [[NeurFrame-Continuous-Frame-Fields]] 和 [[sato-strips-tokens]] 之后的重要进展。

**开源预期**: 论文未提及代码链接，需关注后续。

---

### 2. AnySurf (2605.26149) — ⭐ 开放曲面生成

**核心方法**: 统一的开放曲面（open surface）生成框架，解决现有 field-based 方法在开放曲面上的双层结构缺陷。

**创新点**:
- 专门针对开放曲面（服装、鞋履、配饰）设计
- 避免 Trellis2 等方法中开放曲面的法线和拓扑错误

**几何处理意义**: 工业 3D 内容中大量存在开放曲面，开放曲面的高质量生成是逆向工程和 CAD 重建的关键环节。与 [[TopGen-Quadrilateral-Mesh-Generation]] 可对比阅读。

---

### 3. PINNSur (2605.27308) — 曲面 PDE 的神经求解

**核心方法**: 将 Physics-Informed Neural Networks (PINNs) 扩展到曲面偏微分方程，通过神经场近似曲面法向量，用投影算子表达曲面微分算子。

**创新点**:
- Mesh-free 的曲面 PDE 求解，避免 FEM 对网格质量的敏感性
- 适用于任意可定向流形，不依赖曲率或拓扑

**几何处理意义**: 曲面 PDE 是几何处理的核心工具（热传导、曲面平滑、Laplace-Beltrami 算子）。PINNs 作为 FEM 的替代方案值得关注，尤其适合复杂拓扑和高曲率区域。

---

## 🔧 开源库关联

| 开源库 | 相关函数/模块 | 关联论文 |
|--------|------------|---------|
| libigl | `cross_field_match`, `parameterization` | CrossLift |
| CGAL | `Surface_mesh_parameterization` | AnySurf, PINNSur |
| PyTorch Geometric | 曲面几何深度学习 | PINNSur |

---

## 📅 历史日报

- [[DAILY-2026-05-23]]
- [[DAILY-2026-05-20]]
- [[DAILY-2026-05-09]]
- [[DAILY-2026-05-01]]

---

> 🥬 由 wawaicai 自动生成 | 搜索源: arXiv cs.GR | 2026-05-27