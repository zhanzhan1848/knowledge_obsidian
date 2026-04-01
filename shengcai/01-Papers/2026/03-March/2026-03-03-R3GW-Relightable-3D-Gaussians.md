---
title: R3GW: Relightable 3D Gaussians for Outdoor Scenes in the Wild
authors: Margherita Lea Corona et al.
date: 2026-03-03
source: arXiv (VISAPP 2026)
url: https://arxiv.org/abs/2603.02801
pdf: https://arxiv.org/pdf/2603.02801
tags: [rendering, 3DGS, PBR, relighting, rasterization, outdoor-scenes, 2026]
status: unread
---

# R3GW: Relightable 3D Gaussians for Outdoor Scenes in the Wild

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | R3GW: Relightable 3D Gaussians for Outdoor Scenes in the Wild |
| 作者 | Margherita Lea Corona et al. |
| 来源 | arXiv (VISAPP 2026) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2603.02801) |
| PDF | [下载](https://arxiv.org/pdf/2603.02801) |

## 核心贡献
1. 提出 R3GW，学习户外场景的可重照明 3DGS 表示
2. 将场景分离为可重照明的前景和非反射背景（天空）
3. 结合 PBR 与 3DGS，在变化光照条件下建模视图相关光照效果
4. 天空表示缓解深度重建伪影，改善天空-前景边界处的渲染质量

## 技术方案

### 核心方法
- **双高斯集合**：前景使用可重照明高斯，背景使用天空高斯
- **PBR 集成**：在 3DGS 场景表示中结合基于物理的渲染
- **变化光照处理**：支持非约束照片集合（光照变化）
- **天空建模**：减少深度重建伪影

### 渲染方程
```
L_out = L_direct + L_indirect
```
通过 PBR 管道计算直接光照和间接光照的组合。

## 实验结论
- 在 NeRF-OSR 数据集上达到 SOTA 性能
- 支持任意光照条件下的照片级真实感Novel View Synthesis
- 改善天空-前景边界处的渲染质量

## 局限性
- 主要针对户外场景设计
- 复杂室内光照可能需要调整

## 可行性分析
- 实现难度：中
- 性能预期：实时渲染能力
- 适用场景：户外场景重建、文物数字化、自动驾驶

## 相关工作
- 3D Gaussian Splatting (3DGS)
- Novel View Synthesis
- Physically Based Rendering
- NeRF-OSR

## 笔记
VISAPP 2026 论文。将 PBR 与 3DGS 结合实现可重照明是个好方向，特别是户外场景的应用。分离前景和天空的策略有助于解决边界伪影问题。
