---
title: EAG-PT: Emission-Aware Gaussians and Path Tracing for Diffuse Indoor Scene Reconstruction and Editing
authors: Xijie Yang, Mulin Yu, Changjian Jiang, Kerui Ren, Tao Lu, Jiangmiao Pang, Dahua Lin, Bo Dai, Linning Xu
date: 2026-07-19 (SIGGRAPH 2026)
source: SIGGRAPH 2026 Conference Paper
url: https://arxiv.org/abs/2601.23065
pdf: https://arxiv.org/pdf/2601.23065
tags: [rendering, path tracing, 3D Gaussian, global illumination, inverse rendering, neural rendering]
status: unread
---

# EAG-PT: Emission-Aware Gaussians and Path Tracing

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | EAG-PT: Emission-Aware Gaussians and Path Tracing for Diffuse Indoor Scene Reconstruction and Editing |
| 作者 | Xijie Yang et al. (Xijie Yang, Mulin Yu, Changjian Jiang, Kerui Ren, Tao Lu, Jiangmiao Pang, Dahua Lin, Bo Dai, Linning Xu) |
| 来源 | SIGGRAPH 2026 Conference Paper |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2601.23065) / [项目页](https://eag-pt.github.io) |
| PDF | [下载](https://arxiv.org/pdf/2601.23065) |

## 核心贡献
1. 提出 Emission-Aware Gaussians (EAG) 概念：将 2D Gaussians 作为传输友好的几何代理，避免显式网格重建
2. 在重建过程中显式分离发射和非发射组件，支持场景编辑
3. 解耦重建与最终渲染：使用高效单 bounce 优化 + 高质量多 bounce 路径追踪分别处理

## 技术方案
**问题**：
- NeRF/3DGS 等辐射场方法对室内场景重建可达到高视觉质量，但在场景编辑时因光照 baked 和缺乏显式光传输而失效
- 基于网格的逆路径追踪方法虽强制正确光传输，但需要高度精确几何，对真实室内场景鲁棒性差

**方法 (EAG-PT)**：
1. **统一 2D Gaussian 表示**：作为传输友好几何代理，避免显式网格重建
2. **显式发射/非发射分离**：在重建时区分发光与非发光组件，支持编辑
3. **解耦重建与渲染**：
   - 阶段1：高效单 bounce 优化
   - 阶段2：高质量多 bounce 路径追踪渲染

**实验结果**：
- 在合成和真实室内场景上，EAG-PT 产生更自然、物理一致的编辑渲染
- 保留更精细的几何细节
- 避免网格方法的人为瑕疵

## 适用场景
- 室内设计
- XR 内容创建
- Embodied AI

## 可行性分析
- 实现难度：中
- 性能预期：高（支持物理一致的编辑渲染）
- 适用场景：室内场景重建与编辑

## 相关工作
- NeRF, 3D Gaussian Splatting
- 逆路径追踪
- 神经渲染

## 笔记
EAG-PT 将 Gaussian Splatting 与物理路径追踪结合，解决了神经渲染方法在场景编辑时的光照 baked 问题。这是 SIGGRAPH 2026 的重要论文，对室内场景重建和编辑有重要意义。
