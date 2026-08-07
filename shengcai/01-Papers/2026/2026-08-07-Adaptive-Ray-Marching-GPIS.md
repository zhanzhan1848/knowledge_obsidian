---
title: Adaptive Ray Marching for Rendering Gaussian Process Implicit Surfaces
authors: Zhou, Seyb, Zhao
date: 2026-07-19 (SIGGRAPH 2026)
source: SIGGRAPH 2026 Conference Paper
url: https://dl.acm.org/doi/10.1145/3799902.3811101
pdf: (ACM Digital Library)
tags: [rendering, ray marching, implicit surfaces, Gaussian process, SIGGRAPH 2026]
status: unread
---

# Adaptive Ray Marching for Rendering Gaussian Process Implicit Surfaces

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Adaptive Ray Marching for Rendering Gaussian Process Implicit Surfaces |
| 作者 | Zhou, Seyb, Zhao |
| 来源 | SIGGRAPH 2026 Conference Paper |
| 年份 | 2026 |
| 链接 | [原文](https://dl.acm.org/doi/10.1145/3799902.3811101) |
| DOI | 10.1145/3799902.3811101 |

## 核心贡献
1. 针对 Gaussian Process Implicit Surfaces (GPIS) 的自适应射线行进方法
2. 利用 GPIS 的概率不确定性信息引导射线采样
3. 实现高质量的 GPIS 渲染

## 技术方案
**背景**：
- Gaussian Process Implicit Surfaces (GPIS) 是从点云数据构建连续曲面的概率方法
- GPIS 提供不确定性估计，可在渲染时利用

**方法**：
- 自适应射线行进：根据局部不确定性调整采样步长
- 不确定性高的区域使用更细粒度的采样
- 保持渲染质量同时提高效率

## 可行性分析
- 实现难度：中
- 性能预期：优于传统固定步长射线行进
- 适用场景：基于概率建模的隐式曲面渲染

## 相关工作
- 射线行进 (Ray Marching)
- 隐式曲面渲染
- Gaussian Process Implicit Surfaces

## 笔记
SIGGRAPH 2026 论文，将 Gaussian Process 的不确定性估计与射线行进结合，实现自适应采样。这是射线行进技术在概率建模领域的新应用。
