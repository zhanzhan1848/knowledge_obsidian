# arXiv 流体力学论文日报 — 2026-07-04

> 来源: arXiv physics.flu-dyn (最近24小时)
> 关键词: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence
> 生成时间: 2026-07-04 14:08 UTC

---

## 目录

1. [2607.02398](#260702398) — DNS湍流减阻：压电驱动表面变形
2. [2607.02395](#260702395) — 高雷诺数壁面压力方差的内尺度线性贡献
3. [2607.02310](#260702310) — 气液共存Poiseuille流的压降局域化
4. [2607.02246](#260702246) — 滑翔哺乳动物翅膀气动性能CFD分析
5. [2607.01981](#260701981) — 剪切驱动层结湍流的能量转移与间歇性
6. [2607.01662](#260701662) — 主动脉瓣模拟的浸入边界方法对比
7. [2607.01575](#260701575) — 相变不可压缩流的二阶扩散界面IBM
8. [2607.01533](#260701533) — 二维水动力自旋耦合DNS
9. [2607.01380](#260701380) — 粘弹性流体聚合物应力的拉格朗日评估
10. [2607.01207](#260701207) — 初始无旋湍流引力坍缩的涡度产生
11. [2607.01097](#260701097) — 可压缩超音速湍流剪切层DNS
12. [2607.01020](#260701020) — 多孔介质两相流的PICNN物理保持格式
13. [2607.00960](#260700960) — 气泡幕.lock-exchange流的LES
14. [2607.00909](#260700909) — 瞬态热传递的拉格朗日可视化
15. [2607.00821](#260700821) — 超流氦量子涡格上的惯性波与Kelvin波
16. [2607.00199](#260700199) — Boltzmann方程的高阶ALE-DG方法
17. [2607.02203](#260702203) — 可解释算子学习在流场中的应用

---

## 1. 2607.02398 {#260702398}

**Direct numerical simulations of turbulent drag reduction via piezoelectric actuation**

- **arXiv**: [2607.02398](https://arxiv.org/abs/2607.02398)
- **作者**: Amir Amjadimanesh
- **日期**: 2026-07-02
- **分类**: physics.flu-dyn
- **关键词**: DNS, turbulent drag reduction, piezoelectric actuation, channel flow

### 控制方程
- 不可压缩Navier-Stokes方程
- 半通道流，摩擦雷诺数 $Re_\tau = 200$
- 压电致动器产生的表面变形（有限元分析确定）

### 数值方法
- **离散化**: 有限差分/有限元（表面变形）
- **方法**: DNS（直接数值模拟）
- **稳定性**: CFL条件

### 核心发现
- 表面变形产生三种波：行波、混合波、驻波
- 上游波：减阻1.6%
- 下游波：减阻5.4%
- **跨度方向波：减阻27.6%**（最佳）
- 机制：横向剪切破坏近壁湍流再生循环

### 计算成本
- $Re_\tau = 200$
- $f_\mathrm{act} \in [119, 543]$ Hz
- $Q \in [250, 500]$ V

### 评估
✅ **推荐实现** — DNS湍流减阻研究的优秀案例，压电致动具有工程应用价值

---

## 2. 2607.02395 {#260702395}

**An Inner-Scaled Linear Contribution to Wall-Pressure Variance at High Reynolds Number**

- **arXiv**: [2607.02398](https://arxiv.org/abs/2607.02395)
- **作者**: Jonathan Massey
- **日期**: 2026-07-02
- **分类**: physics.flu-dyn
- **关键词**: wall-pressure variance, turbulent boundary layer, inner scaling

### 核心发现
- 壁面压力方差 = 常数偏移 + 对数斜率（关于$Re_\tau$）
- 湍流压力是两类源的Poisson响应：
  1. **线性源**：平均剪切 × 脉动速度梯度
  2. **非线性源**：脉动速度场
- 线性源在$\delta^+ \sim O(10^4)$范围内保持内尺度不变
- 对数增长来自非线性源

### 物理机制
- 近壁平均涡量的耗竭 → 限制线性源
- 同时通过涡拉伸 → 馈给惯性层裂隙 → 增强非线性贡献

### 评估
✅ **推荐关注** — 高雷诺数湍流边界层基础研究，对壁模量建模有参考价值

---

## 3. 2607.02310 {#260702310}

**Pressure-drop localization and momentum insulation in liquid-gas coexistence Poiseuille flow**

- **arXiv**: [2607.02310](https://arxiv.org/abs/2607.02310)
- **作者**: Naoko Nakagawa
- **日期**: 2026-07-02
- **分类**: physics.flu-dyn; cond-mat.stat-mech
- **关键词**: Poiseuille flow, liquid-gas coexistence, pressure-drop localization

### 控制方程
- 体积平均Poiseuille流方程
- Fourier热传导方程
- 粒子守恒 + 能量守恒

### 核心发现
- 识别出极小的无量纲参数 $A^L$ 和 $A^G$（来自微观-宏观长度比平方）
- 弱驱动下：压力差集中在界面区域
- 残余粒子流产生界面冷却效应

### 评估
⚠️ **谨慎** — 多相流基础理论研究，计算方法细节较少

---

## 4. 2607.02246 {#260702246}

**Patagium and tail morphology shape aerodynamic performance and control authority in gliding-mammal-inspired wings**

- **arXiv**: [2607.02246](https://arxiv.org/abs/2607.02246)
- **作者**: Liming Zheng
- **日期**: 2026-07-02
- **分类**: physics.flu-dyn; physics.bio-ph
- **关键词**: CFD, aerodynamic performance, bio-inspired wings, gliding mammal

### 数值方法
- **离散化**: CFD（计算流体力学）
- **方法**: 被动飞行形态数值模拟

### 核心发现
- 翼膜越宽：升力和升力系数越高
- 中间翼膜形态：失速后响应更平滑，阻力更低
- 完整尿翼膜：增强升力和俯仰控制
- 扁平尾：更强的滚转和偏航响应

### 生物启发
- 滑翔哺乳动物（皮翼类）翼膜多样性
- 可变行空中机器人的设计指导

### 评估
✅ **推荐实现** — 生物启发CFD应用，可作为翼型/膜结构CFD分析的参考

---

## 5. 2607.01981 {#260701981}

**Energy transfer, Intermittency and Mixing in Shear-Driven Stratified Turbulence**

- **arXiv**: [2607.01981](https://arxiv.org/abs/2607.01981)
- **作者**: Chandra Shekhar Lohani
- **日期**: 2026-07-02
- **分类**: physics.flu-dyn; nlin.CD
- **关键词**: DNS, stratified turbulence, Kelvin-Helmholtz, mixing, Froude number

### 控制方程
- 确定性Kolmogorov驱动的稳定层结流
- 参数：Froude数 $Fr$ 表征层结强度

### 核心发现
随$Fr$降低，出现三种 regime：
1. **强层结 regime**：浮力主导
2. **中间 regime**：Kelvin-Helmholtz不稳定性 + 增强混合
3. **近各向同性湍流 regime**

关键现象：
- 垂直剪切水平流 (VSHFs) 的出现
- 垂直速度呈非高斯分布，峰度增大
- 基于能量学的混合系数 $\sim 10^{-1}$

### 数值方法
- **方法**: DNS
- **谱能量转移**: 主要为正（forward），但垂直通量在较大水平尺度上变为负

### 评估
✅ **推荐实现** — 层结湍流DNS研究的完整案例，对混合参数化有参考价值

---

## 6. 2607.01662 {#260701662}

**Comparative analysis of resistive immersed surface and immersed boundary methods for aortic valve simulation**

- **arXiv**: [2607.01662](https://arxiv.org/abs/2607.01662)
- **作者**: Han Zhao
- **日期**: 2026-07-02
- **分类**: physics.flu-dyn; math.NA
- **关键词**: Immersed Boundary Method, Resistive Immersed Surface, FSI, aortic valve

### 数值方法对比

| 特性 | RIS方法 | IB方法 |
|------|---------|--------|
| 瓣叶建模 | 指定运动学（惩罚力） | 弹性结构（全耦合FSI） |
| 计算成本 | 降低约60% | 高 |
| 压差误差 | <15%（可降至5%） | 基准 |
| 流场结构 | 捕获大尺度 | 完全耦合 |

### 核心发现
- RIS方法在有代表性瓣叶运动学时提供有用的血流动力学预测
- IB方法通过全耦合两路FSI解析瓣叶变形
- 匹配入口边界条件后，RIS误差降至5%以内

### 软件
- RIS: SimVascular svMultiPhysics
- IB: IBAMR

### 评估
✅ **推荐实现** — 沉浸方法对比研究详尽，对FSI方法选择有重要参考价值

---

## 7. 2607.01575 {#260701575}

**A second-order diffusive-interface immersed boundary method for incompressible flow with phase change and moving interfaces**

- **arXiv**: [2607.01575](https://arxiv.org/abs/2607.01575)
- **作者**: Wenyuan Chen
- **日期**: 2026-07-02
- **分类**: physics.flu-dyn
- **关键词**: diffusive-interface IBM, phase change, second-order accuracy, boiling

### 核心问题
传统扩散界面IBM在相变边界附近精度降为**一阶**

### 解决方案
- **平滑延拓策略**：将标量场外推穿越界面
- 保持速度场的标准扩散界面处理
- 速度场保持标准扩散界面处理，仅对标量输运方程应用平滑延拓

### 验证
- 一维蒸发和沸腾问题
- 各向同性自推进粒子自推进运动

### 评估
✅ **推荐实现** — 扩散界面方法精度恢复的创新方案，相变多相流CFD的实用方法

---

## 8. 2607.01533 {#260701533}

**Two-dimensional simulations of hydrodynamic spin coupling in a two-rotor corral**

- **arXiv**: [2607.01533](https://arxiv.org/abs/2607.01533)
- **作者**: Tsorng-Whay Pan
- **日期**: 2026-07-01
- **分类**: physics.flu-dyn
- **关键词**: DNS, 2D flow, hydrodynamic spin coupling, gear ratio

### 控制方程
- 2D不可压缩粘性流体N-S方程
- DLM/FD方法（双层方法/有限差分）

### 核心发现
- **齿轮比** $\Gamma = \omega / \Omega$ 区分共旋和反旋
- 捕获间隙路径（gap route）：反旋带 → 共旋转变
- 齿轮比量级 $10^{-2}$
- 在$Re=44$处出现重入（reentrant）结构

### 评估
⚠️ **谨慎** — 2D流动，实用价值有限，但涡旋动力学机制有参考意义

---

## 9. 2607.01380 {#260701380}

**Lagrangian evaluation of polymeric stress in viscoelastic fluids**

- **arXiv**: [2607.01380](https://arxiv.org/abs/2607.01380)
- **作者**: Mohammad Majidi
- **日期**: 2026-07-01
- **分类**: physics.flu-dyn
- **关键词**: Lagrangian method, polymeric stress, viscoelastic, FENE-P, Oldroyd-B

### 核心创新
- **拉格朗日积分格式**：从流体微团轨迹重建聚合物应力场
- 避免求解完整的Eulerian本构输运方程

### 模型
- 非线性FENE-P模型
- Oldroyd-B模型（参考）

### 验证
- 圆孔道流绕圆障碍物的速度场（来自数值模拟和微流控实验）
- 可直接从实验速度场量化应力场

### 评估
✅ **推荐实现** — 拉格朗日方法在粘弹性流体中的创新应用，实验-数值桥梁

---

## 10. 2607.01207 {#260701207}

**No evidence of vorticity production from initially irrotational turbulent gravitational collapse**

- **arXiv**: 2607.01207
- **作者**: Axel Brandenburg
- **日期**: 2026-07-01
- **分类**: physics.flu-dyn; astro-ph.CO; astro-ph.GA
- **关键词**: DNS, gravitational collapse, vorticity production, turbulence

### 核心发现
- 引力坍缩产生大量动能，可种子湍流
- 小尺度发电机需要涡旋湍流，但坍缩主要产生**无旋运动**
- DNS显示：涡度产生**与初始无旋湍流相关**，而非坍缩流本身
- 压力和密度梯度平行（barotropic EoS），涡度只能由粘性产生

### 评估
⚠️ **谨慎** — 天体物理背景，但DNS方法对涡度产生机制有通用参考价值

---

## 11. 2607.01097 {#260701097}

**Numerical Study of Compressibility and Velocity Parameter Effects on Spatially Evolving Supersonic Turbulent Shear Layers**

- **arXiv**: 2607.01097
- **作者**: Muhammad Rubayat Bin Shahadat
- **日期**: 2026-07-01
- **分类**: physics.flu-dyn
- **关键词**: DNS, supersonic turbulent shear layer, compressibility, convective Mach number

### 控制方程
- 可压缩Navier-Stokes方程（超声速）
- 参数：$M_c$（对流马赫数），$\lambda$（速度参数）

### 核心发现
- 所有情况在远下游都达到自相似
- 识别自相似区域的方法：
  - 归一化平均流向速度塌陷
  - 归一化Reynolds应力峰值恒定
  - 剪切层厚度和动量厚度的线性增长率
- 建立了包含可压缩性和中心线偏移的自相似方程

### 卷吸比
- 随$M_c$和$\lambda$增加
- 有利于高速侧的过量卷吸

### 评估
✅ **推荐实现** — 可压缩湍流剪切层DNS的完整研究，对超声速CFD有参考价值

---

## 12. 2607.01020 {#260701020}

**The PICNN-Assisted Physics-Preserving Scheme for Thermodynamically Consistent Two-Phase Flow in Porous Media**

- **arXiv**: 2607.01020
- **作者**: Xue Wang
- **日期**: 2026-07-01
- **分类**: physics.flu-dyn; math.NA
- **关键词**: PICNN, two-phase flow, porous media, physics-preserving, finite volume

### 核心方法
- **PICNN**：物理信息卷积神经网络
- 预测-校正格式：Li et al. 2025的物理保持方法
- 预测步骤由PICNN执行，使用有限体积残差训练
- 界面通量由TPFA（两点通量近似）计算

### 性质保证
- 能量稳定
- 质量守恒
- 边界保持

### 优势
- 相比传统PINN，更好地捕获局部空间相互作用
- 适应不连续渗透率场和界面通量连续性

### 评估
✅ **推荐实现** — PINN在多孔介质两相流中的创新应用，物理保持格式有价值

---

## 13. 2607.00960 {#260700960}

**Lock-exchange flow regimes under low air Froude number bubble curtains**

- **arXiv**: 2607.00960
- **作者**: Matias Duran-Matute
- **日期**: 2026-07-01
- **分类**: physics.flu-dyn
- **关键词**: LES, lock-exchange flow, bubble curtain, gravity current

### 数值方法
- **大涡模拟 (LES)**
- 两相（空气-水）模拟

### 核心发现
- 在"突破regime"内识别出三种**子regime**
- 决定因素：
  - **空气Froude数**：气泡幕与重力流的相对强度
  - **密度比**：盐水与淡水（对气泡幕有效性有重要影响）

### 应用
- 船闸中气泡幕的优化设计

### 评估
✅ **推荐实现** — 两相LES在环境流体力学中的应用，气泡幕工程设计参考

---

## 14. 2607.00909 {#260700909}

**Visualizing Lagrangian Heat Transport Paths and Density Structures in Unsteady Heat Transfer**

- **arXiv**: 2607.00909
- **作者**: Besm Osman
- **日期**: 2026-07-01
- **分类**: physics.flu-dyn; cs.GR
- **关键词**: Lagrangian visualization, heat transport, finite-time Lyapunov, coherent structures

### 核心方法
- **基于粒子的可视化技术**：沿时间重参数化时空公式对流无质量粒子
- 积累路径贡献以揭示相干传输路径
- 识别有限时间吸引和排斥结构

### 优势
- 揭示Eulerian视角无法显示的相干结构和传输路径
- 解决热传递的非周期性和非保守性挑战

### 应用
-  IEEE VIS 2026短文（已接收）

### 评估
✅ **推荐关注** — 拉格朗日输运可视化的创新方法，热传递研究的新视角

---

## 15. 2607.00821 {#260700821}

**Visualization of Inertial and Kelvin Waves on the Quantum Vortex Lattice in Superfluid Helium**

- **arXiv**: 2607.00821
- **作者**: Florian Lorin
- **日期**: 2026-07-01
- **分类**: physics.flu-dyn
- **关键词**: quantum vortex, Kelvin waves, inertial waves, superfluid helium

### 核心发现
- 超流$^4$He在稳定旋转下形成规则量子涡旋阵列
- 低于两倍旋转率：连续频谱惯性波
- 高于两倍旋转率：Kelvin波湍流级联的证据
- 直接观测量子涡旋系统中集体动力学的实验方法

### 评估
⚠️ **谨慎** — 量子流体专项，对经典流体直接参考有限

---

## 16. 2607.00199 {#260700199}

**A High-Order Arbitrary Lagrangian-Eulerian Discontinuous Galerkin Method for the Boltzmann Equation in Nearly Incompressible Flows**

- **arXiv**: 2607.00199
- **作者**: Atakan Aygun
- **日期**: 2026-06-30
- **分类**: physics.flu-dyn; physics.comp-ph
- **关键词**: ALE-DG, Boltzmann equation, moving boundaries, GPU, incompressible flow

### 数值方法
- **ALE格式**：将连续Boltzmann方程映射到参考系
- **空间离散**：非结构网格上的间断Galerkin方法
- **时间离散**：半解析Runge-Kutta
- **GPU加速**：libParanumal内核库

### 验证案例
- 自由流保持
- 移动Taylor-Green涡

### 应用
- 二维俯冲对称翼型
- 三维运动鱼（carangiform）
- 完美匹配层 (PML)

### 评估
✅ **推荐实现** — 高阶ALE-DG方法的完整实现，动边界问题的可靠方案

---

## 17. 2607.02203 {#260702203}

**Self-explainable Operator Learning for Discovering Spatial Patterns in Functional Data**

- **arXiv**: 2607.02203
- **作者**: Amirhossein Arzani
- **日期**: 2026-07-02
- **分类**: cs.LG; physics.flu-dyn
- **关键词**: operator learning, explainable AI, physics, fluid flow, interpretability

### 核心创新
- **自解释算子学习框架**：将算子学习重新表述为广义泛函线性模型的线性组合
- 通过积分方程表达
- 可加性分解：划分输入域为子域，计算局部积分
- **内置可解释性**：无需外部事后解释工具

### 应用
- 血流功能映射（血液流动）
- 非稳态空气动力学

### 核心发现
- 算子最优先关注强特征梯度区域
- 提供物理上有意义的洞察

### 评估
✅ **推荐关注** — 可解释AI在流体力学中的重要进展，对数据驱动CFD有指导意义

---

## 统计摘要

| 类型 | 数量 |
|------|------|
| DNS类论文 | 9 |
| 湍流相关 | 6 |
| 多相流/相变 | 4 |
| 沉浸方法/IBM | 3 |
| 机器学习+CFD | 2 |
| 涡旋动力学 | 2 |
| 可压缩流 | 1 |

---

*由 鲜毛肚 (Xianmaodu) 自动生成于 2026-07-04 14:08 UTC*
