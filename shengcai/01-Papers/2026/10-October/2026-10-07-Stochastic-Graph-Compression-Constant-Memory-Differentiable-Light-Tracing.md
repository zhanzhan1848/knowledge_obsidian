---
title: "Stochastic Graph Compression for Constant-Memory Differentiable Light Tracing"
authors: (arXiv preprint, see source URL)
date: 2026-10-07
source: arXiv (cs.GR)
url: https://arxiv.org/abs/2610.10847
pdf: https://arxiv.org/pdf/2610.10847
arxiv_id: "2610.10847v1"
tags: [rendering, paper, 2026, differentiable-rendering, light-tracing, path-tracing, reservoir-sampling, memory-optimization]
status: unread
---

# Stochastic Graph Compression for Constant-Memory Differentiable Light Tracing

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Stochastic Graph Compression for Constant-Memory Differentiable Light Tracing |
| 类别 | cs.GR |
| 年份 | 2026 |
| 发布时间 | 2026-10-07 |
| 链接 | [原文](https://arxiv.org/abs/2610.10847) |
| PDF | [下载](https://arxiv.org/pdf/2610.10847) |

## 核心贡献
1. 提出 **Reservoir Light Replay Backpropagation (ResLRB)**，实现 reverse-mode 可微光传输，**内存与路径长度、每条光路径的传感器连接数均无关**。
2. 用 **流式加权 reservoir** 在正向传播过程中，**为每条光路径随机保留一个代表性的传感器连接**，将 adjoint 计算图从"分支结构"压缩到"线性"。
3. 反向传播时通过**重放伪随机序列**重构路径，**只对保留的连接反向传播**，得到无偏梯度估计，峰值内存 ≈ 单次散射事件的微分。

## 技术方案
- 关键观察：常规 adjoint path replay 通过**无分支**路径消除深度依赖；而 splatting（光→传感器）天然带分支（每个散射顶点都可能 splat 到多个像素）。
- 解决思路：
  1. 在 primal pass 中维护一个 streaming weighted reservoir（沿用 Z sampler / A-Res 思想）。
  2. 每条 light path 进入采样器时按权重做 weighted-reservoir 保留，记录一个 representative sensor connection。
  3. Adjoint pass：用相同的伪随机序列回放路径，仅对该 connection 求梯度。
- 形式上等价于对所有传感器连接的梯度贡献做 unbiased 估计：
```math
  \nabla_\theta \mathcal{L}
  \;\approx\;
  \frac{\partial \mathcal{L}}{\partial c^\star}\,
  \frac{\partial c^\star}{\partial \theta},
  \quad
  c^\star \sim \text{WeightedReservoir}\bigl(c_1,\ldots,c_K\bigr)
```
- **常数内存**峰值：$O(\text{single scatter event})$, 不再随 path depth 增长。

## 实验结论
- 论文展示了对光传输相关任务的反向传播可行性，无需显式构造 full computation graph。
- 适用更复杂的 differentiable light transport 优化（材质、几何、相机、传感器等参数同时优化）。

## 局限性
- stochastic 单连接保留引入方差，可能需要更长训练时间或更多样本抵消。
- 依赖 Mitsuba / Dr.Jit 类可微光传输框架才能落地。

## 可行性分析
- 实现难度：**高**。需要可微渲染器底座（Mitsuba 3 / Dr.Jit）+ streaming reservoir 改造。
- 性能预期：显存 **常数**而非线性，可训练大规模场景；时间复杂度略高于逐连接反向。
- 适用场景：可微光传输、inverse rendering、神经光照资产的端到端优化。
- 推荐度：**⭐⭐⭐⭐** — 解决了 differentiable light tracing 的核心显存瓶颈，对团队 inverse rendering 路线有战略价值。

## 相关工作
- [[2026-04-29-8D-Neural-Asset-Light-Transport]]
- Differentiable Monte Carlo Ray Tracing via Differential Probability Gradients (Zhao et al.)
- ReSTIR PT 梯度版 — [[2026-05-28_Gradient_Domain_ReSTIR_PT_Eurographics2026]]
- Dr.Jit / Mitsuba 3 相关工作。

## 笔记
- 团队评估：在已有 Mitsuba 3 / Dr.Jit 集成经验的前提下，可优先列为下季度 R&D 候选。
