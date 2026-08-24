---
title: "RADmesh: Remesh-Aware Mesh Deformation"
authors: Nam Anh Dinh et al.
date: 2026-08-17
tags: [几何, 网格处理, 网格变形, 重网格化, 生成模型]
categories: [Mesh Deformation, Remeshing, Text-to-3D]
arxiv: "2608.17182"
conference: ECCV 2026 Oral
---

# RADmesh: Remesh-Aware Mesh Deformation

## 核心方法

提出**首个将重网格化（Remeshing）嵌入生成式网格变形流程**的方法，解决视觉损失监督下剧烈变形导致网格质量下降的问题。

### 问题背景
- 网格在大变形下三角化质量容易恶化
- 现有生成式/文本驱动的变形方法不改变三角化
- 重网格化是离散操作，难以与噪声视觉损失梯度耦合

### 解决方案
1. 提出**顶点级别变形优化量**（vertex-based deformation optimization quantity）：支持大变形且对噪声鲁棒
2. **周期性重网格化**：使用各向同性重网格器（isotropic remesher）保持变形状态连续性
3. 从粗到细逐步增加分辨率

## 关键创新

| 创新点 | 描述 |
|--------|------|
| 顶点变形优化量 | 大变形 + 噪声鲁棒 |
| Remeshing + Deformation耦合 | 三角化拟合优化后的几何 |
| 局部化能力 | 可在基础形状上生长新特征 |
| 三角形效率 | 优化后的三角形分布更合理 |

## 应用场景

- 文本驱动的网格变形（Text-to-Mesh）
- 图像驱动的网格变形（Image-to-Mesh）
- 局部特征添加（无需重新生成整体）
- 关节物体创建（articulated object creation）
- 结构化场景组合

## 项目链接

- Project Page: https://threedle.github.io/radmesh
- GitHub: 待查找

## 相关技术

- Mesh Deformation / Mesh Editing
- Isotropic Remeshing
- Visual Losses / Perceptual Losses
- Coarse-to-fine Optimization
- Text-to-3D / Image-to-3D

## 关联笔记

[[网格变形]]
[[重网格化]]
[[Text-to-3D]]
[[各向同性网格优化]]
