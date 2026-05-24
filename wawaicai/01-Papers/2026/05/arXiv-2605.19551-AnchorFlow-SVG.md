---
title: "Editable SVG Reconstruction via Sparse Anchor Point Fields"
authors: []
date: 2026-05-19
venue: arXiv cs.GR
tags: [几何, SVG, 向量图形, 锚点优化]
---

# Editable SVG Reconstruction via Sparse Anchor Point Fields

## 核心方法

提出 **AnchorFlow**，通过稀疏锚点场建模路径级锚点放置，实现保真度与可编辑性的平衡。

### 技术要点

1. **问题**: 现有方法在向量结构参数化上存在权衡
   - 高保真方法依赖多路径或密集参数化曲线
   - 紧凑 SVG 生成可能偏离输入几何
2. **解决方案**: 
   - 预测图像条件稀疏锚点场
   - 解析为有序 Bezier 路径
   - 渲染引导反馈纠正局部结构错误

## 推荐结论

❌ **不推荐** - 主要应用于 2D 向量图形，与网格处理关联较弱

## 相关技术

- [[Vector Graphics]], [[Bezier Curves]], [[Image-to-SVG]]