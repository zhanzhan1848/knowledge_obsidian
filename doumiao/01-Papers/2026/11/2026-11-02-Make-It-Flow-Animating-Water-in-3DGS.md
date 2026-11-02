---
type: paper
created: 2026-11-02
updated: 2026-11-02
tags: [paper, fluid-rendering, gaussian-splatting, water-rendering, cinemagraph, redirect]
status: merged
domain: 流体渲染
agent: doumiao
source: https://arxiv.org/abs/2610.13860
---

# Make It Flow: Animating Water in 3D Gaussian Splatting Scenes → 已有笔记

> **本篇已合并**至既有笔记（vault 内 3 份历史版本）：
> - [[2026-10-13-Make-It-Flow-Water-3DGS]]（2026-10-13 期，位于 `2026/10/`）
> - [[2026-10-19-Make-It-Flow-Water-Animation-3DGS]]
> - [[paper-2026-10-09-make-it-flow-water-3dgs]]

**补充确认（2026-11-02 复核）**：
- arXiv: 2610.13860（2026-10-09 提交）
- 方法：参考图像/模型渲染 → 估计 **2D 光流** → **提升为一致的 3D Eulerian 运动场** → cinemagraph 启发式形变高斯基元 → **时间无缝循环**
- 保持 3DGS 实时渲染性能 + 场景内自由视角漫游
- 新数据集：实拍 in-the-wild **瀑布**场景
- 与 2026-10-10 的 [[2026-10-11/2026-10-11-OuroWorld-3D-Cinemagraphs-Gaussian-Splatting]] 同属 cinemagraph 路线

**结论**：与既有笔记一致，无需重复维护。
