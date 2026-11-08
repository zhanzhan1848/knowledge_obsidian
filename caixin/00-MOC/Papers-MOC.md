# 论文索引 (Papers MOC) — 菜心 / 流体力学

> 知识库：`~/knowledge-vault/caixin/01-Papers/` | 最近更新：2026-11-08
> 搜索源：arXiv **列表页** `arxiv.org/list/<cat>/new`（⚠️ `cs.FL` 是形式语言分类，与流体无关，**已连续 5 轮确认为误标，建议从配置移除**）
> ⚠️ **检索路径**：必须用**列表页**判定最新批次；`export.arxiv.org` API 的 `published` 字段**滞后一天**，单用 API 会漏收整批论文（2026-11-01 已修正）
> 🟢 **建议加入 `math.NA`**（2026-11-07 命中 6 篇，质量最高）；`physics.comp-ph`/`cs.CE`/`math-ph` 亦有稳定高质量命中
> 🔧 **去重必须固化**（2026-11-08 发现）：周末 arXiv 不发批次，连续多轮候选池重叠（11-06 收 24 / 11-07 收 12 / 11-08 初筛 30 → 仅 9 新增）；建笔记前须先扫 `01-Papers/` 建 arXiv ID 集合比对

---

## 2026-11

### 2026-11-08（本次收录：**9 篇**，批次 Fri 6 Nov 2026；周末 arXiv 不发布新批次）

> ⚠️ **跨批次去重发现**：本轮初筛命中 30 篇，其中 **21 篇已在 11-06 / 11-07 入库**（`cs.FL` 0 篇）。已删除全部重复笔记，仅保留 9 篇真正新增。**建议把去重逻辑固化进流程**（见报告内 `dedup.py` 建议代码）。

**⭐⭐⭐⭐⭐ 动力学理论**
- [[2026-11-08-arXiv-2611.07999-Hypocoercivity-for-a-thermostatted-Boltzmann-equation]] — 恒温器 Boltzmann **谱隙上下界**；识别**亚 hypoelliptic** 参数区（谱隙幂律退化至零，宏观流体极限失效）；谱隙 ∝ Kn²；**可用作 kinetic 求解器数值耗散的「安全阈值」** ⭐⭐⭐⭐⭐

**⭐⭐⭐⭐⭐ AI for CFD（可信度范式）**
- [[2026-11-08-arXiv-2611.07387-Projection-based-segregated-iterative-and-multi-stage-physics-informed-neural-ne]] — **投影解耦 + 多阶段课程** PINN 求解不可压 N-S；速度-压力分块迭代；Re=10⁴ 圆柱绕流 L2 误差 **~1%**、卡门涡频误差 **<3%**；训练快 2-5× ⭐⭐⭐⭐⭐
- [[2026-11-08-arXiv-2611.07231-Efficient-Projection-Based-Reduced-Order-Modeling-for-Computational-Fluid-Dynami]] — **多保真基 + Galerkin 投影** ROM；同等高保真样本下气动系数误差低 **2-5 倍**；评估提速 **3-4 个数量级**（3-4 个数量级）⭐⭐⭐⭐
- [[2026-11-08-arXiv-2611.07458-Physics-informed-latent-conditional-flow-matching-for-generative-modeling-of-gra]] — **物理信息潜空间流匹配**生成连续流场；连续性 + 摩擦边界软约束；DEM 真值 L2 误差 5-10%；推理提速 **4-5 个数量级** ⭐⭐⭐⭐

**⭐⭐⭐⭐ 海洋 / 大气观测**
- [[2026-11-08-arXiv-2611.07969-Estimating-Vertical-Ocean-Velocity-from-Horizontal-Currents-Linear-and-Depth-Con]] — **深度条件化**共享网络反演垂向流速；单网络覆盖全剖面；RMSE 显著优于线性模型与 OI；32 页 14 图 6 表 ⭐⭐⭐⭐
- [[2026-11-08-arXiv-2611.08148-Detecting-Weather-Fronts-from-Satellite-Observations-What-Does-Reanalysis-Add]] — 卫星锋面检测；ERA5 作伪标签弱监督；再分析提高完整性但**削弱弱锋面** ⭐⭐⭐⭐
- [[2026-11-08-arXiv-2611.07910-Inertial-sub-range-detection-and-characterization-for-ground-layer-turbulence-at]] — 望远镜台址**地面层湍流惯性子区**分离（scintillometer + 多层超声风速塔）；占视宁度 **30-50%** ⭐⭐⭐⭐

**⭐⭐⭐ 双曲守恒律 / 统计物理**
- [[2026-11-08-arXiv-2611.08292-Overcompressive-shocks-in-a-2times2-hyperbolic-system-of-conservation-laws]] — 2×2 双曲系统**过压缩激波**允许条件（特征场退化）；完整波型相图；标准捕捉格式在此失效 ⭐⭐⭐
- [[2026-11-08-arXiv-2611.08038-The-stochastic-Ginzburg-Landau-equation-with-harmonic-potential-in-the-full-subc]] — 随机 GL（模型 B）**亚临界区完整解析解**；临界点**对数修正**（长期未决）；与 MC 定量一致 ⭐⭐⭐

**方法论观察**：3 篇 AI 论文同属一范式 —— **把物理结构编入求解器/模型本身，而非事后修正**（投影法入 PINN、Galerkin 入 ROM、守恒律入生成模型）。配合谱隙阈值，共同主张「可信度来自结构性保证，而非拟合精度」。

---

### 2026-11-07（本次收录：12 篇，批次 Thu 5 Nov 2026 残余；周末 arXiv 不发布新批次）

