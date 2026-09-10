---
title: SceneHI: High-Resolution 3D-Consistent Scene Texturing with Controllable Illumination
authors: Athanasios Tragakis, et al.
date: 2026-09-09
source: arXiv (cs.GR) - ECCV 2026
url: https://arxiv.org/abs/2609.10363
pdf: https://arxiv.org/pdf/2609.10363
tags: [rendering, texture-synthesis, global-illumination, 3D-consistency, ECCV, paper, 2026]
status: unread
---

# SceneHI: High-Resolution 3D-Consistent Scene Texturing with Controllable Illumination

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | SceneHI: High-Resolution 3D-Consistent Scene Texturing with Controllable Illumination |
| 作者 | Athanasios Tragakis, et al. |
| 来源 | arXiv:2609.10363 (cs.CV, cs.GR) — ECCV 2026 |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2609.10363) |
| PDF | [下载](https://arxiv.org/pdf/2609.10363) |

## 核心贡献
1. **首个无需微调的高分辨率 3D 纹理生成框架**：将高分辨率、照明感知的 2D 扩散模型先验提升到 3D 纹理合成，无需模型微调或优化
2. **精确解析像素到纹素的映射**：引入精确解析像素到纹素映射（exact analytical pixel-to-texel mapping），对齐多视角扩散轨迹
3. **高分辨率潜在纹理（HRLTs）**：作为持久画布用于逐步去噪纹理，确保多视角一致性后可后续细化到高分辨率
4. **光感知生成通道**：将几何一致的阴影嵌入纹理图集，弥合与生产工作流的差距

## 技术方案
SceneHI 框架核心设计：

- **2D 到 3D 提升**：利用预训练 2D 扩散模型生成 3D 一致纹理
- **精确像素-纹素映射**：确保多视角几何一致性
- **潜在空间去噪**：相机视角在潜在像素空间执行去噪步骤，共享基础纹理
- **光感知生成**：嵌入物理可信的烘焙阴影

```math
\text{HRLT}_{\text{denoised}} = \text{DiffusionProcess}(\text{HRLT}_{\text{noisy}}, \text{camera\_view})
```

## 实验结论
- 生成时间减少 80% 相比现有场景级方法
- 高视觉保真度
- 严格的几何一致性
- 支持复杂多物体环境

## 局限性
- 依赖预训练扩散模型质量
- 对极端视角变化可能失效

## 可行性分析
- 实现难度：中（需集成扩散模型和 3D 渲染管线）
- 性能预期：80% 时间减少，实用性高
- 适用场景：3D 内容创作、游戏、电影制作

## 相关工作
- [[3D Texture Synthesis]]
- [[Neural Rendering]]
- [[Diffusion Models for Graphics]]

## 笔记
与渲染直接相关：光照可控的纹理合成、烘焙阴影、全局光照先验都是渲染核心问题。此论文是渲染+生成式AI交叉的重要工作。
