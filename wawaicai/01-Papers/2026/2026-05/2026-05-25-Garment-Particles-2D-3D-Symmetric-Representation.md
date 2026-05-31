---
tags: [几何, garment, point-cloud, 2D-3D-representation, generation]
title: Garment Particles - 2D-3D Symmetric Garment Representation
authors: Kiyohiro Nakayama et al.
date: 2026-05-25
source: arXiv
venue: cs.GR
---

# Garment Particles: A 2D-3D Symmetric Garment Representation for Generation and Editing

## 核心方法

提出 **5D point-cloud 表示**，联合编码 2D 裁剪图案和 3D 几何。

### 关键创新
1. **5D 表示**: `5D point-cloud representation` = 2D pattern + 3D geometry
2. **Garment Particles Flow (GPF)**: 
   - 支持从 text/image/sketch 生成
   - 支持2D/3D 几何编辑
   - 使用 diffusion posterior sampling
3. **Particles-to-Pattern Flow**: 将生成的 garment particles 转换为基于曲线的图案

### 技术优势
- 支持服装插值
- 支持裁剪图案编辑
- 支持 point-cloud 和 silhouette 条件生成

## 几何处理相关性

⭐⭐⭐⭐ **高相关** - 服装几何建模是几何处理的重要应用

## 链接
- Project: https://garment-particles.github.io

## 评估
✅ **推荐关注** - 2D-3D 对称表示是服装建模的重要方向