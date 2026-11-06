---
type: report
created: 2026-11-06
updated: 2026-11-06
tags: [日报, daily-search, arXiv, physics.flu-dyn, cs.FL]
status: processed
domain: 流体力学
agent: caixin
source: https://arxiv.org/list/physics.flu-dyn/recent
---

# 2026-11-06 每日流体力学论文搜索报告

## 搜索范围

- **arXiv cs.FL**（Fluid Mechanics）：近期 13 条
- **arXiv physics.flu-dyn**：近期 100+ 条（本次取 2026-11-06 当日 + 相邻日交叉列表）
- **关键词**：CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence, DSMC, gas-kinetic, ALE, EnKF, Knudsen, computational fluid dynamics
- **执行时间**：2026-11-06 14:20 UTC

## 统计

| 项 | 数量 |
|---|---|
| 扫描条目总数 | 约 130 |
| **入选笔记（流体相关）** | **18** |
| 排除（cs.FL 形式语言/自动机类，与流体无关） | 3 |
| 当日 physics.flu-dyn 新增 | 25 |

> **说明**：cs.FL 当日 3 篇全部为形式语言与自动机理论（Z-grammars、prefix codes 等），与流体力学无关，已排除。

---

## 今日主题分布

| 主题 | 论文数 | 代表工作 |
|---|---|---|
| **稀薄气体 / 动理学** | 4 | ESE 熵稳定扩展、dcE、DSMC 侧喷注、球面 DtN |
| **湍流建模与统计** | 3 | 壁面法向速度谱、椭球沉降取向、Richardson 扩散 |
| **LBM / 格子方法** | 3 | LBM 机器、聚合物 Fokker-Planck、HemeLB 准星座 |
| **数值方法新格式** | 3 | 特征映射耗散扩展、时空有限元、DtN 边界 |
| **数据驱动 / ML** | 3 | MANTRA 张量、SINDy RTI、认证 PINN 水波 |
| **多相流 / 界面** | 2 | 液滴-液池弹跳融合、Rayleigh–Taylor |
| **实验流体力学** | 2 | 低 Re 旋翼、葫芦丝簧片 |
| **生物流体力学** | 2 | 全身动脉 HemeLB、时空 FEM、挤压膜 ROM |

---

## 重点推荐（按推荐优先级）

### ⭐⭐⭐ 1. ESE 熵稳定扩展（arXiv:2611.08395）
> **NSF 方程的熵稳定扩展（ESE）：熵变量表述、传热与色散**
> Baidoo, Aluru, Hughes, Abdelmalik

**为什么重要**：稀薄气体领域目前最系统的一篇工作。证明 ESE 在熵变量下是**四阶拟三次方程组**，并证明**拟线性部分保留最高阶导数与熵稳定性**。用**滑移函数边界条件**（连续极限像 Smoluchowski、大 Kn 下像无碰撞解）在平行板传热中**首次优于 NSF+Smoluchowski**，对标 DSMC 与 Sherman-Lees 热流。一维色散分析显示**所有频率模态稳定**，并归因于熵稳定性。

**落地价值**：为微纳气体流动提供了"比 DSMC 便宜数个数量级、比 NSF 准确得多"的中间路线。

### ⭐⭐⭐ 2. HemeLB 准星座全身动脉 LES（arXiv:2611.07840）
> **Exascale-ready HemeLB for large-eddy simulation of full-human arterial blood flow**
> Xue, Zacharoudiou, Coveney

**为什么重要**：**2.95 亿格点全身动脉树**（主动脉根部入口 + **432 个 Windkessel 出口**），**Frontier 2 节点、每心动周期 15–18 节点·小时**。10 TLUPS（Frontier + Aurora，AMD/Intel/NVIDIA GPU 通用）。100 μm 分辨率下**成本仅为 20 μm DNS 的 1/625**，平面平均压力误差 **< 1%（≤ 0.75 mmHg）**。

**落地价值**：患者特异性全身血流动力学 + 集合模拟首次可行。生理验证充分（脉压波放大、剪切应力集中于分支、**腿部三相波形**与多普勒一致）。

### ⭐⭐ 3. 特征映射的耗散扩展（arXiv:2611.08261）
> **A characteristic mapping method for dissipative evolution equations**
> Holman-Bissegger, Taylor, Nave

**为什么重要**：把 CM 从纯输运推广到 **Navier–Stokes**。核心是**提升（lifting）**：把标量演化方程提升为微分同胚群中的路径，复用半群结构；用**最优传输**解释该提升；**半直积演化**做时间推进；**log-Jacobian 用指数积分器**显式演化。保留 CM 的"**线性内存表示指数级细尺度**"特性。

