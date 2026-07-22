---
title: Rendering 3D Gaussians on a Graph Processor
authors: Nicholas Fry
date: 2026-07-17
source: Eurographics Symposium on Rendering 2026
url: https://arxiv.org/abs/2607.15951
pdf: https://arxiv.org/pdf/2607.15951
tags: [rendering, 3DGS, graph-processor, IPU, rasterization]
status: unread
---

# Rendering 3D Gaussians on a Graph Processor

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Rendering 3D Gaussians on a Graph Processor |
| 作者 | Nicholas Fry |
| 来源 | Eurographics Symposium on Rendering (Symposium Track), 2026 |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2607.15951) |
| PDF | [下载](https://arxiv.org/pdf/2607.15951) |

## 核心贡献
1. 首个在Intelligence Processing Unit (IPU)上实现3D Gaussian渲染器
2. 提出基于Manhattan距离的NEWS网格路由机制，高斯原语通过北-东-西-南跳点路由到目标tile
3. 在SRAM-only约束下分析性能瓶颈：tile间带宽、每tile SRAM容量、高斯密度不均匀导致的负载均衡问题

## 技术方案
**硬件架构**: IPU包含1,472个独立tiles，每个tile只有on-chip SRAM，模拟sensor-processor架构特性

**渲染流程**:
1. 每个tile拥有framebuffer的屏幕空间区域
2. 高斯原语通过NEWS网格的Manhattan距离跳点路由到目标tile
3. 以扩展树模式分发到重叠的邻居
4. 计算遵循IPU的BSP (Bulk Synchronous Parallel)模型

**关键设计**:
- 空间和时间局部性利用：核心间本地数据传输
- 编译时定义tile间通信

## 性能瓶颈分析
1. **Inter-tile bandwidth**: 主要瓶颈
2. **Per-tile SRAM capacity**: 内存限制
3. **Workload imbalance**: 非均匀高斯密度导致

## 实验结论
- 分析了SRAM-only实现下的性能约束
- 揭示了传统GPU减少DRAM访问的潜在方向：SM间直接通信
- 为未来on-sensor和DRAM-free架构提供参考

## 局限性
- 仅适用于SRAM-only架构
- 需要针对特定硬件特性优化

## 可行性分析
- 实现难度：中
- 性能预期：需要特定IPU硬件
- 适用场景：嵌入式视觉、传感器直接处理

## 相关工作
- [[3D Gaussian Splatting]]
- [[Neural Rendering]]

## 笔记
这是首个探索3DGS在非传统GPU架构上渲染的研究，对未来渲染架构有启发意义。
