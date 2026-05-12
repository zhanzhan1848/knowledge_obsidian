---
tags: [网格简化, 代数粗化, GPU加速, IPC求解器, 隐式时间积分]
date: 2026-05-12
source: arXiv cs.GR
---

# Adaptive In-Solve Algebraic Coarsening for GPU IPC

## 核心方法

### 问题定义
- 隐式时间积分是模拟刚性材料和大变形的关键
- 性能瓶颈：反复求解大型线性系统
- 传统自适应粗化方法需要显式重网格，会改变连通性和顶点排序

### 核心创新：代数自适应粗化
在 Newton 求解过程中**代数地**减少自由度，**无需显式拓扑修改**

### 技术流程

1. **从细网格开始**
2. **选择性边折叠** → 用 per-edge tags 控制
3. **并行聚合**：Warp-level hash mapping scheme
   - 将细顶点分组为粗超节点
   - 保护边 (Protected edges) 保留局部细节
4. **隐式粗网格定义**：代数组装细尺度梯度和 Hessian
5. **PCG 求解**：预条件共轭梯度法
6. **延拓回细网格**

### 关键设计

| 组件 | 描述 |
|------|------|
| Selective Edge Collapse | Per-edge tags 控制哪些边可折叠 |
| Warp-level Hash Mapping | GPU warp 并行聚合 |
| Protected Edges | 保护局部细节的边 |
| Implicit Coarse Mesh | 代数定义的隐式粗网格 |
| GPU Reduction Kernels | 高效 GPU 归约内核 |

## 性能结果

- 相比 SOTA GPU IPC 求解器实现 **3x 加速**
- 视觉结果无差异

## 复杂度分析
- 时间复杂度: O(n log n) → O(n/k) 粗化后
- 空间复杂度: O(n) → O(n/k) 粗化后
- 其中 k 为粗化比

## 开源参考
- Authors: Kemeng Huang et al.
- arXiv: [2605.04773](https://arxiv.org/abs/2605.04773)
- PDF: [2605.04773.pdf](https://arxiv.org/pdf/2605.04773)

## 相关笔记
[[2026-05-12-DAILY-SUMMARY]]

## 技术分类
- 网格处理 > 网格简化 > 代数粗化
- GPU并行计算 > 物理仿真 > IPC
