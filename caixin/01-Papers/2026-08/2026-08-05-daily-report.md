# 流体力学论文日报 | 2026-08-05

> 搜索范围: arXiv physics.flu-dyn (最近3日: Aug 3-5, 2026)
> 关键词: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence

---

## 🥬 每日概览

| 日期 | 论文数 | 重点方向 |
|------|--------|---------|
| 2026-08-05 | 9 | 波流相互作用, SciML, 多相流 |
| 2026-08-04 | 26 | 雾化, 燃烧, 涡晶, 湍流 |
| 2026-08-03 | 15 | 湍流边界层, Leidenfrost, 射流 |

---

## 📄 论文详情

### 1. 2608.03657 — A windy sea surface with Stokes waves
**日期:** 2026-08-05 | **作者:** Nikhil Yewale

**方向:** 非线性波动力学 / 势流

**摘要:** 研究风致重力-毛细波从平滑态到波纹态的转变。通过求解驱动-耗散非线性势流方程，将波（4-13 cm）映射到 Reynolds 数-波能相空间。识别出平滑态与波纹态之间的转变带，发现波陡与 Reynolds 数呈非单调关系。次谐波不稳定性分析揭示最快增长模态在载波交替面加强波纹。

**关键词:** 势流, Stokes 波, 次谐波不稳定性, Reynolds 数, 波陡

**数值方法:**
- 离散化: 非线性势流方程有限差分
- 求解器: 驱动-耗散系统

**创新点:** 首次将波纹态转变带与 Reynolds 数建立定量联系

**链接:** https://arxiv.org/abs/2608.03657

---

### 2. 2608.03438 — Latent Stochastic Differential Equation for Chaotic Systems
**日期:** 2026-08-04 | **作者:** Ismael Zighed

**方向:** 科学机器学习 / 湍流ROM

**摘要:** 提出基于隐空间随机微分方程（SDE）的混沌动力系统概率降阶模型（ROM）。利用非线性自编码器将流场映射到低维表示，时空演化由 SDE 显式控制。漂移项捕捉可预测动力学，扩散项吸收状态依赖随机性。从 DNS 数据学习，生成分形歧管上统计一致的混沌轨迹。

**控制方程:** 
$$d\mathbf{z} = \mathbf{f}(\mathbf{z})dt + \mathbf{g}(\mathbf{z})d\mathbf{W}$$

**关键词:** SDE, DNS, 降阶模型, 混沌吸引子, 自编码器

**数值方法:**
- 离散化: 隐空间 SDE 时间步进
- 求解器: 概率生成模型

**创新点:** 首次将 SDE 基础建模用于高维非线性物理系统的隐空间降阶

**链接:** https://arxiv.org/abs/2608.03438

---

### 3. 2608.03030 — Droplet Size Distributions in Liquid-Jet-in-Crossflow Atomization
**日期:** 2026-08-04 | **作者:** Ashoke De

**方向:** 多相流 / 雾化 / VOF

**摘要:** 研究液射流横向注入（LJICF）的液滴尺寸分布（DSD）。使用可压缩 VOF-Lagrangian 粒子追踪（VOF-LPT）耦合框架模拟初碎和二次雾化过程。分析动量通量比、Weber 数对 Sauter 平均直径（SMD）的影响。对数正态分布和 Rosin-Rammler 分布能有效捕捉液滴尺寸趋势。

**控制方程:**
- 连续相: 可压缩 Navier-Stokes + VOF 界面追踪
- 离散相: Lagrangian 粒子追踪

**关键词:** VOF-LPT, 雾化, SMD, Weber 数, 动量通量比

**数值方法:**
- 离散化: 有限体积法 (FVM)
- 界面追踪: Volume of Fluid
- 求解器: 耦合欧拉-拉格朗日

**创新点:** 揭示了高动量通量比和高 Weber 数导致更细小均匀液滴的机制

**链接:** https://arxiv.org/abs/2608.03030
**期刊:** Physics of Fluids, 2025

---

### 4. 2608.03027 — Flame Dynamics of Air-Diluted Methanol Spray Combustion
**日期:** 2026-08-04 | **作者:** Ashoke De

