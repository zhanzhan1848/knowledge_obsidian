---
title: MetaSapiens v2 - Advancing Real-Time Foveated Neural Rendering via Foveation-Aware Pruning and Stereo Warping
authors: Weikai Lin, Yu Feng et al.
date: 2026-08-18
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.17969
pdf: https://arxiv.org/pdf/2608.17969
tags: [rendering, gaussian-splatting, neural-rendering, foveated-rendering, VR-AR, real-time, 2026]
status: unread
---

# MetaSapiens v2: Advancing Real-Time Foveated Neural Rendering via Foveation-Aware Pruning and Stereo Warping

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | MetaSapiens v2: Advancing Real-Time Foveated Neural Rendering via Foveation-Aware Pruning and Stereo Warping |
| 作者 | Weikai Lin, Yu Feng et al. (University of Rochester, Shanghai Jiao Tong University) |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.17969) |
| PDF | [下载](https://arxiv.org/pdf/2608.17969) |

## 核心贡献
1. **感知引导的效率感知剪枝**：直接最小化渲染/推理速度，而非最小化点数，同时使用人类视觉系统（HVS）模型监控感知质量
2. **PBNR 的注视点渲染（Foveated Rendering）方法**：利用人类外周视觉敏锐度下降的特性，设计高偏心率点为低偏心率点严格子集的分层结构
3. **增强的高效 FR 基元**：用新的 alpha 分布函数替代高斯，增强场景覆盖能力，避免外周区域背景泄漏
4. **选择性 warp 双目渲染**：利用两眼视图相似性，仅在外周区域应用 warping 复用，降低 AR/VR 双目渲染计算冗余
5. **共同设计的加速器架构**：解决 FR-PBNR 中 tile 间负载不均衡问题，支持深度提取和选择性 warping

## 技术方案

### 感知引导剪枝
- 现有剪枝方法关注最小化点数，但未考虑实际计算成本
- 新方法直接最小化推理速度
- HVS 模型在训练中监控感知质量，迭代剪枝直到质量低于感知阈值

### 注视点渲染
- 偏心度增加时逐步减少用于渲染的点数
- 分层结构：外周点集是中心点集的严格子集
- 参数和计算跨偏心度区域共享

### 增强 FR 基元
高斯 primitive 的 alpha = opacity × Gaussian falloff，衰减快，难以用有限 primitive 覆盖外周场景。
解决方案：新 alpha 分布函数控制衰减，实现受限高斯 primitive 的更好场景覆盖。

### 选择性 Warping 双目渲染
- 先渲染一眼，再 warp 到另一眼
- 仅在偏心度超过阈值后应用 warping
- 阈值通过测量 HVSQ (Human Visual System Quality) 调优，确保感知质量与高质量 MetaSapiens 相当

## 实验结论
- 用户研究（12 名参与者）：MetaSapiens v2 感知质量与 Mini-Splatting-D（SOTA PBNR）无统计显著差异
- Mobile Volta GPU：最高 **8.7×** 加速
- 硬件支持下：最高 **30.9×** 加速
- PSNR：最高 **+0.49 dB** 客观质量提升
- 渲染质量与 MetaSapiens 感知等效（用户研究中验证）

## 局限性
- 需要针对特定 HVS 模型调优偏心度阈值
- Warping 在低偏心度区域可能引入可察觉的伪影
- 加速器架构需要定制硬件设计

## 可行性分析
- 实现难度：中（算法部分可独立实现；加速器需要硬件协同设计）
- 性能预期：移动端 VR/AR 实时渲染显著加速
- 适用场景：AR/VR 实时神经渲染、数字孪生、移动端高帧率渲染

## 相关工作
- 3D Gaussian Splatting (3DGS)
- Point-Based Neural Rendering (PBNR)
- MetaSapiens (v1)
- Foveated Rendering
- Neural Radiance Fields (NeRF)

## 笔记
MetaSapiens v2 是将注视点渲染引入 PBNR 的系统性工作。四项技术协同（剪枝、FR、新基元、双目warping），并共同设计硬件加速器。最高 30.9× 加速对于 VR/AR 应用极具吸引力。
