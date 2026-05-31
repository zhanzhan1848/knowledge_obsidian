# 每日 arXiv 论文摘要 — 2026-05-31

> 搜索范围：arXiv physics.flu-dyn (2026-05-26 至 2026-05-31)  
> 关键词：CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence

---

## 1. SLBM 耗散与色散分析（重要 — LBM 方法）

**arXiv:2605.29887**  
**标题：** Revisit the simplified lattice Boltzmann method: dissipation, dispersion and stability  
**作者：** Zhen Chen  
**日期：** 2026-05-28  
**分类：** physics.flu-dyn  
**链接：** https://arxiv.org/abs/2605.29887

### 摘要
SLBM (Simplified LBM) 是近年 LBM 领域的重要进展，直接演化宏观量而非传统分布函数，高 Re 数下保持数值稳定。但 SLBM 的数值耗散与色散特性缺乏理论分析，稳定性的物理根源不明。本文建立广义 formulation，揭示 SLBM 恢复的修正宏观方程同时包含内禀物理偏差和数值截断误差。提出 reformulated SLBM：以标准 BGK-LBM 推导的宏观方程为参考模型，用 predictor-corrector 策略求解。线性波分析阐明各参数在控制数值耗散和色散中的作用。方法保留二阶精度，改善色散耗散性能，增强数值稳定性，在较粗网格上解析精细涡结构。

### 创新点
- 广义 SLBM formulation，揭示误差来源
- Predictor-corrector 重构策略
- 线性波分析量化数值耗散/色散
- 高 Re 数稳定求解

### 数值方法
- 格子玻尔兹曼 (LBM / SLBM)
- BGK 碰撞模型
- Predictor-corrector 策略
- 有限差分离散

### 关键词
`LBM` `SLBM` `数值稳定性` `耗散` `色散` `高雷诺数`

---

## 2. DG SEM 高阶可压缩流框架（重要 — 高性能 CFD）

**arXiv:2605.28627**  
**标题：** An Architecture-Agnostic High-Order Discontinuous Galerkin Framework for Compressible Flows  
**日期：** 2026-05-28  
**分类：** physics.flu-dyn  
**链接：** https://arxiv.org/abs/2605.28627

### 摘要
GPU异构超算时代，高阶 CFD 迎来机遇。本文提出 GALÆXI——GPU加速的间断 Galerkin 谱元法 (DGSEM)框架，支持 NVIDIA CUDA 和 AMD HIP，架构无关。方法验证使用manufactured solutions，确认收敛阶数。Taylor-Green-Vortex 可压缩流模拟与参考解一致。GPU 并行扩展性：强扩展至 4 APUs，弱扩展至 512 APUs（共 4096³ cells）。GPU 相比 CPU 加速7.75x–8.08x，能耗不到一半。展示：NACA 64A-110 和 ONERA OAT15A 翼型激波 buffet 的壁面解析大涡模拟 (WRLES)。

### 创新点
- CUDA/HIP 双架构支持
- 67.1 亿自由度规模
- 82.6% 并行效率
- WRLES 激波 buffet 模拟

### 数值方法
- 间断 Galerkin 谱元法 (DGSEM)
- 高阶 (high-order)
- GPU 并行 (CUDA/HIP)
- 可压缩 N-S 方程
- 大涡模拟 (LES)

### 关键词
`DGSEM` `GPU加速` `高性能计算` `可压缩流` `LES` `异构计算`

---

## 3. 简化 LBM 各向异性平衡分布（新 — LBM 理论）

**arXiv:2605.27004**  
**标题：** Lattice Boltzmann Methods with Anisotropic Equilibrium Distributions  
**日期：** 2026-05-27  
**分类：** physics.flu-dyn  
**链接：** https://arxiv.org/abs/2605.27004

### 摘要
LBM 通常在各向同性假设下推导。本文提出各向异性 LBM，从各向异性平衡分布出发完整推导。Chapman-Enskog 分析确认单松弛时间碰撞算子可正确重现宏观行为。结果显示：适当离散的各向异性 Maxwell-Boltzmann 平衡在宏观上确实导致各向异性 Navier-Stokes 方程变体。保留 LBM 所有特性（碰撞局部性、离散空间速度各向同性、质量动量守恒）。方法可推广至平流扩散问题。

