---
title: MetaSapiens v2: Advancing Real-Time Foveated Neural Rendering via Foveation-Aware Pruning and Stereo Warping
authors: Weikai Lin, Yu Feng
date: 2026-08-18
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.17969
pdf: https://arxiv.org/pdf/2608.17969.pdf
tags: [rendering, neural-rendering, foveated-rendering, real-time, PBNR, AR/VR, 2026]
status: unread
---

# MetaSapiens v2: Advancing Real-Time Foveated Neural Rendering via Foveation-Aware Pruning and Stereo Warping

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | MetaSapiens v2: Advancing Real-Time Foveated Neural Rendering via Foveation-Aware Pruning and Stereo Warping |
| 作者 | Weikai Lin, Yu Feng |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.17969) |
| PDF | [下载](https://arxiv.org/pdf/2608.17969.pdf) |

## 核心贡献
1. **Efficiency-aware pruning** - 优化渲染速度的剪枝技术
2. **Foveated Rendering (FR) method** - 针对 PBNR 的高效凹陷渲染方法，利用人眼周边视觉低敏锐度特性
3. **Selective warping method** - 利用双眼冗余减少 AR/VR 双目渲染计算开销
4. **Accelerator design for binocular FR** - 解决 FR-based PBNR 负载不平衡问题

## 技术方案

### Point-Based Neural Rendering (PBNR)
PBNR 是一类有前景的渲染技术，在 AR/VR 和数字孪生领域对实时逼真渲染需求驱动下快速发展。

### 四项核心技术
1. **Efficiency-aware pruning**: 优化渲染速度的剪枝技术
2. **Foveated Rendering**: 利用人眼周边视觉低敏锐度特性，在周边区域放宽渲染质量以提高速度
3. **Selective warping**: 利用双眼冗余，选择性应用扭曲方法进一步减少计算开销
4. **Accelerator design**: 解决 FR-based PBNR 负载不平衡问题，支持高效双目渲染

### 性能结果
- 相比现有 PBNR 模型实现**数量级加速**（order of magnitude speedup）
- 保持视觉质量

## 实验结论
- MetaSapiens v2 在 AR/VR 设备上实现实时神经渲染
- 在保持人类视觉质量的同时实现数量级加速

## 局限性
- 主要针对 PBNR 场景
- 需要特定硬件支持（VR/AR 设备）

## 可行性分析
- 实现难度：中
- 性能预期：数量级加速，实时渲染
- 适用场景：AR/VR 应用、数字孪生、实时渲染

## 相关工作
- [[PBNR 相关研究]]
- [[Foveated Rendering 技术]]

## 笔记
针对 AR/VR 设备的实时渲染优化方案，结合了剪枝、凹陷渲染和双目扭曲三种技术。这是一个实用的工程优化方案。
