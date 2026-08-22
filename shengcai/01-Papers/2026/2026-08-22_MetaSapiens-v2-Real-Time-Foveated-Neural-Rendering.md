---
title: Advancing Real-Time Foveated Neural Rendering via Foveation-Aware Pruning and Stereo Warping
authors: Weikai Lin et al.
date: 2026-08-18
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.17969
pdf: https://arxiv.org/pdf/2608.17969
tags: [rendering, paper, 2026, neural-rendering, foveated-rendering, VR-AR, point-based]
status: unread
---

# Advancing Real-Time Foveated Neural Rendering via Foveation-Aware Pruning and Stereo Warping

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Advancing Real-Time Foveated Neural Rendering via Foveation-Aware Pruning and Stereo Warping |
| 作者 | Weikai Lin et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.17969) |
| PDF | [下载](https://arxiv.org/pdf/2608.17969) |

## 核心贡献
1. **MetaSapiens v2**：面向 VR/AR 设备的实时点基神经渲染（PBNR）系统
2. **效率感知剪枝**：优化渲染速度
3. **注视点渲染（Foveated Rendering）方法**：利用人眼周边视觉低敏锐度特性，降低周边质量提升速度
4. **选择性 warping 方法**：利用双眼冗余减少 AR/VR 双目渲染计算开销
5. **双目 FR 加速器设计**：解决 PBNR 负载不均衡问题
6. 实现**数量级速度提升**同时保持视觉质量

## 技术方案

### 问题
在 VR/AR 设备上实现实时 PBNR 具有挑战性。需要同时满足：实时性、照片级视觉质量、VR/AR 设备资源受限。

### 四大技术
1. **效率感知剪枝**：优化渲染速度
2. **注视点渲染方法**：PBNR 的高效原语，利用人眼周边低敏锐度
3. **选择性 warping**：利用双眼冗余进一步减少计算
4. **双目 FR 加速器**：解决 PBNR 负载不均衡，支持 warping 实现高效双目渲染

### 系统架构
```
输入 → 效率感知剪枝 → Foveated Rendering → 选择性 Warping → 双目 FR 加速器 → 输出
```

## 实验结论
- 数量级速度提升（10x）同时保持视觉质量
- 适用于 AR/VR 设备

## 局限性
- 14页论文，详细限制未在摘要中明确

## 可行性分析
- 实现难度：**中**
- 性能预期：数量级速度提升
- 适用场景：VR/AR 实时渲染、数字孪生

## 相关工作
- [[Point-Based Neural Rendering 相关工作]]

## 笔记
MetaSapiens v1 → v2 的演进，重点关注 VR/AR 落地方向。与传统 PBNR 不同，v2 强调硬件适配和效率优化。