**⭐⭐⭐⭐⭐ 湍流建模 / 数据驱动闭合**
- [[2026-11-07-arXiv-2611.07582-BKAN-Bayesian-Reynolds-stress]] — **首次把「可解释性」与「可信不确定度」放进同一个 RANS 闭合**；KAN 边函数=可学习样条（可符号蒸馏）+ 张量基硬约束不变性/对称/无迹 + realisability 仅软正则；局部重参数化使样条输出本身为高斯；Periodic hill RMSE **0.046±0.001**，BKAN ECE **0.06** vs 宽 BNN 0.13（容量↑精度不变但校准变差）；⚠️ **几何外推下过度自信**（epistemic 增大但不足以覆盖误差，under-coverage）⭐⭐⭐⭐⭐

**⭐⭐⭐⭐⭐ 数值方法 —— 预条件与刚性求解**
- [[2026-11-07-arXiv-2611.08402-hybrid-PIC-preconditioned-quasi-Newton]] — **混合 PIC 隐式能量守恒 + Hall-MHD 物理预条件子 + 解析质量矩阵(AMM)**；Krylov 迭代 **357→~6**，前 25 步每步时间 **↓186×**（vs 未预条件 JFNK）；AMM 仅 4 值/节点且**无粒子循环**、**不破坏守恒性**；显式需 **40× 更小步长 + 9× 墙钟**才达同等能量误差；容差 $10^{-13}$ 下能量到舍入、动量到 $10^{-9}$（Alfvén 单位）；WarpX/AMReX 实现 ⭐⭐⭐⭐⭐
- [[2026-11-07-arXiv-2611.08429-Stokes-preconditioning-Radau-IIA-weighted-DG]] — 时间依赖 Stokes 的 **FOV 等价预条件子**，常数**与粘性/步长/网格无关**；**可直接抄的 Radau IIA 权重表**（2 级 0.51216588/0.11995468；3 级 0.29272466/0.29076228/0.04863362）；$C_r$ 的 $\lambda_{\min}$ 表显示 **$s\le7$ 用 $\hat W=W$ 即可，$s\ge8$ 转负需另选**；块对角（每级一块）；NGSolve+NETGEN+ngsxfem ⭐⭐⭐⭐⭐

**⭐⭐⭐⭐ 自由表面 / 多孔介质**
- [[2026-11-07-arXiv-2611.07360-energy-conserving-shallow-water-capillary]] — 浅水+毛细**完全离散能量守恒**：缩放深度梯度增广（二次毛细能→凸熵）+ 能量守恒两点通量 + SBP + CN 型时间离散；**非分裂**双曲/毛细（既有分裂格式尚无严格证明）；二次模型二阶、非线性趋近二阶；能量到机器精度；步长由**双曲 CFL** 决定（不受色散限制）；液态金属包层动机 ⭐⭐⭐⭐
- [[2026-11-07-arXiv-2611.08169-semi-implicit-shallow-water-sphere]] — 球面浅水二阶半隐式投影：DG-upwind SSPRK3 + $H(\text{div})$ 一致隐式 + hybridisation；**三步对称分裂**（显式半步→完整对流步→隐式半步含投影）保二阶；稳定性**仅受对流 CFL 约束**，超限可**子循环且不增隐式求解**；Williamson 5 / Galewsky 斜压不稳定；Courant~1（2 子循环）；Firedrake ⭐⭐⭐⭐
- [[2026-11-07-arXiv-2611.08276-HVEM-Richards-variably-saturated-flow]] — Richards 方程**质量守恒混合 VEM**：仅节点水头为全局自由度，单元内凝聚 Darcy 通量（无散部分+特定线性散度场）→ **逐单元水量平衡恒等成立**（任意迭代/任意步长）；**无需稳定化参数**（无散场取按旋转排序的调和多项式，给出参数个数闭式规则）；**Kirchhoff 平均传导率**→静水平衡与重力排水任意网格精确；单元算子全化边界积分；分层边坡 cut grid 用 **40% 节点**达均匀网格 2 倍加密精度 ⭐⭐⭐⭐

**⭐⭐⭐⭐ 高维动理学 / 低秩**
- [[2026-11-07-arXiv-2611.07107-low-rank-Vlasov-6D]] — **首个以 PDE 物理可观测量（而非纯矩阵量）驱动秩选择**的 HPC 低秩自适应策略；三种判据 `df`/`ef`(电场)/`ee`(电场能量)；升秩则**拒绝当前步并重启**；只存 rank $r$ 对象、GPU 友好；对比自适应 BUG：**内存更省、墙钟 ↓**（GPU 上积分 452→373 s）；线性/非线性 Landau 阻尼、两流、峰尾不稳 ⭐⭐⭐⭐
- [[2026-11-07-arXiv-2611.07364-APTNN-high-field-kinetic]] — 3D3V 高场动理学（VPFP）的**渐近保持张量神经网络**：CP 分解且**残差保持分解形式**→高维损失积分可按维求值（成本**指数→多项式**）；**增强 AP loss 加入一阶矩方程**直接约束极限通量闭合；3D3V 多随机输入**单 GPU 训练 <30 min** ⭐⭐⭐⭐

