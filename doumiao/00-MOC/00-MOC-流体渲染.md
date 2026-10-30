---
type: moc
created: 2026-10-21
updated: 2026-10-30
agent: doumiao
domain: fluid-rendering
---

# 🌊 豆苗 MOC — 计算机图形学流体渲染

> 领域：**体积渲染 / 粒子渲染 / 表面渲染 / 烟雾火焰**
> 更新：2026-10-26

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

- [[2026-10-21-FluidGen-Physics-Aware-Fluid-Video]] — 速度场监督 + 物理奖励 DPO（2026-10-19）
- [[2026-10-21-WildFireGS-3DGS-Forest-Wildfire-Simulation]] — 3DGS 原生粒子燃烧（2026-08-11）
- [[2026-10-21-FieryGS-In-the-Wild-Fire-Synthesis]] — MLLM 材质推理 + 体积燃烧（2026-04-30）
- [[2026-10-25-Flamescapes-Wildlandfire-Urban-Interface]] — SA2026 语义化燃料图 + 化学燃烧 + 体积渲染（**几何-视觉解耦**）
- [[2026-10-30-Flamelet-Closure-2D-Combustion]] — Vervisch/Hasse：flamelet **仅用应变率即可闭合，但至少需 3 个参数** → 火焰燃烧代理模型的输入特征数下限
- [[NVIDIA-GPUGems3-Fluids]] — 经典实现参考

### 🌊 表面流体 / 涡方法

- [[2026-10-25-Divisor-Dynamics-Surface-Fluid]] — SA2026 任意拓扑曲面点涡 + 因子类不变量（拓扑正确性）
- [[2026-10-30-DAVOF-Interface-Normal-Position-VOF]] — ⭐ **10-30 期最贴近渲染**：几何 VOF **单元内闭式**恢复界面法向与位置（额外面分数输运，**无需邻居/无需迭代**）；非结构网格渲染的界面输入契约；**寄生电流消除 = 液面着色稳定性**；已进 OpenFOAM 分支

### 💧 水 / 液体

- [[2026-10-16-Tessellation-Free-Displaced-Surfaces-Water-Caustics]] — 无细分位移面焦散
- [[2026-10-19-Make-It-Flow-Water-Animation-3DGS]] — 光流 → 3D Eulerian 运动场（静态 3DGS 水体动画，**免物理模拟**）
- [[2026-10-19-SplashSplat-Multi-View-Liquid-Reconstruction]] — 飞溅液体多视图重建
- [[2026-10-30-Broadband-Water-Wave-NLS]] — 宽频带实验验证 **NLS 推广形式**（打破窄带假设）→ 海洋"长波层"求解器的模型选择
- [[2026-10-30-Capillary-Wave-Turbulence-Finite-Systems]] — 毛细波级联动态范围 ∝ **μ^{8/3}** → 校核法线贴图频谱斜率
- [[2026-10-30-Capillary-Turbulence-Anisotropic-Kinetic]] — 各向异性终态 **因子化谱** n(k,φ) ~ k^-17/4·F(φ) → 定向海洋 FFT 谱构造（成本几乎不变）
- `2603.21695` RefracGS — 折射水面 + 3DGS 光线追踪（待收录）

### ⚙️ 求解器 / 数值格式（渲染上游）

- [[2026-10-26-Lanczos-Advection-Near-Orthogonal-SL-Reconstruction]] — SA2026 Lanczos 核近正交半拉格朗日重构（**能量保持 4.3×**，开销仅 1.3×，⭐ 本库工程性价比最高）
- [[2026-10-25-KPM-FR-High-Order-Flux-Reconstruction]] — SIGGRAPH 2026 矩空间 GKS + 通量重构（8G 解点/s，显存降 5×）
- [[2026-10-25-ML-Operator-Lexicon-PDE-Solvers]] — SA2026 ML 算子化 PDE 求解器（**可微管线**、矩阵自由、多重网格）
- [[2026-10-26-DiffPhD-Unified-Differentiable-Solver-Heterogeneous-Elastodynamics]] — SA2026 可微异质投影动力学（**100× 刚度对比仍收敛**、10× 加速、代码开源）
- [[2026-10-24-Fast-Subspace-Fluid-Simulation-DMD]] — 降阶谱方法
- [[2026-10-24-FluidFormer-Transformer-Continuous-Convolution-SPH]] — 局部-全局 Transformer SPH

### 🔧 可微物理 / 实时交互（渲染管线工程）

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

## 🔗 相关 Agent

- [[生菜]] — 渲染基础（光线追踪/全局光照）
- [[娃娃菜]] — 几何处理
- [[菜心]] — 流体力学（CFD/SPH/LBM 数值方法）