# 流体力学论文笔记 - 2026年7月10日

## 论文列表

---

## 1. Scaling WaterLily.jl with MPI and an improved geometric multigrid solver

**arXiv ID**: [2607.07687](https://arxiv.org/abs/2607.07687)  
**类别**: physics.flu-dyn, physics.comp-ph, cs.DC  
**日期**: 2026-07-08 (v1), 2026-07-09 (v2)  
**作者**: Bernat Font 等

### 摘要
We present recent performance-oriented developments in WaterLily, a scale-resolving incompressible flow solver written in pure Julia that runs seamlessly on CPUs and GPUs of any vendor. Supported by the newly added MPI-based parallelism, strong-scalability tests display a near-ideal linear trend, and weak-scaling efficiency is kept above 85% before node memory-concurrency contention dominates parallel performance. Inter-node weak scalability is sustained above 96% with grid size up to 1 billion cells. We further benchmark improvements to the geometric multigrid Poisson solver enabled by an adaptive under-relaxed red-black Gauss-Seidel smoother together with anisotropic coarsening operators.

### 核心要点
- **数值方法**: 几何多重网格 (Geometric Multigrid) + 自适应欠松弛红黑高斯-赛德尔平滑器
- **并行化**: MPI 并行，强可扩展性接近理想线性，弱可扩展性 > 85%（达10亿网格单元）
- **语言**: 纯 Julia 实现，CPU/GPU 通吃
- **Poisson 求解器**: 各向异性粗化算子

### 关键词
`CFD` `高性能计算` `Julia` `多重网格` `MPI` `Poisson方程`

---

## 2. On the rectification of oscillatory flows by flexible leaflets in a confined geometry

**arXiv ID**: [2607.08394](https://arxiv.org/abs/2607.08394)  
**类别**: physics.flu-dyn, cond-mat.soft  
**日期**: 2026-07-09  
**作者**: Martin Brandenbourger 等

### 摘要
Inspired by biological systems, extensive research has explored how fluid-structure interactions in compliant channels and confined geometries control fluid transport. While local nonlinearities can be induced by individual components, arranging these elements into larger architectures gives rise to increasingly complex, collective responses. Predicting these collective behaviors, however, remains largely restricted to steady-state characterization, as the dynamic coupling between time-varying flows and multiple interacting structures is difficult to model. In this paper, we investigate numerically the collective interaction of multiple asymmetric leaflets within a channel at low-Reynolds number. By utilizing symmetrically oscillating plates rather than a pressure-driven flow to isolate the system from background asymmetries, we characterize how these interacting structures generate a net fluid transport. We develop an analytical framework to evaluate transport in the steady limit, which we subsequently extend to account for time-dependent channel oscillations, providing a complete dynamic description of the coupled fluid-structure system. Our results demonstrate that high leaflet densities maximize collective interactions and net transport. Furthermore, we define an elastoviscous number comparing viscous hydrodynamic forces to the restorative elastic forces of the leaflets, and uncover an optimal value that maximizes the net flow. This framework establishes a foundation for analyzing how collective slender structures interact dynamically within viscous environments, laying the groundwork for future studies on flow control in biological fluid transport and microfluidic design.

### 核心要点
- **研究对象**: 低雷诺数下多个非对称柔性薄片在通道中的流固耦合
- **控制方程**: Stokes 流 (低雷诺数近似)
- **关键参数**: Elastoviscous number (粘弹性数) - 粘性 hydrodynamic 力与叶片弹性恢复力的比值
- **发现**: 高叶片密度最大化集体相互作用和净输运；存在最优 elastoviscous number
- **应用**: 生物流体输运、微流控设计

### 关键词
`流固耦合` `低雷诺数流` `柔性结构` `微流控` `Stokes流`

---

## 3. Manifold-adapted radial basis functions for reduced-order modelling of chaotic flows

**arXiv ID**: [2607.08571](https://arxiv.org/abs/2607.08571)  
**类别**: physics.flu-dyn, nlin.CD  
**日期**: 2026-07-09  
**作者**: Miguel Pérez Cuadrado 等

### 摘要
Chaotic systems often evolve on a low-dimensional attractor whose geometry varies from one region to another. We propose a non-intrusive reduced-order model that reads this local geometry by clustering and uses it to shape a radial basis library whose kernels adapt to each region. Fitting the reduced velocity onto this library by one global regularised least-squares solve gives an explicit, differentiable vector field that reproduces the long-term statistics, that is, the invariant measure, without any use of the governing equations. Since a radial basis field decays away from the data and cannot by itself return an escaped state, the integration is stabilised by a kinematic corrector whose magnitude is reported as a measure of how far each result rests on the learned field rather than on the corrector. On Lorenz-63 the model recovers the attractor, its marginal densities, and the positive and neutral Lyapunov exponents, while under-recovering the strong transverse contraction. On Lorenz-96 its valid prediction time is competitive with tuned neural-network and reservoir-computing forecasters, and the invariant measure is reproduced on both the full state and a reduced observable. On the Kuramoto--Sivashinsky equation and the quasiperiodic Kolmogorov flow the model matches the energy distribution and spectrum of an intrusive quantised-local Galerkin model, and improves on a global Galerkin projection of the same dimension, without ever projecting the governing equations.

### 核心要点
- **方法**: 流形自适应径向基函数 (RBF) + 聚类
- **类型**: 非侵入式降阶模型 (ROM)
- **创新点**: 
  - 无需使用控制方程
  - 通过聚类读取局部流形几何
  - 径向基核自适应不同区域
  - 使用运动学校正器稳定积分
- **验证**: Lorenz-63, Lorenz-96, Kuramoto-Sivashinsky, Kolmogorov flow
- **性能**: 预测时间与神经网络/reservoir computing 相当

### 关键词
`降阶模型` `径向基函数` `混沌流` `数据驱动` `流形学习`

---

## 4. Stochastic dynamics of particles in correlated fields

**arXiv ID**: [2607.08627](https://arxiv.org/abs/2607.08627)  
**类别**: cond-mat.soft, cond-mat.stat-mech  
**日期**: 2026-07-09  
**作者**: Andrea Gambassi 等

### 摘要
The effective dynamics of a colloidal particle immersed in a complex medium at equilibrium is usually described in terms of a linear overdamped Langevin equation, possibly with memory. However, numerical simulations and experiments have shown that this linear model fails, suggesting that the effective dynamics of the probe is actually nonlinear. Focusing on the case in which the medium is described by a fluctuating and correlated Gaussian field, linearly coupled to the colloid, we derive this effective dynamics and discuss its various consequences, including those on the stochastic thermodynamics of a driven particle. When the field is generated by the particle itself, with negligible fluctuations, the resulting self-chemotactic dynamics turns out to display anomalous扩散 and run-and-tumble motion in low spatial dimension, which we characterise analytically.

### 核心要点
- **研究对象**: 相关场中胶体颗粒的有效动力学
- **模型**: 过阻尼 Langevin 方程（非线性内存效应）
- **发现**: 自趋化动力学显示异常扩散和 run-and-tumble 运动
- **方法**: 解析推导 + 数值模拟验证

### 关键词
`胶体动力学` `随机过程` `Langevin方程` `相关场` `自趋化`

---

## 5. The Radial Distribution Functions of Nanofluids: Molecular Dynamics Simulations

**arXiv ID**: [2607.08527](https://arxiv.org/abs/2607.08527)  
**类别**: cond-mat.mes-hall, cond-mat.mtrl-sci  
**日期**: 2026-07-09  
**作者**: Özlem Öztürk 等

### 摘要
Nanofluids, which are composed of insoluble, stable, and well-dispersed solid particles of nanoscale and/or subnanometer sizes suspended in a base liquid, are the next generation of liquids of today. The purpose of this paper is to investigate the one dimensional and three dimensional angle dependent radial distribution functions RDF and ARDF of polymeric nanofluids made up of nonrigid (soft) nanoparticles and a polymer melt (base fluid) using the molecular dynamics simulation approach and to search the shape stabilities by using these results. For this purpose, we use the nanoparticles of three different sizes: 28, 42, and 56 particles. We research them both within the base fluid and without this polymeric medium for instability analysis. We found that the nanoparticles with 28 atoms show the shape instability inside the base fluid when we increase the system temperature from T=1.2 to T=1.8 and hence, the structure of two concentric spherical shell of the nanoparticle breaks down and as a result the empty vacuum between these inner and the outer shells disappears. In contrast to this findings, the nanoparticles with 42 and 56 atoms show the shape stability inside the base fluid by preserving their concentric shell structures when we rise the system temperature and decrease the affinity between the nanoparticles and the base liquid medium.

### 核心要点
- **方法**: 分子动力学 (MD) 模拟
- **研究对象**: 聚合物纳米流体中的角度依赖径向分布函数 (RDF/ARDF)
- **粒子尺寸**: 28, 42, 56 原子
- **关键发现**: 
  - 28原子纳米粒子在 T=1.2→1.8 时出现形状失稳
  - 42和56原子纳米粒子保持形状稳定性
- **应用**: 纳米流体热传导增强

### 关键词
`分子动力学` `纳米流体` `径向分布函数` `形状稳定性` `热传导`

---

## 搜索元信息

- **搜索时间**: 2026-07-10 14:07 UTC
- **搜索范围**: arXiv cs.FL, physics.flu-dyn (最近24小时)
- **关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence
- **备注**: 今日找到 5 篇相关论文，其中 3 篇直接属于 physics.flu-dyn 类别

---
*由 鲜毛肚 (Xianmaodu) 自动收集整理*
