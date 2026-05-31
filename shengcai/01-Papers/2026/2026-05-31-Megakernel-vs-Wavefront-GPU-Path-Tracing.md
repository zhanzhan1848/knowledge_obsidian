---
title: Megakernel vs Wavefront GPU Path Tracing
authors: Rafael Padilla
date: 2026-05-26
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.27323
pdf: https://arxiv.org/pdf/2605.27323
tags: [rendering, path-tracing, GPU, ray-tracing, paper, 2026]
status: unread
---

# Megakernel vs Wavefront GPU Path Tracing

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Megakernel vs Wavefront GPU Path Tracing |
| 作者 | Rafael Padilla |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.27323) |
| PDF | [下载](https://arxiv.org/pdf/2605.27323) |

## 核心贡献
1. 对比分析了前向路径追踪（PT）和波前路径追踪（WPT）两种 GPU路径追踪算法的性能
2. 发现 WPT 相比 PT 实现约 **16% 的性能提升**
3. 通过 NVIDIA Nsight Graphics 跟踪分析，将性能提升归因于 WPT 更好的缓存局部性
4. 发现当前实现未达到 GPU 各单元的最大吞吐量，通信/内存延迟和同步是限制因素

## 技术方案

### Megakernel Path Tracing (PT)
- 每个线程 trace 一条完整路径到完成
- 适合 GPU 硬件 ray tracing core (RT cores) 加速
- 所有计算在单一 kernel 内完成

### Wavefront Path Tracing (WPT)
- 在专用 kernel 调用间维护状态缓冲区
- 不同 path stages 并行 trace
- 改善了缓存局部性

### 性能分析结论
```
WPT 优势：
- 更好的 cache locality
- ~16% speedup over PT

PT 瓶颈：
- 通信和内存延迟
- 同步开销
- 未达到最大 GPU 吞吐量
```

## 实验结论
- WPT 在实现中比 PT 快约 16%
- 性能瓶颈主要在内存延迟和同步，而非 GPU 计算能力
- 两种方法均未达到 GPU 各单元最大吞吐量

## 局限性
- 当前实现存在通信和内存延迟瓶颈
- 未实现 GPU 各单元的最大吞吐量
- 需要进一步算法优化

## 可行性分析
- 实现难度：中
- 性能预期：WPT 比 PT 提升约 16%，可进一步优化
- 适用场景：实时路径追踪、交互式渲染

## 相关工作
- [[NVIDIA OptiX]]
- [[GPU Ray Tracing]]