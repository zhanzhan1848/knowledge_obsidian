---
title: Stochastic Pairwise MIS for Unbiased Large-Kernel Reuse in Real Time
authors: Erik Hedström et al. (NVIDIA)
date: 2026
source: Computer Graphics Forum (Eurographics) 2026
url: https://research.nvidia.com/labs/rtr/publication/hedstrom2026stochastic/
tags: [rendering, path-tracing, ReSTIR, Eurographics2026]
status: unread
---

# Stochastic Pairwise MIS for Unbiased Large-Kernel Reuse in Real Time

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Stochastic Pairwise MIS for Unbiased Large-Kernel Reuse in Real Time |
| 作者 | Erik Hedström et al. (NVIDIA) |
| 来源 | Computer Graphics Forum (Eurographics) 2026 |
| 年份 | 2026 |
| 链接 | [原文](https://research.nvidia.com/labs/rtr/publication/hedstrom2026stochastic/) |

## 核心贡献
1. **随机成对 MIS**: 新型空间邻居选择技术，使实时无偏地从大量邻居复用成为可能
2. **聚焦有效采样**: 将复用集中在含贡献采样的像素上，提升图像质量
3. **解决空间复用稀疏问题**: 尤其适用于相机/物体运动导致区域暴露的场景

## 技术方案
- 扩展 ReSTIR-style spatiotemporal resampling
- 解决"邻居中有效采样少"导致的降质问题
- 相比增大邻居数量，成本更可控

## 实验结论
- 整体图像质量显著提升，尤其在输入采样差的区域
- 实时性能保持

## 可行性分析
- 实现难度：中
- 性能预期：显著提升动态场景 ReSTIR 质量
- 适用场景：实时路径追踪、游戏渲染

## 相关工作
- [[ReSTIR]] [[Gradient-Domain ReSTIR PT]] [[ReSTIR PT Enhanced]]