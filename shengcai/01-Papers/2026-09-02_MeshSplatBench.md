---
title: MeshSplatBench: A Unified Benchmark for Triangle-Based Neural Rendering
authors: —
date: 2026-09-02
source: arXiv cs.GR
url: https://arxiv.org/abs/2609.01306
pdf: https://arxiv.org/pdf/2609.01306
tags: [rendering, neural-rendering, 3DGS, rasterization, benchmark, paper, 2026]
status: unread
---

# MeshSplatBench: A Unified Benchmark for Triangle-Based Neural Rendering

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | MeshSplatBench: A Unified Benchmark for Triangle-Based Neural Rendering |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2609.01306) |
| PDF | [下载](https://arxiv.org/pdf/2609.01306) |

## 核心贡献
1. 提出 **MeshSplatBench** 统一基准，系统评估三角形神经渲染从原生优化到游戏引擎部署的完整流程
2. 建立标准化评测协议，复现论文结果在 **0.8% PSNR 偏差**内
3. 提出分层 Unity 部署协议，含三个渲染层：原生CUDA渲染器、专用引擎着色器、标准不透明网格管线
4. 对重建表面进行拓扑审计，发现显式连通性和共享索引不足以保证生产就绪资产

## 技术方案
三角形神经渲染通过优化兼容标准光栅化硬件的显式几何基元，桥接神经场景表示与传统图形管线。

核心问题：现有方法几乎只在定制研究渲染器中评估，掩盖了在生产引擎中的实际可用性。

MeshSplatBench 建立标准化评估协议，同时保留各方法的原生优化语义。通过三个 Unity 渲染层：原生CUDA渲染器 → 专用引擎着色器 → 标准不透明网格管线，隔离引擎适配导致的精度损失与表示压缩导致的精度损失。

关键发现：**光栅化能力只是基元级属性**，而图形就绪需要表示、拓扑和引擎兼容性的整体对齐。

## 实验结论
- 在 0.8% PSNR 偏差内复现已发布结果
- 拓扑审计揭示：非流形结构、碎片化组件、边界伪影广泛存在
- 重建资产存在的主要问题：non-manifold structures, fragmented components, boundary artifacts

## 局限性
- 栅栏化能力只是基元级属性，图形就绪需要整体对齐
- 现有方法重建的资产在拓扑上往往不合格

## 可行性分析
- 实现难度：低（基准框架，已有方法集成）
- 性能预期：提供标准化评测指标
- 适用场景：神经渲染方法评测、游戏引擎集成

## 相关工作
- 3D Gaussian Splatting
- Triplane /三角形神经渲染
- 神经辐射场 (NeRF)

## 笔记
**对渲染领域的价值**：MeshSplatBench 是首个系统评估神经渲染生产可用性的基准，对从研究到生产的转化具有重要意义。揭示了"可光栅化 ≠ 生产就绪"这一关键问题。
