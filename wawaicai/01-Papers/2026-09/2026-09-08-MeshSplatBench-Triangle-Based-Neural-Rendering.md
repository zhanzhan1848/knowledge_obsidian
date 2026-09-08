---
tags: [神经渲染, 三角形网格, 基准测试, 渲染管线]
---

# MeshSplatBench: A Unified Benchmark for Triangle-Based Neural Rendering

## 论文信息

| 属性 | 内容 |
|------|------|
| arXiv | [2609.01306](https://arxiv.org/abs/2609.01306) |
| 分类 | cs.GR |
| 日期 | 2026-09-02 |

## 核心问题

现有三角形基神经渲染方法在自定义研究渲染器中评估，无法判断生产引擎部署可行性。

## 核心方法

1. **MeshSplatBench统一基准**：
   - 标准化评估协议
   - 保留每方法原生优化语义
   - 0.8% PSNR偏差内复现发表结果

2. **分层Unity部署协议**：
   - 原生CUDA渲染器
   - 方法特定专用引擎着色器
   - 标准不透明光栅化

## 关键创新点

- 首个三角形基神经渲染生产部署基准
- 桥接研究与生产渲染器差距
- 分层评估协议

## 开源实现

- 待发布

## 相关笔记

[[TileGS-Tile-Local-Depth-Binning-Gaussian-Splatting]]

## 可行性分析

⚠️ **评估参考**

- 基准测试框架，非新算法
- 有助于评估现有神经渲染方法
