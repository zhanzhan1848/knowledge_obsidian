---
title: GRTX: Efficient Ray Tracing for 3D Gaussian-Based Rendering
authors: Junseo Lee et al.
date: 2026-01-28
source: arXiv (HPCA 2026)
url: https://arxiv.org/abs/2601.20429
pdf: https://arxiv.org/pdf/2601.20429
tags: [rendering, ray-tracing, gaussian-splatting, HPCA2026]
status: unread
---

# GRTX: Efficient Ray Tracing for 3D Gaussian-Based Rendering

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | GRTX: Efficient Ray Tracing for 3D Gaussian-Based Rendering |
| 作者 | Junseo Lee et al. |
| 来源 | arXiv (HPCA 2026) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2601.20429) |
| PDF | [下载](https://arxiv.org/pdf/2601.20429) |

## 核心贡献
1. 首创识别 Gaussian 光线追踪的挑战与低效问题
2. 提出为 Gaussian 图元构建高效加速结构的方法，通过 ray space 变换将各向异性 Gaussians 表示为单位球体，大幅减少 BVH 大小和遍历开销
3. 提出光线追踪硬件的 checkpointing 和 replay 能力，在多轮追踪中消除冗余 BVH 遍历

## 技术方案
- **两层加速结构 (Two-Level BVH)**: BLAS 包含共享单位球体 geometry，TLAS 中所有 Gaussian primitives 引用同一 BLAS
- **Ray Space 变换**: 各向异性 Gaussians 通过光线空间变换统一表示为单位球体，可在 GPU 射线追踪硬件的 leaf nodes 执行
- **Checkpointing/Replay**: 多轮追踪中保存节点检查点，下一轮直接从检查点恢复，而非从根节点重启

## 公式
```math
\text{ray space transformation: } T_{ray}(G) \rightarrow S_{unit}
```

## 实验结论
- GRTX (软硬件结合) 相比 icosahedron bounding mesh 基线平均加速 **4.36×**
- GRTX-SW (纯软件优化) 在商品 GPU 上达 **1.44–2.15×** 加速
- 使用 Vulkan-Sim cycle-level 模拟器评估

## 局限性
- 需要专用硬件支持 checkpointing
- 主要针对 3D Gaussian Splatting 场景

## 可行性分析
- 实现难度：高（需要硬件修改）
- 性能预期：显著提升 Gaussian ray tracing 效率
- 适用场景：AR/VR、游戏、交互式媒体、机器人视觉

## 相关工作
- [[3DGS]] [[Gaussian Ray Tracing]] [[BVH]] [[OptiX]]

## 笔记
HPCA 2026 论文。软件优化部分可直接复现，硬件优化需 GPU 架构支持。