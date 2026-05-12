---
title: Geometrically Approximated Modeling for Emitter-Centric Ray-Triangle Filtering in Arbitrarily Dynamic LiDAR Simulation
authors: Unknown (from arXiv 2605.10457)
date: 2026-05-12
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.10457
pdf: https://arxiv.org/pdf/2605.10457
tags: [rendering, ray-tracing, acceleration, LiDAR, paper, 2026]
status: unread
---

# Geometrically Approximated Modeling for Emitter-Centric Ray-Triangle Filtering in Arbitrarily Dynamic LiDAR Simulation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Geometrically Approximated Modeling for Emitter-Centric Ray-Triangle Filtering in Arbitrarily Dynamic LiDAR Simulation |
| 作者 | Mae Younes et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.10457) |
| PDF | [下载](https://arxiv.org/pdf/2605.10457) |

## 核心贡献
1. **Gajmer Ray-Casting Algorithm (GRCA)** — inverts traditional ray-tracing question: instead of "what does each ray hit?" asks "which rays can each triangle possibly hit?"
2. **Emitter-centric geometric modeling** — models spinning LiDAR emitters as rotation-traced cones/planes, uses triangle's apparent area to cull which ray channels can reach it
3. **No acceleration structure required** — avoids BVH/octree rebuilds for dynamic geometry
4. **Vendor-agnostic compute-based design** — targets GPU (CUDA/OptiX) and CPU (Embree)

## 技术方案

### 核心思想
传统光线追踪：遍历场景找最近交点
GRCA 思路：**反向追踪** — 从每个三角形出发，计算哪些光线通道可能命中它

### 关键算法步骤
1. 将 LiDAR 发射器建模为旋转追踪的锥体/平面
2. 对每个三角形，计算其在发射器视角下的"表观面积"（apparent area）
3. 用表观面积过滤：哪些通道的光线可能到达该三角形
4. 无需 BVH 等加速结构

### 性能数据
- 2-8 sensors, 128x4096 rays per sensor (360°/180° FOV)
- 仅2个传感器即可投射 ~1M rays/frame
- 纯 GPU 模式：最高 **7.97x over OptiX**，**14.55x over Embree**（无 range culling 时）
- Range culling 开启（10-100m）：最高 7.02x GPU, 9.33x CPU
- 混合管线（GRCA 动态 + OptiX/Embree 静态）：最高 10.5x GPU, 19.2x CPU

### 测试场景
- ~22M 三角形，~9M 动态三角形，8 LiDARs

## 公式
核心过滤器条件：判断光线通道 $c$ 中的光线是否能到达三角形 $t$

```math
\text{visible}(c, t) = \begin{cases}
\text{true} & \text{if } \text{cone}(c) \cap \text{apparent\_area}(t) \neq \emptyset \\
\text{false} & \text{otherwise}
\end{cases}
```

## 代码
无（待从 PDF 提取）

## 实验结论
- 动态场景中 GRCA 显著优于传统加速结构方法
- 混合管线在复杂场景下效果最佳
- 无需每帧重建加速结构，特别适合高度动态场景

## 局限性
- 针对 LiDAR 仿真设计，泛化到通用渲染需验证
- 几何近似建模会带来一定的精度开销
- range culling 效果依赖部署距离

## 可行性分析
- 实现难度：中 — 核心算法明确，GPU 实现复杂度适中
- 性能预期：优秀 — 动态场景下 10x+ 加速
- 适用场景：LiDAR 仿真、动态场景光线追踪、实时感知模拟

## 相关工作
- OptiX (NVIDIA) — 传统 BVH 加速光线追踪
- Embree (Intel) — CPU 光线追踪
- 相关论文：BVH 动态场景加速

## 笔记
GRCA 的"反向追踪"思想值得借鉴。对于动态物体多的场景，传统的 BVH 每帧重建开销很大，这种 emitter-centric 的过滤方法可能是突破口。