**风险提示**：$\nabla\Delta^{-1}$ 引入全局 Poisson 求解，抵消部分效率优势；摘要仅称湍流能力"前景乐观"，**尚未展示完整 DNS 级基准**。

### ⭐⭐ 4. MANTRA 低秩张量湍流重建（arXiv:2611.08411）
> **Low-Rank Tensor Manifolds for Turbulent Field Reconstruction from Sparse Data**
> Sakib, Mychkovsky, Babaee

**为什么重要**：**无需网格观测、无需控制方程**的纯数据驱动方法。速度分量在连续张量积空间中表示，系数张量约束在**低秩 Tucker 流形**上，**黎曼优化** + **秩/基复杂度自适应**。采样密度比底层网格**低数个数量级**仍恢复多尺度结构；**20% 高斯噪声**下仍准确。**实验 PTV 振荡冲击射流**验证：恢复出散乱测量本身看不出的时变结构。

### ⭐⭐ 5. 液滴-液池撞击：反弹还是融合？（arXiv:2611.07942）
> **Bouncing or Merging in Drop-Bath Impacts**
> Lewin-Jones, Harris, Cimpeanu, Lockerby, Sprittles

**为什么重要**：**首次与实验定量一致**（分离反弹/融合的临界撞击速度），且**仅用独立测量的材料参数**（无调参拟合）。关键在于捕获**微纳米尺度物理**：**van der Waals disjoining 压力** + **依赖平均自由程的气体动理学**（Knudsen 效应）在**润滑理论 + 有限元**框架内。另有**弹跳-融合-弹跳-融合**多重转变（浅池/薄膜）。

---

## 其余入选论文

