---
tags: [几何, 变形, 高斯辐射场, ARAP, 3DGS]
---

# As-Rigid-As-Possible Deformation of Gaussian Radiance Fields

## 论文信息
- **arXiv**: [2608.29538](https://arxiv.org/abs/2608.29538)
- **日期**: 2026-08-28

## 核心方法
提出交互式方法对 Gaussian Radiance Fields 进行 as-rigid-as-possible (ARAP) 变形。

## 技术要点
- **问题**: 现有方法通过几何编辑 Gaussians 来变形 3DGS，忽略辐射场栅格化最终图像的事实，导致伪影
- **方法**: 
  1. 对 Gaussians 执行几何编辑
  2. 优化 Gaussians 以确保其栅格化产生与变形辐射场相似的结果
- **径向特征**: 设计 radial features 数学描述变形前后辐射场的径向差异
- **自适应各向异性空间低通滤波器**: 防止采样时的混叠问题，保持变化非均匀采样间隔的场

## 几何算法
- As-Rigid-As-Possible (ARAP) 变形
- Gaussian Splatting 变形
- 辐射场一致性

## 相关笔记
[[2026-09-05-DVGC-Domain-Varying-Green-Coordinates-Cage-Deformation]]
[[2026-09-05-TileGS-Tile-Local-Depth-Binning-Gaussian-Splatting]]
