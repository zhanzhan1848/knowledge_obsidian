---
tags: [渲染, 3DGS, Graph-Processor, IPU, 并行渲染, 2026-07]
date: [[2026-07-24]]
status: 待读
---

# Rendering 3D Gaussians on a Graph Processor

## 元信息

| 标题 | 值 |
|------|-----|
| 标题 | Rendering 3D Gaussians on a Graph Processor |
| 作者 | Nicholas Fry |
| 链接 | [arXiv:2607.15951](https://arxiv.org/abs/2607.15951) |
| PDF | [PDF](https://arxiv.org/pdf/2607.15951) |
| 发表 | Eurographics Symposium on Rendering 2026 |

## 核心贡献

1. **首个 IPU 上的 3D Gaussian 渲染器**: 在 Intelligence Processing Unit (IPU) 上实现 3DGS 渲染
2. **SRAM-Only 实现**: 1472 个独立 tiles，仅使用片上 SRAM，模拟高效传感器-处理器架构
3. **NEWS Grid 路由**: 通过 Manhattan 距离 hops 在北-东-西-南网格上路由 Gaussian 原语到目标 tiles

## 技术方案

### 硬件背景
IPU 包含 1,472 个独立 tiles，每个 tile 只有片上 SRAM（无 DRAM），这近似于高效传感器-处理器架构的属性。

### 渲染架构
- **Tile 区域划分**: 每个 tile "拥有"帧缓冲区的一个屏幕空间区域
- **Gaussian 路由**: 原语通过 Manhattan 距离 hops 在 NEWS 网格上路由到目标 tile
- **扩展树分发**: 路由到目标 tile 后，分发给重叠的邻居节点（扩展树模式）
- **BSP 计算模型**: 遵循 Bulk Synchronous Parallel 模型，tile 间通信在编译时定义

### 性能瓶颈分析
1. **Tile 间带宽**: 主要瓶颈
2. **Per-tile SRAM 容量**: 限制场景规模
3. **工作负载不均衡**: 非均匀 Gaussian 密度导致

## 实验结论

- 展示了空间和时间局部性的利用
- SRAM-Only 实现可实现 Gaussian 渲染
- 揭示了未来无传感器和 DRAM-Free 架构的潜力

## 架构启示

对于传统 GPU 和 3D 表示的更广泛问题：
- 减少 DRAM 访问的潜在方法
- SM 间直接通信的可能性
- 未来渲染架构方向

## 标签
#3dgs #gaussian-splatting #graph-processor #ipu #parallel-rendering #eurographics-2026
