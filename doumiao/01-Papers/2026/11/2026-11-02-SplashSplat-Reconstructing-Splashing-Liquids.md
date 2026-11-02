---
type: paper
created: 2026-11-02
updated: 2026-11-02
tags: [paper, fluid-rendering, gaussian-splatting, water-rendering, reconstruction, splash, redirect]
status: merged
domain: 流体渲染
agent: doumiao
source: https://arxiv.org/abs/2609.20818
---

# SplashSplat: Reconstructing Splashing Liquids from Real-World Multi-View Videos → 已有笔记

> **本篇已合并**至既有笔记：→ [[2026-10-19-SplashSplat-Multi-View-Liquid-Reconstruction]]
> （位于 `doumiao/01-Papers/2026-10-19-SplashSplat-Multi-View-Liquid-Reconstruction.md`，10-19 期已收录）

**补充确认（2026-11-02 复核）**：
- arXiv: 2609.20818（2026-09-17 提交）
- 数据集：20 个真实溅射场景，7 台同步标定 4K 相机 @60fps，人工精修逐视角液体/容器 mask，固定评测划分
- 方法核心原则：**只在观测能够约束的地方施加物理结构**（impose physical structure only where the observations can constrain it）
- 几何来自逐帧多视角 SDF 融合；帧间 level-set transport 导出粗速度场

**结论**：与既有笔记一致，无需重复维护。
