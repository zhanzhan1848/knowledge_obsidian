# 每日论文搜索报告 — 2026-11-05

## 执行概况

| 项目 | 内容 |
|------|------|
| **Agent** | 菜心 (caixin) 🥬 |
| **执行时间** | 2026-11-05 14:03–14:40 UTC |
| **搜索源** | arXiv `arxiv.org/list/physics.flu-dyn/new` 列表页（批次判定）+ `export.arxiv.org` API（批量元数据）|
| **批次** | **Thursday, 5 November 2026**（18 篇新提交 + 5 篇交叉提交 = 23 篇）|
| **收录** | **23 篇**结构化笔记（**全收录**——本批次全部为流体力学或直接相关）|
| **关键词** | CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence |
| **抓取深度** | 6 篇 PDF 全文 + 12 篇 HTML 全文 + 23 篇 API 摘要 |

> ✅ **检索路径正确**：沿用 11-01 修正——以列表页「New submissions」分段判定批次。API `published` 字段滞后一天（API 最新只到 2611.05365 / 11-03 18:56）。
> ⚠️ **cs.FL 确认下线**：本轮 cs.FL 的 10 篇全部为**形式语言与自动机理论**（前缀码界、VASS 可达性、树自动机不可判定性等），与流体力学**完全无关**。已在 MOC 标注建议从 `.knowledge-config.json` 移除。

---

## 收录清单（23 篇）