**方向:** 燃烧 / 多相流 / 旋流

**摘要:** 研究旋流热伴流中空气稀释甲醇喷雾燃烧的火焰动力学。采用欧拉-拉格朗日方法模拟多相流，连续气相用欧拉框架，液相用拉格朗日框架求解。FGM 模型模拟气相反应。旋流数 SN=0.2~3.0，临界旋流数 SN=1.0 处出现最大lift-off高度。

**控制方程:**
- 气相: Navier-Stokes + FGM 化学反应
- 液相: Lagrangian 喷雾追踪

**关键词:** 旋流数, FGM, 喷雾燃烧, lift-off高度, Eulerian-Lagrangian

**数值方法:**
- 离散化: FVM
- 反应模型: Modified Flamelet Generated Manifold (FGM)

**创新点:** 发现临界旋流数 SN=1.0 处的 lift-off 转变机制

**链接:** https://arxiv.org/abs/2608.03027
**期刊:** Application in Energy and Combustion Science, 2025

---

### 5. 2608.02779 — Particle trapping in vortex crystals
**日期:** 2026-08-03 | **作者:** Jean-Régis Angilella

**方向:** 涡流动力学 / 粒子追踪

**摘要:** 研究二维无粘和粘性涡晶中惯性粒子的运动，涡旋放置在正多边形顶点。发现含中心涡旋的晶格中存在额外捕获点，粒子轨迹可逼近用渐近方法描述的极限环。粘度存在时这些新发现的定点暂时持续。中等 Reynolds 数下环形合并形成环形涡层，大 Reynolds 数时成对涡旋合并。

**关键词:** 涡晶, 极限环, 惯性粒子, 涡旋合并, 捕获点

**数值方法:**
- 离散化: 有限差分
- 分析方法: 渐近分析

**创新点:** 发现涡晶中新的固定点及极限环捕获机制

**链接:** https://arxiv.org/abs/2608.02779

---

### 6. 2608.02360 — CFD-Based Pollen Particle Transport
**日期:** 2026-08-03 | **作者:** Talib Dbouk

**方向:** CFD / 颗粒输运 / 空气动力学

**摘要:** 首次使用高级 CFD 模拟评估真实脱水（干燥）花粉颗粒的空气动力拖曳力和对流换热。研究 Re_p ∈ [0.1, 15]，对应风速 0.27-30 km/h。发现干燥花粉颗粒拖曳系数比水合球形颗粒预测值高 8%-15%，Nusselt 数低 5%-15%。

**关键词:** CFD, 花粉脱水, 拖曳系数, Nusselt 数, Lagrangian 追踪

**数值方法:**
- 离散化: 有限体积法
- 边界条件: 真实脱水形态（非球形）

**创新点:** 首次证明传统球形相关性不适用于模拟干燥花粉 Lagrangian 输运和蒸发

**链接:** https://arxiv.org/abs/2608.02360

---

### 7. 2608.02017 — Coherent structure modulation in drag-reduced TBL
**日期:** 2026-08-03 | **作者:** Max Knoop Ir.

**方向:** 湍流 / 减阻 / 壁面控制

**摘要:** 研究方波型展向壁速 forcing 实现的湍流减阻（减阻约38%）。条件平均场分析显示 forcing 在所有情况下抑制近壁喷射，外层扫掠抑制随 λ_x^+ 增强。最优forcing 后出现湍流周期性能量恢复现象，与非常小尺度的增强相关。小尺度猝发频率从近最优到最优后情况增加4倍。

**关键词:** 湍流边界层, 减阻, 展向壁速 forcing, 小尺度猝发, 小波分析

**实验方法:** 粒子追踪测速 (PTV)

**创新点:** 发现最优 forcing 之后小尺度再激活和周期性抑制的循环模式

**链接:** https://arxiv.org/abs/2608.02017

---

### 8. 2608.02003 — Non-linear energy transfer in turbulent boundary layers
**日期:** 2026-08-03 | **作者:** Max Knoop Ir.

