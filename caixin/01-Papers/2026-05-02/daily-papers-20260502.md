# 流体力学论文日报 — 2026-05-02

> 收集范围：arXiv physics.flu-dyn（最近48小时内）
> 生成时间：2026-05-02 14:13 UTC

---

## 1. Mixture-aware closure of the N-phase Navier--Stokes--Cahn--Hilliard mixture model

| 属性 | 值 |
|------|-----|
| **arXiv** | [2604.27999](https://arxiv.org/abs/2604.27999) |
| **作者** | Marco ten Eikelder |
| **提交** | 2026-04-30 |
| **关键词** | multiphase flow, phase-field, Cahn-Hilliard, Navier-Stokes, N-phase mixture, thermodynamic consistency |
| **PDF** | [pdf](https://arxiv.org/pdf/2604.27999) |

### 核心创新
- 针对 N 相 Navier-Stokes-Cahn-Hilliard 混合模型的热力学一致闭合问题
- 提出**混合感知（mixture-aware）**构架：物理上相同的相可以合并而不改变控制方程
- 在一组结构公理下，PDE 层面归约一致性唯一确定了 admissible free-energy 结构：
  - ideal-mixing 项
  - 对称 mean-field interaction 项
  - 常系数二次梯度惩罚项
- Onsager mobility matrix 约束为**成对交换（pairwise-exchange）**形式，volume fractions 双线性简并

### 控制方程要点
- Free energy: $F = \sum_i \phi_i \log \phi_i + \sum_{i<j} \alpha_{ij} \phi_i \phi_j + \sum_i \gamma_i |\nabla \phi_i|^2$
- Mobility: $M_{ij} = \phi_i \phi_j \sum_k \beta_{ik} \phi_k$（Maxwell-Stefan 类型）

### 数值方法
- 多相流计算框架
- 验证了 mixture-aware reduction 性质

### 关联领域
[[multiphase flow]] [[phase-field]] [[Cahn-Hilliard]] [[Navier-Stokes]] [[thermodynamic consistency]]

---

## 2. Mixing and spreading of gravity currents in heterogeneous porous media

| 属性 | 值 |
|------|-----|
| **arXiv** | [2604.27827](https://arxiv.org/abs/2604.27827) |
| **作者** | Juan J. Hidalgo |
| **提交** | 2026-04-30 |
| **关键词** | gravity current, porous media, heterogeneity, convection, dissolution |
| **PDF** | [pdf](https://arxiv.org/pdf/2604.27827) |

### 核心创新
- 高保真数值模拟研究异质多孔介质中重力流的混合、迁移和扩散
- 异质性用**对数正态渗透率场**表示，变化相关长度和方差
- 稳定和不稳定密度分层：通过线性和非单调密度定律

### 主要发现
1. 异质性**降低溶解度**、**提高**重力流速度（与 Rayleigh 数成正比）
2. 不稳定情况：异质性加速对流 onset
3. 对流驱动的溶解**减缓**重力流并抵消异质性的分散效应
4. 渗透率各向异性**降低溶解度**（低渗透区屏障效应）
5. 对数渗透率场方差**增强溶解度**
6. 存在最佳相互作用：不稳定尺寸、渗透率相关长度、分散/屏障效应的交互

### 关联领域
[[gravity current]] [[porous media]] [[convection]] [[heterogeneity]] [[dissolution]]

---

## 3. Cahn-Hilliard Phase Field modelling captures nanoscale contact line dynamics on high-friction surfaces

| 属性 | 值 |
|------|-----|
| **arXiv** | [2604.27687](https://arxiv.org/abs/2604.27687) |
| **作者** | Michele Pellegrino |
| **提交** | 2026-04-30 |
| **关键词** | contact line, phase-field, molecular dynamics, wetting, high-friction surfaces |
| **PDF** | [pdf](https://arxiv.org/pdf/2604.27687) |

### 核心创新
- 将分子动力学（MD）模拟与 **Cahn-Hilliard Navier-Stokes 相场模型** 连接
- 研究高摩擦表面上润湿动力学中的接触线运动
- 通过系统性校准协议，直接从 MD 结果参数化连续方程

### 关键发现
- **接触线摩擦**是唯一需要基于 MD 数据经验校准的参数
- 接触角动力学匹配后，可在多个可观测量（界面曲率、稳态接触线位移、流线结构）上获得定量一致
- 其他模型参数从独立可观测量计算和数值约束确定

### 方法论
1. water/hexane 双相系统在 silica-like 表面上的 Couette 流配置
2. 可控润湿性
3. 数值 sharp interface 极限下的参数化

### 关联领域
[[contact line]] [[phase-field]] [[molecular dynamics]] [[wetting]] [[contact line friction]]

---

## 4. To stall-cell or not to stall-cell: Variational data assimilation of 3D mean flow past a stalled airfoil

| 属性 | 值 |
|------|-----|
| **arXiv** | [2604.27680](https://arxiv.org/abs/2604.27680) |
| **作者** | Uttam Cadambi Padmanaban |
| **提交** | 2026-04-30 |
| **关键词** | stall cell, 3DVar, data assimilation, PIV, RANS, turbulent flow, airfoil |
| **PDF** | [pdf](https://arxiv.org/pdf/2604.27680) |

### 核心创新
- 从稀疏实验测量重建 3D 湍流全场
- 针对**失速格（stall cells）**——后失速条件下翼型吸力面上形成的径向相干结构
- 实验：NACA 0012 翼型 $Re_c \approx 450{,}000$，$\alpha = 14°$，四平面 2C-PIV

### 方法
- **3DVar 数据同化** within field inversion framework
- 结合稀疏平面测量与 Spalart-Allmaras RANS 湍流模型

### 关键发现
1. **单平面稀疏实验数据**足以恢复失速格的基本特征
2. 最低重建误差来自两平面数据（相邻但分离程度明显不同）
3. 可恢复 focal points 周围的**反向旋转涡旋**

### 关联领域
[[stall cell]] [[data assimilation]] [[PIV]] [[RANS]] [[airfoil]] [[turbulent separation]]

---

## 5. Asymmetric freezing of a sliding droplet on an inclined surface

| 属性 | 值 |
|------|-----|
| **arXiv** | [2604.27388](https://arxiv.org/abs/2604.27388) |
| **作者** | Kirti Chandra Sahu Prof. |
| **提交** | 2026-04-30 |
| **关键词** | droplet freezing, sliding, ice cusp, lubrication approximation, contact angle hysteresis |
| **PDF** | [pdf](https://arxiv.org/pdf/2604.27388) |

### 核心创新
- 数值模拟研究倾斜冷表面上滑动液滴的非对称冻结
- 基于润滑近似（Lubrication approximation）
- 综合重力、毛细力和凝固动力学

### 关键发现
1. 滑动先于冻结并在其早期阶段起主导作用
2. **倾斜冰锥**形成于液滴前端（重力与毛细阻力竞争）
3. 更大的倾角和润湿性增强形态不对称性
4. 高润湿性基底有利于毛细驱动的回缩
5. **接触角滞后**演化强调早期时间动力学的重要性
6. Stefan 数增加加速冻结，限制滑动诱导变形，减少冰锥角

### 关联领域
[[droplet]] [[freezing]] [[sliding]] [[lubrication theory]] [[contact angle hysteresis]]

---

## 6. Training of particle-turbulence sub-grid-scale closures with just particle data

| 属性 | 值 |
|------|-----|
| **arXiv** | [2604.27255](https://arxiv.org/abs/2604.27255) |
| **作者** | German Saltar Rivera |
| **提交** | 2026-04-29 |
| **关键词** | particle-turbulence, sub-grid-scale, neural network, LES, Lagrangian, closure |
| **PDF** | [pdf](https://arxiv.org/pdf/2604.27255) |

### 核心创新
- 神经网络学习粒子-湍流亚网格尺度闭合
- 只需**粒子数据**（不需要流场数据）
- 完整物理作为约束（discretized 方程）

### 关键发现
1. 全时空数据训练反而**降低**模型效果
2. 仅针对能谱的训练（忽略相位信息）效果更好
3. **Langevin-type 闭合**可纠正优先浓度误差
4. 仅用**粒子动能**训练，无需流场直接输入，同样有效
5. 即使添加噪声、亚采样粒子或仅用一个速度分量，结果依然有效

### 系统配置
- 2D湍流中双向耦合粒子
- well-resolved 模拟构建训练数据
- 故意降级以评估稳健性

### 关联领域
[[particle-turbulence]] [[sub-grid-scale]] [[neural network]] [[LES]] [[Lagrangian]]

---

## 7. Hybrid Fourier Neural Operator-Lattice Boltzmann Method (FNO-LBM)

| 属性 | 值 |
|------|-----|
| **arXiv** | [2604.27158](https://arxiv.org/abs/2604.27158) |
| **作者** | Josef Winter |
| **提交** | 2026-04-29 |
| **关键词** | LBM, Fourier Neural Operator, hybrid CFD, speed-up, porous media, surrogate model |
| **PDF** | [pdf](https://arxiv.org/pdf/2604.27158) |

### 核心创新
- **FNO-LBM 混合框架**：Fourier Neural Operator + Lattice Boltzmann Method
- 加速计算流体力学（弱可压流动）

### 性能提升
- FNO 初始化加速 LBM 达到多孔介质流动稳态
- **收敛密度提升 70%**，压降降低 40%+
- 非稳态流动通过 super-time-stepping 策略加速
- 混合耦合：96-99.8% 误差降低

### 模型规格
- 轻量级 2.6M 参数 FNO（与大 11.2M 模型表现相当）
- 混合耦合比纯自回归 rollout 更稳定

### 关联领域
[[LBM]] [[Fourier Neural Operator]] [[hybrid method]] [[CFD acceleration]] [[porous media]]

---

## 8. Compressible Navier--Stokes Flow in Schrödinger-Type Variables

| 属性 | 值 |
|------|-----|
| **arXiv** | [2604.27088](https://arxiv.org/abs/2604.27088) |
| **作者** | James Beattie |
| **提交** | 2026-04-29 |
| **关键词** | Cole-Hopf, compressible NS, Schrödinger variables, helmholtz decomposition, quantum algorithm |
| **PDF** | [pdf](https://arxiv.org/pdf/2604.27088) |

### 核心创新
- **首个精确的 Cole-Hopf 型可压 Navier-Stokes Schrödiner 变量 reformulation**
- 2D：Helmholtz 分解分离速度为压缩和涡旋势， 对数变换得到两个标量虚时间 Schrödiner 型方程

### 数学结构
- 混合密度-压缩振幅 $\Psi_\alpha = \rho^\alpha \Theta^{1-2\alpha}$ 满足非线性 Schrödiner 型方程
- 方程是虚时间热/漂移-扩散方程（非幺正）
- 精确等价于可压 NS（仅通过 Helmholtz 和 Poisson 投影非局部）

### 验证
- Kelvin-Helmholtz 不稳定剪切层计算验证

### 应用前景
- 约化流动描述
- 量子算法（算子演化、PDE 求解器）

### 关联领域
[[Cole-Hopf]] [[compressible NS]] [[Schrödinger variables]] [[Helmholtz decomposition]] [[quantum computing]]

---

## 9. Beyond first-order accuracy in continuous-forcing immersed boundary methods

| 属性 | 值 |
|------|-----|
| **arXiv** | [2604.28152](https://arxiv.org/abs/2604.28152) |
| **作者** | Diederik Beckers |
| **提交** | 2026-04-30 |
| **关键词** | immersed boundary, high-order accuracy, continuous-forcing, projection method, well-conditioned |
| **PDF** | [pdf](https://arxiv.org/pdf/2604.28152) |

### 核心创新
- 超越一阶精度的沉浸边界（IB）方法
- 使用**平滑指示器（Heaviside）函数**
- 将 IB 解视为不同 interior 和 exterior 场的合成

### 关键发现
1. 之前方法忽略了一些限制精度到一阶的项
2. 补全这些项系统性地提高精度
3. 泊松问题经验二阶收敛
4. NS 模拟接近二阶性能
5. 投影求解自然减轻虚假表面应力并减少几何分辨率敏感性

### 技术贡献
- 高阶精度框架（不依赖启发式校正）
- 解决条件数和精度问题的统一方法

### 关联领域
[[immersed boundary]] [[high-order accuracy]] [[projection method]] [[CFD]] [[numerical methods]]

---

## 10. Propulsion and far-field hydrodynamics of linked-sphere microswimmers with viscoelastic deformability

| 属性 | 值 |
|------|-----|
| **arXiv** | [2604.27348](https://arxiv.org/abs/2604.27348) |
| **作者** | Akash Choudhary |
| **提交** | 2026-04-30 |
| **关键词** | microswimmer, viscoelasticity, propulsion, Kelvin-Voigt, far-field hydrodynamics, reciprocal actuation |
| **PDF** | [pdf](https://arxiv.org/pdf/2604.27348) |

### 核心创新
- 研究**粘弹性可变形**微泳体的动力学
- 两种设计：3-sphere（端部驱动）和 4-sphere（中点驱动）
- Kelvin-Voigt 可变形性模型

### 关键发现
1. **3-sphere 泳体**：存在最优驱动频率
2. **4-sphere 泳体**：临界频率导致运动方向反转
3. 远场流场：主导偶极子和四极子贡献，其量级对驱动段相对长度敏感

### 关联领域
[[microswimmer]] [[viscoelasticity]] [[propulsion]] [[Kelvin-Voigt]] [[far-field hydrodynamics]]

---

## 11. Turbulence and Star Formation Suppression in Elliptical Galaxies: The Role of AGN Jet Wind Interaction

| 属性 | 值 |
|------|-----|
| **arXiv** | [2604.27301](https://arxiv.org/abs/2604.27301) |
| **作者** | Minhang Guo |
| **提交** | 2026-04-30 |
| **关键词** | AGN feedback, turbulence, jet, wind, elliptical galaxy, star formation, Kelvin-Helmholtz |
| **PDF** | [pdf](https://arxiv.org/pdf/2604.27301) |

### 核心创新
- 同时考虑 jets 和 winds 的 AGN 反馈模拟
- 解析 Bondi 半径
- 使用 GRMHD 模拟参数

### 主要发现
1. 有效 AGN 反馈（产生强湍流、抑制冷气体凝结和恒星形成）**仅在 jets 和 winds 同时运行**时发生
2. 物理机制：jet-wind 相互作用在界面产生强剪切 → Kelvin-Helmholtz 不稳定 → 湍流
3. 单独 jets 或 winds 无法产生强湍流
4. 湍流主要是** solenoidal** 性质
5. 能量谱近似 Kolmogorov 幂律
6. 耗散率 $\sim 10^{-27}$ erg cm$^{-3}$ s$^{-1}$，与观测一致

### 关联领域
[[AGN feedback]] [[turbulence]] [[galaxy]] [[jet]] [[wind]] [[Kelvin-Helmholtz]]

---

## 统计摘要

| 类别 | 数量 |
|------|------|
| 多相流 / 相场 | 3 |
| 湍流建模 / LES | 2 |
| 高阶数值方法 | 2 |
| 可压流 / 基础理论 | 2 |
| 微流控 / 生物流 | 1 |
| 天体流 | 1 |

---

*由 鲜毛肚 (Xianmaodu) 自动收集整理 | 2026-05-02*