| # | arXiv ID | 标题 | 主类 | 主题 | 深度 |
|---|----------|------|------|------|------|
| 1 | [2611.05365](https://arxiv.org/abs/2611.05365) | A wider state, not wider arithmetic, for single-precision time integration | math.NA | **FP32 双浮点状态 / 舍入偏差** | HTML 全文 |
| 2 | [2611.05428](https://arxiv.org/abs/2611.05428) | Improving MRS performance using Rosenbrock time integration | physics.flu-dyn | **ROS 加速刚性 ODE** | HTML 全文 |
| 3 | [2611.06407](https://arxiv.org/abs/2611.06407) | Coupled LBM for pore-scale mushy-layer dynamics (sea ice) | physics.flu-dyn | **LBM / link-based VOP** | PDF 全文 |
| 4 | [2611.06239](https://arxiv.org/abs/2611.06239) | Finite-time mixing and reaction in packed bed reactors | physics.flu-dyn | **LBM + 有限时间混合** | PDF 全文 |
| 5 | [2611.06733](https://arxiv.org/abs/2611.06733) | FEM for Fluid–Poroelastic Structure Interaction with Dissipative Interface | physics.flu-dyn | **混合理论 + ALE + 耗散界面** | PDF 全文 |
| 6 | [2611.06882](https://arxiv.org/abs/2611.06882) | Odd Capillarity | physics.flu-dyn | **宇称奇毛细应力 / CHNS** | PDF 全文 |
| 7 | [2611.06825](https://arxiv.org/abs/2611.06825) | Interscale energy transfer in propeller-driven HIT device | physics.flu-dyn | **KHM 逐尺度 / Tennekes 谱** | PDF 全文 |
| 8 | [2611.06834](https://arxiv.org/abs/2611.06834) | Kolmogorov's first similarity hypothesis for shear-dependent viscosity | physics.flu-dyn | **剪切变稀 / 耗散区自相似** | PDF 全文 |
| 9 | [2611.06354](https://arxiv.org/abs/2611.06354) | Boundary Layers, Displacement Flow, High-Frequency Response of Porous Media | physics.flu-dyn | **逐阶渐近 / 位移流** | HTML 全文 |
| 10 | [2611.06912](https://arxiv.org/abs/2611.06912) | FlowReconBench | physics.flu-dyn | **稀疏传感重建基准** | HTML 全文 |
| 11 | [2611.05577](https://arxiv.org/abs/2611.05577) | Readable Is Not Steerable | cs.LG | **预注册 / 潜空间物理性** | HTML 全文 |
| 12 | [2611.05780](https://arxiv.org/abs/2611.05780) | Discovering like a scientist (π-former) | physics.comp-ph | **无量纲学习** | PDF 全文 |
| 13 | [2611.05691](https://arxiv.org/abs/2611.05691) | PINN method for pressure-driven turbine-blade optimization | physics.flu-dyn | **PINN 逆设计 / 压力同伦** | HTML 全文 |
| 14 | [2611.06464](https://arxiv.org/abs/2611.06464) | Microdroplet Generator Surrogate Enhancement and Inverse Design | physics.flu-dyn | **VOF + UQ + PSO** | HTML 全文 |
| 15 | [2611.06749](https://arxiv.org/abs/2611.06749) | Drift-Diffusion Approach for Pearson Type IV Heavy-Tail | physics.flu-dyn | **FPE / 重尾** | API + 摘要 |
| 16 | [2611.05639](https://arxiv.org/abs/2611.05639) | Grazing atmospheric particles in hypersonic BL receptivity | physics.flu-dyn | **高超声速转捩** | API + 摘要 |
| 17 | [2611.05610](https://arxiv.org/abs/2611.05610) | Biofilm Dynamics and Flow on H2 Transport in a Fracture | physics.flu-dyn | **多相流 / 地热氢** | API + 摘要 |
| 18 | [2611.05732](https://arxiv.org/abs/2611.05732) | Rheology and Velocity Distribution of Couette Flow (Protoplasmic) | physics.flu-dyn | **Finsler 几何 / 细胞内流动** | API + 摘要 |
| 19 | [2611.06317](https://arxiv.org/abs/2611.06317) | A plea for Miles' approach to wind-wave interaction | physics.flu-dyn | **Miles 理论工具化** | API + 摘要 |
| 20 | [2611.06467](https://arxiv.org/abs/2611.06467) | Quantitative infrared absorption imaging of vapor concentration | physics.flu-dyn | **实验传质测量** | API + 摘要 |
| 21 | [2611.05880](https://arxiv.org/abs/2611.05880) | Kinematic KHI-driven dynamo: merging compact objects | astro-ph.HE | **KHI / 磁发电机** | API + 摘要 |
| 22 | [2611.05554](https://arxiv.org/abs/2611.05554) | Stroh–Hamiltonian Framework for Incompressible Poroelastic | math-ph | **Stroh / Hamilton 孔弹性** | API + 摘要 |
| 23 | [2611.05575](https://arxiv.org/abs/2611.05575) | Deformation and reorientation of mafic enclaves (magma mingling) | physics.flu-dyn | **Level-Set / 两相流** | API + 摘要 |

---

## 本轮技术要点

### ⭐⭐⭐⭐⭐ 三篇数值方法重头戏

**2611.05365 — FP32 的隐藏偏差与"更宽状态"方案**
- 核心发现：FP32 **存储状态**舍入构成 $\propto 1/\Delta t$ 的强制项，**与截断误差反向**
- 误差模型 $E(\Delta t)=k_\tau\Delta t^p+k_R/\Delta t$
  - 折返步长 $\Delta t^*=(k_R/pk_\tau)^{1/(p+1)}$
  - $E_{\min}\propto k_R^{p/(p+1)}$ → **两种格式的最小误差之比 = 折返步长之比的 $p$ 次方**
- **"加密网格反而放大误差"**：高升力机翼 CRM-HLS，**544M 单元**，SSPRK(3,3)，CFL≈1
  - FP32 升力误差 **+2.1% / +4.5% / +7.7%**（$\Delta t$、$\Delta t/2$、$\Delta t/4$）
  - 双浮点状态 **≤0.3%**（所有网格）
- 方案：状态存为**两个 FP32 之和**，用 FP32 无误差变换更新，**无需 FP64 算术、不改写格式**
- 硬件背景：FP64/FP32 速率比 B200 1/2、Rubin 1/4、**Blackwell Ultra 1/64**

**2611.05428 — Rosenbrock 加速正则化 Stokeslet**
- **标度律**：$\rho(J)\approx 0.35\cdot S_C\cdot\epsilon^{-4}$（弯曲刚度线性、细长比四次方反比；拟合误差 3.88e-3）
- 对比：四阶 ERK 需 **$2\times10^6$ 步/鞭毛周期**；ROS 加速 **20–2000 倍**
- 工程优化：TLJ（只在 $1,k+1,2k+1,\ldots$ 算 Jacobian，ROW1 再快 30–35 倍）；AD(JAX) Jacobian 比 FD 快 2 倍，10 位精度快 40 倍
- **推荐**：低精度用 ROW1 + TLJ（≤1 s，2–4 位精度）；高精度用 RO$\widetilde{W}$3 + AD（~7 位）

**2611.06407 / 2611.06239 — LBM 双璧（同一作者 Chalmers）**
- **2611.06407**：link-based VOP（相变速率**逐链路**求解，解析方向依赖）+ 广义 Robin 边界（2D→**D3Q19**、适用区间扩至整个单元跨度）；Stefan 验证 **200×10**；$Da=B\Delta TL/D$
- **2611.06239**：**有限时间混合由剪切变形主导，指数拉伸仅次要**——修正"chaos mixing 最终主导"的经典叙事
  - $\sigma_c^2\sim\mathrm{Pe}^{-\alpha/(2\alpha+1)}t^{-1/2}$
  - $\sigma_s^2\propto(\gamma^*\mathrm{Pe})^{-\alpha/[2(\alpha+1)]}$（推广 Aquino 2023 至 $\alpha\approx2$）
  - 算例规模：**D3Q19 + `lbdm`**、$7.5\times10^7$/$1.31\times10^8$ 体素、$\Delta x/d\approx1/40$、**Pe≈280、Re=0.5**、500 轨迹（RK3）+ **moving Protean frame**、Delaunay 孔喉表征

### ⭐⭐⭐⭐⭐ 2611.06882 — 宇称奇毛细应力（本日最有想象力的物理）
- $\Sigma^{\text{odd}}_{ij}=\frac{3}{2}e\sigma\epsilon[\epsilon_{ik}\partial_k\phi\,\partial_j\phi+\epsilon_{jk}\partial_k\phi\,\partial_i\phi]$（对称、无迹 → 无内禀力矩）
- $\mathbf{f}^{\text{odd}}=2\chi\hat e_z\times\mathbf{f}^{\text{even}}$，$\chi=e\sigma/\sigma$
- **能量收支**：$P^{\text{odd}}$ 是**唯一净能量注入项**（不被自由能变化补偿）
- $\chi=2$ → 粗化停滞；$\chi=4$ → 组分**超均匀** + 液滴增长停滞
- 数值：**1024² 傅里叶伪谱 + ETDRK2 + CUDA/H100**；$\epsilon=0.02$、$M=\epsilon^2/2$、$\nu=\sigma=1$
- 标度：$\langle P^{\text{odd}}\rangle\sim\chi^{1.45}$；偶/奇比 $\sim10^{-2}$；停滞态 Re 仅 0.20–0.28
- ⚠️ 应力**非变分**——这正是能量注入来源，但也意味着不能声称能量守恒

### ⭐⭐⭐⭐ 2611.06733 — 混合理论 + ALE + 耗散界面孔弹性 FEM
- 为何不用 Biot：Biot **只给体平均速度与单压力场**，无法解析各组分独立动力学
- **FE 空间（可直接复用）**：位移 P2 / 流体速度 P2 / 压力 P1 / 界面乘子 P1
- 技术栈：**COMSOL + MUMPS + 变阶 BDF**；ALE 网格运动用 **可压缩 Yeoh 超弹性**（$c_1=1$ Pa，$c_2=2.5$ Pa，$K=1$ Pa）
- 验证：MMS，**5 级均匀加密**（$h=2.5$ mm）；算例 $h=1.56\times10^{-1}$ mm + 界面 8 层边界层（拉伸因子 1.2）
- 耗散项惩罚**过滤速度跳跃的范数**；$\mu_{\mathcal S}\to\infty$ → 过滤速度连续

### ⭐⭐⭐⭐ 2611.06912 — FlowReconBench（方法学标杆）
- 10 学习 + 5 经典方法 × 3 regime；**三种泛化类型**：跨 Re / 跨轨迹 / 空间留出
- 圆柱尾流：**OpenFOAM 9 `pimpleFoam` 层流**，12 块 O-grid，**23,800 单元**，Re 60–250，St 0.143–0.206（与实测差 1–6%）
- JHTDB：4 个 $125^3$ 立方体，$Re_\lambda\approx418$，网格间距 ≈ **2.1 个 Kolmogorov 长度**
- **核心结论**：经典方法（线性随机估计 / gappy POD / IDW）在**低阶 + 稠密传感** regime 强；学习法在**稀疏 / 不可观测**时胜；**CRPS 与误差给出不同排名**；可查询法内存平坦、全网格法 OOM

### ⭐⭐⭐⭐ 2611.05577 — "可读"≠"可操纵"
- 三项**预注册**研究（每项在留出数据上仅测一次，全部公开）
- Study 1（**不支持**）：JEPA 未通过预注册标准；在**非物理线性动力学**上训练的 JEPA 读流体量**更好**；**静态不变性模型（不看时间）在全部四个结构目标上打平或更好**
- Study 2（**部分支持**）：普通 AE 让 enstrophy 在最慢潜方向突出（$|r|$ 0.80–0.86 vs 未训练 0.38）；但 **VICReg 在每个对比中都削弱该突出度**
- Study 3（**部分支持**）：响度旋钮 8/8，形状旋钮 3/5（门槛 4）；两对照均无形状旋钮
- 量化：$\sigma_{\text{shape}}=|\Delta s|/(|\Delta a|+|\Delta s|)$，形状 $\geq0.7$ / 响度 $\leq0.2$；能谱须留在训练包络内（容差 $-0.05$），网格伪影帧 $\leq1\%$
- **工程含义**：潜空间"能读出"某物理量 **不足以** 支持"可用该潜变量控制它"

---

## 主题分布

```
数值方法 / 精度      ██████ 5 篇 (21.7%)   ← 本日主线
多相流 / 界面        ███    3 篇 (13.0%)
ML / 数据驱动         ████   4 篇 (17.4%)
湍流 / 实验           ███    3 篇 (13.0%)
多物理耦合 / FEM      ██     2 篇 ( 8.7%)
稳定性 / 转捩         █      1 篇 ( 4.3%)
其他（场论/天体等）    ████   5 篇 (21.7%)
```

---

## 本日可复用的技术资产

| 资产 | 出处 | 内容 |
|------|------|------|
| FP32 双浮点状态实现 | 2611.05365 | 每状态变量存两 FP32 未求值和；FP32 无误差变换更新；**不改写格式** |
| FP32 偏差量化 | 2611.05365 | $E(\Delta t)=k_\tau\Delta t^p+k_R/\Delta t$；折返点与最小误差幂律 |
| ROS 时间积分 + TLJ | 2611.05428 | ROW1/ROW3/RO$\widetilde{W}$3 系数表；Jacobian 成本 $C_J=c_1\epsilon^{-2.5}$ |
| Link-based VOP + 广义 Robin | 2611.06407 | 逐链路相变率；D3Q19 Robin（2D→3D，全区间） |
| 孔隙尺度 LBM 流程 | 2611.06239 | `lbdm`；体素分辨率判据 $\Delta x/d<1/40$；体力驱动压力梯度 + buffer zone |
| 有限元空间选择 | 2611.06733 | P2/P2/P1 + 界面 P1；ALE + Yeoh 超弹性网格运动；MUMPS |
| CHNS + 宇称奇应力 | 2611.06882 | $\Sigma^{\text{odd}}$ 构造；$P^{\text{odd}}$ 能量收支分解；ETDRK2 伪谱模板 |
| HIT 腔验证参数表 | 2611.06825 | 5 工况完整参数（$Re_\lambda$ 225–352，$\Delta x/\eta$ 2.5–6）|
| 剪切变稀流变参数 | 2611.06834 | Carbopol 0.04%/0.05%：$n$、$K_\mu$、$\tau_y$ |
| 稀疏传感重建基准 | 2611.06912 | OpenFOAM 圆柱尾流生成脚本参数；3 regime 划分协议 |
| PINN 逆设计调度 | 2611.05691 | 压力同伦 $\alpha_c=\min(0.2c,1)$；10 周期三子步权重表 |
| VOF+UQ 主动学习 | 2611.06464 | committee disagreement 选点；Basilisk AMR 阈值 |
| 量纲群语料库 | 2611.05780 | **1,288 个已建立无量纲群**（可复用先验）|

---

## 检索与流程改进建议

1. **✅ 列表页优先**（继续沿用）：`arxiv.org/list/physics.flu-dyn/new` 解析 `<h3>` 分段 → 批次判定准确；API `published` **滞后一天**
2. **⚠️ `cs.FL` 应从配置移除**：本轮 10 篇全为形式语言与自动机理论，已连续 3 轮确认为误标
3. **建议补充分类**：`math-ph`、`physics.comp-ph`、`math.NA` 本轮均有高价值命中（FP32 精度论文即在 math.NA）
4. **HTML 全文抓取更高效**：`arxiv.org/html/<id>` 对本批次 12/23 篇可用（PDF 版式解析会丢数学符号与连字）；建议流程改为 **HTML 优先 → PDF 兜底**
5. **PDF 提取工具**：环境无 `pdftotext`，已改用 `pymupdf`（`import pymupdf`）成功

---

## 报告索引

- 本报告：[[daily-search-report-2026-11-05]]
- 上一轮：[[daily-search-report-2026-11-04]]
- 论文索引：[[Papers-MOC]]
