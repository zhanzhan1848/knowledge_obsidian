---
title: "ReSTIR PT Enhanced: Algorithmic Advances for Faster and More Robust ReSTIR Path Tracing"
authors: ["Lin et al."]
publication: "Proc. ACM Comput. Graph. Interact. Tech. (I3D 2026)"
year: 2026
date: 2026-04-23
tags: [渲染, 路径追踪, ReSTIR, 实时渲染, NVIDIA]
status: 已读
source: NVIDIA Research
url: https://research.nvidia.com/labs/rtr/publication/lin2026restirptenhanced/
---

# ReSTIR PT Enhanced: Algorithmic Advances for Faster and More Robust ReSTIR Path Tracing

## 核心贡献

1. **2-3x 渲染速度提升**：通过算法改进和工程优化实现显著性能提升
2. **内存优化**：1080p 下内存消耗从 ~430MB 降至 ~265MB（减少约 165MB）
3. **渲染时间优化**：从 37.1ms 降至 12.6ms
4. **视觉质量提升**：减少形状相关性和色彩噪声，增强去遮挡噪声

## 技术方案

### 核心算法改进

#### 1. 互惠邻居选择 (Reciprocal Neighbor Selection)
- 将空间复用成本减半
- 通过双向采样提高鲁棒性

#### 2. 基于足迹的重新连接标准 (Footprint-based Reconnection Criteria)
- 鲁棒化移位映射 (shift mappings)
- 减少视觉和数值误差

#### 3. 复制地图 (Duplication Maps)
- 减少时空相关性
- 改善采样质量

#### 4. 统一直接/全局光照
- 将直接光照和全局光照统一到相同的 reservoir 中
- 简化渲染管线

### GPU 级别优化

- SM warp occupancy 提升约 9%
- 减少管道停顿，改善执行流
- 最大化 GPU 资源利用率

## 实验结果

| 指标 | 优化前 | 优化后 |
|------|--------|--------|
| 渲染时间 | 37.1ms | 12.6ms |
| 内存占用 (1080p) | ~430MB | ~265MB |
| 性能提升 | - | 2-3x |

## 可行性分析

- **实现难度**：中
- **技术成熟度**：接近生产就绪
- **开源状态**：NVIDIA Research 页面提供论文
- **适用场景**：游戏实时渲染、虚拟制片

## 局限性

- 主要针对 NVIDIA GPU 优化
- 仍需硬件支持（如 RTX 系列）

## 推荐度

⭐⭐⭐⭐⭐ — 强烈推荐实现

## 相关工作

- Conditional Resampled Importance Sampling and ReSTIR (2023)
- Generalized Resampled Importance Sampling: Foundations of ReSTIR (2022)
- Gradient-Domain ReSTIR Path Tracing (2026)
- ReSTIR PG: Path Guiding with Spatiotemporally Resampled Paths (2025)
- Stochastic Pairwise MIS for Unbiased Large-Kernel Reuse in Real Time (2026)