### 创新点
- 各向异性平衡分布推导 LBM
- Chapman-Enskog 分析
- 保留标准 LBM 特性
- 平流扩散问题适用

### 数值方法
- 格子玻尔兹曼 (LBM)
- 各向异性平衡分布
- Chapman-Enskog 分析
- BGK 碰撞

### 关键词
`LBM` `各向异性` `Chapman-Enskog` `守恒性`

---

## 4. 向量式 LBM 有限应变超弹性（新 —固体力学与 LBM）

**arXiv:2605.26677**  
**标题：** A total-Lagrangian vectorial lattice Boltzmann method for finite-strain hyperelastic dynamics  
**日期：** 2026-05-27  
**分类：** physics.flu-dyn  
**链接：** https://arxiv.org/abs/2605.26677

### 摘要
受线性 elastodynamics 向量式 LBM 启发，构建二维有限应变超弹性动力学的全拉格朗日向量式 LBM 公式。控制方程写为材料速度和完整变形梯度的守恒一阶系统。D2Q4 模板，六分量向量分布。局部碰撞-流动结构保留，自适应接触线追踪。二阶 population初始化，梯形中心体力，位移重建，速度 Dirichlet/Neumann 边界。

### 创新点
- 全拉格朗日框架
- 变形梯度完整演化
- 接触线自适应追踪
- 半步重建边界条件

### 数值方法
- 向量式 LBM
- 全拉格朗日公式
- 有限应变超弹性
- D2Q4 模板

### 关键词
`向量式LBM` `超弹性` `有限应变` `全拉格朗日` `固体力学`

---

## 5. VoF-Phase-Field 可溶表面活性剂两相流（重要 — 多相流）

**arXiv:2605.27534**  
**标题：** A hybrid Volume of Fluid Phase-Field method for Direct Numerical Simulations of soluble surfactant-laden interfacial flows  
**作者：** Ilies Haouche, Benjamin Reichert, Michaël Baudoin, Palas Kumar Farsoiya  
**日期：** 2026-05-27  
**分类：** physics.flu-dyn  
**链接：** https://arxiv.org/abs/2605.27534

### 摘要
提出混合 VoF-Phase-Field 方法用于一般可溶表面活性剂界面流。VoF 方法追踪界面并求解动量，扩散 Phase-Field 作为表面活性剂传输的光滑载体，实现体相与界面浓度场的耦合，无需计算表面导数。通过正则化源项引入吸附/解吸动力学。

### 创新点
- VoF + Phase-Field 混合方法
- 无需表面导数计算
- 可溶表面活性剂耦合
- 吸附/解吸动力学

### 数值方法
- 体积分数法 (VoF)
- Phase-Field 方法
- 界面追踪
- 可溶表面活性剂

### 关键词
`多相流` `VoF` `Phase-Field` `表面活性剂` `DNS` `界面流`

---

## 6. 极端事件与壁面湍流相干结构（重要 — 湍流）

**arXiv:2605.27792**  
**标题：** Triggering of extreme events and coherent-structure modulation in wall-turbulence under cyclostationary forces  
**日期：** 2026-05-26  
**分类：** physics.flu-dyn, physics.comp-ph  
**链接：** https://arxiv.org/abs/2605.27792

### 摘要
大气阵风引发壁面湍流非平衡动力学和极端气动载荷。DNS 研究高振幅阵风下湍流结构的时空调制和近壁极端事件触发机制。结果表明：高振幅阵风向流速分量注入能量，诱导非平衡相位滞后，摩擦滞后显著，松弛时间延长。强阵风抑制高频随机波动，重组为低频相干结构，特征频率锁定于阵风频率（偏差仅 2.4%）。极端近壁事件发生概率增加一个数量级。BF事件由局部逆压梯度和能量抛掷驱动，EP 事件由高速流体扫过压缩近壁涡量。

### 创新点
- 阵风驱动非平衡湍流
- 相干结构频率锁定机制
- 极端事件触发物理解释
- 后掠翼 UAV 流动控制启示

### 数值方法
- 直接数值模拟 (DNS)
- 壁面湍流
- 大气阵风模拟

### 关键词
`壁面湍流` `DNS` `极端事件` `相干结构` `阵风` `非平衡`

---

