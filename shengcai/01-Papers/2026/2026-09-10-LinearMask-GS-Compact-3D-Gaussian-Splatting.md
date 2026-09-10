---
title: LinearMask-GS: Stable-Mask Importance Pruning for Compact 3D Gaussian Splatting
authors: Donghun Ryu, et al.
date: 2026-09-09
source: arXiv (cs.CV) - BMVC 2026
url: https://arxiv.org/abs/2609.10095
pdf: https://arxiv.org/pdf/2609.10095
tags: [rendering, gaussian-splatting, neural-rendering, compact-representation, BMVC, paper, 2026]
status: unread
---

# LinearMask-GS: Stable-Mask Importance Pruning for Compact 3D Gaussian Splatting

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | LinearMask-GS: Stable-Mask Importance Pruning for Compact 3D Gaussian Splatting |
| 作者 | Donghun Ryu, et al. |
| 来源 | arXiv:2609.10095 (cs.CV) — BMVC 2026 |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2609.10095) |
| PDF | [下载](https://arxiv.org/pdf/2609.10095) |

## 核心贡献
1. **识别 LP-3DGS 的核心问题**：发现 Gumbel-Sigmoid 激活的陡峭斜率在掩码训练窗口内将掩码值驱动到极端，在重要性排名稳定前产生尖锐的双峰分布
2. **线性增量激活替代方案**：用线性增量激活（linear increment activation）替代 Gumbel-Sigmoid，使掩码值在整个训练过程中保持中高置信区间，产生稳定的单峰掩码分布
3. **重要性排名稳定追踪**：单峰分布使其排名可靠追踪重要性

## 技术方案
**问题分析**：
- LP-3DGS 使用可学习掩码识别和剪枝冗余高斯
- Gumbel-Sigmoid 激活在短训练窗口内驱动掩码值到极端
- 产生双峰分布，无法可靠恢复重要性排名

**解决方案**：
- 线性增量激活保持掩码值在中高置信区间
- 稳定的单峰分布追踪重要性
- 训练全程保持可区分性

## 实验结论
**Mip-NeRF 360 数据集**：
- 相比 3DGS：3.6x 高斯剪枝
- 相比 LP-3DGS：1.6x 高斯剪枝
- 保持或提升渲染质量

**户外场景**：
- 1.6x 剪枝（2.18M → 1.36M）
- PSNR +0.38 dB
- SSIM +0.025
- LPIPS -0.029

## 局限性
- 需要额外的掩码训练阶段
- 对极端密集场景可能效果有限

## 可行性分析
- 实现难度：中（基于现有 3DGS 框架扩展）
- 性能预期：3.6x 存储减少同时保持质量，实用性高
- 适用场景：实时神经渲染、AR/VR、移动端渲染

## 相关工作
- [[3D Gaussian Splatting]]
- [[Neural Rendering Optimization]]
- [[Point-based Rendering]]

## 笔记
与渲染直接相关：3DGS 是当前实时渲染研究热点，LinearMask-GS 解决了其存储开销大的核心问题，对实时渲染性能优化有重要参考价值。
