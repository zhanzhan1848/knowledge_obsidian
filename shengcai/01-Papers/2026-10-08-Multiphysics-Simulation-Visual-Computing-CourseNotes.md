---
type: paper
created: 2026-10-08
updated: 2026-10-08
tags: [paper, physics-simulation, course-notes, multiphysics, deformable-bodies, fluids, Eurographics-2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.09822
venue: Eurographics 2026 Tutorials
year: 2026
---

# Simulation Methods for Multiphysics Phenomena in Visual Computing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Simulation Methods for Multiphysics Phenomena in Visual Computing |
| **作者** | Jan Bender et al. |
| **发表** | Eurographics 2026 Tutorials / Course Notes |
| **链接** | [原文](https://arxiv.org/abs/2610.09822) |
| **DOI** | [10.2312/egt.20261002](https://doi.org/10.2312/egt.20261002) |

---

## 核心贡献

> EG 2026 课程讲义：覆盖图形学多物理场仿真的核心方法 —— 刚体、可形变体、流体、颗粒介质及其耦合。从数学基础到关键算法到软件框架，**系统化梳理当前 CG 物理仿真的核心技术栈**。

1. 数学基础与公式推导
2. 各种材料/现象的算法分类与对比
3. 多种软件框架的实操介绍（开箱即用的多物理场仿真）
4. 机器学习方法的趋势总结

---

## 技术方案

### 核心思想

图形学物理仿真按现象分类，每类有成熟算法栈。本讲义把它们**统一在一个数学框架**下讲解：
- **离散格式**（FEM、MPM、PBD、position-based）
- **时间积分**（隐式/显式 Newton，Verlet）
- **耦合策略**（one-way / two-way coupling，constraint-based）
- **可微仿真**（autodiff / adjoint）

### 覆盖的物理现象

| 现象 | 代表方法 |
|------|----------|
| 刚体动力学 | Featherstone, impulse-based |
| 可形变体 | FEM, MPM, PBD, XPBD |
| 流体（液体） | SPH, FLIP, PIC, position-based fluids |
| 流体（气体） | Eulerian grid, vortex methods |
| 颗粒介质 | DEM, MPM, granular SPH |
| 布料/绳索 | Mass-spring, position-based |
| 软体 | Neo-Hookean, St. Venant-Kirchhoff |

### 耦合策略

- **One-way**：单向（如流体驱动刚体）
- **Two-way**：双向耦合（力反馈）
- **Constraint-based**：硬约束（关节、绳索）

### ML 趋势

- 神经网络替代求解器（如 learned integrators）
- 可微物理 + 梯度优化（design-by-analysis）
- 神经辐射场作为物理先验

---

## 公式

讲义中包含多种核心公式：

```math
\text{Mass-Spring:} \quad \mathbf{M} \ddot{\mathbf{x}} + \mathbf{D} \dot{\mathbf{x}} = -\nabla x^E(\mathbf{x})
```

```math
\text{Neo-Hookean:} \quad \Psi = \frac{\mu}{2} (I_C - 3) - \mu \ln J + \frac{\lambda}{2} (\ln J)^2
```

```math
\text{Navier-Stokes:} \quad \rho (\partial_t \mathbf{u} + \mathbf{u} \cdot \nabla \mathbf{u}) = -\nabla p + \mu \nabla^2 \mathbf{u} + \mathbf{f}
```

```math
\text{Position-Based Dynamics:} \quad \mathbf{x}^{new} = \arg\min_{\mathbf{x}} \| \mathbf{x} - \mathbf{x}^* \|^2 \;\; \text{s.t.} \;\; C_j(\mathbf{x}) = 0
```

---

## 实验结论

讲义性质，无原创实验。包含多个软件框架对比：
- Bullet, PhysX (刚体)
- taichi, warp (可微仿真)
- Houdini Vellum, Blender (布料/柔体)
- Mantaflow, Splash (流体)

---

## 相关工作

- [[Bullet Physics]]
- [[Taichi]]
- [[NVIDIA Warp]]
- Bridson et al., "Fluid Simulation" (SIGGRAPH course)
- Sifakis & Barbič, "Finite Element Methods" (SIGGRAPH course)

---

## 实现建议

- **实现难度**：本就是讲义，主要价值是**快速建立知识地图**
- **预期性能**：N/A（综述）
- **适用场景**：
  - 作为团队的**物理仿真基础参考**
  - 选型时参考各种方法的适用性对比
  - 推荐给**鲜毛肚 / 鸭血**（流体仿真）参考
- **对 moyuwan 的建议**：
  - 不直接产生可实现代码
  - 但可作为**多物理场算法选型**的背景知识来源
  - 重点章节：耦合策略、可微仿真、ML 趋势