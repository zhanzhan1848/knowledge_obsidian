# 论文索引 (Papers MOC) — 菜心 / 流体力学

> 知识库：`~/knowledge-vault/caixin/01-Papers/` | 最近更新：2026-10-31
> 搜索源：arXiv `physics.flu-dyn`（⚠️ `cs.FL` 是形式语言分类，与流体无关，已停用）

---

## 2026-10

### 2026-10-31（本次收录：6 篇深度重写）

**VOF / 界面重构**
- [[2026-10-30-DAVOF-dual-area-volume-of-fluid-interface-normal]] — 面浸润面积分数作为输运状态 → 闭式单元内恢复法向与位置；plicRDF 在非结构网格不收敛，DAVOF 达舍入误差；一圈曲率收敛（参考实现零阶）⭐⭐⭐⭐⭐

**动理学稳定性**
- [[2026-10-30-kinetic-linear-stability-full-Boltzmann-collision]] — 首次用完整 Boltzmann 算子做剪切流稳定性；动能 Reynolds–Orr 方程；Orr–Sommerfeld 吻合 10⁻⁷；不存在能量稳定性 Re ⭐⭐⭐⭐⭐

**科学机器学习 / PINN**
- [[2026-10-30-PINN-buoyancy-nondimensionalization-failure-modes]] — 无量纲化决定成败：自由落体标度 B=1 误差 1.1%，热扩散标度 B=Ra·Pr 误差 650% 且发散；B² 梯度放大机理 ⭐⭐⭐⭐⭐
- [[2026-10-30-PINN-deep-lid-driven-cavity-regional-accuracy]] — 深腔 PINN 分区评估：速度偏差 5–8% 但涡量偏差 41–53%；腔底绝对 RMS 低至 1e-10U；压力 gauge 分解 ⭐⭐⭐⭐

**多相流 / 液滴**
- [[2026-10-30-VOF-drop-breakup-rotating-cylinders-plicRDF]] — 几何曲率 κ_F=d/R_i 改变破碎机制本身；Re_cr 随曲率下降但临界 L*_max 反而增大；伸长速率斜率 0.44→4.8 ⭐⭐⭐⭐

**域分解 / 可微分反演**
- [[2026-10-30-differentiable-Schwarz-solver-agentic-AI-inverse]] — 拉伸坐标 + 双向 Schwarz 耦合薄边界层；离散伴随硬约束反演；agent 扩充函数基库（75 epoch 达 0.152%）⭐⭐⭐⭐

---

### 2026-10-30（25 篇）

**湍流 / 波湍流**
- [[2026-10-30-arXiv-2610.40474-flamlet-closure-non-orthogonal-composition]] — 非正交组合空间中的 2D flamlet 闭包
- [[2026-10-30-arXiv-2610.40217-capillary-wave-turbulence-finite-systems]] — 有限系统中毛细波 Zakharov–Filonenko 谱的动态范围受限
- [[2026-10-30-arXiv-2610.40090-anisotropic-capillary-turbulence-kinetic-equation]] — 动理学方程框架下的各向异性毛细波湍流模拟
- [[2026-10-30-arXiv-2610.39123-supersonic-turbulent-curved-wall-triadic-cascade]] — 曲面壁超音速湍流边界层的三重能量级联
- [[2026-10-30-arXiv-2610.39348-liquid-metal-swirl-chaos-transition]] — 液态金属电池电极旋流的 RTN 混沌转变；Q_m 标度律 Re ~ Q_m^{2/3}
- [[2026-10-30-arXiv-2610.38011-optimal-seed-spontaneous-splitting-turbulent-puffs]] — 湍流团自发起裂的动力学路径

**多相流 / 界面**
- [[2026-10-30-arXiv-2610.39586-taylor-bubble-drop-assembly-rise-vertical-tube]] — Taylor 气泡-液滴组合体以孤立气泡速度上升
- [[2026-10-30-arXiv-2610.38679-broadband-water-waves-NLS-generalizations]] — 广义 NLS 描述宽频带水波实验
- [[2026-10-30-arXiv-2610.38493-inertial-flows-over-koch-leaf]] — Koch 叶型上的惯性流动
- [[2026-10-30-arXiv-2610.39064-dye-tracking-vortex-filament-geometry]] — 从涡几何定量测量流动：涡丝中心线追踪与能量/螺度计算

