---
title: Improving Order-Independent Transparency 3DGS via Active Set Method
authors: Wentao Yang et al.
date: 2026-05-07
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.13855
pdf: https://arxiv.org/pdf/2605.13855
tags: [rendering, 3DGS, OIT, gaussian-splatting, transparency, 2026]
status: unread
---

# Improving Order-Independent Transparency 3DGS via Active Set Method

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Improving Order-Independent Transparency 3DGS via Active Set Method |
| 作者 | Wentao Yang et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.13855) |
| PDF | [下载](https://arxiv.org/pdf/2605.13855) |

## 核心贡献
1. 提出**SparseOIT**：基于OIT的3DGS重建算法，维护活跃高斯集合
2. 利用OIT修改后的渲染方程使高斯 splats 之间依赖稀疏，可通过 active set 方法优化
3. 加速比与潜在稀疏度成正比

## 技术方案

### 观察到的问题
3DGS使用体积渲染，不适合非兰伯材质或透明物体。OIT方法移除了深度排序步骤，但OIT修改对渲染方程的影响尚未充分探索。

### 核心洞察
OIT对渲染方程的修改显著降低了单个高斯 splats 之间的依赖性，产生非常稀疏的变量依赖，可以通过 active set 方法等特定优化技术加以利用。

### SparseOIT 设计
- 联合考虑OIT渲染方程、重建算法和几何正则化
- 维护活跃高斯集合
- 利用稀疏加速比

## 实验结论
- 在OIT系列方法中大幅领先
- 达到与基于体积渲染的SOTA 3DGS重建方法相当的性能

## 可行性分析
- 实现难度：**中**
- 性能预期：大幅提升透明物体渲染质量
- 适用场景：透明/半透明物体渲染、非兰伯材质、烟雾、火焰等

## 相关工作
- 3D Gaussian Splatting (3DGS)
- Order-Independent Transparency (OIT)
- 神经渲染

## 标签
#3DGS #透明渲染 #OIT #高斯泼溅 #神经渲染