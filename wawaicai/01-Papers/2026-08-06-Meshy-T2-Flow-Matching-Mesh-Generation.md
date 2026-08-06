---
tags: [几何, 网格生成, 流匹配, Flow Matching]
date: 2026-08-06
---

# Meshy T2: Fast Native Mesh Generation with Flow Matching

## 核心方法

**Meshy T2** 是一个基于流匹配 (Flow Matching) 的快速原生网格生成框架，从图像生成高质量网格。

### 关键创新点

1. **Vertex-set Mesh VAE**：
   - 每个顶点编码为一个连续潜在 token
   - 单次前向传递解码顶点、边连接和面缠绕顺序
   - 保持高精度几何和艺术家编写的拓扑

2. **Coarse-to-Fine 级联生成**：
   - **Voxel Flow**：图像条件voxel流，先绘制粗略占用骨架
   - **Mesh Flow**：基于骨架、图像和顶点预算生成每个顶点潜在token

3. **交互式生成速度**：并行流式综合
4. **有效面数控制**：通过请求的顶点预算
5. **多部件资产原生支持**

## 性能指标

- 中位数 6 秒完成端到端图像到网格生成
- 比自回归基线快一个数量级

## 开源参考

- GitHub: https://github.com/meshy-dev/meshy-t2

## 相关笔记

[[HD-PEA: Learning Manifolds in High-D Point Embedding for Anisotropic Surface Approximation]]

## 链接

- arXiv: https://arxiv.org/abs/2607.28675
- PDF: https://arxiv.org/pdf/2607.28675