## 7.稀疏 POD 模态选择与神经网络降维（新 —湍流降阶）

**arXiv:2605.27756**  
**标题：** Sparse POD Mode Selection and Manifold Dimensionality Reduction with Neural Networks  
**日期：** 2026-05-26  
**分类：** physics.flu-dyn, cs.LG, math.NA  
**链接：** https://arxiv.org/abs/2605.27756

### 摘要
POD 广泛应用于数据驱动降阶，但 advection-dominated 和湍流等 Kolmogorov n-width 衰减慢的问题需要大量模态。SparseModesNet：线性 POD 编码 + LassoNet 非线性解码，同时选择信息性 POD 模态并学习最小化重构误差的非线性映射。在 benchmark advection-dominated 和混沌流上达到或超越 SOTA。湍流槽道流 Re_τ=5200，重构误差降低 51–78%。

### 创新点
- LassoNet 稀疏模态选择
- 线性编码 + 非线性解码
- 湍流 Re_τ=5200 验证
- 51-78% 误差降低

### 数值方法
- POD (Proper Orthogonal Decomposition)
- 神经网络流形
- LassoNet
- 降阶建模 (ROM)
- 湍流通道流

### 关键词
`POD` `降阶建模` `神经网络` `LassoNet` `湍流` `流形学习`

---

## 8. 贝叶斯逆设计与神经算子 CFD（重要 — AI+CFD）

**arXiv:2605.26059**  
**标题：** Accelerating Bayesian inverse design in computational fluid dynamics using neural operators  
**日期：** 2026-05-26  
**分类：** physics.flu-dyn  
**链接：** https://arxiv.org/abs/2605.26059

### 摘要
贝叶斯逆设计从稀疏观测推断几何，同时量化不确定性。传统方法需要大量高保真 CFD 模拟。本文将神经算子代理模型直接嵌入 MCMC 推理循环。拟一维喷管完全贝叶斯公式，几何参数化起决定性作用（立方 B-spline 提供稳定物理不确定性估计）。DeepONet 替代 CFD 求解器嵌入 No-U-Turn Sampler。

### 创新点
- 神经算子 +贝叶斯 MCMC
- 保持后验结构
- 立方 B-spline 几何参数化
- 激波主导流验证

### 数值方法
- 神经算子 (DeepONet)
- 贝叶斯推断 (MCMC)
- CFD 代理模型
- 拟一维喷管流

### 关键词
`神经算子` `贝叶斯逆设计` `CFD代理模型` `DeepONet` `不确定性量化`

---

## 9. 神经算子替代模型 CFD + SMHR（重要 — AI+CFD surrogate）

**arXiv:2605.30277**  
**标题：** Neural Operator-Based Surrogate Model for CFD: Helical Coil Steam Generator in Small Modular Reactor  
**日期：** 2026-05-29  
**分类：** cs.LG, physics.flu-dyn  
**链接：** https://arxiv.org/abs/2605.30277

### 摘要
SMR 数字孪生需要实时热工水力模拟。本文提出 ROM + 神经算子集成框架，应用于 SMART 反应堆螺旋线圈蒸汽发生器 (HCSG)。比较 MLP-autoencoder（无结构网格）和卷积 autoencoder（结构网格）+ DeepONet 构建 latent DeepONet (L-DeepONet)。多尺度技术减轻谱偏差、改善 Kármán 涡街预测。多尺度 L-DeepONet 捕获瞬态周期涡动力学，多尺度 FNO 预测时均流和压降。

### 创新点
- ROM + 神经算子集成框架
- L-DeepONet 多尺度方法
- 捕获瞬态涡街动力学
- CFD 级别 SMR 几何验证

### 数值方法
- 神经算子 (DeepONet, FNO)
- POD-ROM
- 多尺度方法
- 螺旋线圈蒸汽发生器

### 关键词
`神经算子` `CFD替代模型` `DeepONet` `FNO` `数字孪生` `SMR` `多尺度`

---

## 10. CFDTwin — ANSYS Fluent POD-NN 替代模型工具包（新 — 开源工具）

**arXiv:2605.27725**  
**标题：** An open-source GUI and Python toolkit for POD-NN surrogate modeling of ANSYS Fluent simulations  
**作者：** Han Hu  
**日期：** 2026-05-26  
**分类：** physics.flu-dyn, cs.LG  
**链接：** https://arxiv.org/abs/2605.27725

