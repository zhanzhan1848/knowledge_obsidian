---
title: "Learning View-Dependent Splatting Kernels"
authors: []
date: 2026-05
tags: [几何, 高斯溅射, 视图相关, 新视角合成]
arXiv: "2605.25426"
conference: "SIGGRAPH 2026"
---

# Learning View-Dependent Splatting Kernels

## 核心方法

提出一种可微分框架，自动学习基于溅射（splatting）管道中的视图相关 2D 内核，以改进新视角合成的重建质量和表示效率。

### 技术细节
- 体积基元: bounding ellipsoid + 3D kernel latent vector
- 投影网络: 输入 ellipsoid 属性和 3D kernel latent，输出 2D kernel latent
- 解码器: 基于 Mahalanobis 距离生成径向对称 2D kernel
- 联合优化: 神经网络与每基元属性联合优化

## 应用扩展
- 学习通用 2D 内核用于 2D splatting
- 图像表示

## 开源参考
- 3D Gaussian Splatting: 原始实现
- 可微分渲染: `diffdrr`, `Nerfstudio`

## 推荐度
⚠️ 谨慎评估（SIGGRAPH 2026，但主要是渲染/合成方向，非传统几何处理）

## 相关笔记
[[DP-GES: Depth Peeling for Gaussian-Enhanced Surfel Rendering]]