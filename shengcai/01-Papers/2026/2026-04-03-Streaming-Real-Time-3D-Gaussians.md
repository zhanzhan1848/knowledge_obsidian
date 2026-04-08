---
title: Streaming Real-Time Rendered Scenes as 3D Gaussians
authors: Matti Siekkinen, et al.
date: 2026-04-03
source: arXiv cs.GR
url: https://arxiv.org/abs/2604.02851
pdf: https://arxiv.org/pdf/2604.02851
tags: [rendering, paper, 2026, 3DGS, cloud-rendering, streaming, real-time]
status: unread
---

# Streaming Real-Time Rendered Scenes as 3D Gaussians

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Streaming Real-Time Rendered Scenes as 3D Gaussians |
| 作者 | Matti Siekkinen, et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.02851) |
| PDF | [下载](https://arxiv.org/pdf/2604.02851) |

## 核心贡献
1. 提出基于 3D Gaussian Splatting (3DGS) 的云渲染替代方案
2. 设计 Unity 原型，服务器构建并持续优化来自实时渲染参考视图的 3DGS 模型
3. 支持全模型快照和增量更新的流式传输，支持重光照和刚体对象动态

## 技术方案

### 背景
云渲染在游戏和 XR 中广泛用于克服客户端 GPU 资源限制和支持异构设备。现有系统将渲染场景作为 2D 视频流传输，限制了视角灵活性。

### 核心方法
1. **服务器端**: 从实时渲染参考视图构建和持续优化 3DGS 模型
2. **流式传输**: 使用全模型快照和增量更新传输演变的表示
3. **客户端**: 本地重建接收的高斯模型并从该表示渲染当前视角

### 支持的特性
- 重光照 (Relighting)
- 刚体对象动态
- 多用户场景建模 amortized

### 与传统方法对比
相比 per-user 渲染和视频流，该方法改进了视角灵活性以实现延迟补偿

## 实验结论
- 改进了视角灵活性
- 更好 amortized 服务器端场景建模
- 支持多用户场景

## 局限性
- 动态场景的实时 3DGS 重建质量
- 网络带宽要求

## 可行性分析
- 实现难度：中
- 性能预期：实时云渲染
- 适用场景：云游戏、XR 远程渲染

## 相关工作
- [[2026-04-02-Palette-Based-Color-Grading-3DGS|3DGS 颜色分级]]
- [[2025-05-Virtualized-3D-Gaussians|3DGS 虚拟化]]

## 笔记
这是 3DGS 在云渲染场景应用的重要进展，将神经辐射场表示引入传统云游戏管线。