**⭐⭐⭐ 理论 / 其他**
- [[2026-11-07-arXiv-2611.07981-SSP-bound-RK-AI-assisted-proofs]] — 非负系数 RK 三定理：**二阶隐式 SSP 系数 ≤ 2s（锐）→ 全隐式相对 DIRK 无优势**（解决 Ketcheson-Macdonald-Gottlieb 猜想）；**三阶 + 非负系数 → 不可能代数稳定**（排除性判据）；AI 发现 **SSP Butcher 矩阵 ↔ phase-type 分布**关系 ⭐⭐⭐
- [[2026-11-07-arXiv-2611.06945-dissipative-spin-hydrodynamics]] — 完美自旋流体动力学的耗散扩展；能量-动量张量**反对称部分**两重效应（自旋张量源项→自旋-轨道交换；进入能量/线动量守恒律）；IS 动力学趋向局部平衡**先过 NS 区**；NS 框架因引入**一阶以上导数**而破坏方程结构 ⭐⭐⭐
- [[2026-11-07-arXiv-2611.08084-OPENSC2-winding-pack-quench]] — 开源 **OPENSC²** 扩展：匝间**横向导热**（破 1D 横向绝热）+ 3D 场分辨电流分配温度/感应损耗 + **集总水力网络**（传输线模型 + 场-网络耦合，借鉴电场-电路耦合）；W7-X 2006 试验验证：**出口温度误差 55 K → 12 K**，复现相邻绕组经入口**流量反向**加热 ⭐⭐⭐
- [[2026-11-07-arXiv-2611.07985-boundary-preserving-RNN-Poisson]] — Poisson 的**硬边界**随机神经网络：线性提升精确满足 Dirichlet、**无需平衡边界/内部罚权重**；广义重心坐标+超限插值（多面体）+径向参数化（星形曲线域）⭐⭐⭐
- [[2026-11-07-arXiv-2611.07781-Z-Grammars-credible-grade-semiring]] — ⚠️ **cs.FL 误标，与流体无关**（Z-number 加权文法/自动机）；第 4 轮确认，建议下线该分类 ⛔

---

### 2026-11-05（本次收录：23 篇，批次 Thu 5 Nov 2026 = 18 新提交 + 5 交叉，全部收录）

**⭐⭐⭐⭐⭐ 数值方法 / 精度（本日重头）**
- [[2026-11-05-arXiv-2611.05365-FP32-wider-state-time-integration]] — **FP32 存储状态舍入 = $\propto1/\Delta t$ 强制项，与截断误差反向 → 加密网格反而放大误差**；折返步长 $\Delta t^*=(k_R/pk_\tau)^{1/(p+1)}$，$E_{\min}\propto k_R^{p/(p+1)}$；**双 FP32 未求值和状态**（无需 FP64 算术、不改写格式）→ 恢复设计阶收敛；NASA 求解器 SSPRK(3,3)+CFL≈1，**544M 单元高升力机翼：FP32 升力 +2.1%/+4.5%/+7.7%，双浮点 ≤0.3%**；B200/MI355X FP64 1/2、Rubin 1/4、**Blackwell Ultra 1/64** ⭐⭐⭐⭐⭐
- [[2026-11-05-arXiv-2611.05428-Rosenbrock-regularized-Stokeslet]] — MRS 刚性 ODE 首次用 ROS；**加速 20–2000 倍**；**标度律 $\rho(J)\approx0.35S_C\epsilon^{-4}$**（弯曲刚度线性、细长比四次方反比）；TLJ 只在 $1,k+1,2k+1,\ldots$ 算 Jacobian（ROW1 再快 30/35 倍）；AD(JAX) Jacobian 比 FD 快 2 倍、10 位精度快 40 倍；ERK 需 $2\times10^6$ 步/鞭毛周期 ⭐⭐⭐⭐⭐
- [[2026-11-05-arXiv-2611.06407-LBM-mushy-layer-sea-ice]] — **link-based VOP**（相变速率逐链路求解，解析方向依赖）+ **广义 Robin 边界**（2D→3D D3Q19、适用区间扩到整个单元跨度；一阶~二阶收敛）；Stefan 验证 200×10；$Da=B\Delta TL/D$；应用海冰盐水通道糊状层 ⭐⭐⭐⭐⭐
- [[2026-11-05-arXiv-2611.06239-packed-bed-mixing-LBM]] — **有限时间混合由剪切变形主导、指数拉伸仅次要**（修正经典认知）；$\sigma_c^2\sim\mathrm{Pe}^{-\alpha/(2\alpha+1)}t^{-1/2}$；表面 $\sigma_s^2\propto(\gamma^*\mathrm{Pe})^{-\alpha/[2(\alpha+1)]}$（推广 Aquino 2023 到 $\alpha\approx2$）；D3Q19+`lbdm`、**$7.5\times10^7$/$1.31\times10^8$ 体素、$\Delta x/d\approx1/40$、Pe≈280、Re=0.5、500 轨迹 RK3 + Protean 坐标系** ⭐⭐⭐⭐⭐
- [[2026-11-05-arXiv-2611.06733-poroelastic-FEM-dissipative-interface]] — 混合理论（非 Biot）+ **ALE** + 耗散界面；**FE 空间 P2/P2/P1（+界面 P1）**；COMSOL + **MUMPS** + 变阶 BDF；MMS 验证 5 级均匀加密 $h=2.5$mm；Yeoh 超弹性网格运动；耗散项惩罚**过滤速度跳跃** $\mu_{\mathcal S}$ ⭐⭐⭐⭐

