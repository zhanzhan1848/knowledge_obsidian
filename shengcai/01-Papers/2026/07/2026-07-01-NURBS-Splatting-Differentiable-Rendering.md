---
title: A Unified Differentiable Rendering Framework for Vector Graphics
authors: Jingye Qiu et al.
date: 2026-06-30
source: arXiv cs.GR (ECCV 2026)
url: https://arxiv.org/abs/2606.31764
pdf: https://arxiv.org/pdf/2606.31764
tags: [rendering, differentiable-rendering, NURBS, vector-graphics, 2026]
status: unread
---

# A Unified Differentiable Rendering Framework for Vector Graphics

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | A Unified Differentiable Rendering Framework for Vector Graphics |
| 作者 | Jingye Qiu et al. |
| 来源 | arXiv cs.GR, ECCV 2026 |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2606.31764) |

## 核心贡献
1. **NURBS Splatting** - 将平面有理曲线表示为连续Gaussian场
2. 通过沿曲线参数域和闭合区域内采样Gaussians进行渲染
3. 稳定梯度 - 重构为平滑累积过程
4. 支持长样条、有理权重、非均匀节点、闭合区域填充

## 技术方案
- 将NURBS曲线表示为连续Gaussian场
- 沿曲线采样Gaussians + 闭合区域内采样
- 渲染 = 光滑累积过程 → 稳定梯度
- 支持：Bezier曲线、长样条、有理权重、非均匀节点

## 应用场景
- 书法重建 (calligraphy reconstruction)
- 矢量化框架 (vectorization)
- 长样条图像抽象化

## 实验结论
- 相比现有方法提高稳定性和重建质量
- Improved stability and reconstruction quality

## 可行性分析
- 实现难度：中
- 性能预期：实时
- 适用场景：矢量图形处理、书法重建

## 相关工作
- [[NURBS]] - Non-Uniform Rational B-Splines
- [[Differentiable-Rendering]]

## 笔记
ECCV 2026接收，关注NURBS曲线的可微渲染
