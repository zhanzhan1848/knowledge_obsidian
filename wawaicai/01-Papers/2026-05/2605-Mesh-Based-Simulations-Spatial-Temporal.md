---
tags: [几何, 图神经网络, CFD, 有限元, 几何深度学习]
created: 2026-05-13
---

# Mesh Based Simulations with Spatial and Temporal awareness

## 核心方法

解决图神经网络 (GNN/Transformer) 替代 CFD 仿真时的**训练范式瓶颈**：节点级监督 + 显式 Euler 时间步进忽略了 PDE 求解方法的局部通量连续性和刚性动力学。

### 三大创新

| 创新 | 描述 |
|------|------|
| **Multi Node Prediction** | 模板级目标，预测节点完整局部拓扑的场值，强制空间导数一致性 |
| **Temporal Correction** | 用 predictor-corrector + temporal Cross-Attention 替换不稳定显式格式 |
| **Geometric Inductive Biases** | 3D RoPE (Rotary Positional Embeddings) 捕获非结构化网格中的旋转对称性 |

## 评估设置

- 架构：MeshGraphNet、Transolver、Transformer
- 数据集：多种物理仿真数据集
- 指标：精度、稳定性、长时域 rollout 能力

## 关键成果

1. **精度提升**：一致性的精度和稳定性提升
2. **长时域能力**：长期 rollout 表现优异
3. **泛化能力**：可泛化到未见子任务（Wall Shear Stress、Pressure 预测）

## 创新点

- 首次将**数值分析严谨性**与**几何深度学习**结合
- RoPE 用于非结构化网格的 3D 旋转对称性建模
- 时间交叉注意力机制解决显式格式不稳定问题

## 开源参考
- GitHub: https://github.com/DonsetPG/graph-physics
- 论文: https://arxiv.org/abs/2605.01542
- 会议: ICML 2026

## 相关笔记
[[GMT-Geometric-Multigrid-Transformer]] - 几何变换器方法
[[STA-FEM-Dynamic-Tetrahedral-Assembly]] - 另一个 FEM 相关方法