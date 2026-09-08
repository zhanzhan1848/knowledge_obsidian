---
tags: [点云, 纹理编辑, UV映射, 几何编辑, 神经表示]
---

# PointGT: Simultaneous Geometry and Texture Editing for Point-Based Representations

## 论文信息

| 属性 | 内容 |
|------|------|
| arXiv | [2609.03341](https://arxiv.org/abs/2609.03341) |
| 分类 | cs.CV, cs.GR |
| 日期 | 2026-09-03 |
| 会议 | ECCV 2026 |
| 项目 | [pointgt](https://zvict.github.io/pointgt/) |

## 核心问题

现有3D重建和视图合成方法（3DGS等）难以同时编辑几何和纹理。

## 核心方法

1. **点基3D表示** - 适合几何变形
2. **学习型UV映射技术** - 支持高分辨率纹理编辑
3. 同时编辑几何和纹理

## 关键创新点

- 点基表示 + UV映射结合
- 同时几何和纹理编辑
- 高渲染质量
- 与纯纹理编辑方法（如3DGS）兼容

## 开源实现

- 待发布

## 相关笔记

[[Self-Supervised-Surface-Consistency-Point-Editing]]

## 可行性分析

✅ **推荐实现**

- 点基几何+纹理联合编辑
- UV映射技术可用于参数化研究
- 可与WildFab等点云处理流程集成
