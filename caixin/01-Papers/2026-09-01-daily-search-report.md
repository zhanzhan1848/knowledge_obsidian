# Daily Search Report — 2026-09-01

**搜索范围**: arXiv physics.flu-dyn (新提交)
**关键词**: CFD, fluid simulation, Navier-Stokes, turbulence, SPH, LBM, vortex method
**检索时间**: 2026-09-01 UTC

---

## 统计

- physics.flu-dyn 今日新提交: 27 篇
- 筛选出流体/CFD 相关: 19 篇
- 覆盖主题: DNS, turbulence, multiphase flow, viscoelastic fluids, ML/PINNs for CFD, operator learning, particle-laden flows

---

## 重点论文索引

| arXiv ID | 主题 | 方法 | 标签 |
|---|---|---|---|
| [2608.31141](#260831141) | 超晶格 Faraday 波模式 | DNS (3D NS + free surface) | DNS, free surface, pattern formation |
| [2608.29069](#260829069) | 三相流 operator learning | DeepONet (SEDONet) + Cahn-Hilliard-NS | operator learning, multiphase, DeepONet |
| [2608.28935](#260828935) | Data-free PINN 跨 Reynolds 数 | NeuralFlowNet / PINN | PINN, Navier-Stokes, AI-CFD |
| [2608.29895](#260829895) | PI-KAN 求解黏弹性流体方程 | Physics-Informed KAN | KAN, viscoelastic, PINN |
| [2608.28869](#260828869) | 张量网络压缩各向同性湍流 | MPS (Matrix Product State) | ROM, turbulence, compression |
| [2608.30545](#260830545) | 衰减湍流中惯性粒子聚团 | DNS + Voronoï tessellation | particle-laden, turbulence, clustering |
| [2608.30909](#260830909) | 轨迹一致性流体重建网络 | TraCTra (Physics-informed) | flow reconstruction, deep learning |
| [2608.30452](#260830452) | 行波控制管道流的减阻与亚临界湍流 | DNS, traveling wave control | turbulence control, pipe flow, relaminarization |
| [2608.30926](#260830926) | CNN 从涡量预测黏弹性应力 | CNN + assimilation training | elastic turbulence, neural networks |
| [2608.30286](#260830286) | 微结构表面弹性湍流与弹性波共存 | DNS + microfluidic experiments | elastic turbulence, viscoelastic, pattern formation |
| [2608.29552](#260829552) | 黏弹性 Taylor-Couette 流动稳定性 | DNS (Oskolkov model) | stability, viscoelastic, Taylor-Couette |
| [2608.31010](#260831010) | 盐指对流中螺旋度的增长 | 解析理论 | helicity, salt-fingering, double diffusion |
| [2608.30840](#260830840) | Real Schur 流动的声学指向性与螺旋度 | 绝对统计平衡 + 声学类比 | helicity, acoustic, turbulence |
| [2608.29240](#260829240) | 矩形微通道沸腾转变的 Reynolds 数效应 | 3D 共轭模拟 | boiling, two-phase flow, mini-channel |
| [2608.29762](#260829762) | 倾斜表面液滴撞击飞溅标度律 | DNS, high-speed imaging | droplet impact, splashing, We |
| [2608.28761](#260828761) | 毛细射流液滴尺寸指数分布 | 分析 + DNS | droplet fragmentation, capillary jet |
| [2608.29946](#260829946) | 磁控多相流溶质分散 | 解析 + Brownian dynamics | MHD, multiphase, solute transport |
| [2608.29342](#260829342) | 乳化液滴在倾斜微结构表面撞击 | 实验 | emulsion, droplet, wettability |
| [2608.28679](#260828679) | 低 Prandtl 数双扩散阶梯的通量 | DNS (triply periodic) | double diffusion, convection, staircase |

---

## 详细笔记

---

### 2608.31141 — Numerical simulation of two-frequency-driven superlattice Faraday-wave pattern {#260831141}

**链接**: https://arxiv.org/abs/2608.31141
**作者**: (见 arXiv)
**方法**: DNS of 3D Navier-Stokes + free surface, two-frequency forcing
**创新点**:
- 首次通过 DNS 完整 3D NS 方程复现 SSS-I 超晶格模式
- 发现弱非线性或黏性近似无法触及该 regime
- 两种初始条件均收敛到同一 superlattice pattern（约 250 forcing periods）
- 100 periods 后模式失稳，转变为动态漂移版本

**控制方程**: 完整 3D Navier-Stokes + free surface boundary condition

**数值方法**: DNS, 时间步长由 CFL 条件约束

**关键词**: Navier-Stokes, free surface, pattern formation, Faraday wave, DNS
**标签**: `DNS` `free-surface` `pattern-formation`

---

### 2608.29069 — Spectral-Embedded Operator Learning for Three-Phase Interfacial Flow {#260829069}

**链接**: https://arxiv.org/abs/2608.29069
**作者**: Muhammad Abid
**方法**: DeepONet 三种 trunk 表征变体比较: DeepONet / FEDONet (Fourier) / SEDONet (Chebyshev)
**创新点**:
- 三相流 (air bubble → water-oil interface → water plume in oil) benchmark
- 1,024 Sobol 采样，9 维参数空间 → 5 通道时空场
- **SEDONet** (Chebyshev) 比 DeepONet 误差降低 24%，比 FEDONet 降低 16.8%
- Chebyshev 表征对非周期 wall-normal 和时间结构特别有效

**基准问题**: 三相 Cahn-Hilliard-Navier-Stokes (保持 simplex 约束)

**关键词**: operator learning, DeepONet, multiphase flow, Cahn-Hilliard, Chebyshev
**标签**: `operator-learning` `multiphase` `DeepONet` `Cahn-Hilliard`

---

### 2608.28935 — Towards Data-Free PINN Solutions of Navier-Stokes Across Low and High Re {#260828935}

**链接**: https://arxiv.org/abs/2608.28935
**方法**: NeuralFlowNet — data-free PINN 框架
**创新点**:
- 无需任何训练数据，仅从 NS 方程和边界条件学习
- 覆盖低 Re 到高 Re 稳态流动
- 包括强压力梯度场景
- 与参考数值解吻合良好

**数值方法**: PINN, 物理信息损失函数含 NS 残差 + 边界条件

**应用**: 高 Re 航空流体动力学 AI solver 基础
**关键词**: PINN, Navier-Stokes, data-free, AI-CFD, high-Re
**标签**: `PINN` `Navier-Stokes` `AI-CFD` `high-Reynolds`

---

### 2608.29895 — Physics-Informed KAN for Viscoelastic Fluid Equations {#260829895}

**链接**: https://arxiv.org/abs/2608.29895
**作者**: Suryanshu Singh
**方法**: PI-KAN (Physics-Informed Kolmogorov-Arnold Network)
**创新点**:
- KAN 用可学习激活函数替代 MLP 固定节点激活，更可解释
- 采用广义 hydrodynamic 模型 (dusty plasma 领域建立)
- Taylor-Green 流动基准测试，黏弹性参数 τ_m = 1–20
- 系统研究网络架构、超参数、配置点分布对收敛性的影响
- 研究随机种子初始化对训练结果的影响

**关键词**: KAN, viscoelastic, physics-informed, Taylor-Green, fluid dynamics
**标签**: `KAN` `viscoelastic` `physics-informed` `Taylor-Green`

---

### 2608.28869 — A priori Assessment of Tensor-Network Encoding for Isotropic Turbulent Flows {#260828869}

**链接**: https://arxiv.org/abs/2608.28869
**方法**: MPS (Matrix Product State) 作为降阶建模框架
**创新点**:
- DNS 数据压缩: 速度场用 5% 内存达到 99.8% 重构精度
- 标量场用 15% 内存达到相同精度
- 采用 interleaved ordering 定位 tensor 间相关性
- 统计量 (速度梯度、耗散、结构函数) 在压缩水平下保持 ~0.2% 相对误差
- 总动能和标量能在 0.2% 以内，耗散在 10% 以内

**数据集**: 各向同性 3D 不可压缩湍流 + 保守 Fickian 标量
**关键词**: tensor network, MPS, ROM, turbulence, compression, DNS
**标签**: `tensor-network` `ROM` `turbulence` `compression`

---

### 2608.30545 — Evolution of Inertial Particle Clustering in Decaying Turbulence {#260830545}

**链接**: https://arxiv.org/abs/2608.30545
**方法**: DNS (one-way coupling) + 3D Voronoï tessellation + physics-informed neural networks
**创新点**:
- 揭示优先浓度 (preferential concentration) 不能仅由瞬时 Stokes 数描述
- 粒子滑移速度遵循经典稳态关系，聚团统计量却保留历史依赖
- 粒子云从初始球形变形为椭球（~10 Kolmogorov times）
- 衰减湍流中聚团由瞬时流场状态和初始状态共同决定

**关键词**: preferential concentration, inertial particles, decaying turbulence, Voronoï, DNS
**标签**: `particle-laden` `turbulence` `clustering` `Voronoï`

---

### 2608.30909 — Learning Dynamically Consistent Flow Reconstructions (TraCTra) {#260830909}

**链接**: https://arxiv.org/abs/2608.30909
**方法**: Trajectory-Consistent Network Training (TraCTra)
**创新点**:
- 无标签框架，仅用部分观测序列 + 可微分前向模型训练
- 网络预测状态前推与后续观测一致，且与独立重建在完整状态空间一致
- 四大流体系统: 3D 湍流粗粒化场、密度波动速度、PIV 重建、涡量恢复
- 超越纯同化方法和物理信息神经网络
- 可迁移到未见过的流场

**关键词**: flow reconstruction, deep learning, trajectory consistency, sparse observations
**标签**: `flow-reconstruction` `deep-learning` `sparse-data`

---

### 2608.30452 — Drag Reduction and Subcritical Turbulence in Controlled Pipe Flows {#260830452}

**链接**: https://arxiv.org/abs/2608.30452
**作者**: Emanuele Gallorini
**方法**: DNS, streamwise-traveling waves of azimuthal wall velocity
**创新点**:
- 管道流与槽道流响应机制不同: 管道流可实现层流化，槽道流不行
- 合适控制下，湍流 puffs 可在 3 倍于自然临界 Re 下持续存在
- 基于空间方差的新间歇性指标将局部湍流与壁面摩擦关联
- 控制 puffs 的前缘传播速度可能快于体流速度

**Re_b = 4900**, traveling wave control
**关键词**: turbulence control, pipe flow, drag reduction, relaminarization, DNS
**标签**: `turbulence-control` `pipe-flow` `relaminarization`

---

### 2608.30926 — Neural Network to Predict Viscoelastic Stresses from Vortical Data {#260830926}

**链接**: https://arxiv.org/abs/2608.30926
**方法**: CNN (涡量场 → 正定构象张量) + assimilation-based training
**创新点**:
- 解决弹性湍流中速度与聚合物构象同步测量的难题
- 不需要预生成参考构象场库，通过同化训练算法从涡量时间序列学习
- 训练时要求网络预测与保存的涡量时间序列匹配，且 solver 与网络预测自洽
- 在 2D Kolmogorov 流各种 regime 下均产生稳健预测
- 可泛化到训练域外更大区域

**关键词**: elastic turbulence, CNN, conformation tensor, assimilation, polymer
**标签**: `elastic-turbulence` `neural-network` `polymer` `assimilation`

---

### 2608.30286 — Coexisting Chaos and Order in Micro-textured Elastic Flows {#260830286}

**链接**: https://arxiv.org/abs/2608.30286
**作者**: Giulio Foggi Rota
**方法**: Fully resolved DNS + microfluidic experiments
**创新点**:
- 黏弹性流体过微结构表面 (cilia/villi-like pillars) 产生弹性湍流
- 弹性湍流与弹性波共存 (由流体弹性与几何剪切耦合产生)
- 有序波动在宽范围流动条件下持续存在
- 揭示结构化几何如何利用黏弹性流体自发动力学操纵复杂流动

**关键词**: elastic turbulence, viscoelastic, microtextured surface, elastic waves
**标签**: `elastic-turbulence` `viscoelastic` `microstructure` `pattern-formation`

---

### 2608.29552 — Competing Instabilities in Wide-Gap Viscoelastic Taylor-Couette Flow {#260829552}

**链接**: https://arxiv.org/abs/2608.29552
**作者**: Alexander V. Proskurin
**方法**: DNS, Oskolkov 模型 (Kelvin-Voigt 特殊形式)
**创新点**:
- 弹性力增加使螺旋扰动比轴对称扰动更危险（不同于牛顿流体）
- 全非线性方法，直接数值模拟白噪声有限持续时间扰动
- 临界雷诺数与线性理论预测一致

**关键词**: Taylor-Couette, viscoelastic, stability, DNS, Oskolkov model
**标签**: `Taylor-Couette` `viscoelastic` `stability` `DNS`

---

### 2608.31010 — Growth of Helicity in Salt-Finger Convection {#260831010}

**链接**: https://arxiv.org/abs/2608.31010
**作者**: Benjamin Miquel
**方法**: 解析分析，2D 三分量框架
**创新点**:
- 揭示盐指区域中螺旋度放大机制（Rayleigh ratio > 临界阈值时）
- 为近期数值模拟中观察到的螺旋度自发涌现提供理论解释
- 发表在 Phys. Rev. E

**关键词**: helicity, salt-fingering, double diffusion, analytical
**标签**: `helicity` `double-diffusion` `analytical`

---

### 2608.30840 — Real Schur Flow Acoustic Directivity and Helicity Effects {#260830840}

**链接**: https://arxiv.org/abs/2608.30840
**作者**: Jian-Zhou Zhu
**方法**: 绝对统计平衡 + 声学类比，Wick 定理计算涡声源谱
**创新点**:
- 螺旋度放大 CWDRF (component-wise dimensionally reduced flows) 指向性各向异性
- 三类 CWDRF (两种 RSF + liberated Schur flow) 系统研究
- 声远场指向性函数与螺旋度效应关联

**关键词**: helicity, acoustic, turbulence, Real Schur flow, anisotropy
**标签**: `helicity` `acoustic` `turbulence` `anisotropy`

---

### 2608.29240 — Reynolds Number Effects on Boiling Transition in Rectangular Mini-Channel {#260829240}

**链接**: https://arxiv.org/abs/2608.29240
**作者**: Qi Wang
**方法**: 3D conjugate simulations, multi-site nucleation model, C++ open-source framework
**创新点**:
- 低 Re: 局部干涸发展主导沸腾转变
- 高 Re: 蒸汽结构对流拉伸与重组，长蒸汽段 → 局部蒸汽膜 → 全表面蒸汽覆盖
- Re=2000 提供最优整体热响应

**关键词**: boiling, two-phase flow, mini-channel, DNS, heat transfer
**标签**: `boiling` `two-phase` `mini-channel` `heat-transfer`

---

### 2608.29762 — Splashing-Regime Transitions and Secondary-Droplet Scaling {#260829762}

**链接**: https://arxiv.org/abs/2608.29762
**方法**: DNS, 参数范围 41 ≤ We ≤ 1790, 10° ≤ θ ≤ 90°
**创新点**:
- 五种撞击后 regime: deposition, front splashing, side splashing, side-front splashing, crown splashing
- 沉积-前飞溅转变由切向惯性参数 K_s = We cosθ 控制，K_s^c ≈ 120
- 二级液滴尺寸分布: d_{s,med}/D ~ We^{-3/5}, N_s ~ We^{9/5}
- 方向惯性决定宏观飞溅 regime 选取，共同毛细-惯性破碎标度律跨 regime 成立

**关键词**: droplet impact, splashing, Weber number, DNS, secondary droplets
**标签**: `droplet-impact` `splashing` `Weber-number` `DNS`

---

### 2608.28761 — Droplet Sizes from Impulsive Capillary Jets: Exponential Distribution {#260828761}

**链接**: https://arxiv.org/abs/2608.28761
**作者**: Alfonso M. Ganan-Calvo
**方法**: 分析理论 + DNS (气泡破裂)
**创新点**:
- 传统观点认为存在黏毛细长度 ℓ_μ = μ²/ρσ 下限，作者证明不存在
- 脉冲射流没有自身特征长度
- 液滴尺寸分布为指数分布，标度由空腔半径决定，与流体性质无关
- 持续拉伸保持"记忆"产生尖峰 gamma 分布（Ligament-mediated 破碎）

**关键词**: droplet fragmentation, capillary jet, exponential distribution, cavity
**标签**: `droplet` `fragmentation` `capillary` `scaling`

---

### 2608.29946 — Solute Dispersion in Magnetically Influenced Multiphase Flow {#260829946}

**链接**: https://arxiv.org/abs/2608.29946
**方法**: Two-fluid 解析模型 + Brownian dynamics 验证
**创新点**:
-  micropolar 流体核 + Newtonian 周边 + Brinkman/Darcy 多孔层
- 横向磁场影响载流进而影响溶质局域化
- 与生物流体 (动脉) 输运、磁性纳米药物递送相关

**关键词**: MHD, multiphase, solute transport, porous media, micropolar fluid
**标签**: `MHD` `multiphase` `solute-transport` `porous-media`

---

### 2608.29342 — Droplet Impact of Emulsions on Inclined Microstructured Surfaces {#260829342}

**链接**: https://arxiv.org/abs/2608.29342
**方法**: 高速成像实验, We = 18–565, 倾斜 55°
**创新点**:
- 表面倾斜引入不对称铺展与回缩
- 微结构表面减少黏附，促进回弹
- 乳化液表现出与水不同的行为（增强沉积、增加滑移）
- 局部相再分布从根本上改变能量耗散、润湿和破碎

**关键词**: emulsion, droplet impact, microstructured surface, wettability
**标签**: `emulsion` `droplet` `microstructure` `wettability`

---

### 2608.28679 — Fluxes through Double-Diffusive Staircase at Low Prandtl Number {#260828679}

**链接**: https://arxiv.org/abs/2608.28679
**方法**: DNS (triply periodic), 系统参数扫描
**创新点**:
- 发现低 Pr 数双扩散阶梯可存在于比以往报道更高的密度比
- 提出长寿命层状态新判据（弱依赖 Ra）
- Nusselt 数标度为 Ra^{1/3}（与之前 (RaPr)^{1/3} 不同）
- 基于密度异常升降和湍流混合的新模型解释数据

**关键词**: double diffusion, staircase, low Prandtl, DNS, convection
**标签**: `double-diffusion` `low-Prandtl` `DNS` `convection`

---

## 主题分布

```
DNS / Direct Numerical Simulation:  2608.31141, 2608.30545, 2608.30452, 2608.30286,
                                    2608.29552, 2608.29762, 2608.29240, 2608.28679
ML/AI for CFD:                      2608.29069, 2608.28935, 2608.29895, 2608.28869,
                                    2608.30909, 2608.30926
Turbulence:                         2608.30545, 2608.30452, 2608.30840, 2608.28869
Viscoelastic/Elastic Fluids:        2608.29895, 2608.30926, 2608.30286, 2608.29552
Multiphase Flow:                    2608.31141, 2608.29069, 2608.29240, 2608.29762,
                                    2608.28761, 2608.29342, 2608.29946
Turbulence Control:                 2608.30452
Particle-Laden Flows:               2608.30545
Double Diffusion / Convection:      2608.31010, 2608.30840, 2608.28679
```

---

*报告生成时间: 2026-09-01 14:00 UTC*
