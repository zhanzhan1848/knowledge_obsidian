---
title: Rethinking Collision Detection on GPU Ray Tracing Architecture
authors: Durga Mandarapu, Isaac Fuksman, Artem Pelenitsyn, Gilbert Bernstein, Milind Kulkarni
date: 2026-04-26
source: arXiv cs.GR / ICS 2026
url: https://arxiv.org/abs/2604.23520
pdf: https://arxiv.org/pdf/2604.23520
tags: [rendering, ray-tracing, collision-detection, GPU, BVH, particle-simulation, paper, 2026]
status: unread
---

# Rethinking Collision Detection on GPU Ray Tracing Architecture

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Rethinking Collision Detection on GPU Ray Tracing Architecture |
| 作者 | Durga Mandarapu, Isaac Fuksman, Artem Pelenitsyn, Gilbert Bernstein, Milind Kulkarni |
| 来源 | arXiv cs.GR / ICS 2026 |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.23520) |
| PDF | [下载](https://arxiv.org/pdf/2604.23520) |

## 核心贡献
1. **识别先前方法的基本误解**：指出将 DCD 简化为固定半径邻居搜索在非均匀球体上失效
2. **Mochi 规约**：利用碰撞关系的对称性，为非均匀球体提供正确且紧凑的 RT-based DCD
3. **per-object proxy spheres**：解耦 BVH 包围盒与碰撞搜索半径，实现更紧的边界框

## 技术方案

### 问题背景
传统 DCD 需使用 BVH 等索引结构加速，但 GPU shader cores 上加速不规则 BVH 遍历困难
GPU RT 架构提供硬件加速 BVH 遍历

### 现有方法的问题
先前 RT-based DCD 工作将 DCD 简化为固定半径邻居搜索：
- 均匀球体：有效
- 非均匀球体：失效，需要过大的包围盒

### Mochi 方法
**关键观察**：碰撞关系是对称的，无需两方都检测碰撞

**Proxy Sphere 定义**：
给定球体 $S$（中心 $\mathbf{c}$，半径 $r$），其 proxy sphere 为同一中心、半径 $2r$ 的球体

**算法**：
1. 为每个输入球体构造 proxy sphere
2. 在 proxy spheres 上构建 BVH
3. 从每个球体中心发射点射线（point ray）
4. 射线遍历 BVH 并报告 ray-proxy-sphere 交集
5. 每个交集标识候选碰撞对

**正确性**：保证所有真碰撞被检测，无遗漏

### 形式化正确性证明
Mochi 是先前均匀半径 NNS 方法的泛化，避免了其对非均匀球体的根本限制

## 实验结论
- 在大规模粒子工作负载上展示显著加速
- 优于 state-of-the-art BVH-based 和 RT-based DCD 实现
- 支持均匀和非均匀球体的高效 DCD

## 局限性
- 专注于球体几何
- 需要 GPU RT 架构支持
- DEM 管线集成可能需要额外工作

## 可行性分析
- **实现难度**：中
  - 需利用 OptiX 等 RT 框架
  - proxy sphere 构建和 BVH 遍历需仔细实现
- **性能预期**：显著性能提升，尤其在大规模非均匀粒子场景
- **适用场景**：粒子模拟、流体模拟、离散元方法（DEM）

## 相关工作
- [[BVH Collision Detection]]
- [[Neighbor Search on RT Architecture]]
- [[Particle-based Physics Simulation]]

## 笔记
Purdue University 和 University of Washington 联合完成。
将于 ICS 2026 ( Belfast, UK) 展示。
开源代码：https://github.com/MDurgaKeerthi/Mochi-DCD-on-RT
对粒子物理模拟有重要应用价值。
