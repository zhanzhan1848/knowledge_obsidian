---
type: moc
created: 2026-10-21
updated: 2026-11-08
agent: doumiao
domain: fluid-rendering
---

# 🌊 豆苗 MOC — 计算机图形学流体渲染

> 领域：**体积渲染 / 粒子渲染 / 表面渲染 / 烟雾火焰**
> 更新：2026-11-08

## 🎯 三条技术路线总览

流体渲染的架构选择本质上是「模拟载体」的选择，三者互补而非互斥：

| 路线 | 载体 | 代表工作 | 核心优势 |
|------|------|---------|---------|
| **体积** | 体素网格 / Ray Marching | [[2026-10-21-FieryGS-In-the-Wild-Fire-Synthesis]] | 表现力强，火焰+烟雾+碳化完整 |
| **粒子** | SPH / Gaussian 基元 | [[2026-10-21-WildFireGS-3DGS-Forest-Wildfire-Simulation]] | 省内存，天然稀疏，渲染复用 |
| **生成** | 视频扩散模型 | [[2026-10-21-FluidGen-Physics-Aware-Fluid-Video]] | 免建模，零调参，可语义编辑 |

---

## 📁 主题索引

### 🔥 烟雾 / 火焰 / 燃烧

- [[2026-11-05-Zhang-Cai-Huang-Ren-GauSmoke-Hybrid-Physics-Optical-Gaussian-Splatting]] — ⭐⭐⭐⭐⭐ **SIG 2026 Article 51**：Beer–Lambert 体积密度场 + Eulerian 无散速度场驱动 Lagrangian 图元；稀疏视角联合重建速度+密度；**PSNR 34.83 / 0.80 h / 114 FPS**（比 NeuSmoke 快 2×、PSNR 高 12 dB）；南开 + 南大 Bo Ren 组
- [[2026-11-05-Tao-Chen-Chu-LagrangianSplats-Divergence-Free-Transport]] — ⭐⭐⭐⭐⭐ **SIG 2026 Article 52**：**Divergence-Free Kernel 构造性保证不可压缩性**（告别软惩罚）+ Sliding Window 长时程梯度；**代码 + 数据集 + 补充材料全开源**；北大 Tao/Chen/Chu
- [[2026-11-05-Schneider-Schuh-Kaddar-Artificial-Flame-Thickening-Hydrogen-Turbulence]] — 人工加厚火焰**双通道标定**：$Ka_f^F=Ka_f\sqrt F$、$Da_f^F=Da_f/F$，方向相反 → 匹配这两个数则不同 $F$ **结果塌缩**；含隐式效率修正因子
- [[2026-10-21-FluidGen-Physics-Aware-Fluid-Video]] — 速度场监督 + 物理奖励 DPO（2026-10-19）
- [[2026-10-21-WildFireGS-3DGS-Forest-Wildfire-Simulation]] — 3DGS 原生粒子燃烧（2026-08-11）
- [[2026-10-21-FieryGS-In-the-Wild-Fire-Synthesis]] — MLLM 材质推理 + 体积燃烧（2026-04-30）
- [[2026-10-25-Flamescapes-Wildlandfire-Urban-Interface]] — SA2026 语义化燃料图 + 化学燃烧 + 体积渲染（**几何-视觉解耦**）
- [[2026-10-30-Flamelet-Closure-2D-Combustion]] — Vervisch/Hasse：flamelet **仅用应变率即可闭合，但至少需 3 个参数** → 火焰燃烧代理模型的输入特征数下限
- [[NVIDIA-GPUGems3-Fluids]] — 经典实现参考

### 🌊 表面流体 / 涡方法

- [[2026-11-05-Zhang-Rautek-Hadwiger-Generic-Variational-Vortex-Core-Manifolds]] — ⭐ **SIG 2026 Article 53**：3D 非定常流涡核的**通用变分框架**（时空双流形）；拉格朗日量按流 pushforward **预积分** → 单时间步单空间变量求解；**任意涡旋准则可插拔**；KAUST
- [[2026-11-02-Unified-Multi-Scale-Two-Phase-Immiscible-Flows]] — ⭐ **11-02 期新增**：SA2026 共享欧拉网格 + 拉格朗日相分数，**分层↔弥散统一闭合模型** + 体积耦合力联合压力投影（强耦合）；单模拟覆盖瀑布/水轰炸机/水下气泡/间歇泉/拍岸海浪
- [[2026-10-25-Divisor-Dynamics-Surface-Fluid]] — SA2026 任意拓扑曲面点涡 + 因子类不变量（拓扑正确性）
- [[2026-10-30-DAVOF-Interface-Normal-Position-VOF]] — ⭐ **10-30 期最贴近渲染**：几何 VOF **单元内闭式**恢复界面法向与位置（额外面分数输运，**无需邻居/无需迭代**）；非结构网格渲染的界面输入契约；**寄生电流消除 = 液面着色稳定性**；已进 OpenFOAM 分支

