---
title: "LTM: Large-scale Terrain Model for Landscapes"
authors: []
date: 2026-07-10
tags: [几何, 地形重建, 大规模, DEM, 灾害响应]
categories: [Terrain Reconstruction, Remote Sensing]
arxiv: "2607.08711"
---

# LTM: Large-scale Terrain Model for Landscapes

## 核心方法

**Multi-modal Reconstruction Framework** - 利用过时的 DEM 作为几何先验进行图像 3D 重建。

### 关键创新

1. **Physics-based Pixel-Pixel Alignment**
   - 图像与 DEM 数据之间的物理对齐
   - 消除昂贵的特征匹配计算
   - 显著降低计算复杂度

2. **Cross-modality Landscape Mapping**
   - Vertical: 历史大规模 DEM baseline
   - Horizontal: 基于学习的单目深度估计
   - 自动识别变化区域

## 应用场景

- 野火响应 - 地形燃料图
- 植被动态监测
- 灾害预警系统

## 技术特点

- Real-time performance
- High-fidelity depth maps
- 适用于稀疏特征和低纹理自然场景

## 开源参考

- 数据集: 基于真实野火易发区域的大规模地形模拟器

## 相关笔记

[[Terrain Reconstruction]], [[Multi-modal]], [[Disaster Response]]

---
*Created: 2026-07-10*
*Source: arXiv cs.GR*
