---
title: "Surface Quadrilateral Meshing from Integrable Odeco Fields"
authors: ["Mattéo Couplet", "Alexandre Chemin", "David Bommes", "Edward Chien"]
venue: "SGP 2026 (Symposium on Geometry Processing)"
date: 2026-04
tags: [网格处理, 四边形网格, 场引导, 可积函数, SGP2026]
links:
  arXiv: "https://arxiv.org/abs/2604.03889"
  doi: "https://doi.org/10.48550/arXiv.2604.03889"
  paper: ""
  project: ""
  code: ""
---

# 可积 Odeco 场生成曲面四边形网格

## 核心方法

本文提出基于**可积正交标架场**生成四边形网格的方法，利用**正交分解 (odeco) 张量**隐式表示对称性。

### 关键创新

1. **3D Odeco 可积性**：将 2D odeco 可积性公式推广到 3D
2. **有限元能量**：在有限元框架下定义面积和拉伸畸变能量
3. **自动奇异性**：优化过程自然创建和放置奇异性，无需用户放置
4. **特征对齐和尺寸约束**：支持用户定义的特征对齐和尺寸约束

## 算法复杂度

- 时间复杂度：O(n) 有限元优化
- 空间复杂度：O(n) 网格存储

## 技术要点

### Odeco 张量
- 正交分解的张量表示
- 隐式编码标架场对称性
- 保证正交（剪切自由）标架场

### 优化策略
- 面积畸变最小化
- 拉伸畸变最小化
- 自动奇异性管理

## 开源实现

- libigl: `quad_remeshing`, `frame_field` 相关函数
- CGAL: `Polygon_mesh_processing` 相关

## 相关笔记

[[四边形网格]], [[场引导网格生成]], [[奇异性处理]]

---

> 来源: arXiv:2604.03889 / SGP 2026
> 分析日期: 2026-06-09