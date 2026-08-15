---
tags: [可微模拟, 图形学, 优化, adjoint]
---

# Reverse-Sweep Adjoints for Block Implicit Simulation

## 论文信息
- **arXiv**: [2608.08559](https://arxiv.org/abs/2608.08559) [cs.GR]
- **作者**: Lei Shu et al.
- **提交日期**: 2026-08-09
- **ACM分类**: I.3.7; G.1.6
- **PDF**: [arXiv PDF](https://arxiv.org/pdf/2608.08559)

## 核心方法

### 问题定义
可微模拟是学习、控制和逆问题的关键，但现有方法存在内存随求解器深度增长，或需组装全局Jacobian的问题。

### 核心创新：Solver-level Differentiation
**不微分数值方程，而是微分实际执行的求解器本身**

#### Vertex Block Descent 实例化
- 前向：有序局部求解的近似逆
- 反向：反向局部伴随求解
- **无全局系统构造**
- 反向pass由反向彩色Gauss-Seidel sweeps组成，全部是局部3×3伴随求解

#### Reverse-Sweep Formulation
```python
# 前向：ordered local solves → approximate inverse
# 反向：reverse ordered adjoint solves (reverse-sweep)
```

### 关键性质
- **精确匹配自动微分**：每个求解器深度精度匹配
- **33x faster** 且 **71x less memory** vs unrolled AD
- **误差有界**：Equation-level adjoint off by 37% after one sweep
- 可扩展到projective dynamics和extended position-based dynamics

## 实验结果
- 1M顶点弹性体 (8M vertices with contacts)
- 100万接触耦合软体 on one GPU

## 几何处理相关性
🔴 **方法论论文** — 可微模拟方法论，与几何处理的关系取决于具体应用（网格变形、物理仿真等）。

## 关键词
`可微模拟` `Adjoint` `反向传播` `隐式求解器` `实时物理`
