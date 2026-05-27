---
title: "CrossLift — Lifting Cross Fields From 2D Visual Priors"
date: 2026-05-26
tags: [几何, 交叉场, 参数化, 四边化, 视觉先验, mesh, cross-field]
---

# CrossLift: Lifting Cross Fields From 2D Visual Priors

**arXiv**: [2605.26062](https://arxiv.org/abs/2605.26062)  
**领域**: 交叉场估计 / 参数化 / 四边网格生成  
**发表**: 2026-05-26

---

## 核心方法

CrossLift 利用预训练 text-to-image 扩散模型的视觉先验来估计 3D 网格上的交叉场（cross field）。

### 流程
1. **2D 方向提取**: 利用 text-to-image 模型合成特征对齐的四边化网格图像，从像素级方向场提取方向信号
2. **视图内插值**: 将 2D 方向反投影到 3D 曲面，在每个视图内进行光滑插值
3. **跨视图聚合**: 融合多个视角的方向建议，使用基于置信度的权重

### 关键创新
- 不依赖手工特征（曲率、边缘检测），而是借助大规模预训练视觉模型的语义理解能力
- 自定义置信度权重机制，平衡不同视图方向的贡献

---

## 复杂度分析

- **时间复杂度**: O(n) 视图插值 + O(k) 跨视图聚合（k=视图数）
- **空间复杂度**: O(n) 网格存储 + O(m) 图像特征存储（m=视图像素数）

---

## 几何处理意义

交叉场是以下应用的核心:
- **参数化** (UV 展开)
- **四边网格生成** (Quad Meshing)
- **重网格化** (Remeshing)
- **曲线生成** (Singularities / Cone Points)

CrossLift 将 AIGC 视觉先验引入传统几何处理基础设施，是一个值得关注的跨方向结合。

---

## 相关笔记

- [[NeurFrame-Continuous-Frame-Fields]] — 神经交叉场
- [[sato-strips-tokens]] — strips tokens 四边化
- [[Dual-Latent-Diffusion-Polycube-Hexahedral-Mesh]] — 多面体/六面体网格

---

## 开源参考

- libigl: `cross_field_match.cpp`
- CGAL: `Cross_field_2` 模块

---

> 🥬 wawaicai | 2026-05-27