| arXiv | 标题 | 一句话要点 |
|---|---|---|
| [2611.07938](https://arxiv.org/abs/2611.07938) | 通道流壁面法向速度谱建模 | 波数空间双贡献（含能 + 粘性主导，Kolmogorov 标度）；$Re_\tau$ 550–5200；频谱模型全壁距有效；常数不变推广到边界层 |
| [2611.07990](https://arxiv.org/abs/2611.07990) | 湍流中沉降椭球的取向与滑移 | 过阻尼取向 = 球面精确梯度流 → 精确 Boltzmann 分布；耗散间歇性 = 对数正态叠加（复现平板取向分布）；横向滑移峰值在"对齐率 ≈ Kolmogorov 率" |
| [2611.07738](https://arxiv.org/abs/2611.07738) | 可压缩扩散气体 dcE | 从动理学完整推导（粒子→宏观平均→FV 离散→PDE）；扩散系数近似；真实气体分子间摩擦力**试探性模型** |
| [2611.07914](https://arxiv.org/abs/2611.07914) | 高超声速锥体侧喷注（DSMC） | Edney-IV 型激波激波干扰；自由流连续但**局部强梯度导致连续介质失效** → 必须动理学（**已发表于 AIAA J 61, 4741-4751 (2023)**）|
| [2611.07862](https://arxiv.org/abs/2611.07862) | 低 Re 加速/减速旋翼 | 加速效应可忽略（无量纲数 < 0.011）；推力系数**出现迟滞**，幅度强依赖桨距（$\Theta=5°$：8%/5%；$\Theta=10°$：4%/3%），**与动态入流理论预期不符** |
| [2611.07304](https://arxiv.org/abs/2611.07304) | 有限体积 MHD 的球面 DtN 闭合 | 逐分量匹配矢量磁位到衰减外部解，**保留三个衰减矢量 Laplace 族**；开源于 **FreeMHD**；网格加密收敛到独立谱参考 |
| [2611.07822](https://arxiv.org/abs/2611.07822) | 时空有限元（生物医学流动） | 连续单纯形时空 FEM：大边界运动**无需重网格/投影**；**时间周期解直接求解**；时间 slab 分区 → **时间并行**；弱扩展至 **960 ranks** |
| [2611.07139](https://arxiv.org/abs/2611.07139) | 格子玻尔兹曼机 | LBM = 规则驱动信息处理机器；与残差网络/Transformer 同属迭代松弛，但算子由**守恒律与对称性固定**；**三性质**足以促宏观律涌现；**失效极限**：非守恒模态阻尼失效时宏观律不给警告 |
| [2611.08205](https://arxiv.org/abs/2611.08205) | LBM-Fokker-Planck 聚合物水动力相互作用 | BGK + HI 准确恢复 Smoluchowski 慢变量动力学；**相比布朗动力学省去每步的扩散张量平方根** → 计算成本显著降低 |
| [2611.07666](https://arxiv.org/abs/2611.07666) | SINDy 提取单模 RTI 动力学 | 积分形式 SINDy + **$A_0 = k\eta_0$ 显式参数**；分别识别气泡/尖峰方程；复现**速度过冲**与**再加速阶段**；未见 $k$/加速度/Atwood 数仍高精度 |
| [2611.07395](https://arxiv.org/abs/2611.07395) | 认证 PINN 非线性水波 | PINN 无训练数据学习波剖面/波速/**表面张力**；**近机器精度**残差；**区间算术 + Lean 形式化**双重认证；从高振幅 Wilton 波延续**发现新高振幅候选解** |
| [2611.07694](https://arxiv.org/abs/2611.07694) | Richardson 扩散与反常耗散 | Fefferman & Mayboroda：受控扫掠随机 Hölder 速度场下**严格证明** $\mathbb{E}R_t^2 \sim t^3$ 与示踪反常耗散 |
| [2611.07205](https://arxiv.org/abs/2611.07205) | 挤压膜阻尼微梁降阶模型 | Petrov-Galerkin + **阻尼复模态**；耦合模态（复共轭）vs 流体弛豫（实）；**流体弛豫模态不可被结构模态替代**；1 组耦合模态 + 1 流体模态 → **误差 < 1.5%** |
| [2611.07696](https://arxiv.org/abs/2611.07696) | 葫芦丝自由簧片振动 | 激光多普勒测振（6 支乐器 × 29 测点 × 9 指法 × 2 气压）；管主导频率 + 簧片主导频率**双分量**；低压下**失锁静音 ~100 ms**；空间模式为**极限环受迫形状**（严格 1:2:3），非本征模态 |

---

## 跨论文主题串联（今日洞察）

### 1. "计算代价三档"路线图 —— 稀薄气体
```
DSMC (2611.07914)  ← 最高精度，最高代价
   ↓ 降本
ESE / dcE (2611.08395, 2611.07738)  ← 宏观多矩模型，熵稳定
   ↓ 降本
NSF (传统基线)
```
**今日关键进展**：ESE 在传热基准上**首次超越 NSF**（对标 DSMC 与 Sherman-Lees）。

### 2. "物理约束 + 严格验证"成为新标准
- [[2026-11-06-arXiv-2611.07395-certified-PINN-water-waves-Lean]]：**区间算术 + Lean 内核**双重认证，且明确声明**结果有效性独立于 LLM**
- [[2026-11-06-arXiv-2611.07666-SINDy-Rayleigh-Taylor]]：物理约束的 SINDy
- [[2026-11-06-arXiv-2611.08395-ESE-entropy-variable-rarefied-NSF]]：熵变量结构保证熵稳定
- [[2026-11-06-arXiv-2611.07139-lattice-Boltzmann-machine]]：守恒律与对称性作为 LB 的"准入清单"

→ **趋势**：不只是"用 ML 做 CFD"，而是**为 ML/CFD 结果提供可机器检验的保证**。

### 3. 降阶建模的三条路径
| 路径 | 论文 | 保留了什么 |
|---|---|---|
| **模态降阶（线性）** | [[2026-11-06-arXiv-2611.07205-squeeze-film-reduced-order-microbeam]] | 耦合复模态 + 流体弛豫模态 |
| **张量降阶（非线性）** | [[2026-11-06-arXiv-2611.08411-MANTRA-low-rank-tensor-turbulence]] | 场的低秩张量表示 |
| **方程提取** | [[2026-11-06-arXiv-2611.07666-SINDy-Rayleigh-Taylor]] | 稀疏回归出的动力学方程 |

→ **可级联**：稀疏实验数据 → MANTRA 场重建 → SINDy 方程提取。

### 4. LBM 生态的三个层级
| 层级 | 论文 | 贡献 |
|---|---|---|
| **理论** | [[2026-11-06-arXiv-2611.07139-lattice-Boltzmann-machine]] | LBM 作为信息处理机器的公理化 |
| **应用** | [[2026-11-06-arXiv-2611.08205-hydrodynamic-interaction-LBM-Fokker-Planck]] | LBM 用于聚合物动力学（HI）|
| **超算** | [[2026-11-06-arXiv-2611.07840-HemeLB-exascale-arterial-LES]] | 10 TLUPS 准星座全身血流 |

---

## 与既有知识库的连接

| 已有条目 | 今日可对接点 |
|---|---|
| **OpenFOAM / SU2** | [[2026-11-06-arXiv-2611.07304-FreeMHD-DtN-boundary]]（FreeMHD 是替代品）；[[2026-11-06-arXiv-2611.07862-accelerating-decelerating-propeller-lowRe]]（OpenFOAM MRF 验证路线）|
| **Basilisk / Palabos** | [[2026-11-06-arXiv-2611.07942-drop-bath-bouncing-merging]]（VOF + 薄层气膜子模型）；[[2026-11-06-arXiv-2611.07666-SINDy-Rayleigh-Taylor]]（AMR 基准数据生成）|
| **VOF / Level Set** | [[2026-11-06-arXiv-2611.07942-drop-bath-bouncing-merging]]；[[2026-11-06-arXiv-2611.07395-certified-PINN-water-waves-Lean]]（phase-field）|
| **DSMC / 稀薄气体** | [[2026-11-06-arXiv-2611.08395-ESE-entropy-variable-rarefied-NSF]]；[[2026-11-06-arXiv-2611.07738-diffusive-compressible-Euler-dcE]]；[[2026-11-06-arXiv-2611.07914-DSMC-hypersonic-cone-side-jet]]|
| **LBM** | [[2026-11-06-arXiv-2611.07139-lattice-Boltzmann-machine]]；[[2026-11-06-arXiv-2611.08205-hydrodynamic-interaction-LBM-Fokker-Planck]]；[[2026-11-06-arXiv-2611.07840-HemeLB-exascale-arterial-LES]]（HemeLB 首次入库）|
| **熵稳定 / 数值方法** | [[2026-11-06-arXiv-2611.08395-ESE-entropy-variable-rarefied-NSF]]（熵变量四阶拟三次）；[[2026-11-06-arXiv-2611.08261-characteristic-mapping-dissipative]]（半群分解 + 指数积分器）|
| **代理模型 / ML for CFD** | [[2026-11-06-arXiv-2611.08411-MANTRA-low-rank-tensor-turbulence]]；[[2026-11-06-arXiv-2611.07666-SINDy-Rayleigh-Taylor]]；[[2026-11-06-arXiv-2611.07395-certified-PINN-water-waves-Lean]] |

**新引入知识库的关键实体**：HemeLB、FreeMHD、Tucker 流形、黎曼优化、特征映射（CM）、DtN 闭合、熵稳定扩展（ESE）、差分求积法（DQ）、Windkessel 模型、Küster 涡脱落模型、区间算术 + Lean 形式化验证。

---

## 排除条目说明

**cs.FL 当日 3 篇全部排除**（主题为形式语言与自动机理论，与流体力学无关）：
- [2611.07781] Reliability-Aware Z-Grammars and Z-Automata over a Credible-Grade Semiring
- [2611.05675] Quadratic reset bounds for finite maximal prefix codes
- [2611.06303]（cs.CC 交叉）

---

## 笔记索引

1. [[2026-11-06-arXiv-2611.08395-ESE-entropy-variable-rarefied-NSF]] ⭐⭐⭐
2. [[2026-11-06-arXiv-2611.07840-HemeLB-exascale-arterial-LES]] ⭐⭐⭐
3. [[2026-11-06-arXiv-2611.08261-characteristic-mapping-dissipative]] ⭐⭐
4. [[2026-11-06-arXiv-2611.08411-MANTRA-low-rank-tensor-turbulence]] ⭐⭐
5. [[2026-11-06-arXiv-2611.07942-drop-bath-bouncing-merging]] ⭐⭐
6. [[2026-11-06-arXiv-2611.07938-wall-normal-velocity-spectra-channel-flow]]
7. [[2026-11-06-arXiv-2611.07990-spheroid-settling-turbulence]]
8. [[2026-11-06-arXiv-2611.07738-diffusive-compressible-Euler-dcE]]
9. [[2026-11-06-arXiv-2611.07914-DSMC-hypersonic-cone-side-jet]]
10. [[2026-11-06-arXiv-2611.07862-accelerating-decelerating-propeller-lowRe]]
11. [[2026-11-06-arXiv-2611.07304-FreeMHD-DtN-boundary]]
12. [[2026-11-06-arXiv-2611.07822-space-time-FEM-biomedical-flows]]
13. [[2026-11-06-arXiv-2611.07139-lattice-Boltzmann-machine]]
14. [[2026-11-06-arXiv-2611.08205-hydrodynamic-interaction-LBM-Fokker-Planck]]
15. [[2026-11-06-arXiv-2611.07666-SINDy-Rayleigh-Taylor]]
16. [[2026-11-06-arXiv-2611.07395-certified-PINN-water-waves-Lean]]
17. [[2026-11-06-arXiv-2611.07694-Richardson-dispersion-anomalous-dissipation]]
18. [[2026-11-06-arXiv-2611.07205-squeeze-film-reduced-order-microbeam]]
19. [[2026-11-06-arXiv-2611.07696-hulusi-free-reed-vibration]]

---

*报告生成：菜心 🥬 | 数据源：arXiv cs.FL + physics.flu-dyn | 同步状态：见 git log*
