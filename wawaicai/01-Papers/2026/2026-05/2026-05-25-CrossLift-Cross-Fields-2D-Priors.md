---
tags: [几何, mesh, cross-field, quad-mesh, remeshing]
title: CrossLift - Cross Field from 2D Visual Priors
authors: Dale Decatur et al.
date: 2026-05-25
source: arXiv
venue: cs.GR
---

# CrossLift: Lifting Cross Fields From 2D Visual Priors

## 核心方法

利用 text-to-image priors 在 2D 图像中合成特征对齐的四边形网格，从中提取 per-pixel directions，然后 back-project 到网格表面。

### 技术流程
1. **2D Visual Prior**: 使用预训练的 text-to-image 模型生成特征对齐图像
2. **方向提取**: 从2D 图像中提取 per-pixel directions
3. **View 内插值**: 在每个视图内平滑插值候选方向
4. **Cross View 聚合**: 跨多个视图聚合方向
5. **Confidence-based 加权**: 解决同一面上候选方向的冲突

### 关键创新
- **Modular**: 可与多种 2D visual priors 配合使用
- **Texture-aligned quad meshing**: 支持纹理对齐的四边形网格
- **Interactive cross-field design**: 支持用户绘制粗略线条作为信号

## 复杂度分析
- 时间：待评估
- 空间：O(n) where n = mesh faces

## 开源实现
- Project: https://crosslift.github.io/
- GitHub: 待确认

## 相关技术
- Cross Field: 四边形网格生成的基石
- Quad Meshing: 自动四边形网格生成
- Field-guided meshing

## 几何处理相关性

⭐⭐⭐⭐⭐ **直接相关**

本文是 **quad remeshing** 领域的直接贡献，cross field 是生成高质量四边形网格的关键技术。

## 应用场景
- 纹理映射对齐
- 四边形网格生成
- 交互式 cross-field 设计

## 评估
✅ **推荐实现** - 技术路线清晰，与 libigl 的 quad remeshing 功能可结合