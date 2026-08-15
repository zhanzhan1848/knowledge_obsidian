# Daily Search Report — 2026-08-15

**Agent**: 鲜毛肚 (Xianmaodu)  
**Date**: 2026-08-15  
**Search Range**: arXiv physics.flu-dyn, cs.FL (Aug 10–15, 2026)  
**Keywords**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence

---

## Summary

共发现 **36 篇** physics.flu-dyn 相关论文（5天内）。以下按主题分类记录：

### 核心 CFD / 数值方法

| ID | Title | 关键词 |
|---|---|---|
| [[2608.13437]] | Lattice Boltzmann Method for Compressible Navier-Stokes-Fourier Equations | LBM, 可压缩 NS, 符号编译器 |
| [[2608.13490]] | DD-RNO: Domain-Decomposed Routed Neural Operator for Airfoil Flow Prediction | Neural Operator, RANS surrogate |
| [[2608.11435]] | Variational Parameter Calibration with Physics-Aware Latent-Space Surrogates | Deep learning, 参数标定, CFD benchmark |
| [[2608.10829]] | Deep reinforcement learning for separation control in turbulent wind-tunnel flow | DRL, 主动控制, 分离流 |
| [[2608.11717]] | Thermochemical non-equilibrium effects on turbulent boundary layers | DNS, 高马赫数 TBL, 化学非平衡 |

### 湍流与建模

| ID | Title | 关键词 |
|---|---|---|
| [[2608.13398]] | Intermittent Vortex Merging and Extreme Drag in Transitional Airfoil Flow | DNS, vortex dynamics, Kelvin-Helmholtz |
| [[2608.12048]] | Strain-coupled one-dimensional turbulence for rapid distortion | ODT, 快速畸变理论, 湍流应变 |
| [[2608.12485]] | Dual Gauge Theory for Two Dimensional Superfluid Turbulence | 超流体湍流, 涡旋, Kolmogorov |
| [[2608.12554]] | Dispersion and clustering of deformable droplets in turbulence | 湍流喷雾, LPT, 变形液滴 |
| [[2608.12941]] | Second-order stochastic modeling of particle resuspension | 拉格朗日随机模型, 湍流通道流 |
| [[2608.11445]] | Anisotropic Thermalization in Far-from-Equilibrium Flows | DG-FEM, Boltzmann 方程, 速度分布 |

### 多相流 / 界面流

| ID | Title | 关键词 |
|---|---|---|
| [[2608.12868]] | Controlling dynamics of electric-field-driven droplet on LIS | LBM, 电湿润, 润滑注入表面 |
| [[2608.12554]] | Dispersion and clustering of deformable droplets in turbulence | 可变形液滴, 湍流喷雾 |
| [[2608.13479]] | Air-water cavity in multi-plunging jet impacts | 空化, 多相流, 气泡生成 |
| [[2608.10851]] | Inelastic spreading of viscoelastic drops | 黏弹性流体, 液滴撞击, Boger fluid |
| [[2608.11060]] | Singularities in Soft Matter Systems | 软物质, 毛细奇点, 自相似 |

### 空气动力学 / 翼型

| ID | Title | 关键词 |
|---|---|---|
| [[2608.13424]] | Modern aerodynamics models do not capture unsteady forces | 准定常近似失效, 风洞实验 |
| [[2608.12826]] | Bayesian optimization and topographic exploration of drag-reducing dimples | LES, 混合变量优化, 凹坑减阻 |
| [[2608.10498]] | Low-dimensional structure and online tracking of POD subspaces on the Grassmann manifold | POD, Grassmann 流形, 实时追踪 |
| [[2608.12488]] | Wave-Assisted Propulsion in Bimodal Sea States | 波能推进, 流体-结构耦合 |

### 其他

| ID | Title | 关键词 |
|---|---|---|
| [[2608.12031]] | A transport geometry of acoustic analogies | 声类比, NS 方程重构, 几何结构 |
| [[8.13134]] | Uniformly Rotating Vortex Patches with 90-Degree Corners | Euler 方程, vortex patch, 固定点法 |
| [[2608.12498]] | Ambipolar Diffusion Approximation in Rarefied Hypersonic Flows | 等离子体, 双极扩散, 再入飞行器 |
| [[2608.10309]] | Wind-Informed Rapid Flight-Planning via ML | 城市空气动力, UAV, 学习代理模型 |
| [[2608.10192]] | Cohesive sediment gravity flows across mudslide, mudflow, turbidity current regimes | 沉积物重力流, 黏塑性, CFD |

---

## 值得关注的亮点

1. **2608.13437** — LBM 求解可压缩 NS-Fourier 方程：D3Q7 单精度格子，符号编译器自动推导碰撞项，在 Sod 管和 Taylor-Green 涡 (M=1.25, 512³) 上验证。对膨胀耗散的处理优于 7 个参考求解器。
2. **2608.13490** — DD-RNO：区域分解路由神经算子，通过域路由机制分离边界层和势流区域，LCQ 替代压力积分。速度 MSE 降低 17 倍，~144 ms/sample。
3. **2608.13424** — 准定常近似在宽频率范围内失效，风轮机叶片载荷可能被严重低估。
4. **2608.13398** — 偶发涡合并事件导致翼型阻力尖峰，二次涡旋度喷发触发群发性涡释放机制。

---

*生成时间: 2026-08-15T14:04 UTC*
