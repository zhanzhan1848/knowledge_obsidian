---
title: "QuadLink: Autoregressive Quad-Dominant Mesh Generation via Point-Relation Learning"
date: 2026-05-16
authors: Yiheng Zhang, Zhe Zhu et al.
arXiv: "2605.16813"
tags: [quad-mesh, point-cloud, mesh-generation, deep-learning]
conference: arXiv 2026
---

# QuadLink: Autoregressive Quad-Dominant Mesh Generation

## 核心思想

从点云生成**生产级四边主导网格**的挑战：
- 现有方法只能生成纯三角网格或各向同性四边网格
- 难以生成各向异性、边缘流对齐的四边网格

**解决方案**: 三阶段链接框架
1. 预测统一锚点集（顶点 + 面质心）
2. 学习质心条件链接（顶点 ↔ 面质心）
3. 四边优先策略组装多边形面

## 算法架构

### 阶段1: 锚点预测
```
Point Cloud → Encoder → Anchor Points (vertices + centroids)
```

### 阶段2: 链接学习
```
Anchors → Centroid-conditioned Link Predictor → Vertex-Centroids Links
```

### 阶段3: 面组装
```
Links → Quad-first Assembly → Quad-dominant Mesh
```

### Tri-to-Quad算子

将艺术三角网格转换为四边主导训练数据：
1. 全局合并选择
2. 拓扑优化
3. 质量评估

## 实验结果

| 数据集 | 指标 | 对比 |
|--------|------|------|
| 点云 | 几何保真度 | 优于SOTA |
| 艺术网格 | 拓扑质量 | 显著提升 |
| 混合 | 泛化能力 | 支持n-gon |

## 可行性评估

- **算法复杂度**: O(n) 推理
- **实现难度**: 中 — 需要图神经网络基础
- **依赖项**: PyTorch Geometric, libigl
- **推荐度**: ⭐⭐⭐⭐ — 生产级四边网格生成

## 技术亮点

1. **链接范式**: 点关联网格生成新思路
2. **四边优先**: 保证边缘流对齐
3. **混合拓扑**: 支持任意n-gon

## 开源相关

- libigl: `quadrification` 相关函数
- CGAL: `Polygon_mesh_processing`

## 相关技术

- [[Mesh Generation]] — 网格生成
- [[Quad Remeshing]] — 四边重网格化
- [[Point Cloud Processing]] — 点云处理