**⭐⭐⭐⭐ 多相流 / 界面力学**
- [[2026-11-05-arXiv-2611.06882-odd-capillarity-CHNS]] — **宇称奇毛细应力** $\Sigma^{\text{odd}}_{ij}=\frac32e\sigma\epsilon[\epsilon_{ik}\partial_k\phi\partial_j\phi+\epsilon_{jk}\partial_k\phi\partial_i\phi]$；$\mathbf{f}^{\text{odd}}=2\chi\hat e_z\times\mathbf{f}^{\text{even}}$；**$P^{\text{odd}}$ 是唯一净能量注入**（$\chi=2$ 粗化停滞、$\chi=4$ 组分超均匀 + 液滴停滞）；1024² 伪谱 + **ETDRK2** + CUDA/H100；$\langle P^{\text{odd}}\rangle\sim\chi^{1.45}$、偶/奇比 $10^{-2}$、Re 仅 0.20–0.28 ⭐⭐⭐⭐⭐
- [[2026-11-05-arXiv-2611.06464-microdroplet-uncertainty-inverse-design]] — Basilisk **VOF + AMR**（小波误差引导，$\alpha$ 阈值 $10^{-3}$、$\mathbf{u}$ $3\times10^{-2}$）；**二维轴对称降维**；committee disagreement 定位流态边界不确定区 + 物理引导富化；PSO 约束逆设计；396 例（96/121/179）；0–3% 误差占比近翻倍 ⭐⭐⭐⭐
- [[2026-11-05-arXiv-2611.05575-mafic-enclaves-magma-mingling]] — 96 例二维 Level-Set；$\mu_r=10^{-6}$–$10^{-3}$、$\mathrm{Ca}=10^6$–$8\times10^9$、Bo $3.5/9.8\times10^6$、Re<0.02；**$\mathrm{Ca}/\mathrm{Bo}\approx1$ 分离下沉 vs 剪切主导**（转变区间随限位移动）；六种结果分类 ⭐⭐⭐

**⭐⭐⭐⭐ 湍流 / 实验**
- [[2026-11-05-arXiv-2611.06825-propeller-HIT-interscale-energy]] — 螺旋桨 HIT 装置；**KHM 框架不假设各向同性** → **纯正向级联贯穿全尺度空间**（其他强迫方式逆/正级联共存）；弱平均流 → Taylor 冻结失效 → **实验验证 Tennekes 欧拉频率谱**；SPIV $\Delta x=0.69$mm、7250 图对、**$2.5\leq\Delta x/\eta\leq6$**（LEPIV 修正）；5 工况 $Re_\lambda$ 225–352 ⭐⭐⭐⭐
- [[2026-11-05-arXiv-2611.06834-Kolmogorov-similarity-shear-thinning]] — **Kolmogorov 第一相似性假设在剪切变稀流体中成立**（实验证实 Rosti JFM 1012 R5 2025 的数值结论）；Carbopol 0.04%/0.05%（$n=0.719/0.584$，$\tau_y=0.055/0.214$ Pa，$K_\mu=0.136/0.468$）；平均粘度 + 平均耗散率归一化 → 二三阶结构函数塌缩 ⭐⭐⭐⭐
- [[2026-11-05-arXiv-2611.06354-porous-high-frequency-boundary-layers]] — 多孔介质高频渐近**逐阶展开**（80 页）；WKB + 非奇异条件 + 位位移流 Neumann 问题；$\Sigma$ 负 ↔ 孔尺寸平行无序、**三阶项大而正 ↔ 流动路径强收缩/扩张**；热参数退化为纯几何（积分平均曲率、Willmore 度量）；锐边 $\varepsilon^w$ 奇异项抵消 → 有限 knife-edge 律 ⭐⭐⭐⭐

**⭐⭐⭐⭐ ML / 数据驱动**
- [[2026-11-05-arXiv-2611.06912-FlowReconBench-sparse-sensor-reconstruction]] — 10 学习 + 5 经典方法 × 3 regime；**OpenFOAM 9 圆柱尾流 12 块 O-grid 23,800 单元、Re 60–250、St 0.143–0.206（差 1–6%）**、Kolmogorov 流、JHTDB $125^3$×4（$Re_\lambda\approx418$）；**经典（线性随机估计/gappy POD/IDW）在低阶+稠密传感强，学习法在稀疏/不可观测时胜**；CRPS 与误差给出**不同排名**；可查询法内存平、全网格法 OOM ⭐⭐⭐⭐
- [[2026-11-05-arXiv-2611.05577-readable-not-steerable]] — **"可读"≠"可操纵"**；预注册三项研究：JEPA **不支持**（非物理 JEPA 与静态模型打平或更好）、AE **部分支持**（enstrophy $|r|$ 0.80–0.86 vs 0.38，但 VICReg 削弱该突出度）、dial **部分支持**（响度旋钮 8/8、形状旋钮 3/5 < 门槛 4）；$\sigma_{\text{shape}}\geq0.7$（形状）$/\leq0.2$（响度）；**70 GPU 小时**，全部预注册/代码公开 ⭐⭐⭐⭐
- [[2026-11-05-arXiv-2611.05780-pi-former-dimensionless-learning]] — π-former 从 **1,288 个已建无量纲群**学关联与指数赋值模式；量纲约束下提出基本群 + 组合优化；7 个物理问题数秒内识别无量纲坐标；接入方程发现表达随工况变化的系数；蒸发驱动润湿实验 → 统一轨迹方程并跨液体泛化 ⭐⭐⭐
- [[2026-11-05-arXiv-2611.05691-PINN-turbine-blade-inverse-design]] — **压力同伦交替 PINN**（3 子步：流场适应 1000 步 $w_p{=}30/w_w{=}1$ → 冻结场几何更新 300 步 $1.5/40$ → 流场重锚 500 步 $7.5/15$）；10 周期 18,000 步 Adam，$\alpha_c=\min(0.2c,1)$；LS89 叶栅 28 目标点 → **PS/SS RMS 误差 1.13%/2.21%**；SharC 黏性独立验证复现实验趋势；网络 3×20 tanh；**Euler 逆 + 黏性验证** ⭐⭐⭐⭐

