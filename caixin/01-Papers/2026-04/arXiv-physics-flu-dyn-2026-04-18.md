# arXiv Physics.Fluid-Dynamics 日报 — 2026-04-18

> 来源：[arXiv physics.flu-dyn](https://arxiv.org/list/physics.flu-dyn/recent) | 收集时间：2026-04-18 UTC
> 关键词：CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence

---

## 1. Superstatistical Approach to Turbulent Circulation Fluctuations

- **arXiv**: [2604.15277](https://arxiv.org/abs/2604.15277)
- **作者**: Henrique Lima
- **分类**: physics.flu-dyn | cond-mat.stat-mech | physics.comp-ph
- **日期**: 2026-04-16
- **PDF**: [PDF](https://arxiv.org/pdf/2604.15277)

### 摘要
研究湍流循环波动的统计组织，揭示了流动结构的统计几何特征及湍流间歇性。研究发现循环概率分布函数服从超统计量表示（superstatistical representation），即基于"Boltzmann-Gibbs  ensemble"的描述。关键发现：耗散场与携带循环的小尺度涡旋（elementary circulation-carrying structures）空间分布之间存在强相关性。超统计量类的 q-指数（q-exponentials）可准确描述均匀各向同性湍流中的循环统计。

### 核心创新点
- 首次将超统计力学（non-extensive statistical mechanics）应用于湍流循环统计
- 提出基于 q-指数的条件分布（Conditioned Boltzmann-like distributions）
- 建立非加性熵（non-additive entropy）框架下的湍流级联统计结构

### 关联关键词
`湍流` `超统计` `q-指数` `循环波动` `间歇性` `Boltzmann-Gibbs`

---

## 2. Stretching and Lyapunov Exponents of Polymers in Ultra-Dilute Turbulent Solutions

- **arXiv**: [2604.14783](https://arxiv.org/abs/2604.14783)
- **作者**: (Navier-Stokes turbulence system)
- **分类**: physics.flu-dyn
- **日期**: 2026-04-16
- **PDF**: [PDF](https://arxiv.org/pdf/2604.14783)
- **规模**: 45 pages, 20 figures

### 摘要
分析 bead-spring 聚合物与 Navier-Stokes 湍流相互作用下的链拉伸物理及有限时间 Lyapunov 指数，Weissenberg 数 Wi ≈ 80。主要发现：
- 链主要作为物质线元素被拉伸，弹性和排斥体积力产生可测量的偏差
- 链端到端距离呈幂律标度区间
- 聚合物优先选择双轴拉伸区域，达到最大伸长
- 拉伸程度与应变强度直接相关，弛豫事件集中在高涡量区域
- 链与第二应变率特征向量强对齐
- Lagrangian Lyapunov 指数在约 10 个大涡 turnover 时间后趋于同步
- 最大与中间指数正相关，中间与最小指数反相关
- $E[\lambda_2]/E[\lambda_1] \approx 2/7$

### 关联关键词
`Navier-Stokes` `聚合物拉伸` `Lyapunov指数` `湍流` `Lagrangian统计` `涡量`

---

## 3. FISR-EQL: Field Inversion Symbolic Regression with Embedded Equation Learner for Turbulence Model Correction

- **arXiv**: [2604.14569](https://arxiv.org/abs/2604.14569)
- **作者**: Yufei Zhang
- **分类**: physics.flu-dyn
- **日期**: 2026-04-16
- **PDF**: [PDF](https://arxiv.org/pdf/2604.14569)

### 摘要
提出可解释的、物理一致的湍流模型修正框架 **FISR-EQL**，将方程学习（Equation Learning）嵌入基于伴随方法的偏微分方程（PDE）约束场反演过程。不同于传统两阶段方法，修正模型在参数空间中端到端优化，使用 EQL 架构直接识别紧致解析表达式。

### 方法
- 基于伴随方法的场反演（Field Inversion）
- EQL（Equation Learner）架构
- 端到端参数优化
- 训练数据：curved backward-facing step, NASA hump

### 应用验证
- periodic hills
- surface-mounted cube
- 高升力 NLR7301 翼型

### 关联关键词
`湍流建模` `RANS` `SST模型` `伴随方法` `符号回归` `可解释AI` `分离流`

---

## 4. A Discrete Adjoint Gas-Kinetic Scheme for Aerodynamic Shape Optimization in Turbulent Continuum Flows

- **arXiv**: [2604.14567](https://arxiv.org/abs/2604.14567)
- **作者**: Hangkong Wu
- **分类**: physics.flu-dyn
- **日期**: 2026-04-16
- **PDF**: [PDF](https://arxiv.org/pdf/2604.14567)
- **规模**: 38 pages, 39 figures

### 摘要
提出高效精准的离散伴随气体动理学格式（GKS）用于连续流区的敏感性分析和气动外形优化。使用反向模式算法微分（AD）开发伴随求解器，通过前向模式 AD 生成的保对偶线性化 GKS 求解器严格验证。

### 基准测试
1. 涡轮叶片的逆设计
2. 升阻比增强（NACA 0012）
3. 激波强度降低（NACA 0012）

### 湍流模型
- 一方程 Spalart-Allmaras (SA) 模型

### 关联关键词
`气体动理学格式` `GKS` `伴随方法` `气动优化` `Spalart-Allmaras` `算法微分`

---

## 5. Sharp-interface VOF Method for Phase-change Simulations on Unstructured Meshes

- **arXiv**: [2604.14938](https://arxiv.org/abs/2604.14938)
- **作者**: (cross-list from physics.comp-ph)
- **分类**: physics.flu-dyn | physics.comp-ph
- **日期**: 2026-04-17
- **PDF**: [PDF](https://arxiv.org/pdf/2604.14938)

### 摘要
针对非结构化网格提出相变模拟方法，结合代数 VOF（Volume-of-Fluid）技术与几何界面重构。相变速率由重构界面处的局部温度梯度计算，无需经验闭合模型。方法基于标准有限体积框架，可集成到支持任意多面体网格的单元格中心代码中。

### 验证案例
- 一维 Stefan 问题
- 一维 Sucking 问题
- 三维 Scriven 气泡生长（六面体和多面体网格）

### 关联关键词
`VOF` `相变` `非结构化网格` `多面体网格` `界面重构` `Stefan问题`

---

## 6. Learning to Traverse Convective Flows at Moderate to High Rayleigh Numbers

- **arXiv**: [2604.14553](https://arxiv.org/abs/2604.14553)
- **作者**: (Rayleigh-Bénard convection)
- **分类**: physics.flu-dyn
- **日期**: 2026-04-16
- **PDF**: [PDF](https://arxiv.org/pdf/2604.14553)

### 摘要
研究自推动惯性粒子在二维 Rayleigh-Bénard 对流中的导航问题（Pr = 0.71，Γ = 4，Ra = 10^7 ~ 10^11）。使用强化学习（RL）控制器选择推进加速度以实现预定水平位移。发现：中等 Ra 下成功率随 A_max 突然增加；高 Ra 下转变更渐进且移向更大 A_max；成功穿行所需推进能量随 Ra 增加而降低。POD 分析揭示性能差异源于载流重组。

### 关联关键词
`Rayleigh-Bénard对流` `强化学习` `POD` `Rayleigh数` `主动粒子`

---

## 7. Collective Dynamics of Active Suspensions on Curved Viscous Interfaces

- **arXiv**: [2604.14469](https://arxiv.org/abs/2604.14469)
- **分类**: physics.flu-dyn
- **日期**: 2026-04-16
- **PDF**: [PDF](https://arxiv.org/pdf/2604.14469)

### 摘要
研究受限在静止弯曲粘性界面上的自推动粒子悬浮液的集体动力学。使用 Cartan 移动坐标系方法在曲面上制定 Fokker-Planck 方程，耦合体相和表面 Stokes 方程。线性稳定性分析预测有限波长不稳定性，模式选择源于囊泡半径与 Saffman-Delbrück 长度的竞争。

### 关联关键词
`主动粒子` `弯曲界面` `Saffman-Delbrück` `Fokker-Planck` `表面活性应力`

---

## 8. Physics-Informed Spatio-temporal Surrogate (PISTM) — Cross-list from cs.LG

- **arXiv**: [2604.14424](https://arxiv.org/abs/2604.14424)
- **分类**: cs.LG (cross-list physics.flu-dyn)
- **日期**: 2026-04-16
- **PDF**: [PDF](https://arxiv.org/pdf/2604.14424)

### 摘要
提出物理信息时空代理建模框架（PISTM），利用 Koopman 自动编码器结合物理约束，解决多物理模拟计算成本高的问题。

### 关联关键词
`Koopman` `物理信息神经网络` `代理模型` `降阶建模`

---

## 9. Discrete Adjoint GKS — Shape Optimization, Mist Cooling (arXiv:2604.14245)

- **arXiv**: [2604.14245](https://arxiv.org/abs/2604.14245)
- **日期**: 2026-04-16
- **分类**: physics.flu-dyn

### 摘要
研究雾化冷却和空气膜冷却在两相旋转爆震燃烧室（RDC）中的性能，对比纯空气膜冷却、纯雾冷却及混合方案。

### 关联关键词
`旋转爆震燃烧室` `雾化冷却` `膜冷却` `多相流`

---

## 10. Rotating Detonation Engine — DRL Control (arXiv:2604.14398)

- **arXiv**: [2604.14398](https://arxiv.org/abs/2604.14398)
- **日期**: 2026-04-16
- **PDF**: [PDF](https://arxiv.org/pdf/2604.14398)

### 摘要
使用深度强化学习（DRL）控制旋转爆震发动机（RDE）模式转换。通过跟随爆震波模式的移动参考系重构 DRL 问题，实现快爆震传播与慢操作模式动力学的尺度分离。

### 关联关键词
`旋转爆震发动机` `深度强化学习` `模式转换`

---

## 本日关键词覆盖率

| 关键词 | 相关论文 |
|--------|---------|
| CFD | #4, #5, #7 |
| turbulence/湍流 | #1, #2, #3 |
| Navier-Stokes | #2 |
| SPH | — |
| LBM | — |
| vortex method | #1, #2 |
| turbulence modeling | #3 |
| VOF | #5 |
| unstructured mesh | #5 |

> 注：本日 cs.FL 类别（形式语言与自动机理论）与流体力学无直接交集。

---

*🥬 鲜毛肚 — 流体力学专家 Agent | 2026-04-18*
