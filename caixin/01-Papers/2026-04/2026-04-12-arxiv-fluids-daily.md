# 流体力学论文日报 | 2026-04-12

> 搜索范围：arXiv physics.flu-dyn, cs.LG (cross-list)
> 日期：2026-04-06 至 2026-04-10 (共72篇提交)
> 关键词：CFD, fluid simulation, Navier-Stokes, SPH, LBM, vortex method, turbulence

---

## 2026-04-10 精选论文

---

### 1. Helicity-Conservative Domain-Decomposed PINN for Incompressible Non-Newtonian Flow

- **arXiv**: [2604.08002](https://arxiv.org/abs/2604.08002)
- **作者**: Zheng Lu
- **提交**: 2026-04-09
- **标签**: #PINN #helicity #non-Newtonian #vorticity #CFD #machine-learning

#### 摘要
提出了一个**螺旋度感知（helicity-aware）**的物理信息神经网络（PINN）框架，用于求解不可压缩非牛顿流。采用旋度形式的控制方程，通过自动微分从神经速度场直接计算涡量，避免兼容误差。通过重叠空间区域分解（FBPINNs风格）和因果逐时间片延续策略提升鲁棒性和可扩展性。

#### 核心创新点
- **Helicity守恒**：通过自动微分计算涡量，避免独立学习涡量场导致的兼容误差
- **重叠区域分解**：基于有限基PINN的空间分解，高斯窗口函数保证光滑单位分解
- **时序延续**：逐时间片顺序推进，长期瞬态模拟稳定

#### 数值方法
- 求解形式：旋度形式 Navier-Stokes + Oldroyd-B 本构方程
- 框架：Physics-Informed Neural Networks (PINN)
- 关键技术：自动微分、causal slab-wise temporal continuation

#### 计算评估
- 测试场景：2D/3D 非牛顿流
- 优势：长时程物理保真、helicity 守恒

#### 关键词
`helicity conservation` `PINN` `non-Newtonian fluid` `vorticity formulation` `domain decomposition`

---

### 2. Viscoelastic Droplet Impact on Surfaces with Sharp Wettability Contrast

- **arXiv**: [2604.07854](https://arxiv.org/abs/2604.07854)
- **作者**: Mahmood Mousavi
- **提交**: 2026-04-09
- **标签**: #VOF #OpenFOAM #viscoelastic #droplet #wetting #CFD

#### 摘要
使用 OpenFOAM 三维求解器（VOF + log-conformation formulation）模拟黏弹性液滴撞击具有湿润性对比的表面。研究了松弛时间、表面张力、Weber数、Eötvös数的耦合影响。关键发现：松弛时间增加→最大铺展直径增大12.9%，表面张力增加→抑制铺展。

#### 核心创新点
- **log-conformation formulation**：提高黏弹性流数值稳定性
- **速度依赖动态接触角模型**：精确捕捉湿润动力学
- **混合湿润性表面**：产生不对称铺展和"dustpan/shoe-like"平衡形态

#### 数值方法
- 求解器：OpenFOAM (interFoam为基础)
- 界面追踪：Volume-of-Fluid (VOF)
- 本构模型：Oldroyd-B (黏弹性)
- 网格：3D 高保真

#### 计算参数
- 液滴直径：2 cm，撞击速度：4 m/s
- 松弛时间：0.02s → 0.12s
- 表面张力：0.05 N/m → 0.15 N/m

#### 关键词
`VOF` `OpenFOAM` `Oldroyd-B` `droplet impact` `dynamic contact angle` `wettability contrast`

---

### 3. Elastic and Viscous Effects in Viscoelastic Flows: De and Wi Numbers

- **arXiv**: [2604.08413](https://arxiv.org/abs/2604.08413)
- **作者**: Arturo C. Martí
- **提交**: 2026-04-09
- **标签**: #viscoelastic # Deborah number #Weissenberg number #constitutive-model

#### 摘要
系统阐明了黏弹性流体中 Deborah 数 (De) 和 Weissenberg 数 (Wi) 的物理意义及其在复杂流动中的竞争关系。通过解析解（平面非稳态流）和数值模拟（同心旋转圆柱间的黏弹性流，Oldroyd-B方程）两个代表性场景，厘清了这两个无量纲参数各自独立的作用。

#### 核心结论
- De 表征流体弹性响应与黏性耗散的特征时间比
- Wi 表征流动超时弹性累积程度
- 两者在弹性与黏性效应竞争中的角色不同，需独立解释

#### 关键词
`viscoelastic fluid` `Deborah number` `Weissenberg number` `Oldroyd-B` `constitutive model`

---

### 4. Evidence of an Inertialess Kapitza Instability due to Viscosity Stratification

- **arXiv**: [2604.07761](https://arxiv.org/abs/2604.07761)
- **作者**: Shravya Gundavarapu
- **提交**: 2026-04-09
- **标签**: #Kapitza instability #viscosity stratification #Stokes flow #film flow #hydrodynamic instability

#### 摘要
传统 Kapitza 失稳需要有限惯性。本文证明当薄膜具有连续黏度分层时（与剪切诱导迁移相关的颗粒负载薄膜、热分层涂层等），**即使在零惯性（Stokes）极限下**，表面模式失稳也会出现。机制类比于表面活性剂驱动的 Marangoni 失稳。

#### 核心创新点
- **无惯性失稳**：首次证明纯黏度分层可在 Stokes 极限下触发界面失稳
- **Peclet数窗口**：失稳局限于有限的 Peclet 数窗口
- **渐近分析 + Chebyshev谱方法**：验证了特征值问题

#### 关键词
`Kapitza instability` `viscosity stratification` `Stokes flow` `thin film` `Marangoni instability`

---

### 5. Collective Dynamics of Vortex Clusters on a Flat Torus

- **arXiv**: [2604.07373](https://arxiv.org/abs/2604.07373)
- **作者**: Rickmoy Samanta
- **提交**: 2026-04-07
- **标签**: #vortex method #Hamiltonian formulation #torus #2D turbulence #vortex clusters

#### 摘要
在双周期（flat torus）无黏流体域中研究了涡旋相互作用的 Hamiltonian 形式。基于 Schottky-Klein prime 函数推导了两涡旋精确相互作用，导出了轨道旋转频率和偶极子平移速度的解析表达式。建立了以复四极矩为核心的集体动力学简化描述。

#### 核心创新点
- **Schottky-Klein prime 函数**：提供精确的双周期涡旋相互作用
- **四极矩描述**：实部控制旋转速率修正，虚部控制呼吸模式
- **flat torus 几何**：紧凑域上的涡旋集群行为

#### 数值验证
- 直接数值模拟确认了理论预测

#### 关键词
`vortex method` `Hamiltonian dynamics` `flat torus` `Schottky-Klein prime function` `quadrupole`

---

### 6. Porosity and Material Disorder Drive Distinct Channelization Transition

- **arXiv**: [2604.08025](https://arxiv.org/abs/2604.08025)
- **作者**: André F. V. Matias
- **提交**: 2026-04-09
- **标签**: #porous media #channelization #heterogeneity #continuum model #flow instability

#### 摘要
通过粗粒化孔隙尺度动力学推导出流动与孔隙率耦合的连续体模型，揭示了不同类型无序导致定性截然不同的行为：侵蚀阻力无序产生**不连续转变**，而弱孔隙率扰动即可触发持续通道化。

#### 核心发现
- **不连续转变**：仅在有限无序强度以上出现永久通道
- **连续转变**：即使极弱初始孔隙率波动也可破坏均匀流动
- 对多孔介质中通道化的理解有重要意义

#### 关键词
`porous media` `channelization` `material disorder` `continuum model` `flow instability`

---

### 7. MeanFlow-Enhanced Neural Operators (MENO) for Dynamical Systems

- **arXiv**: [2604.06881](https://arxiv.org/abs/2604.06881)
- **作者**: Tianyue Yang (cs.LG cross-list)
- **提交**: 2026-04-08
- **标签**: #neural operator #CFD #surrogate model #MeanFlow #dynamical systems

#### 摘要
提出了 **MENO** 框架，利用 MeanFlow 方法增强 Fourier 神经算子，解决高分辨率训练数据不足时的小尺度结构丢失问题。在相场动力学、2D Kolmogorov 湍流和活性物质动力学上测试，分辨率至 256×256，功率谱精度提升2倍，推理速度比 DDIM 快12倍。

#### 核心创新点
- **MeanFlow 增强**：恢复小尺度和大尺度动力学
- **多尺度保真**：解决 Fourier 截断问题
- **高效率**：12× 比 diffusion-based 方法更快

#### 应用场景
- 2D Kolmogorov 流动（湍流相关）
- 相场动力学
- 活性物质

#### 关键词
`neural operator` `MeanFlow` `Fourier neural operator` `turbulence surrogate` `Kolmogorov flow`

---

### 8. Asymptotic-Preserving Neural Networks for Viscoelastic Blood Flow

- **arXiv**: [2604.06287](https://arxiv.org/abs/2604.06287)
- **作者**: Giulia Bertaglia (cs.LG cross-list)
- **提交**: 2026-04-07
- **标签**: #PINN #blood flow #viscoelastic #hemodynamics #APNN #CFD

#### 摘要
使用渐近保持神经网络（APNN）从一维多尺度血液流动模型（描述动脉壁黏弹性）中识别黏弹性参数，同时重构状态变量。可从 Doppler 超声的截面积和速度数据推断压力波形。

#### 核心创新点
- **APNN**：嵌入物理守恒律，跨尺度保持渐近一致性
- **患者特定**：从非侵入性数据估计压力波形
- **参数识别 + 状态重建** 同时完成

#### 关键词
`asymptotic-preserving NN` `blood flow` `viscoelastic` `1D blood flow model` `parameter identification`

---

### 9. Viscous Bending Mitigates Spontaneous Meandering of Rivulets

- **arXiv**: [2604.07222](https://arxiv.org/abs/2604.07222)
- **作者**: Grégoire Le Lay
- **提交**: 2026-04-08
- **标签**: #Hele-Shaw #rivulet #viscous bending #Navier-Stokes #linear stability

#### 摘要
在 Hele-Shaw 细胞中研究细长沟渠的自发蜿蜒失稳。将黏性弯曲项纳入深度平均 Navier-Stokes 方程，解决了15年未解的"最快增长模式波长选择"问题，并证明蜿蜒失稳是绝对的而非对流的。

#### 核心发现
- **黏性弯曲**：是波长选择的关键物理机制
- **修正稳定性判据**：基于低黏度假设的简化推导
- **失稳机制重新解释**：源于摩擦效应而非惯性力

#### 关键词
`Hele-Shaw cell` `rivulet meandering` `viscous bending` `Navier-Stokes` `wavelength selection`

---

### 10. Free Surface Enhancement of Droplet Rupture by Cavitation Bubble Collapse

- **arXiv**: [2604.06121](https://arxiv.org/abs/2604.06121)
- **作者**: Jie Feng
- **提交**: 2026-04-07
- **标签**: #cavitation #droplet rupture #microjet #Weber number #free surface

#### 摘要
研究空化气泡与油滴在自由表面和刚性壁面耦合约束下的hydrodynamic相互作用。发现两种机制：破裂（液滴碎裂）vs 非破裂。建立了基于 Kelvin 脉冲和 Weber 数的标度律，首次将破裂准则与气泡-液滴尺寸比关联。

#### 关键词
`cavitation bubble` `droplet rupture` `microjet` `Weber number` `free surface`

---

### 11. Preferential Orientation of Slender Elastic Floaters in Gravity Waves

- **arXiv**: [2604.08323](https://arxiv.org/abs/2604.08323)
- **作者**: Frederic Moisy
- **提交**: 2026-04-09
- **期刊**: Submitted to Phys Rev Fluids
- **标签**: #hydro-elastic #gravity waves #floater #wave-structure interaction

#### 摘要
建立了无衍射的流-弹性理论，计算细长柔性浮体在重力波中的波致平均偏航力矩。短浮体（<半波长）：软/短/重→纵向， stiff/long/light→横向。长浮体（>波长）：多平衡态。

#### 关键词
`hydro-elastic` `gravity waves` `floater orientation` `wave loading`

---

### 12. Ultimate Regimes in Horizontal and Internally Heated Convection

- **arXiv**: [2604.08164](https://arxiv.org/abs/2604.08164)
- **作者**: Olga Shishkina
- **提交**: 2026-04-09
- **标签**: #turbulent convection #Rayleigh-Bénard #ultimate regime #scaling laws

#### 摘要
推导了水平热对流（HC）和纯内部加热对流（IHC）的 ultimate 区域渐近模型。与 Rayleigh-Bénard 对流的关键区别：HC/IHC 的全局动能平衡不含额外响应因子，导致 ultimate 区域标度指数为 1/3（而非 RBC 的 1/2）。

#### 关键词
`turbulent convection` `ultimate regime` `Rayleigh-Bénard` `heat transfer scaling`

---

### 13. Tuning Cross-stream Lift in Viscoelastic Shear

- **arXiv**: [2604.07906](https://arxiv.org/abs/2604.07906)
- **作者**: Akash Choudhary
- **提交**: 2026-04-09
- **标签**: #viscoelastic #lift force #microfluidics #particle transport #swimmers

#### 摘要
研究了外部驱动机制对黏弹性剪切流中粒子横流升力的影响。发现 force-bearing 机制（如重力）和 force-free 机制（如电泳）产生**相反符号**的升力。机制源于不同流动物理扰动导致的聚合物应力分布差异。

#### 关键词
`viscoelastic shear` `lift force` `microfluidics` `electrophoresis` `polymeric stress`

---

### 14. Soret Diffusion Effects on Premixed Hydrogen/Air Flame Instability

- **arXiv**: [2604.08061](https://arxiv.org/abs/2604.08061)
- **作者**: Shengkai Wang
- **提交**: 2026-04-09
- **标签**: #flame instability #hydrogen combustion #Soret diffusion #DNS #Markstein length

#### 摘要
通过一维对流分析和二维直接数值模拟（DNS），量化了 Soret 扩散对氢气火焰不稳定性的影响。线性区：Soret 扩散在 φ<1.7 时增加扰动增长率，在 φ>1.7 时降低。非线性区：加速贫燃氢火焰的小尺度褶皱形成。

#### 方法
- DNS：覆盖线性增长区和完全非线性区
- 一维对流分析：Markstein 长度分析
- 标度参数：Karlovitz 数、密度加权位移速度

#### 关键词
`hydrogen flame` `Soret diffusion` `DNS` `flame instability` `Markstein length`

---

### 15. Cavity-Stabilized Rotating Flames in Circular Hele-Shaw Burner

- **arXiv**: [2604.08035](https://arxiv.org/abs/2604.08035)
- **作者**: Shengkai Wang
- **提交**: 2026-04-09
- **标签**: #flame dynamics #micro-combustion #Hele-Shaw #rotating flame #CH4

#### 摘要
在圆形 Hele-Shaw 燃烧器中实验观察到自组织旋转预混火焰（CH4、 C3H8、DME）。低流率下单头旋转，流率增加时分叉为多头，最终转为稳定环形火焰。临界总质量流率与当量比、间隙距离、燃料类型无关。

#### 关键词
`rotating flame` `Hele-Shaw burner` `micro-combustor` `flame stabilization`

---

### 16. Spatiotemporally Resolved Measurements of Methane Tulip Flames

- **arXiv**: [2604.08027](https://arxiv.org/abs/2604.08027)
- **作者**: Shengkai Wang
- **提交**: 2026-04-09
- **标签**: #tulip flame #PLIF #methane #premixed flame #turbulent combustion

#### 摘要
通过时间同步、双色、 多平面 PLIF 测量获取郁金香火焰形成和演化过程中温度和 OH 浓度的时空分辨 3D 数据集。发现壁面显著热损失产生近似恒压环境。超平衡 OH 分布表明热冷却主导化学反应松弛。

#### 关键词
`tulip flame` `PLIF` `methane/air` `flamefront morphology` `premixed combustion`

---

### 17. Peristaltic Pumping under Poroelastic Confinement

- **arXiv**: [2604.04779](https://arxiv.org/abs/2604.04779)
- **作者**: Avery Trevino
- **提交**: 2026-04-06
- **标签**: #peristaltic flow #poroelastic #low Reynolds number #fluid-structure interaction

#### 摘要
建立孔隙弹性固体约束下蠕动泵的2D模型。上边界为多孔弹性半空间。解析求解（以蠕动振幅为小参数渐近展开）。多孔弹性约束抑制流动（增加黏性耗散），渗透率和滑移与材料刚度相互作用产生正向/反向 Darcy 流。

#### 关键词
`peristaltic pumping` `poroelastic` `low Re flow` `Darcy flow` `fluid-structure interaction`

---

### 18. Efficient Fluid Extraction through Hydraulic Fracture

- **arXiv**: [2604.07485](https://arxiv.org/abs/2604.07485)
- **作者**: Subhadeep Roy
- **提交**: 2026-04-08
- **标签**: #porous media #hydraulic fracture #Darcy flow #capillary #Shannon entropy

#### 摘要
在一维毛细纤维束模型中模拟水力压裂事件。建立渗流率随压力梯度和水力压裂幅值增加的标度律，发现存在最有效压裂最优压力梯度。最大局部流速涨落与 Darcy 转变相关。

#### 关键词
`hydraulic fracture` `capillary bundle` `fluid extraction` `Shannon entropy`

---

### 19. Hydrodynamic Switching Fronts Polarize Deformable Particle Trains

- **arXiv**: [2604.05925](https://arxiv.org/abs/2604.05925)
- **作者**: Zaiyi Shen (cond-mat.soft)
- **提交**: 2026-04-07
- **标签**: #active matter #Poiseuille flow #collective dynamics #polarization #switching front

#### 摘要
在受限的拖鞋形变形粒子列中，传播的切换前缘介导方向状态传输和极性选择。前后不对称性产生方向性耦合，周期性列中前缘粗化→均匀极化；开放长列中形成持久极化域。

#### 关键词
`deformable particles` `Poiseuille flow` `collective polarization` `switching front` `active matter`

---

## 本周趋势分析

### 活跃方向
1. **黏弹性流体**：多篇关于 Oldroyd-B 模型、流变学、液滴撞击（2604.07854, 2604.08413, 2604.07906）
2. **机器学习 + CFD**：PINN/APNN/神经算子成为主流方法论（2604.08002, 2604.06881, 2604.06287）
3. **燃烧与火焰**：氢气火焰稳定性、旋转火焰、郁金香火焰的直接数值模拟（2604.08061, 2604.08035, 2604.08027）
4. **多孔介质 & 通道化**：无序触发的转变和流动不稳定（2604.08025, 2604.07485, 2604.04779）
5. **涡旋动力学**：Torus上的涡旋集群 Hamiltonian 描述（2604.07373）

### 零发现领域
- **SPH** (光滑粒子流体)：本周无相关投稿
- **LBM** (格子玻尔兹曼)：本周无相关投稿
- **直接DNS/LES湍流模拟**：本周无专门针对 RANS/LES/DNS 方法改进的论文

### 值得关注的跨学科方向
- MeanFlow 增强神经算子（2D Kolmogorov 流，即湍流surrogate）
- Asymptotic-Preserving NN 用于血液动力学

---

## 归档信息

- **创建时间**: 2026-04-12
- **数据来源**: arXiv physics.flu-dyn (2026-04-06 ~ 2026-04-10)
- **笔记格式**: Obsidian Markdown
- **同步状态**: 待 Git 同步