**流固耦合 / 稳定性**
- [[2026-10-30-arXiv-2610.39809-critical-level-wave-absorption-chaos-control]] — 临界层波吸收控制波-平均流系统的混沌
- [[2026-10-30-arXiv-2610.39000-benjamin-feir-suppression-constant-vorticity]] — 常涡度对 Benjamin–Feir 不稳定性的抑制
- [[2026-10-30-arXiv-2610.38033-detonation-cell-size-quasi-universal-scaling]] — 爆轰胞元尺度的拟普适标度
- [[2026-10-30-arXiv-2610.38107-tayler-instability-saturation-rotating-stars]] — Tayler 不稳定性及其在旋转恒星中的饱和

**降阶 / ROM**
- [[2026-10-30-arXiv-2610.40426-rom-constrained-flapping-wing-shape-optimization]] — ROM 约束的扑翼形状优化：推力 +37%，推进效率 +40%
- [[2026-10-30-arXiv-2610.39522-causality-informed-dynamic-mode-decomposition]] — Granger 因果信息正则化的 DMD（GC-DMD）

**涡分解 / 应力归因**
- [[2026-10-30-arXiv-2610.38743-reynolds-stress-attribution-nonorthogonal-vortex-representations]] — 局部非正交涡表示下雷诺应力归因的可辨识性极限
- [[2026-10-30-arXiv-2610.38612-zonal-flows-imbalanced-point-vortex]] — 非平衡点涡系统中的带状流涌现

**工程应用**
- [[2026-10-30-arXiv-2610.39780-curved-vortex-generator-finned-tube-heat-exchanger]] — 弯曲涡发生器几何优化强化水-空翅片管换热器传热
- [[2026-10-30-arXiv-2610.39003-agentic-ai-task-aware-sparse-view-ct-hemodynamics]] — Agentic AI 任务感知投影选择预测稀疏视图 CT 血流动力学

**实验 / 数据驱动**
- [[2026-10-30-arXiv-2610.37986-coarse-mesh-gnn-sparse-observables-unsteady-flows]] — 粗网格图神经网络预测参数化非定常流的稀疏可观测量
- [[2026-10-30-arXiv-2610.37860-deep-learning-pretraining-vocal-fold-segmentation-PIV]] — 深度学习预训练对声带分割（高速摄影）的影响

---

### 2026-10-29 之前

参见 `01-Papers/` 目录内按日期命名的笔记；代表性主题：
- **动理学稳定性**: [[2026-07-31-kinetic-linear-stability-theory-compressible-flows]]
- **PINN / 可微分**: [[2026-04-11-AegirJAX-differentiable-coastal-hydrodynamics]]、[[2026-04-09-bottom-topography-PINNs-adjoint]]、[[2026-08-21-PINN-granular-flows-inverse-modeling]]
- **LBM**: [[2026-08-06-2608-04191-Artificial-Compressibility-PINN-NS]]
- **多相流 / VOF**: [[2026-08-12-PINN-level-set-eikonal-3D]]、[[2026-04-02-PINNs-nonattracting-flow-oscillating-cylinder]]
- **域分解**: [[2026-10-17_arXiv-2610.20621_XPINN-Domain-Decomposition-Shock-Burgers]]

---

## 主题索引

### 数值方法
- **界面捕捉**: [[2026-10-30-DAVOF-dual-area-volume-of-fluid-interface-normal]]（VOF 闭式法向/位置）
- **域分解**: [[2026-10-30-differentiable-Schwarz-solver-agentic-AI-inverse]]、[[2026-10-17_arXiv-2610.20621_XPINN-Domain-Decomposition-Shock-Burgers]]
- **降阶模型**: [[2026-10-30-arXiv-2610.40426-rom-constrained-flapping-wing-shape-optimization]]、[[2026-10-30-arXiv-2610.39522-causality-informed-dynamic-mode-decomposition]]
- **稳定性理论**: [[2026-10-30-kinetic-linear-stability-full-Boltzmann-collision]]、[[2026-07-31-kinetic-linear-stability-theory-compressible-flows]]

### 科学机器学习
- **PINN 失败模式**: [[2026-10-30-PINN-buoyancy-nondimensionalization-failure-modes]]（无量纲化）、[[2026-10-30-PINN-deep-lid-driven-cavity-regional-accuracy]]（分区评估）
- **可微分求解器**: [[2026-04-11-AegirJAX-differentiable-coastal-hydrodynamics]]、[[2026-04-09-bottom-topography-PINNs-adjoint]]、[[2026-08-21-PINN-granular-flows-inverse-modeling]]
- **Agentic AI**: [[2026-10-30-differentiable-Schwarz-solver-agentic-AI-inverse]]、[[2026-10-30-arXiv-2610.39003-agentic-ai-task-aware-sparse-view-ct-hemodynamics]]
- **图神经网络**: [[2026-10-30-arXiv-2610.37986-coarse-mesh-gnn-sparse-observables-unsteady-flows]]

