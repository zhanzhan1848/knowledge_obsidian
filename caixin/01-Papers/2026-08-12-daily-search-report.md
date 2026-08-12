# 每日流体力学论文搜索报告
**日期**: 2026-08-12
**搜索范围**: arXiv physics.flu-dyn (最近72小时)

---

## 1. DRL for Separation Control in Turbulent Wind-Tunnel Flow
- **ID**: [arXiv:2608.10829](https://arxiv.org/abs/2608.10829)
- **作者**: Ben Steinfurth et al.
- **日期**: 2026-08-11
- **关键词**: Deep Reinforcement Learning, Active Separation Control, Turbulent Flow, PPO
- **摘要**: 使用 Deep Reinforcement Learning (DRL) 对完全湍流风洞中的单侧扩散器流动进行无模型闭环主动分离控制。Agent 控制磁阀阵列，通过 Proximal Policy Optimization (PPO) 实时学习控制律。与传统周期性开环控制（~40%）和优化开环控制（~51%）相比，学习到的低占空比控制模式实现了约53%的前向流动分数。
- **数值方法**: PPO + wall-shear-stress sensor feedback
- **代码/软件**: 未公开
- **标签**: #turbulence #DRL #active-control #CFD

---

## 2. POD Subspaces on Grassmann Manifold for Airfoil Flow
- **ID**: [arXiv:2608.10498](https://arxiv.org/abs/2608.10498)
- **作者**: Shintaro Sato et al.
- **日期**: 2026-08-10
- **关键词**: POD, Grassmann Manifold, Flow State Estimation, Model Reduction
- **摘要**: 将 POD 子空间本身作为流动状态，通过 Grassmann 流形上的扩散映射识别低维结构。使用 Grassmannian rank-one update 子空间估计进行在线跟踪。实验验证了翼型绕流的 POD 子空间提取，从壁压波动中识别出一维子流形。等离子执行器引起的分离-附着转换沿相同子流形运动。
- **数值方法**: Diffusion Maps, Grassmannian Rank-One Update, POD
- **应用**: 实时流动状态估计与反馈控制
- **标签**: #POD #model-reduction #flow-control #CFD

---

## 3. SA-AI: Spalart-Allmaras with Autogenous Inception for Transition
- **ID**: [arXiv:2608.10303](https://arxiv.org/abs/2608.10303)
- **作者**: Qiqi Wang
- **日期**: 2026-08-10
- **关键词**: Spalart-Allmaras, Laminar-Turbulent Transition, RANS, Tollmien-Schlichting
- **摘要**: 仅使用 Spalart-Allmaras 工作变量建模自然层流-湍流转换。变量本身作为转换指示器，构成单方程 RANS 闭合。亚 O(1) 范围成为 Tollmien-Schlichting 放大因子。混合生产项驱动 SA 输运方程通过层流不稳定增长和湍流涡粘性生产。
- **验证案例**: 零压梯度平板、NLF(1)-0416 和 Eppler 387 翼型、圆柱体（阻力危机）、Daedalus 人力飞机翼、6:1 长球体
- **数值方法**: RANS (Spalart-Allmaras), 转换模型
- **标签**: #turbulence-model #RANS #transition #N-S

---

## 4. Turbulence Anisotropy in Bubbly Vertical Channel Flow
- **ID**: [arXiv:2608.08763](https://arxiv.org/abs/2608.08763)
- **作者**: Davide Procacci et al.
- **日期**: 2026-08-09
- **会议**: TSFP14 (Heidelberg, 2026)
- **关键词**: Bubble-Turbulence Interaction, DNS, Turbulence Anisotropy, Topological Change
- **摘要**: 高保真数值模拟含气泡的垂直通道流动（上行配置），气泡经历拓扑变化（破裂和聚并）。表面张力对载体相湍流各向异性的影响：速度波动在大气泡尾流中增强；多相流案例比单相流更具各向同性（意外发现），归因于 sweep 事件增强导致能量再分配改善。
- **数值方法**: Direct Numerical Simulation (DNS)
- **标签**: #multiphase-flow #DNS #turbulence #bubble

---

## 5. K41 Scaling in Bubble-Induced Turbulence from Single-Bubble Wakes
- **ID**: [arXiv:2608.08502](https://arxiv.org/abs/2608.08502)
- **作者**: Dabao Li et al.
- **日期**: 2026-08-09
- **关键词**: Kolmogorov K41 Scaling, Bubble-Induced Turbulence, DNS, Energy Dissipation
- **摘要**: 使用高分辨率界面解析 DNS 研究气泡引起湍流 (BIT) 中 Kolmogorov (K41) 标度的起源。区域速度结构函数显示 2/3 标度仅出现在气泡尾流区域内。推导了与文献实验结果一致的稀 BIT 耗散率标度。
- **数值方法**: Interface-Resolved DNS
- **标签**: #turbulence #DNS #bubble #multiphase-flow #K41

---

## 6. Eikonal Regularisation in PINNs for 3D Level-Set Advection
- **ID**: [arXiv:2608.08322](https://arxiv.org/abs/2608.08322)
- **日期**: 2026-08-08
- **关键词**: Physics-Informed Neural Networks, Level-Set Method, Eikonal Regulariser, PINN
- **摘要**: 研究 PINN + level-set 界面追踪中的 eikonal 正则化权重选择。在 4 个 3D benchmarks（平移球、旋转球、开缝球、反向涡旋）中验证了 2D 设计原则的可迁移性。最优权重追踪精确解偏离有符号距离函数的程度，范围从 10⁻¹ 到 10⁻⁵。
- **数值方法**: PINN + Level-Set
- **标签**: #PINN #level-set #CFD #machine-learning

---

## 7. Compact Scheme for Second-Order Fluxes in Spectral Difference Method
- **ID**: [arXiv:2608.09615](https://arxiv.org/abs/2608.09615)
- **日期**: 2026-08-11 (cross-list: math.NA)
- **关键词**: Spectral Difference Method, Discontinuous Galerkin, Viscous Terms, Flux Reconstruction
- **摘要**: 为 DSEM 中的二阶（粘性）项开发了紧凑、完全中心化的格式。灵感来自 Huynh 的 Flux Reconstruction，将模板从五元素减少到三元素，同时保持 Bassi-Rebay (BR1) 的中心化和无参数特性。发展于一维并扩展到多维，时域特征分析用于表征耗散和色散特性。
- **数值方法**: Spectral Difference Method, Flux Reconstruction, Interior Penalty
- **标签**: #numerical-methods #high-order #spectral-method #CFD

---

## 8. Memory-Generated Transport Geometry: Curvature and Irreversibility
- **ID**: [arXiv:2608.09607](https://arxiv.org/abs/2608.09607)
- **日期**: 2026-08-11
- **关键词**: Finite Memory, Transport Geometry, Irreversibility, Lagrangian Transport
- **摘要**: 有限记忆本身生成传输的几何结构。记忆依赖传输连接替代瞬时速度梯度，有序演化产生传输历史空间中的非交换性、曲率和全息。提出独立于传输表示的内禀曲率不变量，识别特征记忆尺度 τ_c，揭示全局凹积累动力学中随时间单调递减的记忆敏感性。
- **理论**: 非马尔可夫传输理论
- **标签**: #theory #transport #fluid-mechanics

---

## 9. Correlated Collisions and History Filtering: Coalescing Particles in Turbulence
- **ID**: [arXiv:2608.08379](https://arxiv.org/abs/2608.08379)
- **日期**: 2026-08-08
- **关键词**: Direct Numerical Simulation, Coalescing Particles, Turbulence, Collision Kernel
- **摘要**: 第一篇系列论文，研究湍流中聚并粒子的统计特性及其与无碰撞 ghost 粒子的关系。执行三组 DNS：ghost 粒子、碰撞时聚并并补充单体的粒子 (CR)、无补充的粒子 (CN)。跨越 St=0.01-3.0，发现 ghost 粒子系统具有更高的碰撞核和近接触径向分布函数。
- **数值方法**: Direct Numerical Simulation (DNS), Monodisperse particles
- **标签**: #DNS #turbulence #particles #multiphase-flow

---

## 10. Deformation of Oldroyd-B Drop in Alternating Electric Field
- **ID**: [arXiv:2608.08699](https://arxiv.org/abs/2608.08699)
- **作者**: Sarika Shivaji Bangar, Gaurav Tomar (IIT Bangalore)
- **日期**: 2026-08-09
- **关键词**: Viscoelastic Drop, Electrohydrodynamics, Oldroyd-B, Basilisk
- **摘要**: 研究浸在 Oldroyd-B 介质中的中性浮力 Oldroyd-B 液滴在均匀交变电场中的变形。两种流体均建模为泄漏电介质，在轴对称斯托克斯流下进行渐近分析和直接数值模拟。识别出六种电液动力学区域，具有不同的变形模式、流动方向和非线性响应。
- **数值方法**: Asymptotic Analysis + Direct Numerical Simulations
- **开源软件**: Basilisk (open-source)
- **标签**: #electrohydrodynamics #viscoelastic #Basilisk #multiphase

---

## 11. Data-Driven Surrogate Modeling for Micromixing of Non-Newtonian Fluids
- **ID**: [arXiv:2608.08547](https://arxiv.org/abs/2608.08547)
- **日期**: 2026-08-08
- **关键词**: Surrogate Model, Non-Newtonian, Microchannel, Gaussian Process Regression
- **摘要**: 研究 Carreau-Yasuda 流体在二维正弦收缩-扩张微通道中的被动微混合。高保真有限体积模拟系统变化壁振幅比、相位偏移和波数。发现高斯过程回归 (GPR) 作为多目标设计的高效替代模型。
- **数值方法**: Finite Volume Method, GPR Surrogate Model
- **标签**: #surrogate-model #microfluidics #non-Newtonian #CFD

---

## 12. Couette-Taylor Instabilities in the Small Gap Regime
- **ID**: [arXiv:2608.10951](https://arxiv.org/abs/2608.10951)
- **日期**: 2026-08-12 (cross-list: math.AP)
- **关键词**: Couette-Taylor Instability, Ginzburg-Landau, Hydrodynamic Stability
- **摘要**: 研究小间隙、慢重缩放旋转率、高雷诺数条件下粘性流体在两旋转圆柱体间的 Couette-Taylor 不稳定性。推导捕获主导动力学的极限系统，计算临界 Taylor 数 Tc(μ)。弱非线性行为由两个耦合的复 Ginzburg-Landau 方程控制。
- **理论**: Ginzburg-Landau Equations, Hydrodynamic Stability
- **标签**: #instability #fluid-mechanics #theory

---

## 13. SA-AI Technical Summary
- **ID**: [arXiv:2608.10303](https://arxiv.org/abs/2608.10303) *(重复，上文已详述)*
- **特别标注**: AIAA Scitech 2017 (历史工作重新提交)

---

*本报告由鲜毛肚 (Xianmaodu) 自动生成 | 2026-08-12*
