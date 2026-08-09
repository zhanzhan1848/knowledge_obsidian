---
title: A Query-Efficient Stochastic Volume Rendering Framework for Time-Varying Implicit Neural Volumes
authors: Alper Sahistan et al.
date: 2026-07-30
source: arXiv cs.GR
url: https://arxiv.org/abs/2607.28047
pdf: https://arxiv.org/pdf/2607.28047
tags: [rendering, volume-rendering, ray-marching, delta-tracking, INR, neural-volume, time-varying]
status: unread
---

# A Query-Efficient Stochastic Volume Rendering Framework for Time-Varying Implicit Neural Volumes

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | A Query-Efficient Stochastic Volume Rendering Framework for Time-Varying Implicit Neural Volumes |
| 作者 | Alper Sahistan et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2607.28047) |
| PDF | [下载](https://arxiv.org/pdf/2607.28047) |

## 核心贡献
1. **Delta Tracking + INR**：将delta tracking引入时变隐式神经表示(INR)的体渲染
2. **异构并行四阶段管线**：ray tracing core做遍历，tensor core做批量神经求值
3. **Ray Budgeting & Query Pruning**：减少INR查询开销，提高每帧性能
4. **时域探索**：时间步更新约1-2ms，支持交互式时域探索

## 技术方案

### 问题
- 时变INR提供紧凑的体积表示（动态X-ray CT等）
- 交互式渲染困难：内存查询被昂贵神经推理取代
- 传统ray marching + dense sampling不实用
- resampling/caching/retraining代价高，对时变数据不友好

### 解决方案：Delta Tracking + Stochastic Volume Rendering
```math
沿光线累积透射率，使用delta tracking避免密集采样
T_{total} = \prod_i T_i  \quad \text{where } T_i = 1 - \alpha_i
```

### 四阶段管线
1. **Ray Traversal**：GPU ray tracing core做光线-体积求交
2. **Batch Query**：Tensor core批量神经评估INR
3. **Query Reduction**：Ray budgeting限制每光线采样数
4. **Query Pruning**：跳过低贡献区域

### 关键公式
```math
\text{Transmittance: } T = \exp\left(-\int_0^d \sigma(t) dt\right)
\text{Delta tracking: 随机采样界面，通过Russian roulette估计透射率}
```

### 性能结果
- RTX 4090上 1024×1024 分辨率：~30-40 FPS
- 时间步更新：约1-2 ms
- 收敛到高质量图像

## 实验结论
- 多种时变INR可直接从原始表示渲染
- RTX 4090达到30-40 FPS实时性能
- 支持连续时域交互探索

## 局限性
- 依赖特定GPU架构（RTX + Tensor Core）
- 对极端光学厚度体积可能收敛慢

## 可行性分析
- 实现难度：高（需要delta tracking与INR集成，GPU架构适配）
- 性能预期：优秀（30-40 FPS @ 1MP, RTX 4090）
- 适用场景：科学可视化、动态CT、时变体积数据

## 相关工作
- [[2026-08-09_ESVR-Ellipsoid-Sparse-Volume-Ray-Rendering]] -  ellipsoid-based sparse volume rendering
- [[2025-06_Stochastic-Ray-Tracing-Transparent-3D-Gaussians]] - 随机渲染技术

## 笔记
核心创新：不是把INR当MLP黑盒，而是利用delta tracking特性减少神经求值次数。Ray budgeting是核心——限制每光线查询数，pruning跳过低密度区域。
