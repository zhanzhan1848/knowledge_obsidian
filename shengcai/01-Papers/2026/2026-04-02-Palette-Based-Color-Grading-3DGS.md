---
title: Palette-Based Color Grading for 3D Gaussian Splatting via View-Space Sparse Decomposition
authors: Cheng-Kang Ted Chao, et al.
date: 2026-04-02
source: arXiv cs.GR
url: https://arxiv.org/abs/2604.01551
pdf: https://arxiv.org/pdf/2604.01551
tags: [rendering, paper, 2026, 3DGS, gaussian-splatting, color-grading, real-time]
status: unread
---

# Palette-Based Color Grading for 3D Gaussian Splatting via View-Space Sparse Decomposition

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Palette-Based Color Grading for 3D Gaussian Splatting via View-Space Sparse Decomposition |
| 作者 | Cheng-Kang Ted Chao, et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.01551) |
| PDF | [下载](https://arxiv.org/pdf/2604.01551) |

## 核心贡献
1. 提出基于调色板的 3DGS 颜色分级框架，支持调色板重着色和per-palette色调曲线
2. 引入视图空间调色板分解，在 splatting 时分解权重而非颜色
3. 使用几何损失（逆重心坐标）强制一致的稀疏模式

## 技术方案

### 背景问题
专业颜色编辑需要精确控制颜色（色相和饱和度）和亮度，最好通过独立控制实现。

现有方法在 primitive 级别分解颜色，在 splatting 前优化 per-Gaussian 调色板权重。但稀疏的 primitive 级别权重不能保证 alpha-blending 后稀疏的像素级分解，导致调色板编辑影响非目标区域。

### 核心方法
1. **视图空间调色板分解**: 不在 primitive 空间分解颜色，而是在视图空间分解，splatting 权重而非颜色来优化场景的可观察外观
2. **几何损失**: 使用逆重心坐标强制一致的稀疏模式，确保相似颜色共享相似分解
3. **专业颜色分级**: 支持基于调色板的重新着色、per-palette 色调曲线进行颜色感知亮度调整

### 关键创新
- 实现了 3DGS 场景的像素级精确约束
- 实现了类似专业软件的颜色分级工作流
- 支持实时交互编辑

## 实验结论
- 优于 primitive 空间方法的编辑质量
- 支持 3DGS 场景的专业颜色分级工作流
- 实时交互能力

## 局限性
- 需要针对特定场景微调
- 稀疏模式约束可能限制某些编辑灵活性

## 可行性分析
- 实现难度：中
- 性能预期：实时交互
- 适用场景：3DGS 场景的影视级颜色分级

## 相关工作
- [[2025-06-Stochastic-Ray-Tracing-of-Transparent-3D-Gaussians|3DGS 透明物体渲染]]
- [[2025-05-Virtualized-3D-Gaussians|3DGS 虚拟化]]

## 笔记
这篇论文展示了 3DGS 在专业影视工作流中的应用潜力，特别是后期颜色分级阶段。
