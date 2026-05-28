---
title: Gradient-Domain ReSTIR Path Tracing
authors: Wang et al. (NVIDIA)
date: 2026
source: Computer Graphics Forum (Eurographics) 2026
url: https://research.nvidia.com/labs/rtr/publication/wang2026gradient/
tags: [rendering, gradient-domain, path-tracing, ReSTIR, Eurographics2026]
status: unread
---

# Gradient-Domain ReSTIR Path Tracing

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Gradient-Domain ReSTIR Path Tracing |
| 作者 | Wang et al. (NVIDIA) |
| 来源 | Computer Graphics Forum (Eurographics) 2026 |
| 年份 | 2026 |
| 链接 | [原文](https://research.nvidia.com/labs/rtr/publication/wang2026gradient/) |

## 核心贡献
1. **首个实时梯度域渲染方法**: 将梯度域估计引入实时渲染
2. **Path space extension**: 在梯度图像渲染中引入新颖路径空间扩展，实现时空采样复用
3. **高度选择性空间复用**: 利用梯度图像的相对稀疏性实现高效复用

## 技术方案
- 梯度域渲染通过同时估计像素颜色差值来加速重构高频率
- ReSTIR G-PT = ReSTIR + 梯度域路径追踪
- 收敛图像仍需大量 spp，但结合去噪后效果显著

## 实验结论
- 在视觉和统计上均优于基线方法
- 首次实现实时梯度域渲染

## 可行性分析
- 实现难度：中（结合 ReSTIR 和梯度域技术）
- 性能预期：高质量全局光照，适合实时应用
- 适用场景：实时全局光照、路径追踪去噪

## 相关工作
- [[ReSTIR PT Enhanced]] [[Stochastic Pairwise MIS]] [[Gradient-Domain Rendering]]