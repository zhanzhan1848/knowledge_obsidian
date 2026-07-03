---
title: "Intrinsic Decomposition and Editing of 3D Gaussian Splats"
authors: ["George Drettakis", "et al."]
date: 2026-06-30
venue: "Proc. ACM Comput. Graph. Interact. Tech. 9, 1, Article 10 (May 2026)"
status: important
tags: [渲染, 高斯泼溅, 固有分解, 编辑, 神经渲染]
links:
  arXiv: "https://arxiv.org/abs/2606.31637"
  DOI: "https://doi.org/10.1145/3804495"
---

## 核心贡献

1. 将固有分解扩展到Gaussian Splatting表示的辐射场
2. 三个关键方面的解决方案：
   - 独立Gaussian图元集合建模固有分解
   - 数据驱动预测引导的优化程序
   - 编辑工作流

## 技术方案

### 1. 固有分解建模
- 将固有分解建模为独立Gaussian图元集合
- 每个集合可适应其表示层的特征

### 2. 优化程序
- 使用数据驱动预测指导
- 将多视角照片分解为固有集合

### 3. 编辑工作流
- 用户只需修改一张图像中平面表面的纹理
- 在固有辐射场中捕获编辑
- 可在任意视角下重新渲染编辑后场景

## 应用场景

- 修改物体颜色和纹理而不改变光照
- 支持视图依赖残差
- 长期用于图像编辑

## 标签

#高斯泼溅 #固有分解 #图像编辑 #神经渲染 #材质
