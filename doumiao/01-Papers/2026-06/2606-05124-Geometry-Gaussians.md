---
title: Geometry Gaussians: Decoupling Appearance and Geometry in Gaussian Splatting
authors: Hongyu Zhou, Zorah Lähner
date: 2026-06-03
tags: [Gaussian Splatting, 3DGS, Rendering, Geometry, Transparent Objects]
cite: arXiv:2606.05124
source: arXiv cs.GR
category: Rendering Technique
---

## 核心创新

## 方法

### 问题定义
3D Gaussian Splatting (3DGS) 在新视角合成方面取得成功，但直接从 3DGS 提取几何信息仍然具有挑战性，且往往会影响外观渲染质量。

### 解决方案
提出为每个 splat 添加单一的额外几何不透明度参数，配合可选的透明度优化管道。

## 关键技术

### 几何不透明度参数
- 每个 splat 增加 geometry opacity 参数
- 分离外观和几何表示

### 透明度优化管道
- 可选的优化策略
- 针对透明物体复杂场景特别有效

## 实验结果

### 数据集表现
- 多种数据集上渲染和几何性能均提升
- 透明物体复杂场景效果显著提升

### Ground-truth 和 VFM 输入
- 使用完整 ground-truth 纹理和几何信息训练验证
- Vision Foundation Model 几何输入也能取得良好效果

## 与流体渲染的关联

- 透明物体渲染技术可应用于水体渲染
- 几何/外观解耦对体积渲染有参考价值
- 泡沫、飞溅等透明粒子效果可借鉴

## 链接
- [arXiv](https://arxiv.org/abs/2606.05124)
- [PDF](https://arxiv.org/pdf/2606.05124)