---
tags: [几何, 凸分解, 碰撞检测, 刚体模拟, arXiv, 2026-02]
---

# Convex Primitive Decomposition for Collision Detection

## 核心方法

受二次网格简化启发，提出一种自底向上将输入网格分解为凸基元的算法，专为刚体模拟设计。该方法将凸基元拟合到复杂真实网格上，提供逼真的模拟性能，并保证完全包围输入表面。

## 算法要点

- **问题**: 碰撞对象创建耗时，需要手动放置基元
- **核心创新**: 自底向上凸基元分解，灵感来自 Quadric Error Metrics
- **优势**: 
  - 比 V-HACD 和 CoACD 更低 Hausdorff/Chamfer 距离
  - 不到 1/3 的复杂度（按总字节数）
  - 24 个模型测试，碰撞检测速度一致提升
- **保证**: 包围输入表面的凸包

## 数据集
- 60+ Sketchfab 模型

## 开源实现
- 论文代码: 待查找

## 相关笔记
[[2026-04-VisACD]]

## 元信息
- **arXiv**: [2602.07369](https://arxiv.org/abs/2602.07369)
- **日期**: 2026-02-07
- **作者**: Julian Knodt et al.
- **领域**: cs.GR
- **会议**: Eurographics 2026
