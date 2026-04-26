---
title: "Matrix-Free Multigrid with Algebraically Consistent Coarsening on Adaptive Octrees"
authors: "Mengdi Wang"
date: 2026-04-20
status: 待读
tags: [渲染, Poisson方程, Multigrid, Octree, GPU, 流体模拟]
conference: arXiv (Submitted to JCP)
arxiv_id: "2604.18886"
---

# Matrix-Free Multigrid with Algebraically Consistent Coarsening on Adaptive Octrees

## 基本信息
| 项目 | 内容 |
|------|------|
| 作者 | Mengdi Wang |
| 发表 | arXiv cs.GR (2026-04-20), submitted to JCP |
| 链接 | [arXiv](https://arxiv.org/abs/2604.18886) |

## 核心贡献
1. **Matrix-free GPU multigrid preconditioner**：在自适应 octree 上求解 Poisson 方程
2. **代数一致粗化**：Uniform 分辨率区域满足 Galerkin 原则
3. **T-junction 通量一致粗化校正**：恢复跨层级一致性，保持紧凑 matrix-free 表示

## 技术方案

### 问题
- 自适应 octree 网格上的 Poisson 方程求解
- 不规则域
- 需要 GPU 高效实现

### 方法
- Matrix-free 形式存储粗算子
- 适合 GPU 并行执行
- Flux-consistent coarse-grid correction at T-junctions

### 关键创新
在 refinement level 之间的 T-junction 处：
- 提出 flux-consistent coarse-grid correction
- 恢复跨层级一致性
- 保持 compact matrix-free 表示

## 性能
- 单 NVIDIA RTX 4090 GPU
- 全解吞吐量 > 200M cells/s (解析 Poisson 测试)
- > 70M cells/s (流体模拟压力投影)
- 二阶精度
- 网格无关收敛 (with PCG)
- 鲁棒的 cut-cell 问题性能

## 评估
- **创新性**: ⭐⭐⭐⭐
- **实用性**: ⭐⭐⭐⭐ (渲染中 Poisson 方程常见，如全局光照)
- **难度**: 高
- **推荐度**: ⭐⭐⭐⭐

## 相关工作
- Poisson equation solvers
- Multigrid methods
- Adaptive octrees
- GPU computing
- Fluid simulation

## 链接
- PDF: https://arxiv.org/pdf/2604.18886