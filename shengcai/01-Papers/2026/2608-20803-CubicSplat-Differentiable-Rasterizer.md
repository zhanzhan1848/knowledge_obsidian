---
title: "Differentiable Vector Graphics via Error-Bounded Forward Relaxation"
authors: [Chenglong Liu et al.]
date: 2026-08-21
status: 待读
tags: [渲染, 可微渲染, 向量图形, ECCV 2026]
keywords: [differentiable rendering, vector graphics, Bezier, ECCV 2026]
links:
  arXiv: https://arxiv.org/abs/2608.20803
  PDF: https://arxiv.org/pdf/2608.20803
  Code: https://github.com/CubicSplat/repo
reviewDate: 2026-08-25
---

# Differentiable Vector Graphics via Error-Bounded Forward Relaxation

## 元信息
| 项目 | 内容 |
|------|------|
| 作者 | Chenglong Liu et al. |
| 发表 | arXiv cs.GR, ECCV 2026 Oral |
| 链接 | [arXiv](https://arxiv.org/abs/2608.20803) |

## 核心贡献

**CubicSplat**：可微分向量光栅化器，替代 Bézier 最近点求解器为均匀多段线代理，几何误差界为 $O(S^{-2})$。

### 问题：梯度跷跷板

设计选择提高正向几何精确性可能系统性降低梯度信号，反之亦然。

CubicSplat 解决方案：
- **均匀多段线代理**替代 Bézier 最近点求解器
- 静态计算图，梯度条件良好
- 复合派生可见性机制，无需辅助正则化即可剪枝退化图元

## 技术方案

### 核心公式

```math
\text{几何误差} = O(S^{-2})
```

其中 $S$ 是多段线的分段数。

### 方法优势

1. **静态计算图** → 梯度条件良好
2. **复合派生可见性机制** → 自动剪枝退化图元
3. **无需辅助正则化**

## 实验结论

### 基准测试

- **DIV2K** 数据集
- **Kodak** 数据集

### 结果

| 指标 | CubicSplat | 之前最佳方法 |
|------|------------|--------------|
| PSNR (closed-fill) | SOTA | - |
| 提升 | >2 dB | baseline |
| 训练速度 | 4x faster | prior methods |

- 在 closed-fill 设置中实现 **2 dB 以上 PSNR 提升**
- 训练速度比之前方法**快 4 倍**

## 实用性评估

- **创新性**：⭐⭐⭐⭐⭐ 可微向量渲染创新
- **实用性**：⭐⭐⭐⭐⭐ ECCV 2026 Oral
- **实现难度**：中

## 相关工作

- Differentiable Rendering
- Vector Graphics
- Bezier Curves
- Monte Carlo Gradient Estimation

## 备注

- 27 pages, 8 figures, 7 tables
- ECCV 2026 Oral
- 代码开源
