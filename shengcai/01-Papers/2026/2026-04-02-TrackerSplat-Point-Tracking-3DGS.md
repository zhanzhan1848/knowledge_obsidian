---
title: Exploiting Point Tracking for Fast and Robust Dynamic 3D Gaussians Reconstruction
authors: Daheng Yin, et al.
date: 2026-04-02
source: arXiv cs.GR (SIGGRAPH Asia 2025)
url: https://arxiv.org/abs/2604.02586
pdf: https://arxiv.org/pdf/2604.02586
tags: [rendering, paper, 2026, 3DGS, dynamic-scene, point-tracking, SIGGRAPH-Asia]
status: unread
---

# Exploiting Point Tracking for Fast and Robust Dynamic 3D Gaussians Reconstruction

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Exploiting Point Tracking for Fast and Robust Dynamic 3D Gaussians Reconstruction |
| 作者 | Daheng Yin, et al. |
| 来源 | arXiv cs.GR (SIGGRAPH Asia 2025) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.02586) |
| PDF | [下载](https://arxiv.org/pdf/2604.02586) |

## 核心贡献
1. 提出 TrackerSplat，将先进点跟踪方法集成到 3DGS 中
2. 利用现成点跟踪模型提取像素轨迹并三角化到 3D 高斯
3. 有效处理大帧间位移，减少快速物体运动下的伪影和时间不一致

## 技术方案

### 背景问题
当前基于高斯的动态场景重建方法在处理大帧间位移时遇到困难，导致快速物体运动下出现伪影和时间不一致。

### 核心方法
1. **点轨迹提取**: 使用现成点跟踪模型提取像素轨迹
2. **3D 高斯三角化**: 将per-view像素轨迹三角化到 3D 高斯
3. **高斯重定位**: 在训练前引导高斯的重定位、旋转和缩放

### 关键优势
- 有效处理大帧间位移
- 显著减少 fading 和 recoloring 伪影
- 在并行设置下提升重建吞吐量

## 实验结论
- 在大位移的挑战性场景中展现鲁棒性
- 并行设置下实现更高吞吐量
- 保持与基线相当的视觉质量

## 局限性
- 依赖现成点跟踪模型质量
- 动态场景类型可能有限制

## 可行性分析
- 实现难度：中
- 性能预期：高效并行重建
- 适用场景：动态场景 3D 重建、机器人、沉浸式媒体

## 相关工作
- [[2025-03-Dynamic-Scene-Reconstruction|动态场景重建]]
- [[2026-04-03-Streaming-Real-Time-3D-Gaussians|3DGS 云渲染]]

## 笔记
这篇 SIGGRAPH Asia 2025 论文展示了结合传统计算机视觉技术（点跟踪）与 3DGS 的潜力，是多技术融合的典型案例。