**⭐⭐⭐ 其他**
- [[2026-11-05-arXiv-2611.06749-Pearson-IV-drift-diffusion]] — Pearson IV = 线性漂移+二次扩散 FPE 的定常解；**重尾 ← 扩散局部非线性曲率；不对称 ← 扩散梯度**；**对称线性恢复漂移也能产生不对称定常涨落**；显式 CDF/矩递推/偏度/峰度/众数 ⭐⭐⭐
- [[2026-11-05-arXiv-2611.05639-hypersonic-grazing-particle-receptivity]] — HIFLIER Mach 6；**掠飞粒子穿入不足半层即产生与撞壁粒子相当的波包**；多尺度渐近 + 临界层解释（伴随模态流向动量最大）；**不需直接撞击即可激发显著稳定性波** ⭐⭐⭐
- [[2026-11-05-arXiv-2611.05610-biofilm-hydrogen-fracture]] — 生物膜使**表观渗透率降 65%**；两类机制（Type I 非单调：粗糙度涡先限制后被生物膜抑制；Type II 单调：输运阻力+微生物消耗）；**$Re_D=u\sqrt{K_0}/\nu$** 判别 ⭐⭐⭐
- [[2026-11-05-arXiv-2611.05732-protoplasmic-streaming-Finsler-Couette]] — Langevin+Navier–Stokes + **Finsler 几何**（IDOF 驱动相互作用强度）；速度剖面线性 + 分布峰值结构与**激光光散射实测一致**；剪切变稀 + 边界区粘度最小 ⭐⭐⭐
- [[2026-11-05-arXiv-2611.06317-Miles-wind-wave-approach]] — Miles 风浪理论简化为可用函数形式；**计入完整波谱后并不低估增长率**（纠正普遍误解）；推广到复杂水动力情形直接 ⭐⭐⭐
- [[2026-11-05-arXiv-2611.06467-IR-imaging-vapor-concentration]] — 红外吸收成像测蒸气摩尔分数；Hele-Shaw 基准，**30.5 μm/pixel**；仅用端点浓度 + 区间长度的 Stefan 预测做盲对比（**不拟合内部数据**）；n-pentane 分辨非线性 Stefan 剖面，n-hexane/heptane 趋线性扩散极限 ⭐⭐⭐
- [[2026-11-05-arXiv-2611.05880-KHI-driven-dynamo-BNS]] — BNS 并合 KHI 驱动发电机；Re→∞ 极限：平均垂直场立即播种、运动学增长率渐近、$\mathcal{O}(0.1$ ms) 脱离运动学阶段达磁星强度；**警示：多数全局 BNS 并合模拟未解析正确发电机机制** ⭐⭐⭐
- [[2026-11-05-arXiv-2611.05554-Stroh-Hamiltonian-poroelastic]] — Stroh 六次式 ↔ 正则 Hamiltonian 结构 → 推广到 Biot 孔弹性；不可压固体 + 无压力梯度 + 完美排水 + **忽略耗散**（作者明确列出四条限制） ⭐⭐⭐

---

### 2026-11-04（本次收录：13 篇，批次 Wed 4 Nov 2026 = 9 新提交 + 4 交叉）

**数值方法 / 高阶格式**
- [[2026-11-04-arXiv-2611.05095-compact-ALE-GKS-unstructured]] — 三维非结构网格紧致高阶 ALE 气体动理学格式；最小二乘二次多项式重构（$a_{12}=(b_2+c_1)/2$，1 个 $3\times3$ 矩阵 + 4 次最小二乘）；GENO + 梯度压缩；**重映射无关的直写 ALE**；两段四阶推进；CUDA+MPI；⚠️ 分布函数更新实际仅三阶 ⭐⭐⭐⭐⭐
- [[2026-11-04-arXiv-2611.04606-history-kernel-finite-Re-sphere]] — 有限 Re 历史核 $K(s,\mathrm{Re})$（**Re 取源时刻**）；Leibniz 项靠加速/减速 ramp 外推消去；高 Re 中等滞后**非单调**（边界层/尾流延迟）；轴对称 FEM $P_1P_1$+BDF2+PARDISO，Re 0.2–200 ⭐⭐⭐⭐⭐
- [[2026-11-04-arXiv-2611.04622-diffuse-interface-kinetic-model]] — 弥散界面动理学模型 DIKM：单网格单方程 + 局部化分子通量算子 + 任意吸收概率 $\beta$；**匹配渐近证明**锐界面极限；运动壁牵引分离吸收质量携带动量；Strang 分裂 DUGKS ⭐⭐⭐⭐⭐
- [[2026-11-04-arXiv-2611.04443-FAI-ablation-DNS-Mach8]] — Mach 8 压缩斜坡烧蚀 DNS；**INCA+CHAMPS 双求解器交叉验证同一 GSI 模型**；Knudsen-Langmuir 升华 + 壁面能量平衡；凹坑加速仅作用于几何；CFL 0.5 五阶 WENO ⭐⭐⭐⭐