### 摘要
CFDTwin：开源 Python 包 +桌面 GUI，将设计参数采样、Fluent 自动化、数据提取、POD-NN 降阶模型构建、神经网络训练、验证集成到可重用工作流。支持标量、表面场、cell-zone 输出的 POD-NN surrogate 模型。可脚本化 Python API + GUI 双接口，支持 ANSYS Fluent 仿真。

### 创新点
- 开源 POD-NN 工作流工具包
- GUI + Python API
- ANSYS Fluent 集成
- 电子设备冷却应用验证

### 关键词
`开源` `POD-NN` `ANSYS Fluent` `替代模型` `工作流自动化`

---

## 11. 可微编程混沌流降阶建模（新 — 降阶 + 可微编程）

**arXiv:2605.26416**  
**标题：** A Differentiable Programming Framework for Accurate and Stable Reduced-Order Modeling of Chaotic Flows  
**日期：** 2026-05-27  
**分类：** physics.comp-ph  
**链接：** https://arxiv.org/abs/2605.26416

### 摘要
经典 POD-Galerkin 模型对混沌流需要大量模态和稳定项。本文提出可微编程框架，无需增加模态或添加稳定项即可稳定低秩 POD-Galerkin 模型。通过可微编程调整 POD-Galerkin 的线性和二次张量，仅用短期轨迹数据训练。关键发现：纯点轨迹损失函数对混沌系统长期精度差；结合轨迹误差 + 能量守恒物理项的混合损失函数提供优越长期性能。验证：lid-driven cavity Re=30,000，计算成本降低一个数量级。

### 创新点
- 可微编程稳定化混沌 ROM
- 混合损失函数（轨迹 + 能量守恒）
- 无需额外稳定项
- Re=30,000 混沌流验证

### 数值方法
- POD-Galerkin 降阶
- 可微编程
- 混沌流 (lid-driven cavity)
- 能量守恒约束

### 关键词
`可微编程` `降阶建模` `混沌流` `POD-Galerkin` `能量守恒`

---

## 12. 深度学习 RANS 代数 Reynolds应力闭合（重要 — ML湍流模型）

**arXiv:2605.26358**  
**标题：** Deep Learning-based Algebraic Reynolds Stress Closures for RANS Simulations of Turbulent Flows  
**日期：** 2026-05-27  
**分类：** physics.flu-dyn  
**链接：** https://arxiv.org/abs/2605.26358

### 摘要
RANS 方程节省超过十个数量级但存在未闭合项。离线训练的 ML 闭合存在分布偏移问题。DARSM (Deep Algebraic Reynolds Stress Model)：物理推导的深度学习闭合模型，从 Reynolds应力输运方程在弱平衡假设下推导隐式代数 Reynolds 应力方程，神经网络映射流不变量至此方程的经验参数，端到端优化消除分布偏移。小数据集训练即可跨 Re 数、跨几何、跨流态泛化。

### 创新点
- 物理结构的 ML 闭合
- 弱平衡假设推导
- 端到端 PDE 优化
- 跨 Re 数泛化

### 数值方法
- RANS
- 代数 Reynolds 应力模型
- 深度学习闭合
- 神经网络

### 关键词
`RANS` `深度学习``湍流模型` `代数应力模型` `分布偏移`

---

## 13. 斜压海底边界层参数次谐波不稳定性（理论）

**arXiv:2605.28555**  
**标题：** Parametric Subharmonic Instability in the Ocean Bottom Boundary Layer  
**作者：** Logan Knudsen  
**日期：** 2026-05-28  
**分类：** physics.flu-dyn, physics.ao-ph  
**链接：** https://arxiv.org/abs/2605.28555

### 摘要
内波频率大于局部最小允许波频率两倍时会发生 PSI（参数次谐波不稳定性）。在斜坡地形底部边界层，近底内流沿 Kelvin 波传播方向导致 Ertel 势涡度降低，使近惯性波 PSI 成为可能。线性稳定性分析和非线性模拟表明：PSI 增长率由底部边界层垂向层结和斜坡 Burger 数决定，波剪切生产是主要能量源。

