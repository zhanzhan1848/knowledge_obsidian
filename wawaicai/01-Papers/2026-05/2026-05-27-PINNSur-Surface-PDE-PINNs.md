---
title: "PINNSur — Physics-Informed Neural Networks for PDEs on Curved Surfaces"
date: 2026-05-27
tags: [几何, 曲面PDE, PINNs, 神经求解器, 微分算子, mesh-free]
---

# PINNSur: PINNs for PDEs on Curved Surfaces

**arXiv**: [2605.27308](https://arxiv.org/abs/2605.27308)  
**领域**: 曲面偏微分方程 / 几何处理 / 神经求解器  
**发表**: 2026-05-27

---

## 核心方法

PINNSur 将 Physics-Informed Neural Networks (PINNs) 扩展到曲面偏微分方程。

### 技术路线
1. **神经场表示曲面**: 训练神经网络近似曲面的有向法向量场
2. **投影算子**: 将 $\mathbb{R}^3$ 中的微分算子投影到曲面切空间
3. **Mesh-free 求解**: 避免传统 FEM 的网格依赖，不受几何离散化误差影响

### 核心公式
曲面微分算子通过投影表达：
$$\nabla_{\mathcal{S}} = \mathbf{P} \nabla$$
其中 $\mathbf{P}$ 是切空间投影矩阵。

### 适用性
适用于所有可定向流形，不依赖曲率或拓扑。

---

## 算法复杂度

- **时间复杂度**: O(N) 训练步数 × O(B) 每次 batch（B=采样点数）
- **空间复杂度**: O(P) 网络参数 + O(N) 曲面采样点存储

---

## 几何处理应用场景

| 应用 | 关联技术 |
|------|---------|
| 曲面热传导 | Laplace-Beltrami 算子 |
| 曲面平滑 / 去噪 | 平均曲率流 |
| 参数化 | Dirichlet / Neumann 边界 |
| 流体模拟 | Navier-Stokes on surfaces |

---

## 与传统 FEM 对比

| 维度 | PINNs | FEM |
|------|-------|-----|
| 网格质量依赖 | **无** | 高 |
| 几何误差 | 无 | 有（尤其是高曲率区）|
| 计算效率 | 需多次训练 | 求解器一次完成 |
| 收敛保证 | 有限 | 有 |

---

## 相关笔记

- [[MonteCarlo-PDE]] — 曲面上的蒙特卡洛 PDE 求解
- [[Accelerated-Winding-Numbers]] — 曲面几何算子

---

## 开源参考

- PyTorch / JAX: PINNs 实现
- DeepXDE: 神经微分方程库
- libigl: `cotmatrix` — 曲面离散拉普拉斯算子

---

> 🥬 wawaicai | 2026-05-27