**方向:** 湍流 / 能量级串 / PTV

**摘要:** 使用 3D 粒子追踪测速（3D-PTV）计算 Reynolds 应力张量的谱传输。零压梯度 TBL 在 Re_τ=1020 下验证实验框架。首次对非线性传输项进行分量分解，揭示与展向和壁法向对流相关的不同能量传输机制。减阻 TBL 中非线性能量传输被强烈抑制并远离壁面。

**关键词:** 3D-PTV, Reynolds 应力, 非线性能量传输, 湍流边界层, 减阻

**创新点:** 首次对壁湍流中非线性 Reynolds 应力传输进行分量分解

**链接:** https://arxiv.org/abs/2608.02003

---

### 9. 2608.01828 — Leidenfrost droplets: humidity and internal circulation
**日期:** 2026-08-03 | **作者:** Maxim De Wildt

**方向:** 多相流 / 相变 / DNS

**摘要:** 通过直接数值模拟（DNS）分析莱顿弗罗斯特效应的水滴特性，跨越四个数量级的液滴半径。研究发现环境湿度与液滴内部流动的耦合对几何形状和干燥动力学有重要影响。轴对称模型在大液滴时与实验有显著偏差， azimuthal 稳定性分析表明这是轴对称约束导致的。

**关键词:** Leidenfrost 效应, DNS, 蒸发动力学, 轴对称/3D, 环境湿度

**数值方法:**
- 离散化: DNS（直接数值模拟）
- 3D 验证模型

**创新点:** 揭示环境湿度对 Leidenfrost 系统中被低估的影响

**链接:** https://arxiv.org/abs/2608.01828

---

### 10. 2608.01542 — Supersonic jet impingement on concave surfaces
**日期:** 2026-08-03 | **作者:** Hemanth Chandravamsi

**方向:** 航空声学 / 可压缩 LES / 射流

**摘要:** 使用可压缩大涡模拟（LES）、涡面模型和 Powell 反馈回路分析研究超声速射流撞击凹面的气动声学共振。 choke 射流工作于 Ma=1.56, Re=6×10⁴。发现凹面使主频幅度增加高达 23 dB。Powell-Tam 源-传输预算将放大归因于 Mach disk 源幅度增加和上游反馈波更有效返回。

**关键词:** 大涡模拟, 超声速射流, 凹面, screech tones, Powell 反馈回路, LES

**数值方法:**
- 离散化: LES (大涡模拟)
- 涡面模型

**创新点:** 揭示凹面声聚焦增强上游反馈的机制，区分螺旋和轴对称 screech 的不同频率选择机制

**链接:** https://arxiv.org/abs/2608.01542

---

### 11. 2608.01224 — Rarefied Poiseuille flow: scalar relaxation limits
**日期:** 2026-08-02 | **作者:** Ehsan Roohi

**方向:** 稀薄流 / DSMC / 本构模型

**摘要:** 研究压力驱动稀薄 Poiseuille 流中壁法向压力变化的弱效应，这是高阶本构模型的严格检验。非线性耦合本构关系（NCCR）再现其凸拓扑。DSMC 动量预算分析显示非平衡壁法向应力过度支撑压力缺陷，而剪切应力展向传输提供反向修正。

**关键词:** DSMC, 稀薄流, Poiseuille, NCCR, Knudsen 数

**数值方法:**
- 离散化: 直接模拟蒙特卡罗 (DSMC)
- 本构模型: 非线性耦合本构关系 (NCCR)

**创新点:** 发现弱非平衡可观测量的准确性不一定意味着正确的内闭 closure 机制

**链接:** https://arxiv.org/abs/2608.01224

---

### 12. 2608.00856 — PINNs for wall-reactive solute dispersion in shear flows
**日期:** 2026-08-02 | **作者:** (待补充)

**方向:** 科学机器学习 / 输运 / PINN

**摘要:** 提出物理信息神经网络（PINN）框架模拟有界剪切流（Couette, Poiseuille, Couette-Poiseuille）中的壁反应溶质弥散。将对流-扩散方程和 Robin 边界条件嵌入统一损失函数。在 Pe=10 下验证 ADI 有限差分基准。

