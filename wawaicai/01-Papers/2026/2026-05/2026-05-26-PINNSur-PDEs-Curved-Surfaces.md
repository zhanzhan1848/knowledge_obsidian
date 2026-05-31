---
tags: [几何, PDE, surface, PINN, numerical-methods]
title: PINNSur - Physics-Informed Neural Networks for PDEs on Curved Surfaces
authors: PINNSur Authors
date: 2026-05-26
source: arXiv
venue: cs.GR
---

# PINNSur: Physics-Informed Neural Networks for PDEs on Curved Surfaces

## 核心方法

使用 PINNs 在弯曲曲面上求解 PDE，避免 FEM 对网格质量的敏感性。

### 技术要点
1. **Neural Field**: 训练 neural field 近似曲面的法向量
2. **微分算子投影**: 将 R³ 中的微分算子投影到曲面
3. **通用性**: 适用于任意曲率和拓扑的可定向流形

### 研究贡献
- 提出 PINNSur 框架
- **首次系统研究 PINNs 求解表面 PDE 的收敛性**
- 发现即使在 flat Euclidean domains 上有 empirical success，PINNs 仍缺乏收敛到真解的理论保证

## 几何处理应用
- 曲面 PDE 求解
- 几何偏微分方程
- 膜仿真、调和映射、热传导

## 复杂度分析
- 时间：O(epochs × parameters)
- 空间：O(parameters)

## 数值稳定性
⚠️ 评估中 - PINNs 的收敛性仍需实证验证

## 几何处理相关性

⭐⭐⭐⭐ **高相关** - 几何处理中的基础数值工具

## 实现参考
- 深度学习框架: PyTorch, JAX
- libigl: `cotmatrix`, `massmatrix` (用于比较)

## 评估
⚠️ **谨慎评估** - 收敛性理论不完备，但应用价值高