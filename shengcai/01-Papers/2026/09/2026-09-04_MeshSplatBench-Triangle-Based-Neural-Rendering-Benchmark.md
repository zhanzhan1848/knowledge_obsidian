---
title: MeshSplatBench - A Unified Benchmark for Triangle-Based Neural Rendering
authors: Kaixuan Zhang et al.
date: 2026-09-01
source: arXiv cs.GR
url: https://arxiv.org/abs/2609.01306
pdf: https://arxiv.org/pdf/2609.01306
tags: [rendering, neural-rendering, benchmark, rasterization, 3DGS, mesh]
status: unread
---

# MeshSplatBench - A Unified Benchmark for Triangle-Based Neural Rendering

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | MeshSplatBench: A Unified Benchmark for Triangle-Based Neural Rendering |
| 作者 | Kaixuan Zhang et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2609.01306) |
| PDF | [下载](https://arxiv.org/pdf/2609.01306) |

## 核心贡献
1. **MeshSplatBench**：首个系统性调查三角形神经渲染的统一基准，覆盖从原生优化到游戏引擎部署的完整管线
2. **标准化评估协议**：保持每种方法的原生优化语义，在 0.8% PSNR 偏差内复现发表结果
3. **分层 Unity 部署协议**：三个渲染层——原生 CUDA 渲染器、方法特定专用引擎着色器、标准不透明网格管线
4. **拓扑审计**：揭示显式连通性和共享索引不足以保证生产就绪资产（因非流形结构、碎片化组件、边界伪影）

## 技术方案
- **评估维度**：优化保真度、引擎部署保真度、拓扑质量
- **引擎适配**：量化表示缩减 vs 引擎适配导致的精确保真度损失
- **关键发现**：光栅化能力只是 primitive 级别属性，图形就绪需要表示、拓扑和引擎兼容性的整体对齐

## 实验结论
- 建立了神经渲染从研究到生产的评估标准
- 揭示现有方法在实际引擎部署中的保真度损失
- 拓扑问题（非流形、碎片化、边界伪影）是生产部署的关键瓶颈

## 局限性
- 仅覆盖三角形基础方法
- 主要在 Unity 引擎评估

## 可行性分析
- 实现难度：N/A（基准/评估工作）
- 适用场景：评估神经渲染方法的生产就绪性、研究复现性验证

## 相关工作
- [[2026-09-04_TileGS-Tile-Local-Depth-Binning-3DGS]]
- 3D Gaussian Splatting (Kerbl et al., 2023)
- Mesh-based neural rendering methods

## 笔记
重要的基准测试工作。对渲染知识库的价值：提供了评估神经渲染方法生产就绪性的标准框架。核心洞见"光栅化能力 ≠ 图形就绪"对实际渲染系统集成有重要指导意义。
