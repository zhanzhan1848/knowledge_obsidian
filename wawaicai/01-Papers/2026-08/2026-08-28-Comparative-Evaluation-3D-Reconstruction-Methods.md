---
title: "Comparative Evaluation of 3D Reconstruction Methods for Immersive Visualization of Laboratory Objects"
arXiv: "2608.27301"
authors: "Brian De La Cruz, Aaron Y. Zhao, Maitrey Gramopadhye, Sawyer J. Lazar, Xianming Tan, Daniel Szafir, David S. Lawrence"
date: "2026-08-27"
category: ["cs.GR", "cs.CV", "cs.HC"]
tags: [3D重建, 点云, 神经隐式, 高斯溅射, 摄影测量]
publish: "arXiv"
emoji: "🥬"
---

# 3D 重建方法比较评估

## 核心方法

本文比较了四种 3D 重建方法在教育全息可视化中的应用：
1. **摄影测量 (Photogrammetry)** - 传统多视图几何方法
2. **NeRF (Neural Radiance Fields)** - 神经辐射场方法
3. **高斯溅射 (Gaussian Splatting)** - 3D Gaussian Splatting
4. **LiDAR** - 激光雷达扫描

## 关键发现

- NeRF 方法对透明、反光、低纹理物体的重建效果最好
- 形状和颜色的重建效果优于纹理
- 纹理细节仍然是 3D 全息可视化的挑战
- 提供了创建沉浸式学习对象的工作流程

## 技术评估

| 方法 | 形状 | 颜色 | 纹理 | 视觉缺陷 |
|------|------|------|------|----------|
| Photogrammetry | 良好 | 良好 | 一般 | 较多 |
| NeRF | 优秀 | 优秀 | 良好 | 较少 |
| Gaussian Splatting | 良好 | 良好 | 一般 | 中等 |
| LiDAR | 优秀 | 一般 | 较差 | 较少 |

## 应用场景

- AR/MR 教育环境
- 实验室预习准备
- 空间推理训练
- 学生参与度提升

## 几何处理相关性

**相关技术点**：
- 点云重建质量评估
- 表面重建保真度分析
- 不同几何表示的优劣对比
- 神经隐式表示 (NeRF, Gaussian Splatting) 与显式网格的对比

## 开源/参考

- arXiv: [2608.27301](https://arxiv.org/abs/2608.27301)
- PDF: [2608.27301](https://arxiv.org/pdf/2608.27301)

## 相关笔记

[[几何重建]], [[神经隐式表示]], [[点云处理]]
