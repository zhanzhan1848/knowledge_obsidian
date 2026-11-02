---
type: paper
created: 2026-11-02
updated: 2026-11-02
tags: [paper, fluid-rendering, siggraph-asia-2026, roundup, conference]
status: processed
domain: 流体渲染
agent: doumiao
source: https://www.physicsbasedanimation.com/2026/09/08/siggraph-asia-2026/
---

# SIGGRAPH Asia 2026 流体模拟论文全景综述（渲染向精选）

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | SIGGRAPH Asia 2026 | Physics-Based Animation 全列表 |
| **来源** | Christopher Batty (U. Waterloo) 维护的 Physics-Based Animation 站点 |
| **链接** | https://www.physicsbasedanimation.com/2026/09/08/siggraph-asia-2026/ |
| **会议** | 第 19 届 ACM SIGGRAPH Asia，2026-12-01~04，马来西亚吉隆坡（首次在吉隆坡举办） |
| **出版** | ACM TOG 专辑 + ACM Digital Library 会议论文集 |

---

## 核心贡献

> SIGGRAPH Asia 2026 是**流体模拟方法学的大年**：完整技术论文列表中有 **16 篇**直接涉及流体/两相流/自由表面/涡量/粒子/PDE 求解器，另有数篇涉及可微模拟与分布式求解。这批论文整体呈现三条清晰主线。

---

## 技术方案

### 三条主线

#### 主线 A：多尺度 & 高效求解器（求解器侧）

| 论文 | 核心 |
|------|------|
| **A Unified Multi-Scale Method for Simulating Two-Phase Immiscible Flows** (Wretborn, Stomakhin, Batty) | 共享欧拉网格 + 拉格朗日相分数；分层↔弥散统一闭合模型；体积耦合力联合压力投影 |
| **An Extended Full GKS Formulation for High-Efficiency and Low-Memory Two-Phase Flow Simulation** | 完整 GKS（Generalized Kinetic Scheme）双流体框架，扩展到高效率低内存 |
| **Kinetic Predicted-Moment Flux Reconstruction for High-Order High-Performance Fluid Simulation** | 动理学 + 预测矩通量重构，高阶高性能 |
| **Primal SPH Solver for Strongly Coupled Multiphase Simulations with High Density Ratios** | 原始型（primal）SPH 求解器，处理高密度比强耦合多相 |
| **Implicit velocity projection method for incompressible SPH fluids** | 隐式速度投影 → 不可压 SPH 的更无条件稳定时间步 |
| **Efficient Open-Boundary Poisson Solves** | 开放边界 Poisson 求解（工程组件，可用于大场景流体域） |
| **Semi-Implicit Pairwise Descent for Nonlocal Continuum Mechanics** | 非局部连续介质力学的半隐式成对下降（长程相互作用求解） |

#### 主线 B：自由表面与涡量（渲染相关度最高）

| 论文 | 核心 |
|------|------|
| **Hamiltonian Two-Way Coupling of Nonlinear Waves and 3D Flows** | Zakharov 正则波动模型 + 规范一致 2D↔3D 双向耦合；误差降 1.7–5×，比 BEM 快 >1000× |
| **Divisor Dynamics for Surface Fluid Simulation** | 点涡的因子类不变量；流体力学 ↔ 代数几何桥接；任意拓扑曲面 |
| **Lanczos Advection: Near-Orthogonal Semi-Lagrangian Reconstruction for Fluid Simulation** | Lanczos 重构的近正交半拉格朗日平流（改进 FLIP 平流误差） |
| **Flamescapes: Simulating the Wildlandfire Urban Interface** | 野火-城市界面模拟（火焰+烟+建筑交互） |

#### 主线 C：粒子/学习/可微 & 分布式（工具链侧）

| 论文 | 核心 |
|------|------|
| **WorldParticle: Unified World Simulation of Lagrangian Particle Dynamics via Transformer** | Transformer 统一世界尺度粒子动力学模拟 |
| **Machine Learning Operator Lexicon for PDE Solvers on Irregular and Sparse Domains** | 不规则稀疏域上的 PDE 算子学习词典 |
| **DiffSurFlow: Efficient and Robust Differentiable Fluid Optimization via Surrogate Strategy on Flow Map** | 基于 flow map 的可微流体优化（surrogate 策略提升鲁棒性） |
| **RealSimLoop: Online Real-to-Sim Adaptation via Differentiable Reduced-Order Simulation with Vision Feedback** | 可微降阶模拟 + 视觉反馈的在线 real-to-sim 适配 |
| **A Practical Partitioner for Distributed Simulations on Sparse Dynamic Domains Using Optimal Transport** | 最优传输做稀疏动态域的分布式模拟分区 |
| **REST3D: Reconstructing Physically Stable 3D Scenes from a Single Image** | 单图 → 物理稳定 3D 场景 |
| **BubbleGym: A Practical Shape-to-Frequency Model for Acoustic Bubbles** | 气泡形状→声学频率模型（气泡音效用） |

---

## 关键观察

1. **「混合欧拉-拉格朗日」成为主流范式**：两相流、相分数、粒子流图（flow maps）都在往这个方向收敛。
2. **Hamilton / 变分结构回潮**：Zakharov 波动（Wang et al.）与 Hamiltonian Two-Way Coupling 说明**结构保持（structure-preserving）**在图形学流体中重新受到重视，与 2023-2024 的 "Fluid Simulation on Particle Flow Maps" 系列一脉相承。
3. **物理 ↔ 代数/几何的跨界**：Divisor Dynamics 把代数几何（因子理论）引入图形学，这是罕见且值得长期跟踪的方向。
4. **可微模拟进入"工程可用"阶段**：DiffSurFlow、RealSimLoop 不再只是 demo，而是强调**鲁棒性与效率**（surrogate 策略、降阶）。
5. **大规模分布式是共识需求**：Optimal Transport 分区器 + DELUGE 流式传输（IEEE ISMAR 2026）共同指向"大规模模拟的分布式与流式"。

---

## 相关工作

- [[2026-11-02-Unified-Multi-Scale-Two-Phase-Immiscible-Flows]]
- [[2608.25203-hamiltonian-wave-coupling]]
- [[2026-10-25-Divisor-Dynamics-Surface-Fluid]]
- [[2025-03-29_SIGGRAPH-Asia-2024-Fluid-Papers]]
- [[2025-03-29_Journey-into-SPH-Simulation]]

---

## 实现建议

- **优先级阅读**:
  - 想要**免费表面水体** → Hamiltonian Two-Way Coupling
  - 想要**大尺度两相/水花** → Unified Multi-Scale Two-Phase Immiscible Flows
  - 想要**表面涡流特效** → Divisor Dynamics
  - 想要**可微/优化** → DiffSurFlow
  - 想要**粒子/大规模** → WorldParticle + ParticleGS + DELUGE
- **可落地性排序**: Unified Multi-Scale (⭐⭐⭐⭐⭐) > Hamiltonian Waves (⭐⭐⭐⭐) > Divisor Dynamics (⭐⭐⭐) > 其余（跟踪）
