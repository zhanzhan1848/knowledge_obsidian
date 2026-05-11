---
type: paper
created: 2026-05-11
updated: 2026-05-11
tags: [paper, mesh-simplification, GPU, IPC, physics-simulation, adaptive-coarsening]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2605.04773
---

# Adaptive In-Solve Algebraic Coarsening for GPU IPC

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Adaptive In-Solve Algebraic Coarsening for GPU IPC |
| **作者** | Kemeng Huang et al. |
| **发表** | arXiv cs.GR (2026) |
| **链接** | [原文](https://arxiv.org/abs/2605.04773) |

---

## 核心贡献

> 提出代数自适应 in-solve 粗化方法，动态减少隐式时间积分中的自由度

1. GPU 导向方法：在牛顿求解内动态减少 DoF，无需显式拓扑修改
2. Warp 级哈希映射：并行聚合细顶点为粗 super-node
3. 最高 3 倍加速，同时产生视觉无法区分的结果

---

## 技术方案

### 核心思想

从细网格开始，将适应性表述为选择性边缘折叠过程：
1. 可折叠边缘通过 warp 级哈希映射方案并行聚合
2. 受保护边缘保留局部细节
3. 隐式粗网格的线性系统通过高效 GPU 归约核装配

### 关键技术

| 技术 | 说明 |
|------|------|
| 边缘折叠 | 选择性 DoF 减少 |
| Warp 级哈希 | GPU 并行聚合 |
| PCG | 预处理共轭梯度法 |

---

## 实验结论

- **加速**: 最高 3 倍 vs SOTA GPU IPC solver
- **质量**: 视觉无法区分的结果
- **场景**: 多种挑战性场景验证

---

## 局限性

- 需要显式 IPC 兼容
- 边缘折叠优先级需要调优

---

## 实现建议

- **实现难度**: 较高
- **适用场景**: 实时物理仿真、交互式模拟、游戏引擎

---

## 相关工作

- [[Mesh Simplification]]
- [[Physics Simulation]]
- [[GPU Computing]]
