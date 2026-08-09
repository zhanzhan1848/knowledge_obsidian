---
title: Rendering 3D Gaussians on a Graph Processor
authors: Ignacio Alzugaray, Mark Pupilli, Paul H. J. Kelly, Andrew J. Davison
date: 2026-07-16
source: arXiv cs.GR
url: https://arxiv.org/html/2607.15951v1
pdf: https://arxiv.org/pdf/2607.15951
tags: [rendering, 3DGS, rasterization, IPU, graph-processor, SRAM-only, memory-locality]
status: unread
---

# Rendering 3D Gaussians on a Graph Processor

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Rendering 3D Gaussians on a Graph Processor |
| 作者 | Ignacio Alzugaray, Mark Pupilli, Paul H. J. Kelly, Andrew J. Davison (Imperial College London) |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/html/2607.15951v1) |
| PDF | [下载](https://arxiv.org/pdf/2607.15951) |

## 核心贡献
1. **首个3DGS在SRAM-only MIMD处理器(IPU)上的实现**
2. **高斯原语路由方案**：将3D Gaussian路由到拥有屏幕空间区域的tile
3. **BSP并行计算模型**：tile间通信在编译时定义
4. **架构启示**：为减少DRAM访问，未来GPU可能需要direct inter-SM通信

## 技术方案

### 硬件背景
- Graphcore Mk2 IPU：1472个独立tile，每个624KB SRAM，无外部DRAM
- 特点：本地内存、显式tile间通信、无共享地址空间
- 模拟高效sensor-processor架构的关键特性

### 3DGS on IPU
1. **帧缓冲区划分**：每个tile拥有屏幕空间的矩形区域
2. **高斯路由**：沿Manhattan网格(North-East-West-South) hop路由到目标tile
3. **树形分发**：分发到重叠邻居（扩展树模式）
4. **本地排序与alpha混合**：每个tile独立并行排序和混合

### 关键洞察
```
GPU: 3DGS渲染是memory-bound
     DRAM访问，而非算术，是帧时间的主导因素

IPU启示: 通过显式数据移动，可利用数据的空间局部性
```

## 实验分析

### 瓶颈分析
- **Tile间带宽**：限制因素之一
- **每tile SRAM容量**：约束瓶颈
- **工作负载不均衡**：非均匀高斯密度导致

### 性能 vs 质量权衡
- 充分利用局部性可降低功耗和延迟
- 为sensor-processor和DRAM-free架构提供参考

## 局限性
- IPU非渲染专用硬件
- 扩展到更大场景受限于SRAM容量

## 可行性分析
- 实现难度：高（需要全新渲染架构适配）
- 性能预期：良好（在特定硬件约束下）
- 适用场景：AR眼镜、移动机器人、传感器端计算

## 相关工作
- [[2025-06_Stochastic-Ray-Tracing-Transparent-3D-Gaussians]] - 透明体3DGS
- [[2025-05-Virtualized-3D-Gaussians]] - 虚拟化3DGS

## 笔记
核心价值：不只是为IPU做3DGS，而是验证了3DGS在DRAM-free架构上的可行性，以及揭示了GPU上3DGS的memory-bound本质。对未来边缘设备渲染有重要参考意义。