**数据同化 / ML / 逆问题**
- [[2026-11-04-arXiv-2611.04795-EnKF-Rayleigh-Benard-reconstruction]] — EnKF 数值验证 Charney 猜想；BO 区谱律 $E_u\sim k^{-11/5}$；卡尔曼增益上半部 $\hat\Sigma_{\omega\theta}$ 是温度→涡量通道；观测够频时温度估计**比观测本身更准**；附录 A 能量论证解释 DR 失败 ⭐⭐⭐⭐⭐
- [[2026-11-04-arXiv-2611.04270-SSH-to-velocity-ML-SWOT]] — U-Net 从 SSH 预测速度（50 m RMSE 0.049 m/s，**-29%**）；**标准 U-Net 与地转近似无异**（负面发现）→ 须靠 4 项策略泛化；涡度相关 0.93 / 辐散度 0.66；**谱能量通量**显示地转近似错误表征级联 ⭐⭐⭐⭐
- [[2026-11-04-arXiv-2611.04007-tensegrity-prestress-PINN-identification]] — PINN 逆问题：约束笛卡尔坐标 → 力密度**线性进入**残差 → 灵敏度闭式 → **Fisher/CRLB 前置可辨识性分析**；softplus 只受拉 vs Fischer-Burmeister；实测 13 预应力水平吻合 2.9% RMS ⭐⭐⭐⭐

**湍流理论 / 统计**
- [[2026-11-04-arXiv-2611.04706-designing-turbulence-hierarchies]] — 摆链层级复现湍流奇异特征（**无需不可压缩/涡拉伸**）；精确通量 $\Pi_k$；耗散异常 $\bar\epsilon\to0.34$（黏性跨 10 数量级）；统计局部 $|\langle Q_{k,k+n}\rangle|\propto2^{-n}$；隐藏尺度对称性；**级联正则性可调** $h_c=(1-\alpha)/3$ ⭐⭐⭐⭐⭐
- [[2026-11-04-arXiv-2611.05282-Lagrangian-irreversibility-stratified]] — 分层湍流 Lagrangian 功率不对称；拓扑条件化：轴向拉伸主导区偏度最负、双轴区**正→负翻转**；方差降但偏度更负；压力贡献由近对称转显著负偏；⚠️ 因果未建立 ⭐⭐⭐⭐

**高超声速 / 稀薄气体**
- [[2026-11-04-arXiv-2611.04684-DSMC-ramp-unsteadiness-SPOD-DMD]] — SUGAR-3D，$200\times10^6$ 粒子、采样格 ≥150；$Kn=3.3\times10^{-4}$；**首次 SPOD 用于 DSMC 流场并与 DMD 对比**；**稳定性对壁温/来流速度的敏感性高于对斜坡角**；三机制 = 再附激波振荡 + 剪切层 K-H + 分离泡 c 形模态 ⭐⭐⭐⭐
- [[2026-11-04-arXiv-2611.03657-shock-transmission-foil-explosion]] — 水下电箔爆炸激波穿固-水界面；500 万 fps 阴影摄影 + 光纤水听器 + 一维 MHD；**传输由阻抗失配 + 支撑材料有限厚度与动态响应共同决定**（静态阻抗公式不足） ⭐⭐⭐
- [[2026-11-04-arXiv-2611.04288-square-spiral-Knudsen-pump]] — 方形螺旋 Knudsen 泵，热渗流 + Poiseuille 闭合成环；**并联 +70.80%**（含稀薄化增强）vs **串联 +3.35%**，但最终流量几乎相同 → 存在最优构型；**弯段是非线性压降与减速损失点** ⭐⭐⭐

**多尺度场论 / 云物理**
- [[2026-11-04-arXiv-2611.04924-twilight-clouds-statistical-field-theory]] — MSR + Gurari 型变分约化消去快速过饱和度浴；鞍结分岔产生边缘态与**禁带区**；Lamperti 势垒景观 → 液滴**长期徘徊**；"云极化子"动态惯性；伪抛物方程 + 空间相关马尔可夫闭合 ⭐⭐⭐⭐

---

### 2026-11-01（周末零新增批次：22 篇覆盖度核验 100%）

最新可用批次仍为 **Fri, 30 Oct 2026**（arXiv 周末不发论文），与 10-30 / 10-31 两轮完全重叠。

