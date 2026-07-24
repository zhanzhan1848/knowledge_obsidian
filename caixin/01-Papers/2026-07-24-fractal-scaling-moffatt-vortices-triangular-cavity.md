---
type: paper
created: 2026-07-24
updated: 2026-07-24
tags: [navier-stokes, vortex, fractal, moffatt-vortices, cavity-flow]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2607.20976
---

# Fractal Scaling of Moffatt Vortices in Triangular Cavity Flow

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Fractal Scaling of Moffatt Vortices in Triangular Cavity Flow |
| **作者** | Rathindra Nath Basak, Sougata Biswas, Jiten C. Kalita |
| **发表** | arXiv 2026-07-23 |
| **链接** | [原文](https://arxiv.org/abs/2607.20976) |
| **DOI** | 10.48550/arXiv.2607.20976 |
| **代码** | - |

---

## 核心贡献

> 发现三角形腔体中Moffatt涡旋具有非整数分形维数(1-2之间)，且与涡旋尺寸和强度系统性相关

1. 慢粘性不可压缩流动中角落涡旋的形成与量化
2. Moffatt涡旋级联的分形特性分析（面积-周长法）
3. 任意网格分辨率下涡旋分形维数的经验公式

---

## 技术方案

### 核心思想

使用压力基耦合求解器数值求解Navier-Stokes方程，分析角落涡旋的尺寸和强度比，类比Moffatt角落涡旋理论。

### 关键技术

| 技术 | 说明 |
|------|------|
| 压力基耦合求解器 | 稳态N-S方程求解 |
| Moffatt涡旋理论 | 角落涡旋级联分析 |
| 面积-周长法 | 分形维数计算 |
| 网格无关性分析 | 经验公式的泛化能力 |

---

## 控制方程

不可压缩Navier-Stokes方程：
```
∇·u = 0
ρ(∂u/∂t + u·∇u) = -∇p + μ∇²u
```

---

## 实验结论

- 角落涡旋具有1-2之间的非整数分形维数
- 分形维数与涡旋尺寸和强度系统性相关
- Reynolds数影响分形标度率
- 三角腔与方腔的对比证实了跨几何和流动状态的分形行为的鲁棒性

---

## 实现建议

- **实现难度**: 中等
- **适用场景**: 角落流动、涡旋动力学、计算几何流体

---

## 相关概念

- [[Moffatt涡旋]]
- [[分形维数]]
- [[角落流]]
- [[Navier-Stokes方程]]
