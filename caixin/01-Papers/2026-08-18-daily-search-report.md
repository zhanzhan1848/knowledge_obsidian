# 每日论文搜索报告 — 2026-08-18

**搜索范围**：arXiv physics.flu-dyn, cs.FL  
**时间窗口**：最近 48 小时（2026-08-16 ~ 2026-08-18）  
**关键词**：CFD, fluid simulation, Navier-Stokes, SPH, LBM, vortex method, turbulence

---

## 统计概览

| 类别 | 数量 |
|------|------|
| physics.flu-dyn 新提交 | 30 篇（2 天） |
| 相关交叉列表 | ~15 篇 |
| **核心关键词匹配** | ~13 篇 |

---

## 📌 重点论文索引

### 🔬 数值方法类

| arXiv | 标题 | 标签 |
|-------|------|------|
| [2608.13437](2026-08-18-2608.13437-LBM-Compressible-NS-Symbolic.md) | LBM for Compressible NS-Fourier (符号编译器自动推导) | #LBM #compressible |
| [2608.14883](2026-08-18-2608.14883-PINN-AUGMENTED-SUPG-HighSpeed-Flows.md) | PASSC: PINN+SUPG 高速可压缩流 | #PINN #SUPG #FEM |
| [2608.14310](2026-08-18-2608.14310-CAV-Vanka-Immersed-Boundary.md) | CAV 多重网格预处理隐式浸入边界 | #immersed-boundary #multigrid |

### 🤖 AI+CFD 类

| arXiv | 标题 | 标签 |
|-------|------|------|
| [2608.14744](2026-08-18-2608.14744-Iterative-Refinement-Diffusion-DA.md) | 迭代精化扩散模型用于 Kraichnan 湍流同化 | #diffusion #turbulence #DA |
| [2608.13629](2026-08-18-2608.13629-PI-DeepONet-Aneurysm.md) | M3PI-DeepONet 用于动脉瘤血流 | #DeepONet #hemodynamics |

### 🌊 湍流与多相流类

| arXiv | 标题 | 标签 |
|-------|------|------|
| [2608.16683](2026-08-18-2608.16683-Intermittent-Turbulence-Gravity-Currents.md) | 倾斜重力流间歇湍流 (DNS) | #DNS #intermittency |
| [2608.13788](2026-08-18-2608.13788-Resolvent-Laminar-Separation-Bubble.md) | LSB 中跨频放大机制 | #resolvent #LSB |
| [2608.16862](2026-08-18-2608.16862-Volume-Preserving-Lagrangian-Averaging.md) | 保体积拉格朗日平均 | #Lagrangian-averaging #GLM |
| [2608.14346](2026-08-14-2608.14346-Optimal-Mixing-Shell-Model.md) | shell 模型中最优混合长期行为 | #advection-diffusion #mixing |
| [2608.15835](2026-08-16-2608.15835-Compressibility-Wake-Transition-Aircraft.md) | 可压缩性驱动的货机尾体绕流转变 | #LES #compressible #wake |

### 🧪 多相流类

| arXiv | 标题 | 标签 |
|-------|------|------|
| [2608.16750](2026-08-17-2608.16750-Diffuse-Interface-Compressible-TwoPhase.md) | 可压缩两相流的扩散界面方法 (7-方程模型) | #diffuse-interface #two-phase |
| [2608.15941](2026-08-16-2608.15941-Phase-Field-Solidifying-Droplet.md) | 凝固金属滴撞击的相场框架 | #phase-field #solidification |
| [2608.15781](2026-08-16-2026-08-18-2608.15781-LBM-Bijel-Reactive-Flow.md) | LBM 模拟 bijel 反应流 | #LBM #color-gradient #bijel |
| [2608.12868](2026-08-13-2026-08-18-2608.12868-LBM-Electric-Droplet-LIS.md) | 电场驱动液滴的 LBM | #LBM #electrohydrodynamics |
| [2608.12554](2026-08-13-2608.12554-Deformable-Droplet-Turbulence.md) | 湍流中变形液滴的弥散与聚集 | #turbulence #droplet-deformation |

### 💨 燃烧与化学反应流

| arXiv | 标题 | 标签 |
|-------|------|------|
| [2608.15586](2026-08-16-2608.15586-Filtered-Turbulent-Flame-Model.md) | FTFM 褶皱修正 | #turbulent-combustion #flamelet |
| [2608.14445](2026-08-14-2608.14445-Hypersonic-Catalytic-Surfaces.md) | 高超声速催化壁面数据驱动建模 | #hypersonic #ROM #catalytic |

---

## 💡 关键趋势观察

### 1. LBM + 复杂多物理场持续活跃
本周出现 3 篇 LBM 相关论文：可压缩 NS 方程（符号推导）、bijel 反应流（颜色梯度 + 中心矩）、电场驱动液滴。LBM 在介观尺度多物理场模拟中仍是主流方法之一。

### 2. AI+CFD 走向实用化
迭代精化扩散模型在 Kraichnan 湍流上达到 0.184 RMSE + 36× 加速；M3PI-DeepONet 用 0.3% 标签数据实现 AAA 血流预测。这些成果表明 AI 方法正在从概念验证走向可工程应用。

### 3. 浸入边界 + 多重网格方法进步
CAV-FGMRES 为隐式浸入边界提供首个稳健的多重网格预处理方案，迭代次数在网格细化下保持稳定（8.6→9.5）。

### 4. 湍流间歇性新机制
倾斜重力流的延迟-微分模型揭示了剪切产生-耗散延迟如何导致间歇性转变，对湍流建模和转捩预测有参考价值。

---

## 📝 创建笔记清单

- [x] 2026-08-18-2608.13437-LBM-Compressible-NS-Symbolic.md
- [x] 2026-08-18-2608.14883-PINN-AUGMENTED-SUPG-HighSpeed-Flows.md
- [x] 2026-08-18-2608.15781-LBM-Bijel-Reactive-Flow.md
- [x] 2026-08-18-2608.12868-LBM-Electric-Droplet-LIS.md
- [x] 2026-08-18-2608.14744-Iterative-Refinement-Diffusion-DA.md
- [x] 2026-08-18-2608.13629-PI-DeepONet-Aneurysm.md
- [x] 2026-08-18-2608.14310-CAV-Vanka-Immersed-Boundary.md
- [x] 2026-08-18-2608.16683-Intermittent-Turbulence-Gravity-Currents.md
- [x] 2026-08-18-2608.13788-Resolvent-Laminar-Separation-Bubble.md
- [x] 2026-08-18-2608.16862-Volume-Preserving-Lagrangian-Averaging.md

---

*由 鲜毛肚 (Xianmaodu) 自动生成于 2026-08-18 14:07 UTC*
