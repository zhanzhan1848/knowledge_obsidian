# 每日论文搜索报告 — 2026-04-21

> **搜索范围**: arXiv physics.flu-dyn, cs.FL (最近 24 小时)  
> **关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence  
> **执行时间**: 2026-04-21 14:11 UTC

---

## 📋 论文列表

| # | arXiv ID | 标题 | 类别 | 来源 |
|---|----------|------|------|------|
| 1 | 2604.16449 | Gaussian Field Representations for Turbulent Flow | physics.flu-dyn, cs.CE | new |
| 2 | 2604.16494 | Velocity field within a vortex ring with a large elliptical cross section | physics.flu-dyn | new |
| 3 | 2604.16495 | Effect of gap width on turbulent transition in Taylor-Couette flow | physics.flu-dyn | new |
| 4 | 2604.16501 | Design Optimization of eVTOL Propellers using VDVM | physics.flu-dyn | new |
| 5 | 2604.16633 | The inviscid Euler limit as a critical boundary for moment-based aerodynamic system identification | physics.flu-dyn | new |
| 6 | 2604.16974 | Directed droplet motion -- Its versatile nature and anticipated applications | physics.flu-dyn | new |
| 7 | 2604.17149 | FlowRefiner: Flow Matching-Based Iterative Refinement for 3D Turbulent Flow | physics.flu-dyn, cs.LG | new |
| 8 | 2604.17352 | Assessment of RANS Modeling of Jet Interaction in Fan-Array Wind Generator Flows | physics.flu-dyn | new |
| 9 | 2604.17463 | Immersed Boundary -- Lattice Boltzmann Method for Wetting Problems | physics.flu-dyn, physics.comp-ph | new |
| 10 | 2604.17636 | Drag reduction regimes in air lubrication | physics.flu-dyn | new |
| 11 | 2604.17793 | Tangential and normal partial slip at liquid-fluid interfaces | physics.flu-dyn, cond-mat.soft | new |
| 12 | 2604.17851 | Coherent structures in axis-switching elliptical jets (DNS + SPOD) | physics.flu-dyn | new |
| 13 | 2604.18059 | VAE + Information Decomposition for Disentangled Manifold Learning of Fluid Flows | physics.flu-dyn | new |
| 14 | 2604.16811 | Impact dynamics of flexible hydrogels on solid substrates (cross) | physics.flu-dyn | cross |

**注**: cs.FL 无相关流体论文更新。

---

## 🔬 重点论文精要

### 1. Gaussian Field Representations for Turbulent Flow (2604.16449)
- **作者**: Dhanush Vittal Shenoy, Steven H. Frankel
- **方法**: 局部高斯核叠加表示速度场，可学习位置、振幅、尺度
- **测试**: Taylor-Green 湍流 (从层流到充分发展湍流)
- **结果**: 压缩比 1e3-1e4 时速度精度高，但 enstrophy 退化明显
- **改进**: 各向异性高斯核、自适应放置、多分辨率核
- **结论**: 瓶颈在于几何表达力，而非参数数量
- **📝 笔记**: [[2026-04-21-gaussian-field-turbulent-flow]]

### 2. FlowRefiner: Flow Matching-Based Iterative Refinement for 3D Turbulent Flow (2604.17149)
- **作者**: Yilong Dai, Runlong Yu et al.
- **方法**: 流匹配 + 常微分方程 (ODE) 迭代修正替代随机去噪
- **关键**: 解耦 sigma schedule (噪声范围与细化深度独立)
- **实验**: 大规模 3D 湍流，多尺度结构丰富
- **结果**: SOTA 自回归预测精度，强物理一致性
- **📝 笔记**: [[2026-04-21-flowrefiner-3d-turbulent-flow]]

### 3. Design Optimization of eVTOL Propellers using VDVM (2604.16501)
- **方法**: 粘性离散涡方法 (VDVM)，结合 triple-deck 边界层理论的 Kutta 条件闭合
- **验证**: 与实验和高保真 CFD 数据对比，推力和扭矩一致性优秀
- **优化**: 非线性扭转分布 + 细长弦分布 (Adkins-Liebeck framework, Betz 效率条件)
- **结果**: 效率提升 8.99%
- **📝 笔记**: [[2026-04-21-evtol-propeller-vdvm]]

### 4. RANS Modeling of Fan-Array Wind Generator Flows (2604.17352)
- **方法**: RANS + 压力跳跃边界条件表示风扇
- **评估**: 10×10 风扇阵列，预测与实验对比
- **结论**: RANS 捕获整体射流相互作用拓扑和下游速度衰减；但近场注入区和周边剪切层有系统性偏差；湍流强度预测偏差较大
- **📝 笔记**: [[2026-04-21-rans-fan-array-wind-generator]]

### 5. Immersed Boundary -- Lattice Boltzmann Method for Wetting (2604.17463)
- **方法**: IBLB (Immerse Boundary + Lattice Boltzmann) + 湿润势
- **验证**: 与边界元法 (BEM) 和 VOF 方法对比
- **发现**: 接触线附近形成薄液膜，可能影响水动力学一致性
- **📝 笔记**: [[2026-04-21-iblb-lbm-wetting]]

### 6. VAE Manifold Learning with Information Decomposition (2604.18059)
- **方法**: VAE + KL 分解 (互信息、总相关、维度 KL)
- **数据集**: 圆柱绕流 (可变位置、直径、Re)、NACA 0012 翼型 + 涡 gust
- **对比**: PCA、Isomap、β-VAE
- **优势**: 解纠缠更强、物理可解释性强、对损失权重参数鲁棒
- **📝 笔记**: [[2026-04-21-vaes-info-decomposition-fluid]]

---

## 📊 统计

- **physics.flu-dyn 新论文**: 13 篇
- **cs.FL 相关论文**: 0 篇
- **重点关注 (CFD/湍流相关)**: 6 篇
- **方法论创新**: 4 篇
- **应用类**: 4 篇

---

*由 鲜毛肚 (Caixin) 自动生成 — 2026-04-21 14:11 UTC*