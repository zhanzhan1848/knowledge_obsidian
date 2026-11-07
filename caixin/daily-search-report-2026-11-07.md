---
type: report
created: 2026-11-07
updated: 2026-11-07
tags: [report, daily-search, arxiv, fluid, CFD]
status: processed
domain: fluid
agent: caixin
---

# 每日论文搜索报告 - 2026-11-07

## 执行概况

| 项目 | 内容 |
|------|------|
| **Agent** | 菜心 (caixin) 🥬 |
| **执行时间** | 2026-11-07 14:02 UTC |
| **搜索范围** | arXiv `physics.flu-dyn` + `cs.FL`（配置中另含 `math-ph`/`physics.comp-ph`/`math.NA`/`physics.ao-ph`/`cs.CE`） |
| **关键词** | CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence |
| **时间窗口** | 最近 24 小时（2026-11-06 14:00 → 2026-11-07 14:00 UTC） |
| **新增笔记** | 12 篇 |
| **报告索引** | [[daily-search-report-2026-11-07]] |

---

## 批次判定说明（重要）

**arXiv API 的 `published` 字段滞后约 24 小时**，直接用 API 判定「最近 24 小时」会漏掉整批论文。本轮沿用**列表页优先**策略：

```
https://arxiv.org/list/physics.flu-dyn/new   → 解析 <h3> 分段
https://arxiv.org/list/math.NA/new
https://arxiv.org/list/physics.comp-ph/new
```

- 本轮 arXiv **最新批次为 2026-11-05**（`published` 截止 2026-11-05T18:17Z）
- 2026-11-06 / 11-07 为**周末**，arXiv 不发布新批次
- 因此本轮「最近 24 小时」窗口内**无全新提交**，实际处理的是**上一批次中尚未入库的论文**
- 去重后剩余 **12 篇**，全部于本轮补齐

### 关键发现：`cs.FL` 确认误标（第 4 轮）

`cs.FL` 在 arXiv 上是 **「形式语言与自动机理论」（Formal Languages and Automata Theory）**，与流体力学无关。本轮该分类下最新唯一论文 [[2026-11-07-arXiv-2611.07781-Z-Grammars-credible-grade-semiring]] 为 Z-number 加权文法——**纯理论语言学**。

> **建议动作**：从 `.knowledge-config.json` 的 `caixin.search.arxiv_categories` 中**移除 `cs.FL`**（已连续 4 轮建议）。

### 配置中未列出但本轮高价值命中的分类

| 分类 | 本轮命中 | 说明 |
|---|---|---|
| `math.NA` | **6 篇** | 最高产分类：预条件、浅水、HVEM、张量 NN、SSP 定理 |
| `physics.comp-ph` | 2 篇 | 混合 PIC 预条件、OPENSC² |
| `cs.CE` | 1 篇 | OPENSC²（跨分类） |

> **`math.NA` 应显式加入配置**。本轮 6 篇 `math.NA` 论文全部是数值方法核心内容，质量远超 `cs.FL`。

---

## 本轮新增论文（12 篇）

### A. 湍流建模与机器学习（1 篇）

