---
title: Reparametrizing 3D Gaussian Splatting for Real-Time Palette-based Color and Luminance Editing
authors: Cheng-Kang Ted Chao et al.
date: 2026-09-03
source: SIGGRAPH Asia 2026 Conference Papers
url: https://arxiv.org/abs/2609.03897
pdf: https://arxiv.org/pdf/2609.03897
tags: [rendering, 3DGS, color-editing, real-time, rasterization]
status: unread
---

# Reparametrizing 3D Gaussian Splatting for Real-Time Palette-based Color and Luminance Editing

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Reparametrizing 3D Gaussian Splatting for Real-Time Palette-based Color and Luminance Editing |
| 作者 | Cheng-Kang Ted Chao et al. |
| 来源 | SIGGRAPH Asia 2026 Conference Papers |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2609.03897) |
| PDF | [下载](https://arxiv.org/pdf/2609.03897) |

## 核心贡献
1. 提出实时交互式调色板颜色编辑框架，支持基于调色板的重新着色、逐调色板色调曲线进行颜色感知亮度调整
2. 通过重新参数化预训练 vanilla 3DGS 的球谐函数，编码视图相关的调色板权重
3. 亮度编辑作为沿无色轴的逐像素权重偏移，解决了先前 primitive 空间方法中 alpha 混合破坏稀疏性导致编辑蔓延的问题

## 技术方案
- **核心方法**：将球谐函数重新参数化，编码视图相关调色板权重，通过基于图像空间稀疏性的损失函数同时求解权重和调色板颜色
- **亮度编辑**：逐像素权重偏移等价于逐像素调色板感知亮度编辑，视图空间 formulation 解决了 alpha 混合导致编辑蔓延的核心限制
- **优化**：通过迭代重加权最小二乘和阻尼块坐标下降实现毫秒级编辑，在视图空间稀疏性约束下耦合色调曲线和调色板偏移

## 实验结论
- 展示比先前基于调色板的 3DGS 方法更稀疏、更局部化的编辑效果
- 支持每个调色板颜色的独立亮度控制和视图一致的逐像素约束
- 可 baked 回 vanilla 3DGS，保持与标准查看器的兼容性

## 局限性
- 依赖预训练的 vanilla 3DGS 模型
- 编辑质量受限于原始球谐函数的表达能力

## 可行性分析
- 实现难度：中（基于现有 3DGS 框架）
- 性能预期：毫秒级实时编辑
- 适用场景：专业颜色分级、图像编辑工具、游戏资产生成

## 相关工作
- [[2026-08-24-CubicSplat]]
- 3D Gaussian Splatting (Kerbl et al., 2023)

## 笔记
**SIGGRAPH Asia 2026 论文**。核心创新在于视图空间的调色板权重编码，避免了 primitive 空间 alpha 混合的编辑蔓延问题。对于渲染知识库中 3DGS 相关工作有直接参考价值。
