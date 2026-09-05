---
tags: [几何, 神经渲染, 三角形网格, 基准测试]
---

# MeshSplatBench: A Unified Benchmark for Triangle-Based Neural Rendering

## 论文信息
- **arXiv**: [2609.01306](https://arxiv.org/abs/2609.01306)
- **会议**: Pacific Graphics 2026
- **日期**: 2026-09-02

## 核心方法
提出 MeshSplatBench，统一基准测试三角形神经渲染，覆盖从原生优化到游戏引擎部署的完整流程。

## 技术要点
- **评估协议**: 标准化评估协议，保持每个方法原生优化语义，在 0.8% PSNR 偏差内复现发表结果
- **Unity 部署层级**: 
  1. 原生 CUDA 渲染器
  2. 方法特定专用引擎着色器
  3. 标准 opaque mesh pipelines
- **拓扑审计**: 发现显示显式连通性和共享索引不足以保证生产级资产（由于非流形结构、碎片化组件、边界伪影）
- **关键发现**: rasterizability 仅仅是图元级属性

## 几何问题
- 非流形结构 (non-manifold structures)
- 碎片化组件 (fragmented components)
- 边界伪影 (boundary artifacts)

## 相关笔记
[[2026-09-05-WildFab-Multi-Axis-3D-Printing-Wild-Models]]
[[2026-09-05-TileGS-Tile-Local-Depth-Binning-Gaussian-Splatting]]
