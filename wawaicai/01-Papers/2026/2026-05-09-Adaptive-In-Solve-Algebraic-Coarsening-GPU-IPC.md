---
tags: [几何, 网格处理, GPU, IPC, 自适应, 代数粗化]
date: 2026-05-09
category: [arXiv, cs.GR]
venue: arXiv
---

# Adaptive In-Solve Algebraic Coarsening for GPU IPC

## 核心方法

**代数自适应 in-solve coarsening** - 一种面向 GPU 的方法，在隐式时间积分的牛顿求解过程中**动态减少自由度**，无需显式拓扑修改。

### 关键技术点
1. **Selective Edge-collapse Process** - 从细网格出发，通过 per-edge tags 表达适应性
2. **Warp-level Hash Mapping** - 可折叠边并行聚合，将细顶点分组为粗 super-nodes
3. **Protected Edges** - 受保护边保留局部细节
4. **Implicit Coarse Mesh** - 定义隐式粗网格，其线性系统通过高效 GPU reduction kernels 组装
5. **PCG Solver** - 预处理共轭梯度法求解粗系统，然后 prolongate 回细网格

## 与 SOTA GPU IPC Solver 对比
- **3x 加速**，视觉效果无差异

## 算法复杂度
- 时间复杂度：O(N) per-iteration
- 空间复杂度：O(N) 细网格 + O(M) 粗网格（M << N）

## 创新点
- 首次在 IPC 隐式时间积分中实现 algebraic adaptive coarsening
- 无需显式拓扑修改，避免几何交叉
- GPU 并行效率高

## 可行性分析
- ✅ 可推荐实现
- 难度：高
- 数值稳定性：PCG 收敛性有保障
- 依赖：GPU IPC solver, thrust/CUB

## 相关笔记
[[网格简化]]
[[GPU并行计算]]
