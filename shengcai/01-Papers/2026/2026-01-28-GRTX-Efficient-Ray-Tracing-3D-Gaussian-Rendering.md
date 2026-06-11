---
title: GRTX: Efficient Ray Tracing for 3D Gaussian-Based Rendering
authors: Junseo Lee et al.
date: 2026-01-28
source: arXiv cs.GR
url: https://arxiv.org/abs/2601.20429
pdf: https://arxiv.org/pdf/2601.20429
tags: [rendering, ray-tracing, 3DGS, gaussian-splatting, BVH, 2026]
status: unread
---

# GRTX: Efficient Ray Tracing for 3D Gaussian-Based Rendering

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | GRTX: Efficient Ray Tracing for 3D Gaussian-Based Rendering |
| 作者 | Junseo Lee et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2601.20429) |
| PDF | [下载](https://arxiv.org/pdf/2601.20429) |

## 核心贡献
1. **共享 BLAS 优化**：所有高斯原语引用相同的 BLAS，极大减少 BVH 内存占用和遍历开销
2. **硬件增强**：为光线追踪硬件添加 checkpointing 和 replay 能力
3. 多轮光线追踪中优化 defer 节点的遍历

## 技术方案

### 关键创新
1. 所有高斯原语共享同一个 BLAS (Bottom-Level AS)，而非各自独立
2. 减少 BVH 内存占用和遍历开销

### 硬件 Checkpointing
- 多轮光线追踪中，被某轮光线穿越但不在该轮遍历区间内的 BVH 节点，需要后续轮次处理
- 传统方法需从根节点重新遍历，代价高昂
- 引入 checkpointing 机制实现高效回放

## 实验结论
- 相比 baseline 光线追踪方法显著提升性能
- 硬件开销可忽略

## 可行性分析
- 实现难度：高（需硬件支持）
- 性能预期：显著提升 3DGS 光线追踪性能
- 适用场景：3D Gaussian Splatting 渲染加速

## 相关工作
- [[3D Gaussian Splatting]]
- [[BVH Ray Tracing]]

## 笔记
**重要性**：⭐⭐⭐⭐⭐  
**推荐度**：高 - 面向 3DGS 时代的光线追踪优化