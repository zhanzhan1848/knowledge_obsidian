---
type: paper
created: 2026-04-09
updated: 2026-04-09
tags: [paper, differentiable-CFD, shallow-water, scientific-ml, coastal-hydrodynamics]
status: processed
domain: computational-fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2604.07129
---

# AegirJAX: A solver-in-the-loop framework for end-to-end differentiable coastal hydrodynamics

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A solver-in-the-loop framework for end-to-end differentiable coastal hydrodynamics |
| **作者** | Elsa Cardoso-Bihlo, Alex Bihlo |
| **发表** | arXiv 2026-04-08 |
| **链接** | [原文](https://arxiv.org/abs/2604.07129) / [PDF](https://arxiv.org/pdf/2604.07129) |
| **DOI** | 10.48550/arXiv.2604.07129 |
| **代码** | (待查) |

---

## 核心贡献

> 基于非静压浅水方程的可微分流体求解器，结合自动微分实现端到端可优化

1. **AegirJAX** — 首个完全可微分的海岸水动力学求解器，基于深度整合的非静压浅水方程
2. 将时间步进物理循环作为连续计算图，实现反向模式自动微分
3. 模糊了正向模拟与逆向优化之间的界限

---

## 技术方案

### 核心思想

- 在 JAX 中实现非静压浅水方程（depth-integrated, non-hydrostatic shallow-water equations）
- 将整个时间推进循环纳入自动微分框架，使离散伴随计算天然可行
- 无需手动推导离散伴随，规避传统方法的计算刚性和高成本问题

### 关键应用场景

| 任务 | 描述 |
|------|------|
| 神经修正发现 | 发现色散波传播中模型 misspecifications 的特定区域神经修正 |
| 拓扑优化 | breakwater（防波堤）设计的连续拓扑优化 |
| 主动波消除 | 训练循环神经网络进行在线波消除 |
| 反演 | 从下游传感器数据反演隐藏地形和海底滑坡运动学 |

---

## 控制方程

非静压浅水方程（深度积分形式）：

```math
\begin{aligned}
\frac{\partial \eta}{\partial t} + \nabla \cdot (H \mathbf{u}) &= 0 \\
\frac{\partial \mathbf{u}}{\partial t} + (\mathbf{u} \cdot \nabla)\mathbf{u} + g \nabla \eta &= -\frac{1}{H} \nabla p_s
\end{aligned}
```

其中 $\eta$ 为水面高度，$H$ 为总水深，$\mathbf{u}$ 为深度平均速度，$p_s$ 为自由表面压力（用于引入非静压效应）。

---

## 方法论

- **框架**: JAX + 反向模式自动微分
- **关键创新**: 时间步进循环本身作为计算图节点，可微分化
- **优势**: 避免传统离散伴随的繁琐推导，支持任意非线性项

---

## 实验结论

- 1D/2D 多种场景验证
- 地形反演、波浪预测均达到高精度
- 可与神经网络联合训练（in-the-loop learning）

---

## 局限性

- 依赖浅水假设（不适用于全3D Navier-Stokes）
- 计算精度受 JAX 框架数值精度限制

---

## 相关工作

- [[PINNs]] — Physics-Informed Neural Networks
- [[可微分CFD]] — Differentiable fluid simulation
- [[浅水方程]] — Shallow water equations
- [[伴随方法]] — Adjoint methods

---

## 实现建议

- **实现难度**: ⭐⭐⭐⭐ 中高
- **适用场景**: 海岸工程、 tsunami 预警、地形估计、逆向优化
- **依赖**: JAX, Flax/Haiku (神经网络)

---

*📅 收集日期: 2026-04-09 | 来源: arXiv physics.flu-dyn*
