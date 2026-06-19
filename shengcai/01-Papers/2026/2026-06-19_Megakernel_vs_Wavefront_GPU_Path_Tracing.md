---
type: paper
created: 2026-06-19
updated: 2026-06-19
tags: [paper, rendering, path-tracing, GPU, CUDA, performance]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2605.27323
---

# Megakernel vs Wavefront GPU Path Tracing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Megakernel vs Wavefront GPU Path Tracing |
| **作者** | Rafael Padilla et al. |
| **发表** | arXiv:2605.27323 [cs.GR], submitted Tue, 26 May 2026 |
| **链接** | [原文](https://arxiv.org/abs/2605.27323) |
| **DOI** | https://doi.org/10.48550/arXiv.2605.27323 |
| **代码** | - |

---

## 核心贡献

> 在统一 Vulkan 渲染器中用硬件光线追踪实现并对比前向 megakernel PT 和 wavefront PT，发现 wavefront 实现比 megakernel 快约 16%，原因是 wavefront 更好的缓存局部性

1. **统一实现比较**：在同一 Vulkan 渲染器框架下实现两种 GPU 路径追踪架构，确保公平比较
2. **性能分析**：通过 NVIDIA Nsight Graphics traces 分析，wavefront 比 megakernel 快约 16%
3. **瓶颈定位**：两种实现均未达到 GPU 各单元最大吞吐量，通信/内存延迟和同步是主要限制因素
4. **硬件 RT 核**：基于硬件加速的光线-场景求交（RT cores）

---

## 技术方案

### 两种架构对比

| 架构 | 说明 | 特点 |
|------|------|------|
| **Forward PT (Megakernel)** | 每线程追踪单条路径到完成，单一大核函数 | 实现简单，适合低延迟交互 |
| **Wavefront PT (WPT)** | 维护状态缓冲区，专用核函数分阶段追踪，多路径并行 | 更好缓存局部性，更高吞吐 |

### 关键发现

- **Wavefront 优势来源**：改进的缓存局部性（cache locality）
- **瓶颈**：通信和内存延迟 + 同步开销限制
- **GPU 利用率**：两种实现均未达到各单元最大吞吐量

---

## 实验结论

- **测试场景**: A Beautiful Game benchmark
- **结果**: WPT 比 PT 快约 16%
- **工具**: NVIDIA Nsight Graphics
- **硬件**: NVIDIA GPU + hardware RT cores

---

## 局限性

- 4 页短文，细节有限
- 未考虑更复杂的渲染场景（参与介质、非平面材质等）

---

## 实现建议

- **实现难度**: 低（基于现有 Vulkan/RTX 框架）
- **适用场景**: 游戏实时路径追踪、交互式渲染
- **优先级**: 中（性能优化参考）
- **关键结论**: 实时路径追踪实现中，wavefront 架构是更优选择
