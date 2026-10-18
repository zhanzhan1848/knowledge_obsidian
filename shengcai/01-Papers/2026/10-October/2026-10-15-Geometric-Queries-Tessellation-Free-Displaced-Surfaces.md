---
title: "Geometric Queries on Tessellation-Free Displaced Surfaces"
authors: "Bing Xu, Yang Zhou, Brian Budge"
date: 2026-10-15
source: arXiv (cs.GR)
url: https://arxiv.org/abs/2610.21584
pdf: https://arxiv.org/pdf/2610.21584
arxiv_id: "2610.21584v1"
tags: [rendering, paper, 2026, ray-tracing, displacement-mapping, BVH, microfacet, specular, caustics, sampling, geometry-query]
status: unread
---

# Geometric Queries on Tessellation-Free Displaced Surfaces

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Geometric Queries on Tessellation-Free Displaced Surfaces |
| 类别 | cs.GR |
| 年份 | 2026 |
| 发布时间 | 2026-10-15 |
| 链接 | [原文](https://arxiv.org/abs/2610.21584) |
| PDF | [下载](https://arxiv.org/pdf/2610.21584) |

## 核心贡献
1. 提出 **first-order 纹理空间层次结构**，无需预镶嵌 (pre-tessellation) 即可解锁 displacement surfaces 上的多种几何查询：表面采样、镜面流形搜索 (specular manifold search)、最近点查询。
2. 每个节点存储**局部仿射高度平面** + **保守残差界** (conservative residual bound)，保留 scalar min-max 区间丢弃的空间高度变化信息。
3. 基于该表示构建查询专用的**遍历、剪枝、采样算法**，应用于 **caustics 渲染、displaced emitters 采样、表面 PDE 求解器**，同时保留高效光线追踪能力。

## 技术方案
### 核心问题
Displacement maps 把精细几何细节编码到纹理中，使用前通常需要预镶嵌为密集三角网格，**内存开销巨大**。近年无镶嵌方法已能直接光线追踪；但**其他几何查询**（表面采样、镜面流形搜索、最近点）尚未充分支持，需要表面包围、面积估计、法向量界，这些都无法仅由 scalar 高度区间提供。

### 关键技术

| 技术 | 说明 |
|------|------|
| 仿射高度平面 | 节点的局部线性高度模型 |
| 保守残差界 | 描述仿射近似与真实 displacement 的最大偏差 |
| 斜率界 (slope bounds) | 支持 specular light-path search |
| 面积估计 | 通过平面高度与斜率积分得到 |
| 表面包围 | 用于相交与距离搜索 |

### 公式核心

```math
h_{\text{affine}}(u, v) = h_0 + a(u - u_0) + b(v - v_0)
```

```math
|h(u, v) - h_{\text{affine}}(u, v)| \le \epsilon_{\text{residual}}(u, v)
```

仿射近似 + 残差界共同构成节点的完整包围信息。

## 实验结论
- 场景：多种 displacement-mapped 表面（人物皮肤、有机物体、机械纹理）。
- 与 pre-tessellation 比较：**内存显著节省**，光线追踪效率保持。
- 与查询专用基线比较：**caustics 渲染、displaced emitter 采样、PDE 求解** 性能提升。
- 保留高效 ray tracing 能力（"while retaining efficient ray tracing"）。

## 局限性
- 仿射近似的精度依赖 displacement 频率 — 高频细节可能需要更深层次结构。
- 残差界需保守估计，可能在某些区域过度保守而损失性能。
- 当前主要在 CPU / 简单场景评估，GPU 大规模场景的可扩展性待验证。

## 可行性分析
- 实现难度：**中-高**。需要：(1) 纹理空间的层次结构构建；(2) 多种查询算法的专用遍历；(3) 与现有光线追踪引擎集成。
- 性能预期：内存节省显著（无镶嵌），查询性能优于基线，整体光线追踪效率保持。
- 适用场景：高细节角色表面渲染、产品级渲染器、caustics 效果、建筑可视化中的有机表面。
- 推荐度：**⭐⭐⭐⭐** — 对**离线渲染器**（Cycles / RenderMan / Arnold）的 displacement pipeline 有直接借鉴价值；为团队未来在高质量离线渲染方向的核心技术储备。

## 相关工作
- Tessellation-free displacement ray tracing 前期工作 (e.g., Heitz 2018, PEGASUS 等)
- 微表面理论 (microfacet theory) - 几何查询基础
- Caustics 渲染相关工作群
- [[2026-04-29-8D-Neural-Asset-Light-Transport]] — 同类光照传输方向

## 笔记
- 关键启示：**几何查询的统一数据结构**比专用算法更重要 — 一个 first-order 仿射近似 + 残差界即可同时支持多种查询。
- 对离线渲染器的指导：若团队构建 PBR 离线渲染管线，displacement + 微表面 + caustics 三件套可基于本工作统一抽象。
- 与实时渲染方向互补：实时端侧重 BVH 加速；离线端可借鉴此处的"统一几何表示"思路。