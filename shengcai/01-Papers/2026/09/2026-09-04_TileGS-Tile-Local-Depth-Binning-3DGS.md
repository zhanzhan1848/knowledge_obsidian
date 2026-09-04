---
title: Tile-Local Depth Binning for Gaussian Splatting Rasterization
authors: Wei Tan et al.
date: 2026-09-03
source: arXiv cs.GR
url: https://arxiv.org/abs/2609.03613
pdf: https://arxiv.org/pdf/2609.03613
tags: [rendering, 3DGS, rasterization, real-time, acceleration, GPU]
status: unread
---

# Tile-Local Depth Binning for Gaussian Splatting Rasterization

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Tile-Local Depth Binning for Gaussian Splatting Rasterization |
| 作者 | Wei Tan et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2609.03613) |
| PDF | [下载](https://arxiv.org/pdf/2609.03613) |

## 核心贡献
1. **TileGS**：提出 tile 本地重组的 Gaussian Splatting 光栅化方法
2. 将长 tile 范围转换为多个短的深度局部范围，以前向顺序光栅化这些范围
3. 在粗排序不足以匹配基线合成的地方应用选择性修复

## 技术方案
- **Tile-Local 重组**：将全局排序的 tile 流拆分为 tile 本地深度局部范围序列
- **前向顺序光栅化**：在每个 tile 内以前向顺序处理深度局部范围
- **选择性修复**：在粗排序不足匹配基线合成质量时应用针对性修复

## 实验结论
- **9 场景基准测试**（桌面和笔记本 Ada GPU）：
  - 默认 No-GW 变体在 RTX 4090 上实现平均 **1.44x 光栅内核加速**
  - RTX 4090 平均端到端帧加速 **1.069x**，RTX 1000 Ada 上 **1.094x**（对比 gsplat）
  - 质量匹配：|ΔPSNR| < 0.001 dB, |ΔSSIM| < 0.001, |ΔLPIPS| < 0.001
- **Nsight Compute 分析**：TileGS 更快尽管 SM 吞吐量更低、占用率更低、DRAM 流量更高
- **SASS 指令**：总线程指令减少 **1.26x**
- **几何属性分析**：占光栅总流量的 85.8%，占 excess sectors 的 88.6%

## 局限性
- 需要针对不同 GPU 架构调优
- 选择性修复机制增加了复杂性

## 可行性分析
- 实现难度：高（需要深入 GPU 光栅化管线知识）
- 性能预期：RTX 4090 上 1.44x 光栅加速
- 适用场景：实时 3DGS 渲染系统、游戏引擎、VR/AR 应用

## 相关工作
- [[2026-08-24-CubicSplat]]
- gsplat (广泛使用的优化开源 3DGS 实现)
- 3D Gaussian Splatting (Kerbl et al., SIGGRAPH 2023)

## 笔记
重要性能优化工作。核心洞见：性能提升来自于减少有效光栅遍历工作，而非减少数据量、改善合并、提高占用率或直接减少测量到的 warp 分歧。对 GPU 渲染优化有重要参考价值。
