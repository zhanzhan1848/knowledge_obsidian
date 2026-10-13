---
title: "Reservoir Light Replay Backpropagation (ResLRB): Stochastic Graph Compression for Constant-Memory Differentiable Light Tracing"
date: 2026-10-13
tags: [differentiable-rendering, light-tracing, photon-mapping, splatting, path-tracing, reservoir-sampling]
authors: [Linas Beresna et al.]
arxiv: 2610.10847
venue: SIGGRAPH Asia 2026 Technical Communications
doi: 10.1145/3829339.3847837
status: processed
subjects: cs.GR
---

## 核心创新点

**ResLRB** — 针对**光追踪 (light tracing, photon mapping)** 的可微渲染，**存储占用与路径长度、每路径传感器连接数都无关**（常数内存），适用于大规模光子 splatting 场景。

### 关键技术

1. **问题诊断** — light tracing 反向模式沿路径维护计算图，每段散射都做 splat，记录会随**有效传感器连接**线性增长
2. **Streaming Weighted Reservoir** — 在前向 pass 中**每条光路径随机保留单一代表传感器连接**
3. **伪随机回放** — 反向 pass 重放 PRNG 序列，**确定性重建路径**，只沿保留的连接反向传播
4. **无偏估计** — 梯度估计无偏，峰值内存 = 单次散射事件反向传播内存

### 核心技术对比

| 方法 | 内存与路径长度 | 内存与传感器连接 |
|------|-----------|-----------|
| Naive AD light tracer | O(L) | O(C) |
| Adjoint path replay | O(1) | ❌ 不支持（splatting 分支） |
| **ResLRB** | **O(1)** | **O(1)** |

## 适用场景

- 大规模光子映射可微管线
- 烟雾/火焰/水等参与介质可微渲染（参与介质常用 light tracing 处理）
- 流体表面 + 体积的耦合光路

## 推荐度

✅ 推荐 — 对做体积可微、参与介质参数反演的团队必备

## 关键词

`light tracing` `differentiable rendering` `photon mapping` `reservoir sampling` `splatting` `reverse-mode AD`

## 相关工作

- [[2026-10-13-UltraDiff-Differentiable-Ultrasound]] — 相关，扩展 differentiability 到新模态
- [[2026-10-13-Sensitivity-AOV-Differentiable-Rendering]] — 同作者系列 SIGGRAPH Asia 2026 工作

---
*由豆苗自动收集于 2026-10-13*
