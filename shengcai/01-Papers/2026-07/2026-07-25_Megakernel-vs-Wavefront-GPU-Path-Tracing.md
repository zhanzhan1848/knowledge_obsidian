---
type: paper
created: 2026-07-25
updated: 2026-07-25
tags: [paper, path-tracing, GPU, performance, wavefront, megakernel]
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
| **发表** | arXiv 2026 |
| **链接** | [原文](https://arxiv.org/abs/2605.27323) |
| **代码** | 待补充 |

---

## 核心贡献

> 对比分析前向路径追踪(PT)与波前路径追踪(WPT)的GPU性能差异，WPT相比PT有约16%性能提升

1. 系统性对比 Megakernel PT 和 Wavefront WPT 的性能
2. 通过 NVIDIA Nsight Graphics 追踪分析性能瓶颈
3. 发现 WPT 相比 PT 有约16%加速

---

## 技术方案

### PT (Path Tracing / Megakernel)

每个线程跟踪一条完整路径——从初始摄像机光线开始，逐次累积沿路径到摄像机的辐射亮度，并在每个表面散射时更新透射率。

### WPT (Wavefront Path Tracing)

在专用内核调用之间维护状态缓冲区，同时跟踪多个路径阶段——各阶段并行处理。

### 性能分析

| 指标 | PT | WPT |
|------|-----|------|
| 缓存局部性 | 较差 | 较好 |
| 内存延迟影响 | 高 | 中 |
| 同步开销 | 低 | 中 |

关键发现：两种实现均未达到 GPU 各单元的最大吞吐率，通信和内存延迟是主要限制因素。

---

## 实验结论

- WPT 相比 PT 提速约 **16%**
- 加速原因：**缓存局部性改善**
- 瓶颈：通信开销、内存延迟、同步

---

## 局限性

- 未达到 GPU 最大理论吞吐率
- 对特定硬件架构可能表现不同

---

## 实现建议

- **实现难度**: 中
- **预期性能**: WPT 比 Megakernel PT 快约16%
- **适用场景**: 实时路径追踪引擎、GPU渲染器优化
