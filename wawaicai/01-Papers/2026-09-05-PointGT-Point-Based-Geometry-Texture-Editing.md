---
tags: [几何, 点表示, 编辑, 纹理, UV映射, ECCV2026]
---

# PointGT: Simultaneous Geometry and Texture Editing for Point-Based Representations

## 论文信息
- **arXiv**: [2609.03341](https://arxiv.org/abs/2609.03341)
- **会议**: ECCV 2026
- **作者**: Yanshu Zhang et al.
- **日期**: 2026-09-03

## 核心方法
提出 PointGT，点基 3D 表示，支持几何和外观的同步编辑。结合适合几何变形的点基表示与学习 UV 映射技术，实现高分辨率纹理编辑。

## 技术要点
- **问题**: 现有重建和视图合成技术产生高质量照片级体积 3D 表示，但难以编辑；3DGS 的纹理编辑方法与几何编辑不兼容
- **解决**: 
  - 点基表示适合几何变形
  - 学习 UV 映射技术实现高分辨率纹理编辑
- **效果**: 在点基神经表示中实现精细几何和纹理编辑，高渲染质量

## 几何算法
- 点基表示 (point-based representation)
- UV 映射 (UV mapping)
- 几何变形 (geometry deformation)

## 开源实现
- 项目页面: https://zvict.github.io/pointgt/

## 相关笔记
[[2026-09-05-Self-Supervised-Surface-Consistency-Point-Editing]]
