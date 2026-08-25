---
title: "Advancing Real-Time Foveated Neural Rendering via Foveation-Aware Pruning and Stereo Warping"
authors: [Weikai Lin et al.]
date: 2026-08-18
status: 待读
tags: [渲染, 神经渲染, foveated rendering, VR/AR, 实时渲染]
keywords: [neural rendering, foveated rendering, VR, AR, real-time rendering, PBNR]
links:
  arXiv: https://arxiv.org/abs/2608.17969
  PDF: https://arxiv.org/pdf/2608.17969
reviewDate: 2026-08-25
---

# Advancing Real-Time Foveated Neural Rendering via Foveation-Aware Pruning and Stereo Warping

## 元信息
| 项目 | 内容 |
|------|------|
| 作者 | Weikai Lin et al. |
| 发表 | arXiv cs.GR, 2026-08-18 |
| 链接 | [arXiv](https://arxiv.org/abs/2608.17969) |

## 核心贡献

1. **效率感知剪枝**：优化渲染速度的剪枝技术
2. **Foveated Rendering (FR)**：针对 PBNR 的高效原语，利用人眼周边低敏锐度放松渲染质量
3. **选择性立体变换**：利用双眼冗余减少 AR/VR 双目渲染计算开销
4. **双目 FR 加速器设计**：解决 FR-based PBNR 的负载不平衡问题

## 技术方案

### MetaSapiens v2 核心架构

基于 Point-Based Neural Rendering (PBNR)，为 VR/AR 设备提供实时神经渲染。

**四项技术结合**：
1. 效率感知剪枝 → 优化渲染速度
2. Foveated Rendering → 周边区域放松质量
3. 选择性立体变换 → 减少双目计算
4. 双目 FR 加速器 → 解决负载不平衡

```math
\text{速度提升} \approx 10\times \text{over existing PBNR models}
```

## 实验结论

- 在保持视觉质量的同时实现**数量级速度提升**
- 针对 VR/AR 设备的实时神经渲染

## 实用性评估

- **创新性**：⭐⭐⭐⭐ VR/AR 实时渲染优化
- **实用性**：⭐⭐⭐⭐⭐ 面向 VR/AR 应用
- **实现难度**：中（需硬件加速器支持）

## 应用场景

- AR/VR 设备
- 数字孪生
- 实时神经渲染

## 备注

- 14 pages, 20 figures, 2 tables
- 系统针对 VR/AR 设备的资源限制进行优化
