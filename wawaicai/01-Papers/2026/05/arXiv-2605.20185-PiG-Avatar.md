---
title: "PiG-Avatar: Hierarchical Neural-Field-Guided Gaussian Avatars"
authors: []
date: 2026-05-14
venue: arXiv cs.GR (更新)
tags: [几何, 高斯溅射, 神经场, 化身重建]
---

# PiG-Avatar: Hierarchical Neural-Field-Guided Gaussian Avatars

## 核心方法

使用神经场将化身表示为锚定在体积规范空间中的高斯，解除与模板曲面的耦合。

### 技术要点

1. **现有方法问题**: 基于身体模板曲面参数化几何，限制了分层、离体、非刚性服装几何的捕捉
2. **解决方案**: 
   - 仅使用参数化身体模型进行运动传输
   - 在连续神经场控制的体积规范空间中表示高斯
   - 通过 3D 重心坐标锚点传输保持运动连贯性

### 关键创新

1. **双重层次空间连贯优化**
   - Sobolev 预条件化神经场更新
   - 基于 KNN 的规范锚点几何预条件化
2. **自组织锚点密度**
   - 锚点自然迁移到高曲率、 appearance 变化和非连贯运动区域
3. **分层重建**
   - 粗级监督通过共享场和耦合锚点图传播到更细级别

## 推荐结论

⚠️ **谨慎评估** - 主要应用于渲染和化身，非核心几何处理

## 相关技术

- [[Gaussian Splatting]], [[Neural Fields]], [[Avatar Reconstruction]], [[Mesh Parameterization]]