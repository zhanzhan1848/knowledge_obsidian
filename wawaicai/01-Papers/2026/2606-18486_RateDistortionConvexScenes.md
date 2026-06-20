---
tags: [几何, 凸几何, 可视化, 率失真]
created: 2026-06-20
source: arXiv cs.GR
---

# Rate-Distortion Reconstruction of Convex Apartness Scenes (Separoids)

## 核心方法

将有限凸体族的 **apartness table**（分离关系）视为信源信号，可渲染凸场景视为编码器，渲染图像视为噪声视觉信道。通过 **differentiable support-function realization** 将可分离性转化为软方向裕度，用分离方向上的分布表示每个分离。

## 关键创新点

1. **apartness-preserving rendering → rate-distortion problem** — 将几何分离信息的保持转化为率失真优化问题
2. **differentiable support-function realization** — 通过可微支持函数实现，支撑函数转化为软方向裕度
3. **信息论框架** — 给出 apartness 互信息 I(Σ;Y) 的变分下界，提供视角选择的信息论解释
4. **certificate skeleton** — 证明 certificate skeleton 已可完全确定 apartness table

## 算法概述

给定凸场景的 apartness table 作为信源，目标是重建原始场景。渲染图像通过噪声信道传输，接收端从图像解码 apartness 结构。实验表明：planar convex scenes 可从 apartness table 以 99.9% 比特准确率恢复，48×48 渲染图像在轻微噪声下可传输约 0.72 的 apartness-graph 熵。

## 复杂度分析
- 时间：可变（取决于场景规模和分辨率）
- 空间：与凸体数量和分辨率相关

## 开源实现
- 代码已公开（见 arXiv 附件）

## 相关笔记
[[凸几何]]
[[几何信息论]]