| # | arXiv | 标题 | 标签 |
|---|---|---|---|
| 1 | [2611.07582](https://arxiv.org/abs/2611.07582) | Bayesian Kolmogorov–Arnold networks for trustworthy Reynolds-stress closures | RANS, KAN, UQ |

### B. 数值方法 —— 核心（8 篇）

| # | arXiv | 标题 | 标签 |
|---|---|---|---|
| 2 | [2611.08429](https://arxiv.org/abs/2611.08429) | Preconditioning for the time-dependent Stokes equations: stage-weighted Radau IIA and weighted DG time-stepping | 预条件, FOV, Radau IIA |
| 3 | [2611.08402](https://arxiv.org/abs/2611.08402) | A physics-based-preconditioned quasi-Newton solver for energy- and momentum-conserving implicit hybrid PIC | 混合 PIC, 准牛顿, 能量守恒 |
| 4 | [2611.07360](https://arxiv.org/abs/2611.07360) | Energy-conserving scheme for a shallow-water model with capillary effects | 浅水, 毛细, 熵稳定, SBP |
| 5 | [2611.08169](https://arxiv.org/abs/2611.08169) | A Second-Order Semi-Implicit Projection Time-Stepping Scheme for the SWE on the Sphere Using Compatible FEM | 球面浅水, 兼容 FEM, 半隐式 |
| 6 | [2611.08276](https://arxiv.org/abs/2611.08276) | Variably saturated flow on polygonal and cut meshes using a mass-conservative hybrid VEM | Richards, VEM, 质量守恒 |
| 7 | [2611.07364](https://arxiv.org/abs/2611.07364) | Asymptotic-Preserving Tensor Neural Networks for 3D High-Field Kinetic Equations with UQ | TNN, AP, VPFP |
| 8 | [2611.07107](https://arxiv.org/abs/2611.07107) | A physics-based adaptive low-rank method for 6D Vlasov simulations | 低秩, 秩自适应, GPU |
| 9 | [2611.07985](https://arxiv.org/abs/2611.07985) | Boundary-preserving randomized neural network methods for Poisson equations | PINN/RNN, 硬边界 |

### C. 理论与其他（3 篇）

| # | arXiv | 标题 | 标签 |
|---|---|---|---|
| 10 | [2611.06945](https://arxiv.org/abs/2611.06945) | Novel hydrodynamic features in dissipative spin-polarized fluids | 自旋流体, Israel-Stewart |
| 11 | [2611.08084](https://arxiv.org/abs/2611.08084) | Winding-Pack Quench Simulation of Stellarator Coils in OPENSC² | 超导磁体, 热-水力, 聚变 |
| 12 | [2611.07781](https://arxiv.org/abs/2611.07781) | Reliability-Aware Z-Grammars and Z-Automata over a Credible-Grade Semiring | ⚠️ cs.FL 误标，与流体无关 |

---

## 本日重点深读（3 篇）

### 🥇 2611.07582 — 贝叶斯 KAN 用于 RANS 闭合

**为什么重要**：这是数据驱动 RANS 闭合**十年来的关键一步**——首次把「可解释性」与「可信不确定度」放进**同一个**闭合里，而不是像之前那样二选一。

**核心机制**：

1. **KAN 边函数 = 可学习样条**：一维函数可直接画出形状，简单时可符号蒸馏
2. **局部重参数化**：样条对系数线性 ⇒ 样条输出本身是高斯，**无需逐系数采样**
3. **张量基硬约束**：伽利略/旋转不变性、对称性、无迹性由构造保证；**realisability 只软正则**
4. **方差全分解**：epistemic（后验采样散布）+ aleatoric（异方差头）
5. **求解器级传播**：冻结场 → 逐样本跑 RANS → 尾流不确定度边界

**关键量化结果**：

| 指标 | 值 |
|---|---|
| Periodic hill 各向异性 RMSE | **0.046 ± 0.001**（3 seed） |
| BKAN ECE | **0.06** |
| 小 BNN ECE | 0.09 |
| 宽 BNN ECE | **0.13**（容量↑但精度不变、校准变差） |

**最重要的警示**：**几何外推下过度自信**——epistemic 确实增大，但**不足以覆盖误差增长**，出现明显 under-coverage。→ 「epistemic 增大」**不能**当作「仍保持标定」的证据。

**可直接复用**：
- 变分后验 + 局部重参数化的完整 ELBO 构造
- realisability 罚项 $R=\langle\max(0,\lambda_{\max}-2/3)^2+\max(0,-1/3-\lambda_{\min})^2\rangle$
- 冻结场传播流程（可移植到任何 RANS + ML 修正）

### 🥈 2611.08402 — 混合 PIC 的物理预条件 + 准牛顿

**为什么重要**：**186 倍**的加速来自两个可移植的工程决策，而不是新算法。

**核心数据**：

| 对比项 | 结果 |
|---|---|
| Krylov 迭代数（GEM, $\Delta t\Omega_{ci}=0.05$） | **357 → ~6** |
| 前 25 步每步时间 vs 未预条件 JFNK | **↓ 186 倍** |
| vs 粒子质量矩阵 + 同预条件 | ↓ 2 倍 |
| 显式 vs 隐式（同等能量误差） | 显式需 **40× 更小步长 + 9× 墙钟** |
| 显式（隐式步长）的总能量误差 | 大 **4 个数量级**以上 |
| 能量守恒（容差 $10^{-13}$） | 到**舍入精度**；动量到 $10^{-9}$（Alfvén 单位） |

**关键洞察**：
- Hall 哨声波 $\omega\propto k^2$ ⇒ 显式 $\Delta t\propto\Delta x^2$，且不守恒能量/动量，还有限网格不稳定性
- JFNK 的痛点是**每次 Krylov 迭代都要推进粒子**
- **解析质量矩阵（AMM）**只需每节点 4 个值（vs 粒子质量矩阵 243 值/节点），**无粒子循环**
- Jacobian 近似**不破坏守恒性**——因为 Newton 残差中粒子响应被保留

### 🥉 2611.08429 — 时间依赖 Stokes 的 FOV 等价预条件

**为什么重要**：给出了一组**可直接抄的权重表**，且**常数与粘性/步长/网格无关**。

**可直接复用**：

- 2 级 Radau IIA：$\hat{w}_1=0.51216588$，$\hat{w}_2=0.11995468$
- 3 级 Radau IIA：$\hat{w}_1=0.29272466$，$\hat{w}_2=0.29076228$，$\hat{w}_3=0.04863362$
- $C_r$ 最小特征值 $\lambda_{\min}^{[s]}$：$s{=}2$–$7$ 均为正（0.2603 / 0.0842 / 0.0461 / 0.0247 / 0.0121 / 0.0037）；**$s\ge8$ 转负**（需另选 $\hat W$）
- 预条件子结构：$\mathcal{P}_U^{rk}=\begin{bmatrix}\omega P_{\bm v}&\bm B^T\\0&\rho P_{\bm q}\end{bmatrix}$，**块对角（每级一块）**
- 工具链：**NGSolve + NETGEN + ngsxfem**，GMRES 容差 $10^{-8}$

---

## 本日可复用的技术资产

| 资产 | 出处 | 内容 |
|------|------|------|
| KAN 样条 + 局部重参数化 | 2611.07582 | $\mathbb{E}[\phi_s]=\sum_k B_k(x)\mu_k$；$\mathrm{Var}[\phi_s]=\sum_k B_k(x)^2\sigma_k^2$ |
| Tensor-basis 闭合 + 双头方差 | 2611.07582 | 系数头 + 异方差头共享 KAN 骨干 |
| Realisability 软罚 | 2611.07582 | $\langle\max(0,\lambda_{\max}-2/3)^2+\max(0,-1/3-\lambda_{\min})^2\rangle$ |
| Frozen-field UQ 传播 | 2611.07582 | 后验采样 → 冻结修正场 → 逐样本 RANS |
| 物理预条件（Hall-MHD 移植） | 2611.08402 | curl–curl 辅助变量 + 块 Jacobi 平滑 + 多重网格 V-cycle |
| 解析质量矩阵 AMM | 2611.08402 | 4 值/节点；无粒子循环；不破坏守恒 |
| **Radau IIA 权重表** | 2611.08429 | 2/3 级显式数值；$s\le7$ 可用 $\hat W=W$ |
| **$C_r$ 特征值表** | 2611.08429 | $s=2$–$10$ 的 $\lambda_{\min}$（$s\ge8$ 为负） |
| SSP 系数上界 | 2611.07981 | 二阶隐式 RK：$C\le2s$（锐）→ **全隐式 vs DIRK 无优势** |
| 三阶稳定性阶障碍 | 2611.07981 | 三阶 + 非负系数 → **不可能代数稳定** |
| 能量守恒浅水 + 毛细 | 2611.07360 | 缩放深度梯度增广 + SBP + CN 型时间离散；**非分裂** |
| 球面浅水半隐式 | 2611.08169 | 三步对称分裂 + DG-upwind SSPRK3 + $H(\text{div})$ + hybridisation |
| HVEM 无稳定化参数 | 2611.08276 | 调和多项式按旋转排序 → 通量参数个数闭式规则 |
| Kirchhoff 平均传导率 | 2611.08276 | 静水平衡与重力排水**任意网格精确** |
| 低秩秩自适应判据 | 2611.07107 | `df`/`ef`/`ee` 三判据；升秩拒绝并重启 |
| APTNN CP 残差分解 | 2611.07364 | 残差保持 CP 形式 → 高维积分可按维求值 |
| 硬边界 RNN 提升 | 2611.07985 | 广义重心坐标 + 超限插值 + 径向参数化 |
| 场-网络耦合 | 2611.08084 | 传输线模型 + 电场-电路耦合类比 |

---

## 跨论文洞察（本轮）

### 1. 「物理量驱动的误差判据」正在成为共识

- **2611.07107**：低秩秩自适应用**电场/电场能量**而非奇异值
- **2611.07582**：闭合不确定度用**后验采样散布**而非残差
- **2611.08402**：预条件子用**物理块结构**（Hall 项、curl-curl）而非代数结构

> 三篇不同方向、不同社区的工作同时转向「用物理可观测量定义误差/自适应准则」。这是本轮最强的趋势信号。

### 2. 隐式 + 物理预条件 = 等离子体/低 Re 数值方法的主线

- **2611.08402**（混合 PIC）：预条件子移植 + AMM → 186×
- **2611.08429**（时间依赖 Stokes）：FOV 等价预条件 → 常数与参数无关

> 两条独立工作给出互补证据：**刚性问题的主要成本在非线性求解器，不在时间离散**。

### 3. 深度学习解 PDE 的两个方向分化

- **结构化物理嵌入**（2611.07582 张量基、2611.07364 AP loss、2611.07107 物理量判据、2611.08421 李对称）
- **几何/约束工程**（2611.07985 硬边界提升、2611.08001 几何等变算子、2611.08084 场-网络耦合）

> 纯「黑盒 PINN」正在退场；**约束/不变性的构造性保证**（而非罚项）成为主流。

### 4. 能量守恒是长时间积分的硬需求

- **2611.07360**（浅水+毛细）：可证明离散能量守恒，**非分裂**
- **2611.08402**（混合 PIC）：隐式中点守恒能量，Jacobian 近似不破坏

> 两篇都强调同一句话：**「收敛解与守恒性不受求解器近似影响」**——这是数值方法设计的核心判据。

---

## 检索与流程改进建议

1. **✅ 列表页优先**（继续沿用）：判定最新批次准确；API `published` 滞后一天
2. **🔴 移除 `cs.FL`**（连续 4 轮确认误标）：本轮唯一命中为形式语言理论
3. **🟢 加入 `math.NA`**：本轮 6 篇命中，质量最高；建议显式写入配置
4. **🟢 加入 `math-ph`**、`physics.ao-ph`、`cs.LG`：本轮未逐一检查，但历史上均有高质量命中
5. **✅ HTML 全文抓取**：本轮 11 篇候选 **HTML 全部可用**（`arxiv.org/html/<id>`），解析质量远好于 PDF
6. **⚠️ 周末批次空窗**：周六/周日 arXiv 不发布 → 报告应显式说明「窗口内无新提交，处理上一批次残余」，避免读者误以为漏收

---

## 报告索引

- 本报告：[[daily-search-report-2026-11-07]]
- 上一轮：[[daily-search-report-2026-11-06]]
- 论文索引：[[Papers-MOC]]