### 关键词
`内波` `PSI` `海底边界层` `湍流混合` `斜压流`

---

## 14. 高焓进入飞行器弓形激波不稳定性（重要 — 高超声速）

**arXiv:2605.28357**  
**标题：** Bow-shock instability in entry, descent, and landing vehicles under high-enthalpy conditions  
**日期：** 2026-05-28  
**分类：** physics.flu-dyn, physics.comp-ph  
**链接：** https://arxiv.org/abs/2605.28357

### 摘要
高焓 Mars 进入条件下，分离弓形激波和激波产生的剪切-熵层在自由流扰动下会失稳，导致非线性破碎和壁面加热增强。分析覆盖 Earth 和 Mars 自由流 Mach 数至 30，Mars 更易受影响。接受性分析揭示三步机制：①声学和熵自由流分量穿越弓形激波并被放大；②在激波后剪切-熵层内对流放大；③弓形激波波纹由下游压力场驱动。总最优能量增益标度：G_T^opt ~ exp[...]。Mars 进入飞行器放大因子达10^6 量级。

### 创新点
- 激波-熵层不稳定性新机制
- 无需经典边界层模态
- Mars2020 等飞行数据验证
- 壁面建模 LES 确认

### 数值方法
- 接受性分析
- 壁面建模大涡模拟 (WMLES)
- 高超声速过渡

### 关键词
`高超声速` `弓形激波` `不稳定性` `EDL` `Mars进入` `LES`

---

## 15. VAWT 近尾流 DNS（重要 — 风力机空气动力学）

**arXiv:2605.27626**  
**标题：** Direct Numerical Simulation of Vertical-Axis Wind Turbine Near-Wake Dynamics  
**日期：** 2026-05-26  
**分类：** physics.flu-dyn  
**链接：** https://arxiv.org/abs/2605.27626

### 摘要
几何解析 VAWT 直接数值模拟，使用 Nektar++ 谱/hp 元方法框架和动参考系公式。三种叶轮几何（1/2/3 叶片）。完整解析动态失速过程，包括涡形成、叶片分离、与近尾流交互。增加叶片数引入叶片-涡交互，影响动态失速过程。三叶片构型中这些交互与动态失速初始阶段重合，动态失速涡尺寸减小。发现新型互补机制：直接涡撞击导致动态失速涡提前破碎。

### 创新点
- VAWT 几何解析 DNS
- 动参考系 formulation
- 叶片数效应
- 涡破碎新机制

### 数值方法
- 谱/hp 元方法 (Nektar++)
- DNS
- 动态失速
- 风力机空气动力学

### 关键词
`VAWT` `DNS` `风力机` `动态失速` `近尾流` `涡相互作用`

---

## 16. Navier-Stokes 开源求解器 FEALPy（新 — 开源软件）

**arXiv:2605.25403**  
**标题：** A High-Performance, Cross-Platform Open-Source Solver for the Incompressible Navier-Stokes Equations in FEALPy  
**日期：** 2026-05-26  
**分类：** physics.flu-dyn  
**链接：** https://arxiv.org/abs/2605.25403

### 摘要
FEALPy：高性能跨平台开源不可压 N-S 方程求解器。核心创新：后端无关设计，支持 NumPy/PyTorch/JAX，在 CPU/GPU 间无缝切换。高度模块化架构提供各种空间离散化方案组件库。benchmark验证确认收敛阶数。模块化设计支持算法即插即用。

### 创新点
- 后端无关 (NumPy/PyTorch/JAX)
- CPU/GPU 无缝切换
- 高度模块化
- 开源

### 数值方法
- 有限元/有限差分
-不可压 N-S
- GPU加速 (JAX/PyTorch)

### 关键词
`开源` `N-S方程` `不可压` `FEALPy` `高性能计算` `GPU`

---

## 17. 半监督 PIV 流场估计（新 — 实验流体力学+ML）

**arXiv:2605.28245**  
**标题：** Data-efficient semi-supervised learning for flow estimation using unlabelled probe data  
**日期：** 2026-05-27  
**分类：** physics.flu-dyn  
**链接：** https://arxiv.org/abs/2605.28245

