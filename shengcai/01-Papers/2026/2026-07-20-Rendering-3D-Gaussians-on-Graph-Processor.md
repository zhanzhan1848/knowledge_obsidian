---
type: paper
created: 2026-07-20
updated: 2026-07-20
tags: [paper, 3D-Gaussians, rendering, IPU, Eurographics-2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2607.15951
---

# Rendering 3D Gaussians on a Graph Processor

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Rendering 3D Gaussians on a Graph Processor |
| **作者** | Nicholas Fry et al. |
| **发表** | Eurographics Symposium on Rendering (Symposium Track), 2026 |
| **链接** | [原文](https://arxiv.org/abs/2607.15951) |
| **DOI** | https://doi.org/10.2312/sr.20261017 |
| **代码** | https://nmjfry.github.io/ipu-3dgs/ |

---

## 核心贡献

> 首次在Graph Processing Unit (IPU)上实现3D Gaussian渲染器，探索DRAM-free架构在神经渲染中的潜力

1. 首个在IPU (Intelligence Processing Unit)上实现的3D Gaussian渲染器
2. 利用IPU的BSP模型和SRAM-only约束，探索传感器-处理器架构的渲染潜力
3. 分析了IPU架构下3DGS渲染的瓶颈：核间带宽、每核SRAM容量、非均匀高斯密度的工作负载不平衡

---

## 技术方案

### 核心思想

- IPU包含1472个独立tile，仅有片上SRAM
- 每个tile"拥有"帧缓冲区的一个屏幕空间区域
- Gaussian原语通过NEWS (North-East-West-South)网格的曼哈顿距离跳跃路由到目标tile
- 然后以扩展树模式分发到重叠的相邻tile

### 架构特点

| 特性 | 说明 |
|------|------|
| 1472 tiles | 每个tile独立处理 |
| SRAM-only | 无外部DRAM |
| BSP模型 | Bulk Synchronous Parallel |
| 编译时通信 | tile间通信在编译时定义 |

---

## 实验结论

- **平台**: Graphcore IPU
- **输入**: 来自真实场景的3D Gaussian maps
- **瓶颈分析**:
  1. 核间带宽限制
  2. 每tile SRAM容量限制
  3. 非均匀高斯密度导致的工作负载不平衡

### 对GPU架构的启示

论文提出：直接进行SM间通信可能提供减少GPU内核DRAM访问的途径，暗示未来DRAM-free或传感器内处理架构的潜力。

---

## 局限性

1. IPU的SRAM容量限制导致大规模场景渲染困难
2. 工作负载不平衡问题在非均匀场景中显著
3. 目前仅支持静态场景

---

## 实现建议

- **实现难度**: 高
- **适用场景**: 低延迟渲染、传感器内处理、边缘计算
- **优化方向**: 核间通信优化、负载均衡、混合DRAM/SRAM架构

---

## 相关工作

- 3D Gaussian Splatting相关研究
- IPU架构在图形渲染中的应用
- 传感器-处理器架构