- **无新建笔记**；逐篇核验 22 篇 `physics.flu-dyn` 新提交全部已入库且结构完整（模板 9 章节）
- **技术收获**：arXiv API `published` 滞后列表页 1 天 —— 改用 `arxiv.org/list/<cat>/new` 解析「New submissions」分段
- **cs.FL 4 篇全为形式语言与自动机理论**（2610.39678 / 2610.39833 / 2610.39941 / 2610.40012），无一收录，印证配置中 `cs.FL` 应移除
- 报告：[[daily-search-report-2026-11-01]]

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
- [[2026-11-08-arXiv-2611.07999-Hypocoercivity-for-a-thermostatted-Boltzmann-equation]] — 谱隙上下界 + 亚 hypoelliptic 退化区；数值耗散安全阈值
- [[2026-11-07-arXiv-2611.08429-Stokes-preconditioning-Radau-IIA-weighted-DG]] — FOV 等价预条件；Radau IIA 权重表；$C_r$ 特征值表
- [[2026-11-07-arXiv-2611.08402-hybrid-PIC-preconditioned-quasi-Newton]] — Hall-MHD 预条件子移植 + 解析质量矩阵（4 值/节点）
- [[2026-11-07-arXiv-2611.07360-energy-conserving-shallow-water-capillary]] — 缩放深度梯度增广 + SBP + CN 型时间离散（非分裂）
- [[2026-11-07-arXiv-2611.08169-semi-implicit-shallow-water-sphere]] — 三步对称分裂 + DG-upwind SSPRK3 + $H(\text{div})$ + hybridisation
- [[2026-11-07-arXiv-2611.08276-HVEM-Richards-variably-saturated-flow]] — 质量守恒混合 VEM（无稳定化参数）+ Kirchhoff 平均传导率
- [[2026-11-07-arXiv-2611.07107-low-rank-Vlasov-6D]] — 物理量驱动秩自适应（`df`/`ef`/`ee`）+ projector-splitting
- [[2026-11-07-arXiv-2611.07981-SSP-bound-RK-AI-assisted-proofs]] — SSP 系数上界 $2s$（二阶隐式）+ 三阶代数稳定障碍
- [[2026-11-07-arXiv-2611.07985-boundary-preserving-RNN-Poisson]] — 线性提升硬边界 + 重心坐标/超限插值/径向参数化
- [[2026-11-05-arXiv-2611.05365-FP32-wider-state-time-integration]] — FP32 存储状态舍入 = $\propto1/\Delta t$ 强制项；双 FP32 未求值和状态
- [[2026-11-05-arXiv-2611.05428-Rosenbrock-regularized-Stokeslet]] — ROS 时间积分 + TLJ；Jacobian 成本 $C_J=c_1\epsilon^{-2.5}$
- **精度与舍入**: [[2026-11-05-arXiv-2611.05365-FP32-wider-state-time-integration]]（FP32 存储舍入 $\propto1/\Delta t$、双浮点状态）
- **刚性 ODE / 时间积分**: [[2026-11-05-arXiv-2611.05428-Rosenbrock-regularized-Stokeslet]]（ROS、$\rho(J)\approx0.35S_C\epsilon^{-4}$）
- **LBM / 界面几何**: [[2026-11-05-arXiv-2611.06407-LBM-mushy-layer-sea-ice]]（link-based VOP + 广义 Robin）、[[2026-11-05-arXiv-2611.06239-packed-bed-mixing-LBM]]（D3Q19 + Protean）
- **有限元 / 多物理耦合**: [[2026-11-05-arXiv-2611.06733-poroelastic-FEM-dissipative-interface]]（混合理论 + ALE + 耗散界面）、[[2026-11-05-arXiv-2611.05554-Stroh-Hamiltonian-poroelastic]]（Stroh–Hamiltonian）
- **界面捕捉**: [[2026-10-30-DAVOF-dual-area-volume-of-fluid-interface-normal]]（VOF 闭式法向/位置）
- **域分解**: [[2026-10-30-differentiable-Schwarz-solver-agentic-AI-inverse]]、[[2026-10-17_arXiv-2610.20621_XPINN-Domain-Decomposition-Shock-Burgers]]
- **降阶模型**: [[2026-10-30-arXiv-2610.40426-rom-constrained-flapping-wing-shape-optimization]]、[[2026-10-30-arXiv-2610.39522-causality-informed-dynamic-mode-decomposition]]
- **稳定性理论**: [[2026-10-30-kinetic-linear-stability-full-Boltzmann-collision]]、[[2026-07-31-kinetic-linear-stability-theory-compressible-flows]]

### 科学机器学习
- [[2026-11-08-arXiv-2611.07387-Projection-based-segregated-iterative-and-multi-stage-physics-informed-neural-ne]] — 投影解耦 + 课程学习；Re=10⁴ 误差 ~1%；涡频误差 <3%
- [[2026-11-08-arXiv-2611.07458-Physics-informed-latent-conditional-flow-matching-for-generative-modeling-of-gra]] — 物理约束嵌入潜空间流匹配；推理提速 4-5 数量级
- [[2026-11-07-arXiv-2611.07582-BKAN-Bayesian-Reynolds-stress]] — 贝叶斯 KAN + 张量基 RANS 闭合；epistemic/aleatoric 二分；冻结场 UQ 传播
- [[2026-11-07-arXiv-2611.07364-APTNN-high-field-kinetic]] — CP 残差分解保持 + 增强 AP loss（一阶矩方程）
- [[2026-11-07-arXiv-2611.07985-boundary-preserving-RNN-Poisson]] — 随机神经网络 + 硬边界提升
- **潜空间物理性检验**: [[2026-11-05-arXiv-2611.05577-readable-not-steerable]]（预注册、"可读≠可操纵"）
- **基准与可观测性**: [[2026-11-05-arXiv-2611.06912-FlowReconBench-sparse-sensor-reconstruction]]（学习 vs 经典方法排序）
- **无量纲与知识引导**: [[2026-11-05-arXiv-2611.05780-pi-former-dimensionless-learning]]
- **PINN 逆设计**: [[2026-11-05-arXiv-2611.05691-PINN-turbine-blade-inverse-design]]（压力同伦）、[[2026-11-05-arXiv-2611.06464-microdroplet-uncertainty-inverse-design]]（UQ 引导 + PSO）
- **PINN 失败模式**: [[2026-10-30-PINN-buoyancy-nondimensionalization-failure-modes]]（无量纲化）、[[2026-10-30-PINN-deep-lid-driven-cavity-regional-accuracy]]（分区评估）
- **可微分求解器**: [[2026-04-11-AegirJAX-differentiable-coastal-hydrodynamics]]、[[2026-04-09-bottom-topography-PINNs-adjoint]]、[[2026-08-21-PINN-granuliar-flows-inverse-modeling]]
- **Agentic AI**: [[2026-10-30-differentiable-Schwarz-solver-agentic-AI-inverse]]、[[2026-10-30-arXiv-2610.39003-agentic-ai-task-aware-sparse-view-ct-hemodynamics]]
- **图神经网络**: [[2026-10-30-arXiv-2610.37986-coarse-mesh-gnn-sparse-observables-unsteady-flows]]