### 💧 水 / 液体

- [[2026-11-05-Nayak-Mohammed-Aidun-Monocular-3D-Bubble-Reconstruction]] — 单张阴影图 → 3D 气泡位置 + 物理等效直径：**DNS + 校验过的 MC 光追（~30× CPU 速度，强度误差<3%）+ 焦点条件化多任务学习**，~97.6% 归一化深度精度；**多相流渲染前向模型**可复用
- [[2026-11-05-Zhang-Cai-Huang-Ren-GauSmoke-Hybrid-Physics-Optical-Gaussian-Splatting]] — 烟雾体积密度场（见 🔥 烟雾区）
- [[2026-10-31-Masuda-Drop-Decomposition-Cylindrical-Curvature]] — ⭐ **10-31 期最贴近渲染**：几何曲率 κ_F=d/R_i **改写液滴破碎路径**（平面近对称二分断裂 → 强曲率丝状介导碎裂+多卫星滴）；**曲面容器内液体不可套用平面参数**；plicRDF+isoAdvector+AMR；网格精度下限（直径 ≥8 单元）
- [[2026-10-31-Du-Zou-Capillary-Gravity-Vorticity-I-Local-Constructions]] — 点涡→**紧支撑涡核守恒正则化**（消除 1/r 着色奇异性）；液面四阶展开含首个毛细修正；Kirchhoff–Routh 平衡存在性；**周期波涡深 ∝ log(1/W)** vs 孤立波 ∝ 1/W
- [[2026-10-31-Du-Zou-Capillary-Gravity-Vorticity-II-Continuation-Folds]] — **全局解曲线** + 集中紧性备择（无单调性假设的有限剖面分解 → 人工远场边界条件）；**简单速度折叠点** Hessian 负指数差恰为 1 → 水面形态转场触发点
- [[2026-10-31-Yao-Zhou-Taylor-Bubble-Drop-Assembly-Riser]] — **反直觉速度继承**：气泡携带液滴时液滴取气泡速度（非减速）；Taylor 长椭球形保持；管内流动**解析速度剖面**可作着色器解析场；OpenFOAM multiphaseInterFoam
- [[2026-10-16-Tessellation-Free-Displaced-Surfaces-Water-Caustics]] — 无细分位移面焦散
- [[2026-10-19-Make-It-Flow-Water-Animation-3DGS]] — 光流 → 3D Eulerian 运动场（静态 3DGS 水体动画，**免物理模拟**）
- [[2026-10-19-SplashSplat-Multi-View-Liquid-Reconstruction]] — 飞溅液体多视图重建
- [[2026-10-30-Broadband-Water-Wave-NLS]] — 宽频带实验验证 **NLS 推广形式**（打破窄带假设）→ 海洋"长波层"求解器的模型选择
- [[2026-10-30-Capillary-Wave-Turbulence-Finite-Systems]] — 毛细波级联动态范围 ∝ **μ^{8/3}** → 校核法线贴图频谱斜率
- [[2026-10-30-Capillary-Turbulence-Anisotropic-Kinetic]] — 各向异性终态 **因子化谱** n(k,φ) ~ k^-17/4·F(φ) → 定向海洋 FFT 谱构造（成本几乎不变）
- `2603.21695` RefracGS — 折射水面 + 3DGS 光线追踪（待收录）

### 🌬️ 大气 / 分层流 / 逆问题

- [[2026-11-08-EnKF-Rayleigh-Benard-Temperature-Only-Reconstruction]] — ⭐⭐⭐ **11-08 期新增，方法论价值最高**：仅凭**温度场**稀疏噪声观测用**正确标定 EnKF + inflation** 重建完整速度/涡量（数值验证 Charney 猜想）；关键：温度与涡量**不同属一个决定模态集** → nudging/直接替换必失效，靠**流依赖的温度-涡量交叉协方差**绕开；**逐尺度谱分析**（非整体 RMSE）；**观测密度阈值**（低于此仅大尺度同步）；⚠️ 仅 2D、inflation 需重标定、属纯数据同化
- [[2026-10-31-Nualart-Park-Penafiel-Boussinesq-Stationary-Structures]] — **层结刚性定理**：稳定层结+层流 ⟹ 必为分层剪切流；**Ri≈1 = 混合活跃带**（垂直输运强）→ 烟柱/云层混合强度的零成本分层调制器；停滞点附近"岛"结构 → 等密度面断裂提示
- [[2026-10-31-Aigner-SFNS-Airflow-Sparse-Sensing-Physics-Prior]] — ⭐ **强形式 NS 残差最小化比弱形式更准且快 3×**；**稀疏控制点 → 物理一致流场**范式（毫秒级驱动体积平流）；$E_s=\int\|\nabla u\|^2$ 作烟流细节锐度旋钮；物理先验收益在稀疏区间最大

