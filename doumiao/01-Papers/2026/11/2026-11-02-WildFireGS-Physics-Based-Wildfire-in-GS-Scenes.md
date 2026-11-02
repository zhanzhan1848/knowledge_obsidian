---
type: paper
created: 2026-11-02
updated: 2026-11-02
tags: [paper, fluid-rendering, fire-simulation, smoke-rendering, gaussian-splatting, redirect]
status: merged
domain: 流体渲染
agent: doumiao
source: https://arxiv.org/abs/2608.11100
---

# WildFireGS: Physics-Based Wildfire Simulation in GS Forest Scenes → 已有笔记

> **本篇已合并**至既有笔记（vault 内 4 份历史版本）：
> - [[2026-10-21-WildFireGS-3DGS-Forest-Wildfire-Simulation]]（2026-10-21 期，7623 bytes，最完整）
> - [[2026-08/2608-11100-WildFireGS]]（2026-08 期）
> - [[2026-08-13-WildFireGS-Wildfire-Simulation-Gaussian-Splatting]]
> - [[2026-08-15-WildFireGS-Wildfire-Simulation-Gaussian-Splatting]]

**补充确认（2026-11-02 复核）**：
- arXiv: 2608.11100（2026-08-11 提交）
- 方法：高斯基元附加**语义 + 材质属性**（植被类型、燃料特性）；**原生运行在高斯表示上的粒子燃烧模型**（点火 → 传热 → 燃烧 → 火焰传播），无需转显式网格
- 目标：真实航空影像重建场景的**野火数字孪生**
- 注意区分：同期还有 [[2026-10-25-Flamescapes-Wildlandfire-Urban-Interface]]（SA2026，野火-城市界面，**几何-视觉解耦**）

**结论**：与既有笔记一致，无需重复维护。