**控制方程:**
$$\frac{\partial c}{\partial t} + \mathbf{u} \cdot \nabla c = D \nabla^2 c - k(c)$$

**关键词:** PINN, 物理信息神经网络, 剪切流, 反应输运, Robin BC

**数值方法:**
- 框架: Physics-Informed Neural Networks
- 基准验证: ADI 有限差分

**创新点:** 建立 PINN 作为分析剪切流中边界耦合反应输运的可解释无网格工具

**链接:** https://arxiv.org/abs/2608.00856

---

### 13. 2608.00731 — Buoyancy-driven melt rate of vertical ice in seawater
**日期:** 2026-08-01 | **作者:** Emily SC Ching

**方向:** 海洋工程 / 双扩散 / 冰-海水分界面

**摘要:** 提出湍流双扩散对流系统中盐通量和热通量的理论，并扩展到垂直冰面在海水中的浮力驱动融化率理论。理论结果与 DNS 数据和实验室实验测量吻合良好。

**关键词:** 双扩散对流, 冰融化, 浮力驱动, DNS, 热盐通量

**创新点:** 建立冰川冰-海洋界面融化率的解析预测理论

**链接:** https://arxiv.org/abs/2608.00731

---

### 14. 2608.04004 — Polymer localization promotes centre-mode elastic instability
**日期:** 2026-08-04 | **作者:** Jason Ryan Picardo | **交叉列表:** cond-mat.soft

**方向:** 复杂流体 / 弹性不稳定性 / Oldroyd-B

**摘要:** 研究聚合物在基础流中非均匀分布对中心模弹性不稳定性的影响。在 Stokes 极限下对周期性 Kolmogorov 流进行线性稳定性分析，发现聚合物局部化于速度最大处时显著促进中心模失稳。能量分析表明这一失稳源于聚合物浓度梯度产生的弹性反馈力。

**控制方程:** Oldroyd-B 方程

**关键词:** Oldroyd-B, 弹性不稳定性, 聚合物, Weisenberg 数, Kolmogorov 流

**创新点:** 首次揭示聚合物空间非均匀分布对弹性流体不稳定性的决定性影响

**链接:** https://arxiv.org/abs/2608.04004

---

### 15. 2607.29598 — Oscillatory shear flows and a new 2D self-sustaining process
**日期:** 2026-07-31 | **作者:** Rich Kerswell

**方向:** 湍流自维持 / 振荡剪切流

**摘要:** 在振荡空间均匀剪切流中识别新的自维持过程（SSP）。该 SSP 由高能展向不变一维"薄片"和较弱展向相关二维波动组成。薄片的线性不稳定产生波动，非线性自相互作用又强化薄片。线性不稳定源于 lift-up 机制与"推-前"效应的联合作用。

**关键词:** 自维持过程, SSP, 振荡剪切, lift-up 机制, Kelvin 模态

**创新点:** 发现振荡剪切流中二维自维持过程的新形式

**链接:** https://arxiv.org/abs/2607.29598

---

## 🔬 本日技术趋势分析

### 数值方法分布
| 方法 | 论文数 |
|------|--------|
| DNS/LES | 5 |
| VOF-LPT | 2 |
| DSMC | 1 |
| PINN/SciML | 2 |
| 理论/渐近 | 2 |
| 实验(PTV) | 2 |

### 热门方向
1. **SciML for Fluid Dynamics** — SDE隐空间降阶、PINN 正在成为 CFD 数据驱动建模的热门工具
2. **多相流雾化** — VOF-LPT 耦合在 LJICF 喷雾中的应用持续活跃
3. **湍流减阻控制** — 展向壁速 forcing 的小尺度调制机制有新发现
4. **可压缩 LES** — 超声速射流撞击问题的气动声学建模进展

---

## 📁 文件信息
- **采集时间:** 2026-08-05 14:09 UTC
- **来源:** arXiv physics.flu-dyn
- **版本:** v1
- **下一步:** 可针对具体论文深入分析或运行代码复现
