---
title: "A Unified Differentiable Rendering Framework for Vector Graphics"
authors: ["Jingye Qiu", "et al."]
date: 2026-06-30
venue: "ECCV 2026"
status: important
tags: [渲染, 可微渲染, 向量图形, NURBS, 贝塞尔曲线]
links:
  arXiv: "https://arxiv.org/abs/2606.31764"
  PDF: "https://arxiv.org/pdf/2606.31764"
---

## 核心贡献

1. **NURBS Splatting** - 将平面有理曲线表示为连续高斯场的统一框架
2. 通过沿曲线参数域和闭合区域内部采样高斯
3. 将渲染重新表述为平滑累积过程，梯度稳定

## 技术方案

### 背景问题
- 平面有理样条的可微渲染基本上未被探索
- 现有可微向量渲染器主要关注贝塞尔曲线
- 依赖解析光栅化，梯度不稳定，灵活性有限

### NURBS Splatting方法
- 沿曲线采样高斯
- 闭合区域内部也采样高斯
- 渲染 = 平滑累积过程

### 自然支持的特性
- 长样条
- 有理权重
- 非均匀节点
- 闭合区域填充

## 应用场景

1. 书法重建 (Calligraphy reconstruction)
2. 矢量化框架 (Vectorization frameworks)
3. 长样条图像抽象化 (Long-spline image abstraction)

## 性能

- 比现有方法更稳定
- 重建质量更好

## 标签

#可微渲染 #向量图形 #NURBS #贝塞尔曲线 #ECCV2026
