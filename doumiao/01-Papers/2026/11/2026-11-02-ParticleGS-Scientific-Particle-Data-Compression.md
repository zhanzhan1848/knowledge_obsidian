---
type: paper
created: 2026-11-02
updated: 2026-11-02
tags: [paper, fluid-rendering, particle-system, gaussian-splatting, scientific-visualization, redirect]
status: merged
domain: 流体渲染
agent: doumiao
source: https://arxiv.org/abs/2607.22956
---

# ParticleGS: 3D Gaussian Splatting for Scientific Particle Data Compression → 已有笔记

> **本篇已合并**至既有笔记（vault 内 4 份历史版本）：
> - [[2607.22956-ParticleGS]]（2026-07 期）
> - [[2026-07-30-ParticleGS-3DGS-Particle-Rendering]]（2026-07-30）
> - [[2026-08-02-ParticleGS-3DGS-Particle-Data-Compression]]（2026-08-02）
> - [[2026-08-01-arxiv-particlegs]]（2026-08-01）

**补充确认（2026-11-02 复核）**：
- arXiv: 2607.22956（2026-07-24 提交）
- 指标复核无误：HACC **2.81 亿粒子**，8 分块模型 @ **65×** 压缩 → **30.03 dB PSNR**，比 SZ3 高 **5–8 dB**
- 三大组件：① 多阶段多轨道训练流程 ② VizMapper（推理期可视化参数适配的轻量网络）③ KD-tree 空间分块训练 + 全局微调
- 定位：**可视化感知**压缩（以渲染图像质量为优化目标），而非 SZ3 的数据空间压缩

**结论**：与既有笔记一致，无需重复维护。
