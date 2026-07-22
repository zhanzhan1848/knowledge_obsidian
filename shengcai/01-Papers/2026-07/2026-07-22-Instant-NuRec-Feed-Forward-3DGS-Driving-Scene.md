---
title: Feed-Forward 3D Gaussian Reconstruction for Driving Scene Simulation
authors: Jiahui Huang, Jiawei Ren, et al. (NVIDIA)
date: 2026-07-15
source: arXiv cs.GR
url: https://arxiv.org/abs/2607.14203
pdf: https://arxiv.org/pdf/2607.14203
tags: [rendering, 3DGS, autonomous-driving, neural-simulation, NVIDIA]
status: unread
---

# Feed-Forward 3D Gaussian Reconstruction for Driving Scene Simulation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Feed-Forward 3D Gaussian Reconstruction for Driving Scene Simulation |
| 作者 | Jiahui Huang, Jiawei Ren, et al. (NVIDIA) |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2607.14203) |
| PDF | [下载](https://arxiv.org/pdf/2607.14203) |

## 核心贡献
1. **Instant NuRec**: 前馈神经网络重建模型，将短多视角驾驶日志转换为可模拟的3DGS世界
2. 单次前向传播完成重建，支持非针孔相机模型（通过3DGUT）
3. 在Waymo Open Dataset上PSNR比最强baseline高2.01 dB
4. 约1.5秒重建10-20秒多相机场景

## 技术方案
**输入**: 校准多相机 rigs 的多视角输入

**输出层次**:
- 静态3DGS层
- 动态3DGS层
- 天空立方体贴图
- 每相机ISP校正

**3DGUT**: 原生支持非针孔相机模型

**集成**: 深度集成到NuRec，与AlpaSim兼容用于闭环仿真

## 实验结论
- PSNR提升2.01 dB vs 最强baseline
- 重建速度: ~1.5秒/10-20秒场景
- 支持端到端策略评估

## 局限性
- 需要校准的多相机输入
- 主要针对驾驶场景

## 可行性分析
- 实现难度：高（NVIDIA内部工作）
- 性能预期：非常高效，单次前向传播
- 适用场景：自动驾驶仿真、数据闭环

## 相关工作
- [[NuRec]]
- [[3D Gaussian Splatting]]
- [[AlpaSim]]

## 笔记
NVIDIA的工作，展示了前馈3DGS重建在自动驾驶仿真中的应用潜力。对驾驶仿真平台有重要价值。