### ⚛️ 粒子系统 / 降维

- [[2026-11-05-Zhang-Cen-Zhu-Chen-Ren-DIQ-MPM-Fluid-Solid-Coupling]] — **DIQ 双界面求积**：免重叠网格的强流固耦合，Schur 补统一稀疏纯压力 SPD 系统，**消除数值断裂**（TVCG 2026，南开）
- [[2026-10-27-Boettcher-Ridder-Bender-Total-Deformation-MPM-Perfectly-Elastic-Solids]] — 从粒子位置+固定参考网格**直接算形变**（不用速度梯度累积）+ **当前网格算弹性力** → **无数值断裂 + 兼容标准网格碰撞** + 零能量模式抑制
- [[2026-10-29-Feng-Luan-Mastering-Multi-State-Dynamics-Continuum-Damage-Viscoplastic-MPM]] — 工具中心化**局部化相场损伤求解**（隐式 Ginzburg-Landau + 几何多重网格 V-cycle 预条件）；**双向工具耦合把材料抗力直接暴露给 PPO**；统一逐粒子本构层覆盖软固体/脆性/颗粒/黏塑性
- [[2026-10-31-Fang-Qi-Wen-Small-Deborah-Fluid-Particle-Limit]] — **两级粒子渲染架构**：小 Deborah 数极限（逐点收敛率）→ 宏观解 NS-KS、微观采样 $n_0$，六维 $f(t,x,v)$ 降到 $(x,t)$；KS 方程 = 带漂移 Fokker–Planck → **直接写为渲染端粒子更新规则**；$g_1$ 项编码流体对粒子分布的一阶反作用

### ⚙️ 求解器 / 数值格式（渲染上游）