### 多相流
- [[2026-10-30-DAVOF-dual-area-volume-of-fluid-interface-normal]] — 界面重构精度
- [[2026-10-30-VOF-drop-breakup-rotating-cylinders-plicRDF]] — 曲率对破碎机制的影响
- [[2026-10-30-arXiv-2610.39586-taylor-bubble-drop-assembly-rise-vertical-tube]] — 气泡-液滴组合体
- [[2026-10-30-arXiv-2610.38011-optimal-seed-spontaneous-splitting-turbulent-puffs]] — 湍流团裂解

### 湍流
- [[2026-10-30-arXiv-2610.39348-liquid-metal-swirl-chaos-transition]] — RTN 路线
- [[2026-10-30-arXiv-2610.39123-supersonic-turbulent-curved-wall-triadic-cascade]] — 三重级联
- [[2026-10-30-arXiv-2610.40474-flamlet-closure-non-orthogonal-composition]] — 燃烧 flamlet 闭包
- [[2026-10-30-arXiv-2610.40217-capillary-wave-turbulence-finite-systems]] — 毛细波湍流
- [[2026-10-30-arXiv-2610.40090-anisotropic-capillary-turbulence-kinetic-equation]] — 各向异性波湍流

---

## 每日报告

- [[daily-search-report-2026-10-31-run2]] — 周末批次：9 篇笔记**技术细节补强**（求解器/网格/格式/边界条件）+ cs.FL 分类建议下线
- [[daily-search-report-2026-10-31]] — 6 篇深度重写 + cs.FL 分类误标更正
- [[daily-search-report-2026-10-22]] / [[daily-search-report-2026-10-21]] / [[daily-search-report-2026-10-20]]
- [[daily-search-report-2026-10-17]] / [[daily-search-report-2026-10-14]] / [[daily-search-report-2026-10-12]]

---

## 2026-10-31 补强要点（arXiv HTML/PDF 全文深挖）

| 论文 | 新增可复用内容 |
|---|---|
| [[2026-10-30-arXiv-2610.37376_Target-Omega-Interfacial-Turbulence-Damping]] | CLSVOF + 调和平均面粘度 + 局部壁律 Newton 反演（额外开销仅 **≈2.3%**）；Stäbler 液深 10.24 mm 算例可作回归测试 |
| [[2026-10-30-arXiv-2610.39522-causality-informed-dynamic-mode-decomposition]] | VAR(1) 条件 Granger + F 检验($d_2=T-r-1$) + BH-FDR($q{=}0.05$) + 行归一化权重 $C_{ij}$；**代码已开源** |
| [[2026-10-30-arXiv-2610.40426-rom-constrained-flapping-wing-shape-optimization]] | 全阶 KKT 内存瓶颈($B,C,D$ 尺寸) → 降阶后 $r$ 维块；降阶基用**并集而非 POD**；Algorithm 3 非定常灵敏度采集；**1.5 TB → 4 MB** |
| [[2026-10-30-arXiv-2610.39780-curved-vortex-generator-finned-tube-heat-exchanger]] | Fluent/SIMPLE/SST $k$–$\omega$ 共轭传热工作流；$y^+$ 0.99→0.26；UDF 迭代生成充分发展入口；CCD→回归→GA/NSGA-II 模板 |
| [[2026-10-30-arXiv-2610.39586-taylor-bubble-drop-assembly-rise-vertical-tube]] | `multiphaseInterFoam`/PIMPLE/VOF；**3° 楔形轴对称**（算力省 100×）；速度分布解析式 + TOMS 748 双根分支 |
| [[2026-10-30-arXiv-2610.39123-supersonic-turbulent-curved-wall-triadic-cascade]] | BASIC (2026.10) Python/GPU 求解器；11 点六阶中心差分 + 六阶滤波；显式五阶低存储 RK；网格 $2668{\times}384{\times}324$ |
| [[2026-10-30-arXiv-2610.39348-liquid-metal-swirl-chaos-transition]] | OpenFOAM/PISO 工作流；电势 Laplace 预计算 $\mathbf{J}$ + Bessel 洛伦兹力展开（**解耦技巧**）；**592 组算例** |
| [[2026-10-30-arXiv-2610.39386-helical-vortex-short-wave-nonlinear-dynamics]] | 柱坐标 6 阶紧致 + Fourier 谱；$565{\times}896{\times}256$；Frenet-Serret 局部坐标；基流冻结的动机 |
| [[2026-10-28-arXiv-2610.37577_ATF-Flame-Thickening-TD-Unstable-Hydrogen]] | PeleLMeX AMR 低马赫数反应流；LES 80% 解析度判据（$\Lambda_{\mathrm{f}}^{F}\approx1$）；Peters 褶皱插值 |
