---
tags: [几何, 发丝建模, 大重建模型, 三维建模]
created: 2026-06-20
source: arXiv cs.GR (ACM SIGGRAPH 2026 Conference Paper)
---

# Strand-based Hair Modeling via Large Reconstruction Models

## 核心方法

使用 **Large Reconstruction Models (LRMs)** 作为结构锚点，结合 **Dual Orientation AutoEncoder** 将粗糙几何升频为高保真发丝。解决从 2D 图像推断复杂 3D 场的问题 — 全局遮挡（如马尾）和局部方向性（如卷发）的歧义问题。

## 关键创新点

1. **Large Reconstruction Model 作为结构锚点** — 利用 LRM 的强几何先验
2. **Dual Orientation AutoEncoder** — 提升粗糙几何为高保真发丝
3. **latent-space optimization** — 解决向量场奇异性
4. **surface-guided refinement** — 表面引导细化，解纠缠复杂拓扑结构

## 论文信息
- arXiv: [2606.15238](https://arxiv.org/abs/2606.15238)
- ACM SIGGRAPH 2026 Conference Paper

## 相关笔记
[[发丝建模]]
[[神经隐式表示]]
[[三维重建]]