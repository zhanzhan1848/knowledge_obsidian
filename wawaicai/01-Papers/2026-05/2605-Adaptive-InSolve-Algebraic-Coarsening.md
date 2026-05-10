---
tags: [几何, 网格处理, GPU, 自适应粗化, IPC]
created: 2026-05-10
venue: arXiv
---

# Adaptive In-Solve Algebraic Coarsening for GPU IPC

## 问题定义

隐式时间积分是模拟刚体材料和大幅变形的核心，但其性能通常被重复求解大型线性系统所主导。

## 核心方法

**代数自适应 in-solve 粗化**：在隐式时间积分的牛顿求解过程中动态减少自由度(DoF)，无需显式拓扑修改。

### 技术流程

1. **Selective Edge Collapse**: 从细网格开始，通过 per-edge tags 控制可折叠边
2. **Warp-level Hash Mapping**: 并行聚合细顶点到粗超节点
3. **Protected Edges**: 保护边保留局部细节
4. **代数组装**: 通过高效 GPU 归约内核映射和归约细尺度梯度和 Hessian
5. **PCG 求解**：预处理共轭梯度法求解粗系统，然后延长解回细网格

## 性能

- **Speedup**: 最高 **3x 加速** over SOTA GPU IPC solver
- **O(N)** per-iteration cost
- 与 IPC barrier energy 无缝集成

## 创新点

- 无显式拓扑修改的 DoF 自适应
- GPU 并行友好：避免不规则数据访问和稠密系统矩阵
- 在牛顿迭代内部进行粗化

## 相关技术

- IPC (Incremental Potential Contact)
- 几何多重网格 (Geometric Multigrid)
- libigl: `decimate` 网格简化功能

## 会议/引用

arXiv:2605.04773 | Authors: Kemeng Huang et al.