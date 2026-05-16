---
title: "STA-FEM: Streaming Assembly for Dynamic Tetrahedral Topology Edits"
authors: ["David Hyde"]
date: 2026-05-12
arXiv: "2605.11673"
categories: ["几何处理", "四面体网格", "有限元", "拓扑动态"]
tags: [tetrahedral-mesh, finite-element, topology-edit, streaming-assembly, fracture]
source: arXiv cs.GR
---

## 核心问题

动态四面体仿真管线在每次 fracture、refinement 或 merge 事件后重建拓扑依赖的求解器状态：
- 丢弃每次编辑后仍存在的结构连续性
- 对局部变化进行全局计算

## 核心方法：STA-FEM

### Streaming Tetrahedral Assembly for Finite Element Method

1. **固定 superset mesh**：预分配候选元素池
2. **per-frame edit stream**：暴露每帧编辑流
3. **增量更新**：用持续增量更新替换每帧 assembly 步骤

### 关键保证
- 与 full-rebuild 方法**完全等价**
- **精确矩阵等价**：所有测试帧与 ground-truth local recomputation 一致

## 实验结果

### 性能提升
| 场景 | 元素数 | 端到端加速 | 骨折帧加速 |
|------|--------|-----------|-----------|
| 3D examples | up to 460k | 1.37x - 1.61x | up to 76% |

### 验证
- 与 full-rebuild 精确匹配
- 与更强的 exact local recomputation baseline 对比保持精确

## 技术要点

### 拓扑动态操作
- **Fracture** (断裂)
- **Refinement** (细化)  
- **Merge** (合并)

### 矩阵更新成本
- orders-of-magnitude 减少矩阵更新成本
- 保留 exact matrix parity

## 应用场景

- **骨折仿真管道** (fracture simulation pipelines)
- 动态拓扑的有限元模拟

## 开源参考

- 参考：libigl 的 mesh processing
- CGAL: 网格分割和细化算法

## 相关笔记

[[tetrahedral-mesh-processing]]
[[finite-element-method]]
[[mesh-topology]]
[[fracture-simulation]]