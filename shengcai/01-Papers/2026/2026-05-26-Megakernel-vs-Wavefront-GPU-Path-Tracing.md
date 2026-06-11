---
title: Megakernel vs Wavefront GPU Path Tracing
authors: Rafael Padilla, Kyle Webster, Austin H Kim
date: 2026-05-26
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.27323
pdf: https://arxiv.org/pdf/2605.27323
tags: [rendering, ray-tracing, path-tracing, GPU, 2026]
status: unread
---

# Megakernel vs Wavefront GPU Path Tracing

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Megakernel vs Wavefront GPU Path Tracing |
| 作者 | Rafael Padilla, Kyle Webster, Austin H Kim (University of Utah) |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.27323) |
| PDF | [下载](https://arxiv.org/pdf/2605.27323) |

## 核心贡献
1. 对比分析了两种 GPU 路径追踪算法：前向路径追踪 (PT) 和波前路径追踪 (WPT)
2. 发现 WPT 相比 PT 实现约 **16% 加速**，归因于更好的缓存局部性
3. 通过 NVIDIA Nsight Graphics 分析，发现当前实现未达到 GPU 各单元的最大吞吐量，瓶颈在通信和内存延迟

## 技术方案

### 光传输方程
```math
L(x,\omega_o) = L_e(x,\omega_o) + \int_{S^2} L_i(x,\omega_i) f(x,\omega_o,\omega_i) |n \cdot \omega_i| d\omega_i
```

### Monte Carlo 积分器
```math
\hat{I} = \frac{1}{N} \sum_{i=1}^{N} \frac{f(X_i)}{p(X_i)} \approx \int_\Omega f(x) dx
```

### 前向路径追踪 (Megakernel)
每线程独立追踪完整路径，单 kernel 完成所有步骤：
1. 从相机生成初始光线
2. 沿当前方向与场景求交找到散射点
3. 累积沿路径的辐射率
4. 采样新方向延伸路径并更新 throughput
5. 重复直到达到最大路径长度

### 波前路径追踪 (Wavefront)
将路径追踪解耦为四个顺序 GPU 计算阶段：
- 光线生成 (Ray Generation)
- 场景求交 (Scene Intersection)
- 材质着色 (Material Shading)
- 辐射率累积 (Radiance Accumulation)

各阶段通过状态缓冲区间传递，实现更好的缓存局部性。

## 实验结论
- WPT 相比 PT 获得 ~16% 加速
- 加速主要来源于改善的缓存局部性
- 通信和内存延迟是当前实现的限制因素

## 局限性
- 未达到最大 GPU 吞吐量
- 需要进一步优化同步开销

## 可行性分析
- 实现难度：中等
- 性能预期：16% 加速，缓存局部性是关键
- 适用场景：实时渲染，离线渲染

## 相关工作
- [[Laine et al. 2013 - Wavefront Path Tracing]]
- [[Pharr et al. 2023 - Rendering Equation]]

## 笔记
**重要性**：⭐⭐⭐⭐⭐  
**推荐度**：高 - 对理解 GPU 路径追踪实现选择有重要价值