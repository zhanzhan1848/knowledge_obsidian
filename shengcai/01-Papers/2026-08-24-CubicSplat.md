---
title: "Differentiable Vector Graphics via Error-Bounded Forward Relaxation"
authors: Chenglong Liu
date: 2026-08-21
source: arXiv cs.GR (ECCV 2026 Oral)
url: https://arxiv.org/abs/2608.20803
pdf: https://arxiv.org/pdf/2608.20803
tags: [rendering, paper, 2026, differentiable-rendering, vector-graphics, rasterization, ECCV]
status: unread
---

# Differentiable Vector Graphics via Error-Bounded Forward Relaxation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Differentiable Vector Graphics via Error-Bounded Forward Relaxation |
| 作者 | Chenglong Liu |
| 来源 | arXiv cs.GR (ECCV 2026 Oral) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.20803) |
| PDF | [下载](https://arxiv.org/pdf/2608.20803) |

## 核心贡献
1. **CubicSplat**: 可微分矢量光栅化器，用均匀多线段替代 Bézier 最近点求解器
2. **误差边界**: 几何误差有界 O(S⁻²)
3. **稳定梯度**: 静态计算图，梯度条件良好
4. **合成推导的可见性机制**: 无需辅助正则化即可剪枝退化图元

## 技术方案

### 核心问题：梯度跷跷板
- 提升正向几何精确性的设计选择会系统性地降低梯度信号质量，反之亦然
- 现有方法需要越来越复杂的启发式来平滑前向传递

### CubicSplat 方法
- 用均匀多线段（uniform polyline）替代 Bézier 最近点求解器
- 几何误差 O(S⁻²)
- 静态计算图 → 梯度自然良态
- 合成推导可见性机制剪枝退化图元
- 无需辅助正则化

### 公式
```math
\text{geometric error} = O(S^{-2})
```

## 实验结论
- **DIV2K 和 Kodak 基准**: 在闭合填充设置下实现 SOTA 重建质量
- **PSNR 提升**: 超过 2 dB
- **训练速度**: 比先前方法快 4 倍
- **代码**: https://github.com/CubicSplat/repo

## 局限性
- 主要针对 2D 矢量图形，对 3D 渲染需进一步扩展

## 可行性分析
- 实现难度：中（有开源代码）
- 性能预期：训练速度 4x 提升
- 适用场景：矢量图形优化、Logo 设计、字体生成、DIV2K/Kodak 图像重建

## 相关工作
- [[可微分渲染]]
- [[矢量图形]]
- [[Bézier曲线]]
- [[ECCV 2026]]

## 笔记
ECCV 2026 Oral 论文。本文解决了可微分矢量渲染中梯度不稳定的根本问题，通过引入误差有界的多线段近似替代 Bézier 求解器。技术路线简洁有效，实验数据扎实，开源代码已公开。对于渲染研究有参考价值。