### 摘要
从 PIV 估计时变速度压力场受限于时间分辨率。本文利用时间步间未标记探针数据，通过半监督学习策略富化 PIV 训练数据集。两个神经网络分别预测 POD 模态的时间系数及其时间导数。未标记探针样本强制时间一致性，扩大流场景覆盖。最小二乘正则化协调预测和时间导数。在湍流通道流和翼型尾流实验 PIV 上验证。

### 创新点
- 半监督学习利用未标记探针数据
- POD 模态时间系数预测
- 时间一致性强制
- 实验 PIV 验证

### 关键词
`PIV` `半监督学习` `流场重建` `压力估计` `POD`

---

## 18. 液滴-液膜相互作用的界面张力 DNS（重要 — 多相流/液滴）

**arXiv:2605.30082**  
**标题：** The Role of Interfacial Tension in Direct Numerical Simulations of Drop-Film Interaction for Immiscible Fluids  
**日期：** 2026-05-29  
**分类：** physics.flu-dyn  
**链接：** https://arxiv.org/abs/2605.30082

### 摘要
使用 FS3D (Free Surface 3D) 进行液滴撞击油膜的直接数值模拟，比较不同界面张力值并评估灵敏度。水滴撞击油膜的定量验证显示数值与实验的冠部高度良好匹配。系统研究界面张力变化，发现冠部高度和铺展直径变化较小，但内部冠部组成差异显著。FS3D 在 AMD MI300A APU 架构超级计算机上优化，使用 OpenMP 和 Umpire 内存池，GPU 加速 4 倍，强扩展至 4 APUs，弱扩展至 512 APUs（4096³ cells）。

### 创新点
- 界面张力敏感性分析
- AMD APU 大规模并行
- 多相流自由表面追踪
- 冠部破碎形态学

### 数值方法
- 直接数值模拟 (DNS)
- FS3D (Free Surface 3D)
- 多相流 / 液滴撞击
- GPU 并行

### 关键词
`多相流` `液滴` `界面张力` `DNS` `自由表面` `FS3D`

---

## 19. 风力场与尾流双向耦合 Reduced-Order 模型（重要 — 风力机/大气边界层）

**arXiv:2605.30077**  
**标题：** Two-way coupling of gravity waves and wind farm wakes: a reduced-order boundary-layer model  
**作者：** Hossein Kafiabad  
**日期：** 2026-05-28  
**分类：** physics.flu-dyn  
**链接：** https://arxiv.org/abs/2605.30077

### 摘要
建立重力波与大型风电场湍流尾流双向耦合的降阶框架。线性化非静力 Boussinesq 方程，考虑边界层和上覆层结自由大气简化。混合谱-有限差分离散化。LES验证确认模型成功重现内部风电场流动和大尺度重力波效应。捕获上游逆压梯度导致的阻塞效应，以及尾流内和下游由顺压梯度驱动的加速恢复。

### 创新点
- 重力波-尾流双向耦合
- 混合谱-有限差分
- 边界层-自由大气耦合
- LES 验证

### 数值方法
- 降阶模型 (ROM)
- Boussinesq 近似
- LES 验证
- 大气边界层

### 关键词
`风力机` `重力波` `尾流` `降阶模型` `大气边界层` `LES`

---

## 20. 统计湍流标度异常指数的扰动框架（理论 — 湍流理论）

**arXiv:2605.26359**  
**标题：** Perturbative anomalous exponents from Kolmogorov multipliers  
**日期：** 2026-05-27  
**分类：** physics.flu-dyn  
**链接：** https://arxiv.org/abs/2605.26359

### 摘要
提出基于 multiplier 统计的湍流标度异常扰动框架，而非零模计算。壳模型结合确定性和 Kraichnan 随机分量，问题简化为 Kolmogorov multiplier（连续标量幅值比） stationary Fokker-Planck 方程分析。通过围绕高斯分布的扰动展开求解不变量测度，计算任意阶结构函数的异常标度指数（包括奇阶、偶阶和非整数矩）。

### 创新点
- Multiplier 统计新方法
- 规避零模 Hopf 方程限制
- 任意阶（奇/偶/非整数）结构函数
- 异常指数显式计算

### 关键词
`湍流理论` `异常标度指数` `Kolmogorov` `壳模型` `Fokker-Planck`

---

*📅 生成时间：2026-05-31 |🤖 鲜毛肚 (Xianmaodu) 自动收集*