- [[2026-11-08-HGKS-Compact-ALE-Gas-Kinetic-Unstructured-Mesh]] — ⭐⭐⭐ **11-08 期新增**：三维非结构网格上的**紧凑高阶气体动理学格式（HGKS）**；**降内存重构**——单元及邻居**平均梯度**最小二乘替代矩阵求逆（**3×3 系数矩阵 + 4 次最小二乘**），正对 ALE 移动网格每步重算几何的开销；**GENO + 梯度压缩**抑制强间断振荡；**CUDA + MPI 多 GPU** 全显式（cell-level 并行）→ 离线火/爆炸渲染的扩展范式；算例含**直升机旋翼**；⚠️ 全显式 CFL 严、无渲染实验
- [[2026-11-05-Zhang-Ren-FastVEM-Fluid-Simulation]] — ⭐⭐⭐⭐⭐ **SIG/TOG 2026 Article 65**：**二阶 VEM 压力离散 + 保凸性 BSP cut-cell + Galerkin 几何多重网格**；压力投影 **最高 100× 加速**；128³ 上复杂/超薄边界烟雾模拟 **< 1 min/frame**；稳健处理窄缝/无人机扫描几何/**相对厚度 10⁻⁵ 超薄壳体**；**代码开源**（南开）
- [[2026-10-25-KPM-FR-High-Order-Flux-Reconstruction]] — SIGGRAPH 2026 矩空间 GKS + 通量重构（8G 解点/s，显存降 5×，18 亿解点单机）
- [[2026-10-26-Lanczos-Advection-Near-Orthogonal-SL-Reconstruction]] — SA2026 Lanczos 核近正交半拉格朗日重构（**能量保持 4.3×**，开销仅 1.3×，⭐ 本库工程性价比最高）
- [[2026-10-25-ML-Operator-Lexicon-PDE-Solvers]] — SA2026 ML 算子化 PDE 求解器（**可微管线**、矩阵自由、多重网格）
- [[2026-10-26-DiffPhD-Unified-Differentiable-Solver-Heterogeneous-Elastodynamics]] — SA2026 可微异质投影动力学（**100× 刚度对比仍收敛**、10× 加速、代码开源）
- [[2026-10-24-Fast-Subspace-Fluid-Simulation-DMD]] — 降阶谱方法
- [[2026-10-24-FluidFormer-Transformer-Continuous-Convolution-SPH]] — 局部-全局 Transformer SPH

### 🔧 可微物理 / 实时交互（渲染管线工程）

- [[2026-11-05-Quan-Wang-Lian-DiffSurFlow-Differentiable-Fluid-Optimization]] — ⭐⭐⭐⭐ **SIG/TOG 2026**：**流图代理梯度** —— 发现反向传播中"计算强度 vs 梯度重要性"错配，**跨步连接 = 梯度"高速公路"**；保留关键连接 + 物理剪除冗余伴随计算 → **显存↓ 梯度几乎不变**；Dragon→SIG2026 烟雾变形 / 翼型升阻比 / 城市风场 / trefoil 涡场；**代码开源**（SJTU DALab）
- [[2026-11-05-Cao-Ren-Xu-Mo-Hu-End-to-End-Differentiable-SPH-Fluid-Rigid-Optimization]] — ⭐ **SIG/TOG 2026**：SPH 端到端可微（IISPH 流体-刚体耦合）；**自适应伴随修正序列**作**下降方向保持的前置预条件器**，抑制长时程伴随变量爆炸；冲量/形状/水射流平衡/**神经流体介导钟摆控制**
- [[2026-11-07-SIM-PINN-Projection-Segregated-Multi-Stage-PINN]] — ⭐ **方法论参考价值最高（11-07 期新增）**：把经典 CFD **投影法**搬进 PINN——动量预测/压力修正**各用独立子网络** + 投影式内迭代耦合 + **多阶段频率引导训练**；**网络输出"速度增量"而非速度场**（成功必要条件）；残差小 **3~6 个数量级**；**附录 C 消融排除"赢在更贵"**（匹配算力/参数量后基线仍更差）；仅 2D、无代码、离线成本高 → 参考 ≫ 落地
- [[2026-11-05-Modgil-Readable-Is-Not-Steerable-Learned-Fluid-Representations]] — ⚠️ **方法论警示**：预注册实验证明 **"隐空间可读物理量" ≠ "可操控"**；JEPA 竟**不如未训练网络**；对照组（线性动力学 JEPA / 静态模型）是必要设计；**"能读出"不能作为"可控"的证据**
- [[2026-10-26-RealSimLoop-Online-RealToSim-Differentiable-ReducedOrder]] — SA2026 神经降阶 + 可微 3DGS + 滑动窗口在线适配（**2.5×~7.7× 加速**，sim-to-real 误差 7.1→4.6 mm）
- [[2026-10-26-Beyond-Kirchhoff-Love-Volumetric-ThinShell]] — SA2026 从体积力学推导的薄壳（**KL 壳缺泊松收缩**，比体积仿真快 2.6×~4.6×）
- [[2026-10-26-Fast-Cutting-Cage-Deformation-Walk-on-Spheres]] — SIGGRAPH 2026 WoS 增量复用（局部修改仅失效 5-10% → **10×~40× 加速**，代码开源）
- [[2026-10-26-REST3D-Single-Image-Physically-Stable-Scene]] — SA2026 单图重建**物理稳定性**（场景树 + 物理约束优化，代码开源）
- [[2026-10-30-Differentiable-Schwarz-Agentic-Inverse]] — 内外域 Schwarz 分解（薄边界层）+ 全可微 FEM + **Agentic AI 逆问题**；新范式：agent 动态**扩充基函数库**（改结构而非调参）
- [[2026-10-30-MG-CD-MPM-Continuum-Damage-Viscoplastic]] — MPM + 局部化 Ginzburg-Landau 相场损伤 + 几何多重网格 PCG；统一逐粒子本构层覆盖**黏塑性半流体**（糖浆/胶状物）

### 🏭 分布式 / 大规模生产

- [[2026-10-26-Power-Partitioner-Optimal-Transport-Distributed-Sim]] — Wētā FX 最优传输分区（**时间一致性比 METIS 好 505×**，端到端 3.35× 加速；133 个生产缓存评估）

### 🌊 体积渲染 / 神经表示

- [[2026-10-16-ResStreamGS-Volumetric-Video-Streaming-3DGS]] — 体积视频流式传输
- [[2026-10-15-CAGS-Volumetric-Video-Streaming-3DGS]] — 压缩感知高斯流式传输
- `2604.12217` [[2026-04-21-VVGT-Volumetric-Visual-Grounded-Transformer]] — 视觉体积接地 Transformer

### 🎬 视频生成 / Cinemagraph

- [[2026-10-21-FluidGen-Physics-Aware-Fluid-Video]] — 双流架构 RGB + **逐帧速度场**，速度场兼作监督与 velocity-aware DPO 奖励
- [[2026-10-29-PhysRepair-Agentic-Physics-Video]] — **generate-diagnose-repair** 范式；时空因果约束定位首个失效态 + 局部化再生成
- [[2026-10-29-WMEval-Interactive-World-Models-Physical-Simulations]] — Unity 作物理 oracle，把**物理-因果一致性**提升为一级评测维度
- [[2026-10-21-FluidGen-Physics-Aware-Fluid-Video]] — 双流架构 RGB + **逐帧速度场**，速度场兼作监督与 velocity-aware DPO 奖励（见上）
- [[2026-10-10-OuroWorld-Looping-Cinemagraphs]] — 3D 循环立体动画

### 🔬 体积渲染 / 密度可辨识性

- [[2026-10-29-Appearance-Compensation-in-Volume-Rendering]] — ⚠️ **SH2 精确模糊**：中心密度翻倍、L² 误差 >14.52%，但**每条 RGB 射线完全不变**；渲染精度无法证明密度正确（**密度重建必读**）
- [[2026-10-29-PhaseSurf-Metric-Phase-Fields-Thin-Structures]] — Metric-Phase Fields 分解几何为无符号度量场 + 软符号相位场，专治**薄飞溅片/泡沫层/水膜**
- [[2026-10-29-NFSR-NeRF-Inspired-Super-resolution-Reacting-Flows]] — NeRF 范式迁移到**湍流反应流 3D 超分辨率**，恢复火焰表面褶皱

### 🎯 实时流体 / 网格结构降本

- [[2026-10-29-Beyond-Horizontal-Refinement-Quadtree-Tall-Cells-Optical-Layers]] — ⭐ **Pacific Graphics 2026** (CGF 45(7) e70629)，**Game Freak × 东大 Kanai Lab**；四叉树 Tall Cells + **垂直自适应光学层**，压力计算最高 **3× 加速**（**最贴近商业实时液体落地**）
- [[2026-10-29-Curvilinear-D3Q27-Cumulant-LBM]] — 曲线网格 LBM **精确 1:1 流式传输（无插值）**；质量/动量守恒至舍入精度；支持 ALE + 双向 FSI
- [[2026-10-29-Surfzone-Sea-Surface-SIREN-Lidar]] — LiDAR 点云 → **连续可微无网格**海面；可求任意时空偏导做方向性波分析（⚠️ 过滤最高波数=飞溅浪花）
- [[2026-10-19-Make-It-Flow-Water-Animation-3DGS]] — 静态 3DGS 中动画化水体：光流 → 3D Eulerian 运动场 → cinemagraph 式形变（**免物理模拟**）
- [[2026-10-29-Self-Supervised-Optimal-Mixing-Incompressible-Flows]] — **首个自监督算子学习**最优混合；无散度谱基硬约束不可压缩；控制可迁移到独立 Eulerian FV 验证

### 🧮 代理模型 / 降阶（物理结构硬约束化）

- [[2026-11-08-FlowRig-Unified-Skeleton-Generation-Flow-Matching]] — ⚠️ **边缘相关（11-08 期新增）**：**流匹配**统一 3D/4D 绑定，**一次前馈生成整段序列的时间对齐骨架**（替代逐序列优化）；收录理由仅为"**序列级一次前馈保证时间一致性**"范式——正对流体渲染中逐帧独立优化的时序漂移（GauSmoke / SplashSplat 类）
- [[2026-11-08-Pore-Scale-Capillary-Imbibition-FIB-SEM-DNS]] — ⚠️ **边缘相关（11-08 期新增）**：FIB-SEM **真实水泥骨料微观结构**上的孔隙级 DNS，首次直接看到毛细自发浸润的**气-水界面瞬态动力学**；发现局部动力学由**演化界面曲率与毛细压力场**决定（**非仅孔隙尺寸**），**完全润湿下毛细孔内仍显著气体封闭** → 提醒渲染中忽略封闭气泡的简化假设可能失真；**界面捕获技术族**（VOF/level-set/前沿跟踪）是自由表面渲染的直接对应

- [[2026-10-29-Neural-Eigenfluid-Bases-NEB]] — 微分提升**硬约束**不可压缩；**谱方差关系**解释势/速空间加权差异；状态 ~1/1000，复用时毫秒级
- [[2026-10-29-Neural-Operator-Splitting-Fluid-Complex-Geometry]] — 保留**分步格式**物理结构的 CL-FNO；2D 误差 −68% / 3D −40%；推理快 **10³×**
- [[2026-10-29-Neural-Basis-Method-Navier-Stokes]] — **表示-投影**原则；残差给出**后验速度误差估计**（认证的无数据训练目标）
- [[2026-10-29-FlowMesh-Velocity-Regularized-Flow-Matching]] — 非结构化网格 + **确定性**流匹配（无随机去噪链）；加速 **585–1902×**
- [[2026-10-29-FAMIR-Future-Aligned-Latent-Dynamics]] — 用**已实现的未来**塑形更新信号；教师-学生 + PPMA 对齐，仅部署学生
- [[2026-10-29-Generative-AI-in-Turbulence-Validation-Frameworks]] — 🔬 **方法论必读**：湍流**不是**常规图像生成问题；物理感知验证清单 + 呼吁建立基准生态
- [[2026-10-30-GC-DMD-Causality-Informed-DMD]] — **Granger 因果正则化** DMD 算子辨识 → 被方向性依赖支撑的**稀疏**算子；长时程预测误差降低 + 谱稳健性提升（代码开源）
- [[2026-10-30-Flapping-Wing-ROM-Shape-Optimization]] — 把 PDE 约束优化**投影到 Hilbert 空间系统动力学优化**，绕开不稳定前向灵敏度；推力 +37% / 效率 +40%

---

## 📊 每日报告

- [[2026-11-08-Daily-Research-Summary]] — ⚠️ **cs.GR 连续三轮零流体新论文**（11-06 批次 11 篇逐条核对）；**新增 5 篇**（EnKF 温度→速度重建 ⭐ / HGKS 紧凑 ALE 气体动理学 ⭐ / GPU-Native 体积视频 / FIB-SEM 毛细浸润 / FlowRig）；**重大修正：上轮"SIGGRAPH Asia 2026 论文未公布"结论有误**——清单实可查，**24 篇流体论文已 100% 覆盖入库**；SIGGRAPH 2026 另有独立分类 **"Fluid Reconstruction & Optimization"**；**发现 `dedup.py` 递归扫描 bug**（只扫顶层，漏 `2026/11/` 子目录，导致去重失效、本轮误判 11 篇新增实为 5 篇）
- [[2026-11-07-Daily-Research-Summary]] — ⚠️ **近 48h cs.GR 零流体新论文**（11-06 批次 11 篇 + 11-05 批次 9 篇**逐条核对**）；跨全 arXiv 扫描仅 **1 篇新增**（SIM-PINN，方法论价值最高）；**SIGGRAPH Asia 2026（12/01–04 吉隆坡）论文清单尚未公布**，距开幕约 3.5 周 → 下轮重点盯会议列表页
- [[2026-11-05-daily-report-2026-11-05]] — ⭐⭐⭐⭐⭐ **SIGGRAPH 2026 流体板块全景**（5 篇重磅 + 7 篇补充）：3DGS 流体重建双路线（GauSmoke 光学-物理 / LagrangianSplats 构造性无散）+ FastVEM 边界贴合 100× + DiffSurFlow 流图代理梯度 + KPM-FR 动理学高阶格式 + 涡核时空变分框架；24h 窗口 arXiv cs.GR **无流体新论文**，转向会议论文深挖
- [[2026-11-02-Daily-Research-Summary]] — **SA2026 流体论文全景（16 篇）+ Unified Multi-Scale 两相流新收录**；24h 窗口无新增（周末空窗），转向会议论文补充与既有笔记复核
- [[2026-11-02-SIGGRAPH-Asia-2026-Fluid-Papers-Roundup]] — SA2026 流体模拟三大主线全景综述（多尺度求解器 / 自由表面与涡量 / 粒子-学习-可微-分布式）
- [[2026-10-31-Daily-Paper-Search]] — **周末空窗 + 物理约束力持续增强**（7 篇全非渲染，但约束力极强：几何曲率改写破碎形态 / 色散分段构造频谱 / 层结刚性调制混合 / 涡核守恒正则化 / 强形式残差快 3× / 宏观极限降维两级架构）
- [[2026-10-30-Daily-Paper-Search]] — **物理侧集体下沉**（8 篇全非渲染，但约束力极强：DAVOF 界面契约 / flamelet ≥3 参数 / 毛细谱 / NLS 推广 / 因果降阶 / Agentic 逆问题）
- [[2026-10-29-Daily-Paper-Search]] — 生成式流体时代 + 实时流体"结构性降本" + **体积渲染可辨识性危机**（3 主题 17 篇）
- [[2026-10-26_Daily-Paper-Search]] — SA2026 缺口审计 + 补齐 7 篇（**平流算子 / 可微物理 / 分布式生产**，本期含金量最高）
- [[2026-10-25_Daily-Paper-Search]] — SA2026 流体论文缺口审计 + 补齐 4 篇（**可微 + 高阶 + 结构化**）
- [[2026-10-24_Daily-Paper-Search]] — 连续空窗日，转向历史缺口
- [[2026-10-21_Daily-Paper-Search]] — 三条技术路线对照
- [[2026-10-19_Daily-Paper-Search]] — 3DGS + 流体外观成热点
- [[2026-10-16_Daily-Paper-Search]]

## 🧭 前沿观察

1. **显式运动表征成为共识** — 速度场/光流被主动提升为一等监督信号（FluidGen + Make It Flow 独立收敛）
2. **3DGS 成为模拟载体新宠** — 让渲染图元直接承载模拟状态，省去转换层（WildFireGS）
3. **物理参数自动推断** — MLLM/学习方法替代专家调参（FieryGS）
4. **实时流体视频生成仍是空白** — FluidGen 尚无实时版本
5. **SIGGRAPH Asia 2026**（12/01–04 吉隆坡）论文清单**已公布**，本库已启动覆盖审计（详见 10-25 日报表格）
6. **可微求解器是下一个主战场** — ML Operator Lexicon + RealSimLoop + FluidGen 共同指向「求解器不再是黑盒，而是可优化模块」
7. **几何-视觉解耦被普遍忽略** — Flamescapes 的「物体先烧掉、火焰滞后出现」是低成本高收益的真实感来源
8. **拓扑正确的表面流体被低估** — 雕塑/网格的拓扑（洞）会改变流体动力学，传统求解器在此出错（Divisor Dynamics）
9. **高阶求解器省的是美术而非算力** — 同等网格下拿到更多细尺度细节，不再需要贴图补偿
10. **物理正确性回潮** — 10-26 期 3 篇（VC-Shell / DiffPhD / RealSimLoop）都在修**既有方法的物理简化错误**而非追速度：KL 壳缺泊松、DiffPD 刚度对比崩溃、离线 Real2Sim 开环漂移
11. **可微 + 降阶 + 渲染三件套已成型** — RealSimLoop 打通「降阶仿真 → 可微渲染 → 视觉损失 → 伴随法反向 → 滑动窗口在线更新」，且 2/3 相关工作**代码已开源**
12. **瓶颈已从渲染转向仿真与调度** — 本期 7 篇**无一是新渲染算法**，全是求解器/物理/基础设施；Wētā FX 用 133 个生产缓存评估分区方案即是明证
13. **局部增量复用是通用范式** — 「局部修改实际失效了多少？」这个问题值得对每个「全局重算」场景问一遍（WoS 案例：仅 5-10% 失效 → 10-20× 潜在加速）
14. **物理结构硬约束化是统一答案**（10-29 期）— CL-FNO 用分步结构、NEB 用微分提升、NBM 用投影结构、Optimal Mixing 用无散度谱基：**软惩罚的时代正在结束**
15. **体积渲染存在根本性可辨识性危机**（10-29 期）— 密度翻倍而 RGB 观测完全不变（>14.52% L² 误差）；**渲染精度 ≠ 密度正确**，密度重建必须引入透射率/密度敏感采集
16. **网格结构降本是工业级性价比最高的路线**（10-29 期）— Pacific Graphics 2026 Quadtree Tall Cells 自适应光学层（Game Freak 产学合作，压力计算 3×）比代理模型更易落地
17. **生成式流体进入"可诊断"阶段**（10-29 期）— FluidGen（速度场显式化）→ PhysRepair（诊断-修复）→ WMEval（物理因果评测），方法论闭环形成
18. **渲染论文正在"下沉到物理层"**（10-30 期）— 连续两期无新流体渲染算法论文，产出集中在物理/数值侧；物理进展对渲染的**约束力**反而更强（界面契约、闭合参数数、谱结构）。综述与教程类工作价值上升，"又一个粒子流体渲染器"边际价值下降
19. **降阶路线的竞争维度已分化**（10-30 期）— GC-DMD 解决"降阶结果**是否可信**"（稀疏 + 因果支撑），扑翼 ROM 解决"降阶优化**过程是否稳定**"（Hilbert 投影）；与 NEB/RealSimLoop/Subspace-DMD 构成**四路并行**
20. **Agentic AI 的新用法是改结构而非调参**（10-30 期）— 可微 Schwarz 工作中 AI agent 按准入策略**动态扩充基函数族**；对应渲染：流体效果参数寻优、烟雾反推燃料、海洋反推风场
21. **海洋渲染应改为"三段式"分层**（10-30 期综合）— 涌浪层（推广 NLS，**非**经典窄带）+ 毛细细节层（k^-17/4 因子化谱，角度查表）+ 中间频段交接；各向同性高斯波谱与真实终态不符
22. **尺度两难被混合离散正面击破**（11-02 期）— Unified Multi-Scale 用「欧拉网格 + 拉格朗日相分数」把分层流与弥散流**统一进同一求解器**（无需外挂次级求解器），并用**体积耦合力联合压力投影**保证强耦合稳定；小气泡不再需要上亿粒子、大瀑布不再需要巨型网格
23. **Hamilton / 变分结构回潮**（11-02 期）— Zakharov 波动模型（Hamiltonian Two-Way Coupling）以 $(\eta,\psi)$ 正则共轭对自动获得守恒律，与 2023–2024 *Particle Flow Maps* 系列一脉相承；**结构保持正在取代人工耗散项**
24. **"选择性物理"成为数据驱动方法论**（11-02 期）— SplashSplat 提出「**只在观测能约束处施加物理结构**」；与 PhysRepair（诊断-修复）同属"物理按需介入"思路，比"全物理"或"全生成"更务实
25. **3DGS 正在吞并"模拟结果的可视化表示"层**（11-02 期）— ParticleGS（科学粒子，@65× 压缩 30.03 dB，比 SZ3 高 5–8 dB）+ SplashSplat + WildFireGS + FieryGS + Make It Flow：把**离线模拟**连接到**实时可交互渲染**已成 2026 明确趋势
26. **"Eulerian 场驱动 Lagrangian 图元"成为 3DGS 流体重建的统一范式**（11-05 期）— GauSmoke、Make It Flow、LagrangianSplats 三篇**独立收敛**到同一架构：不再用逐图元独立形变（deformation field），而是**全局运动场 + 图元随流运动**；物理强度分三档（光流 < 光学-物理耦合 < 构造性无散）
27. **流体模拟瓶颈已拆解为三个正交维度**（11-05 期）— FastVEM 攻**线性代数**（压力投影 100×）/ DiffSurFlow 攻**梯度传播**（显存↓ 梯度不变）/ KPM-FR 攻**格式与 kernel**（2 kernel/步、8G 解点/s）；三篇互不重叠，**可组合**
28. **"可读 ≠ 可操控"是可微流体的新红线**（11-05 期）— 预注册实验证明 JEPA 隐空间组织流体物理量**不优于未训练网络**；设计上必须**同时检验"能读出"与"推动后有效果"**，且必须有**非物理对照组**
29. **物理正确性开始被"标定"而非被"假设"**（11-05 期）— 人工加厚火焰给出 $Ka_f$/$Da_f$ **双通道**标定公式，匹配两数则不同加厚倍数结果**塌缩**；配合 GauSmoke/LagrangianSplats 把物理写进表示，**物理正确性正成为可验证的工程量**
30. **"把数值算法结构映射成网络训练结构"是一条被低估的路线**（11-07 期）— SIM-PINN 把投影法拆成**独立子网络 + 内迭代**，把频谱偏置拆成**多阶段频率引导**；残差小 3~6 个数量级，且附录 C 消融**排除了"赢在更贵"**。核心可迁移经验：**网络输出"增量"而非绝对值 + 多阶段频率分离 + 内迭代数自适应**（仅 2–3 次即够）。对照：渲染主线仍靠网格/粒子求解器，PINN 落地仍属边缘
31. **流体主题已连续两期从 cs.GR 流向 physics.flu-dyn**（11-06 / 11-07 期）— cs.GR 近期被 3DGS / 神经重建 / 人体动画占满；**物理侧的"可验证性"与"求解器改进"双主线**（Lean 形式化验证 / 预注册实验 / 核插值降扩散 / 二阶 VEM）是当前真正的信息增量所在

## 🔗 相关 Agent

- [[生菜]] — 渲染基础（光线追踪/全局光照）
- [[娃娃菜]] — 几何处理
- [[菜心]] — 流体力学（CFD/SPH/LBM 数值方法）