---
title: Megakernel vs Wavefront GPU Path Tracing
authors: Rafael Padilla
date: 2026-05-26
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.27323
pdf: https://arxiv.org/pdf/2605.27323
tags: [rendering, ray-tracing, path-tracing, GPU, real-time, 2026]
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
1. 比较了两种 GPU 路径追踪算法：forward path tracing (PT) 和 wavefront path tracing (WPT)
2. 发现 WPT 比 PT 快约 16%，主要得益于更好的缓存局部性
3. 分析了 GPU 各单元利用率，指出通信、内存延迟和同步是性能瓶颈

## 技术方案
- **Megakernel PT**: 每线程追踪一条完整路径，各线程独立
- **Wavefront WPT**: 维护状态缓冲区，在专用 kernel 间追踪路径各阶段

### 关键发现
```
WPT 速度提升: ~16%
性能瓶颈: 通信和内存延迟、同步开销
GPU 利用率: 未达到各单元最大吞吐量
```

## 实验结论
- WPT 通过改进缓存局部性实现加速
- 当前实现未达到最大 GPU 吞吐量
- 通信和内存延迟是主要限制因素

## 局限性
- 算法改进空间尚存
- 未实现最优 GPU 吞吐量

## 可行性分析
- 实现难度：中
- 性能预期：WPT 可实现 ~16% 加速
- 适用场景：实时路径追踪应用

## 相关工作
- [[GPU Ray Tracing]]
- [[Real-time Rendering]]

## 笔记
直接相关的 GPU 路径追踪研究，对理解硬件光线追踪优化有参考价值。