### 多相流
- [[2026-11-08-arXiv-2611.07458-Physics-informed-latent-conditional-flow-matching-for-generative-modeling-of-gra]] — 物理约束潜空间流匹配（颗粒流生成模型）
- [[2026-11-07-arXiv-2611.06882-odd-capillarity-CHNS]] — 宇称奇毛细应力、粗化停滞、超均匀
- [[2026-11-05-arXiv-2611.06464-microdroplet-uncertainty-inverse-design]] — VOF + 不确定性引导逆设计
- [[2026-11-05-arXiv-2611.05575-mafic-enclaves-magma-mingling]] — Level-Set 液滴变形
- [[2026-10-30-DAVOF-dual-area-volume-of-fluid-interface-normal]] — 界面重构精度
- [[2026-10-30-VOF-drop-breakup-rotating-cylinders-plicRDF]] — 曲率对破碎机制的影响
- [[2026-10-30-arXiv-2610.39586-taylor-bubble-drop-assembly-rise-vertical-tube]] — 气泡-液滴组合体
- [[2026-10-30-arXiv-2610.38011-optimal-seed-spontaneous-splitting-turbulent-puffs]] — 湍流团裂解

### 湍流
- [[2026-11-08-arXiv-2611.07910-Inertial-sub-range-detection-and-characterization-for-ground-layer-turbulence-at]] — 地面层湍流惯性子区分离（scintillometer + 超声风速塔）
- [[2026-11-07-arXiv-2611.07582-BKAN-Bayesian-Reynolds-stress]] — 可解释 + 可信不确定度的 RANS 闭合（BKAN）
- [[2026-11-05-arXiv-2611.06825-propeller-HIT-interscale-energy]] — KHM 逐尺度分析、纯正向级联、Tennekes 谱
- [[2026-11-05-arXiv-2611.06834-Kolmogorov-similarity-shear-thinning]] — 剪切变稀下第一相似性假设
- [[2026-11-05-arXiv-2611.06354-porous-high-frequency-boundary-layers]] — 逐阶渐近（准静态）
- [[2026-11-05-arXiv-2611.06749-Pearson-IV-drift-diffusion]] — 重尾涨落
- [[2026-10-30-arXiv-2610.39348-liquid-metal-swirl-chaos-transition]] — RTN 路线
- [[2026-10-30-arXiv-2610.39123-supersonic-turbulent-curved-wall-triadic-cascade]] — 三重级联
- [[2026-10-30-arXiv-2610.40474-flamlet-closure-non-orthogonal-composition]] — 燃烧 flamlet 闭包
- [[2026-10-30-arXiv-2610.40217-capillary-wave-turbulence-finite-systems]] — 毛细波湍流
- [[2026-10-30-arXiv-2610.40090-anisotropic-capillary-turbulence-kinetic-equation]] — 各向异性波湍流

---

## 每日报告

- [[daily-search-report-2026-11-08]] — **9 篇**（批次 Fri 6 Nov 2026；周末 arXiv 空窗）；⚠️ **跨批次去重发现**：初筛 30 篇中 21 篇已在 11-06/11-07 入库，已全部删除；真正新增 = 恒温器 Boltzmann 谱隙（亚 hypoelliptic 区间）/ 投影分离多阶段 PINN（Re=10⁴ 误差 ~1%）/ 多保真投影 ROM / 物理信息流匹配颗粒流 / 深度条件化海洋垂向流速反演 / 卫星锋面检测 / 地面层湍流惯性子区 / 过压缩激波相图 / 随机 GL 亚临界区对数修正；**cs.FL 第 5 轮确认误标，建议移除；建议固化 dedup.py 去重逻辑**
- [[daily-search-report-2026-11-07]] — 12 篇（周末批次空窗，处理 Thu 5 Nov 批次残余）；**BKAN 贝叶斯 KAN RANS 闭合** / 混合 PIC 物理预条件（**186×**）/ Stokes FOV 预条件（**Radau IIA 权重表**）/ 浅水毛细能量守恒 / 球面浅水半隐式 / Richards HVEM 质量守恒 / 6D Vlasov 物理量驱动秩自适应 / APTNN / SSP 定理；**cs.FL 第 4 轮确认误标，建议移除；建议加入 math.NA**
- [[daily-search-report-2026-11-06]] — 24 篇（Thu 5 Nov 批次）；MANTRA 低秩张量湍流重建 / ESE 熵变量稀薄输运 / 特征映射法耗散方程 / DSMC 高超声速侧喷 / HemeLB exascale 动脉 LES 等
- [[daily-search-report-2026-11-05]] — 23 篇（Thu 5 Nov 批次：18 新 + 5 交叉，**全收录**）；FP32 双浮点状态 / Rosenbrock 加速 MRS / link-based VOP / 有限时间混合标度律 / 宇称奇毛细 / 混合理论孔弹性 FEM；**cs.FL 分类应从配置移除（确认为形式语言）**
- [[daily-search-report-2026-11-04]] — 13 篇深度笔记（Wed 4 Nov 批次：9 新 + 4 交叉）；紧致 ALE-GKS / 有限 Re 历史核 / 弥散界面动理学 / 双求解器烧蚀交叉验证 / EnKF 验证 Charney 猜想 / 摆链层级设计湍流 / SPOD×DSMC 首对比；**配置建议移除 cs.FL，补 math-ph 等 4 类**
- [[daily-search-report-2026-11-01]] — 周末零新增：22 篇覆盖度核验 + **检索路径修正**（列表页优先，API 滞后一天）
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
