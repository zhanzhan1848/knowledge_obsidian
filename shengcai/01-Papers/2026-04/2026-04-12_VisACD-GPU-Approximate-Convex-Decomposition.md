---
title: Visibility-Based GPU-Accelerated Approximate Convex Decomposition
authors: Egor Fokin
date: 2026-04-05
source: arXiv cs.GR
url: https://arxiv.org/abs/2604.04244
pdf: https://arxiv.org/pdf/2604.04244
tags: [rendering, geometry, GPU, collision-detection, ACD, paper, 2026]
status: unread
---

# Visibility-Based GPU-Accelerated Approximate Convex Decomposition

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Visibility-Based GPU-Accelerated Approximate Convex Decomposition |
| 作者 | Egor Fokin |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.04244) |
| PDF | [下载](https://arxiv.org/pdf/2604.04244) |

## 核心贡献
1. 提出 VisACD，一种基于可见性的、旋转等变的、无交叉的 ACD 算法
2. GPU 加速的近似凸分解，比之前的工作更高效
3. 生成的凸部件数量更少，且对输入网格方向不敏感

## 技术方案
- **问题**：碰撞检测中碰撞体几何粒度的权衡——原始网格精确但计算昂贵，基元碰撞体高效但不准确
- **方法**：Visibility-based ACD，使用 GPU 加速
- **关键特性**：旋转等变（rotation-equivariant）、无交叉（intersection-free）
- 支持并行处理凸分解

## 实验结论
- 产生高质量分解，凸部件数量更少
- 对输入网格方向不敏感（解决了 prior works 的 orientation sensitivity 问题）
- 比之前的工作效率更高

## 局限性
- 专注于静态网格的分解
- 可能对非常复杂的网格需要更多部件

## 可行性分析
- 实现难度：中
- 性能预期：GPU 加速，实时可行
- 适用场景：游戏引擎碰撞检测、物理模拟加速

## 相关工作
- [[近似凸分解相关论文]]
- [[碰撞检测相关论文]]

## 笔记
VisACD 对渲染引擎中的碰撞检测优化有直接价值。凸分解是实时渲染系统中常用的优化技术。
