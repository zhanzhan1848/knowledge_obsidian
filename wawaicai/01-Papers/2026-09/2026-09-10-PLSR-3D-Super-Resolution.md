---
tags: [几何, 3D-超分辨率, diffusion, mesh-generation, point-cloud]
date: 2026-09-10
domain: geometry
conference: arXiv
authors: [Yuxin Liu, Minshan Xie, Jiawen Liang, Runsong Zhu, Chi-Wing Fu, Tien-Tsin Wong]
---

# PLSR: Progressive and Localized Super-Resolution of 3D Objects via Localized Latent Voxel Diffusion

## 核心方法

**PLSR** — 基于扩散模型的 3D 超分辨率框架，将全局 SR 分解为局部子任务。

**Pipeline:**
1. 预训练 3D 生成器提供粗几何
2. Associative input decomposition scheme 分解全局 SR → 局部子任务
3. Flow-based 3D 生成器 fine-tune → localized super-resolution model
4. Iterative patch-wise denoising → 无缝高分辨率输出

## 关键创新点

- Progressive + localized 设计：效率 + 质量平衡
- Patch-wise denoising 支持任意分辨率
- 计算成本显著降低

## 推荐度

⚠️ **谨慎评估** — 主要是生成式方法，与传统几何处理关系较弱，但涉及几何超分辨率，有参考价值。

## 链接

- arXiv: https://arxiv.org/abs/2609.06436
- 2026-09-06 提交
