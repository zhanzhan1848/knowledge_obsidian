---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, fluid-rendering, particle-system, sph, mpm, differentiable-simulation, gradient-stabilization, fluid-rigid-coupling]
status: processed
domain: fluid-rendering
agent: doumiao
source: http://ren-bo.net/papers/cgc_tog2026.pdf
---

# End-to-End Differentiable Smoothed Particle Hydrodynamics for Fluid–Rigid Optimization with Gradient Stabilization

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | End-to-End Differentiable Smoothed Particle Hydrodynamics for Fluid–Rigid Optimization with Gradient Stabilization |
| **作者** | Geng-Chen Cao, Bo Ren, Yanrui Xu, Zhe-Han Mo, Shi-Min Hu — **南开大学 VCIP + 香港中文大学 (MMLU @ CUHK) + ETH Zürich** |
| **发表** | **ACM Transactions on Graphics, Vol. 45, No. 4 (SIGGRAPH 2026)**, 18 页 |
| **链接** | [PDF](http://ren-bo.net/papers/cgc_tog2026.pdf) (70.9 MB) · [视频](http://ren-bo.net/Videos/cgc_tog2026.mp4) · [Bo Ren 主页](http://ren-bo.net/) |
| **分类** | 粒子系统 / SPH / 可微模拟 / 流体-刚体耦合 |

---

## 核心贡献

> **端到端可微的 SPH 流体-刚体耦合优化框架** —— 核心难点不只是求 SPH 算子的局部导数，而是**让有用的敏感度穿过长时间展开 (long rollout)** 传播；本文提出**自适应伴随修正序列 (self-adaptive adjoint correction sequence)** 作为**保持下降方向的前置预条件器**，抑制伴随变量爆炸。

1. **问题诊断（本文最核心的洞察）**
   - SPH 算子的局部 VJP（向量-雅可比积）**不是主要难点**；
   - 真正的难点是：**粒子邻域、接触关系、压力响应在时间上快速变化** → 反向模式梯度**噪声大**；
   - 在**长时程控制与逆向设计**任务中，**伴随变量会爆炸 (adjoint variables explode)**。
2. **方法：SPH 专用反向模式管线**
   - 针对 **IISPH**（Implicit Incompressible SPH）流体-刚体模拟构建反向模式管线；
   - 在**带检查点 (checkpointed)** 的仿真分段内实现所需的**向量-雅可比积 (VJP)**。
3. **方法：自适应伴随修正序列（核心贡献）**
   - 作为一个**保持下降方向的前置预条件器 (descent-preserving preconditioner)**；
   - **约束病态的伴随放大**，同时保持更新方向与原始反向模式敏感度**对齐**。
4. **实验覆盖的任务（由易到难）**
   - 低维冲量 (impulse) 优化、形状优化；
   - **标量幅值水 actuation**（控制水量/力度）；
   - **多物体水射流平衡 (multi-object water-jet balancing)**；
   - **神经流体介导的钟摆控制 (neural fluid-mediated pendulum control)**。
5. **意义**：证明**稳定化的反向模式微分**足以支撑涉及**间接动量传递、长时程事件时序、高维控制**的 SPH 优化问题。

---

## 技术方案

### 为什么 SPH 可微化这么难

```
SPH 离散:
  每个粒子 i 的密度 ρ_i = Σ_j m_j W(r_ij, h)          ← 邻域随时间变
  压力 p_i 由泊松/密度约束隐式求解
  接触力: 邻域内的碰撞对随时间变

反向传播时:
  ∂ρ_i/∂x_j 依赖当前邻域 → 梯度路径随时间剧烈变化
  隐式压力求解 → 需要伴随方程 (adjoint equation)
  长时程 (long rollout) → 伴随变量指数增长 → 梯度爆炸 / 噪声
```

### 自适应伴随修正序列的作用

```
原始反向模式:
  s_{n} ← A^T s_{n+1}     (伴随变量递推, A 随时间变)
  ↓ 长时程下 ||s|| 爆炸
  ↓ 梯度被病态放大, 优化方向失真

修正后:
  s_n ← Precondition(s_n)  ← 自适应修正序列
  ✅ 约束病态放大 (bound pathological adjoint amplification)
  ✅ 保持与原始敏感度的方向对齐 (descent-preserving)
  ↓
  梯度可用 → 长时程优化可行
```

### 与 [[2026-11-05-Quan-Wang-Lian-DiffSurFlow-Differentiable-Fluid-Optimization]] 的对比

| 维度 | **DiffSurFlow** (SIGGRAPH 2026) | **本文** (SIGGRAPH 2026) |
|------|-------------------------------|----------------------------|
| 求解器类型 | Eulerian 网格 (flow map) | **Lagrangian 粒子 (SPH)** |
| 梯度问题 | 计算强度 vs 梯度重要性错配 | **伴随变量爆炸 + 梯度噪声** |
| 解法 | 代理梯度：保留跨步"高速公路"，剪除冗余伴随计算 | **自适应伴随修正序列**（下降方向保持的前置预条件器） |
| 应用 | 初始速度场优化、翼型设计、城市风场 | 冲量/形状优化、水射流、**神经控制** |
| 显式求解器 | 是（adjoint 显式求解） | 是（IISPH 隐式密度约束 + 检查点分段） |

> **知识库价值**：这两篇覆盖了可微流体的两大类求解器（Eulerian / Lagrangian），其"梯度病态"的诊断思路可互相迁移 —— DiffSurFlow 的**代理梯度剪枝**与本文的**伴随修正预条件**本质都在做"约束伴随传播"。

---

## 摘要原文

> We introduce an end-to-end differentiable optimization framework for Smoothed Particle Hydrodynamics (SPH) with fluid–rigid body coupling. The central difficulty is not only to obtain local derivatives of SPH operators, but also to propagate useful sensitivities through long rollouts whose particle neighborhoods, contacts, and pressure responses change rapidly over time. These effects make reverse-mode gradients noisy and often cause adjoint variables to explode in long-horizon control and inverse-design tasks. We formulate an SPH-specific reverse-mode pipeline for IISPH-based fluid–rigid simulation and implement the required vector–Jacobian products within checkpointed simulation segments. To make the resulting gradients usable for optimization, we introduce a self-adaptive adjoint correction sequence that acts as a descent-preserving preconditioner: it bounds pathological adjoint amplification while keeping the update direction aligned with the original reverse-mode sensitivity. Our experiments cover a sequence of increasingly demanding tasks, from low-dimensional impulse and shape optimization to scalar-amplitude water actuation, multi-object water-jet balancing, and neural fluid-mediated pendulum control. These results demonstrate that stabilized reverse-mode differentiation can support challenging SPH-based optimization problems involving indirect momentum transfer, long-horizon event timing, and high-dimensional control.

---

## 关联笔记
- [[2026-11-05-Quan-Wang-Lian-DiffSurFlow-Differentiable-Fluid-Optimization]] — 同届 SIGGRAPH 2026，Eulerian 侧对应工作
- [[2026-11-05-Zhang-Ren-FastVEM-Fluid-Simulation]] — 同届 SIGGRAPH 2026
- [[2026-10-27-Tot-Deformation-MPM-Perfectly-Elastic-Solids]] — MPM 数值断裂问题
- 技术笔记：[[粒子渲染]]
