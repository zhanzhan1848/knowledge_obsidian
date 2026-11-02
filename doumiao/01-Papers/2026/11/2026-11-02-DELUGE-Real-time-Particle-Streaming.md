---
type: paper
created: 2026-11-02
updated: 2026-11-02
tags: [paper, fluid-rendering, particle-system, compression, streaming, xr, redirect]
status: merged
domain: 流体渲染
agent: doumiao
source: https://arxiv.org/abs/2609.19750
---

# DELUGE: Real-time Particle Streaming → 已有笔记

> **本篇已合并**至既有笔记：→ [[2026-10-19-DELUGE-Real-time-Particle-Streaming-VR]]
> （位于 `doumiao/01-Papers/2026-10-19-DELUGE-Real-time-Particle-Streaming-VR.md`，10-19 期已收录）

**补充确认（2026-11-02 复核）**：
- arXiv: 2609.19750（2026-09-17 提交），11 页 + 3 页补充
- 发表：**IEEE TVCG**，将发表于 **IEEE ISMAR 2026**
- 指标复核无误：解码 ≈ **20×** G-PCC (TMC13)；编码 ≈ **6×** Draco
- 端到端实现：Web 浏览器 + Apple Vision Pro 双端；被试内感知质量评估 + Vision Pro 双人协作任务研究
- 核心洞察：G-PCC/Draco 假设静态几何；动态粒子下编码延迟超帧周期。DELUGE 利用**时间连贯性 + 速度可预测性**编码残差

**结论**：与既有笔记一致，无需重复维护。
