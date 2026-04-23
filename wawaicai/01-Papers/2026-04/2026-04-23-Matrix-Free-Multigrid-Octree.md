---
type: paper
created: 2026-04-23
updated: 2026-04-23
tags: [geometry, mesh, octree, multigrid, solver, GPU]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2604.18886
---

# Matrix-Free Multigrid with Algebraically Consistent Coarsening on Adaptive Octrees

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Matrix-Free Multigrid with Algebraically Consistent Coarsening on Adaptive Octrees |
| **作者** | Mengdi Wang et al. |
| **发表** | arXiv cs.GR (Apr 2026) - Submitted to Journal of Computational Physics |
| **链接** | [原文](https://arxiv.org/abs/2604.18886) |
| **DOI** | 10.48550/arXiv.2604.18886 |

---

## 核心贡献

> GPU 矩阵-free 多网格预条件子，用于自适应八叉树网格上的泊松方程求解

1. 在均匀分辨率区域，Galerkin 原理满足粗化（coarsening）
2. 在 T 型连接处（refinement levels 之间），提出 **flux-consistent coarse-grid correction**
3. 保持紧凑矩阵-free 形式，适合 GPU 并行执行

---

## 技术方案

### 核心思想

在自适应八叉树网格上求解泊松方程，矩阵-free GPU 多网格预条件子：
- uniform-resolution 区域满足 Galerkin principle
- T-junction 处用 flux-consistent correction 恢复跨级一致性

### 关键技术

| 技术 | 说明 |
|------|------|
| Matrix-free | 不存储稀疏矩阵，适合 GPU |
| Adaptive Octree | 自适应八叉树网格 |
| Algebraically Consistent Coarsening | 代数一致性粗化 |
| Flux-consistent Correction | T 型连接处通量守恒修正 |

### 性能

- 单 NVIDIA RTX 4090 GPU 达到 full-solve throughput >200M cells/s（解析泊松测试）
- >70M cells/s（流体模拟压力投影）

---

## 实验结论

- 二阶精度（second-order accuracy）
- PCG 下网格无关收敛（grid-independent convergence）
- cut-cell 问题（流体模拟）表现稳健

---

## 相关工作

- [[Octree Mesh]]
- [[Multigrid Methods]]
- [[GPU Solver]]

---

## 实现建议

- **实现难度**: 高（需要深入理解多网格和 GPU 并行）
- **预期性能**: 200M+ cells/s 吞吐量
- **适用场景**: 流体模拟、泊松方程求解、网格自适应问题

---

## 开源参考

- CGAL: 可能有类似 octree 实现
- 论文 PDF: https://arxiv.org/pdf/2604.18886