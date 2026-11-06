---
tags: [几何, 参数化, 球面参数化, 敏感性分析, 条件数, 调和延拓, 预条件, LBS, FLASH, cMCF, SDEM]
date: 2026-11-06
source: arXiv
arxiv_id: 2611.00721
venue: cs.GR / cs.CG / math.NA (2026-10-31 submission, v2)
status: processed
agent_id: wawaicai
authors: Zixi Yi, Gary P. T. Choi
url: https://arxiv.org/abs/2611.00721
pdf: https://arxiv.org/pdf/2611.00721
---

# Representation-Aware Closed-Surface Parameterization: Exact Sensitivity Analysis and Pole-Aware Planar Preconditioning

> 把「数值表示（representation）」当作闭曲面参数化中的**设计变量**，给出精确敏感性分析，并提出极点感知的平面预条件器。

---

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Representation-Aware Closed-Surface Parameterization: Exact Sensitivity Analysis and Pole-Aware Planar Preconditioning |
| **作者** | Zixi Yi, Gary P. T. Choi |
| **发表** | arXiv cs.GR / cs.CG / math.NA, 2026-10-31（v2） |
| **链接** | [原文](https://arxiv.org/abs/2611.00721) |
| **篇幅** | 39 页 |

---

## 核心贡献

> 证明 FLASH 球面共形参数化的**南极点 Beltrami 修正精确等价于源网格上的调和延拓**，从而把修正后的映射分解为「chart 变换 → 调和传播 → 逆立体投影」三个环节，给出显式敏感性 Jacobian 与有限三角形条件数界；并据此设计五参数有界仿射预条件器，在 30 个 genus-0 曲面上把极区 log-condition 上尾中位数与弦角失真分别降低 **10.17%** 与 **10.97%**。

1. **分支式（branchwise）表示敏感性框架** —— 把输入-输出问题分解为「通过活跃 Jacobian 的光滑传播」与「anchor / 停止规则 / 回退事件的变化」两部分（**关键工程洞察**）。
2. **精确调和归约定理（Theorem 3.4）** —— 在一致的分片线性装配下，FLASH 的南极点 Beltrami 修正**精确**退化为源网格调和延拓，`K_LBS = K_V`。
3. **有限三角形条件数界（Theorem 3.2）** —— 给出 log-condition 失真对径向变化的显式误差界。
4. **分支稳定半径（Proposition 2.1）** —— 给出保证离散分支不切换的充分邻域半径 `r_stab = min γ_k/(L_k C_k)`。
5. **极点感知平面预条件器** —— 五参数仿射族（各向同性缩放 + 各向异性 + 平移）的有界参数化 + 约束多起点搜索。
6. **迭代参数化的瞬态放大分析** —— cMCF / SDEM 中「终端衰减」与「轨迹级瞬态放大」并存的定量刻画。

---

## 技术方案

### 核心思想

许多参数化方法先做**平面投影**，再在平面上计算。但投影前或几何演化中引入的扰动会通过计算传播，影响映射质量、收敛性、停止行为与几何有效性。本文把「表示扰动」建模为分支式的输入-输出问题，并说明表示选择本身就是算法设计的一部分。

### 关键技术

| 技术 | 说明 |
|------|------|
| **分支稳定半径** | 分支由严格不等式 `g_{k,r}(X^{(k)}) > 0` 刻画；基线间隙 γ_k、Lipschitz 常数 L_k、累积放大 C_k 给出充分半径 |
| **固定-anchor 敏感性 Jacobian** | `D_θ S_θ = P_θ · D_θ G_θ(X_0)`，`P_θ` 为各步 active map 的雅可比链式乘积 |
| **有限立体几何（Prop 3.1）** | 精确有限边缩放：`‖Π⁻¹_N(z_i) − Π⁻¹_N(z_j)‖² = m_ij ‖z_i − z_j‖²`，`m_ij = 2/√(q_i q_j)` |
| **径向离散度 χ_T** | `χ_T(Z) = max_r log(1+‖z_r‖²) − min_r log(1+‖z_r‖²)`；三个边乘子的对数极差恰为 `χ_T/2` |
| **LBS 张量的度量形式（Lemma 3.3）** | `A(μ_T) = Δ_T G_T⁻¹` —— 这是调和归约的代数核心 |
| **精确调和归约（Thm 3.4）** | `∑_T ∫_{P_T} ∇u_T A(μ_T) ∇v dp = ∑_T ∫_{V_T} ∇_V b_u · ∇_V b_v dA` ⟹ `K_LBS = K_V` |
| **源网格调和延拓（Corollary 3.5）** | `Y_U = −K⁻¹_UU K_UI P_I`，即 `Y = H_I P_I`；**修正后的平面映射仅通过指定的南极坐标依赖输入表示** |
| **极点感知传播算子（Sec 3.4）** | 修正后映射因子化为 chart transition → harmonic propagation → inverse stereographic projection |
| **五参数仿射预条件器** | `Z_θ = A_{a,B,t}(Z_0)`，`A_{a,B,t}(z) = e^a B z + t`，`B = [[b₁,b₂],[b₂,−b₁]] ∈ Sym₀(2)`，`θ=(a,b₁,b₂,t₁,t₂)` |
| **约束多起点搜索（Sec 5.3）** | 在有界参数化下评估候选，作用于**修正后的完整球面映射** |

### 关键公式

**分支稳定半径（Proposition 2.1）**

$$
r_{\text{stab}} := \min_{0 \le k < K} \frac{\gamma_k}{L_k C_k},
\qquad
C_k \le L_G \prod_{j=0}^{k-1} L_{T_j}
$$

**有限立体投影边缩放（Proposition 3.1）**

$$
\|\Pi^{-1}_N(z_i) - \Pi^{-1}_N(z_j)\|^2 = m_{ij}\,\|z_i - z_j\|^2,
\qquad m_{ij} = \frac{2}{\sqrt{q_i q_j}},\ q_i = 1 + \|z_i\|^2
$$

**有限三角形条件数界（Theorem 3.2）**

$$
\varepsilon_T = \frac{5 h_T^2}{2\lambda_{\min}(G_T(Z))}\,\delta_T,
\qquad
\delta_T = e^{\chi_T(Z)/2} - 1
$$
$$
\left| d_T\big(\Pi^{-1}_N(Z)\big) - d_T(Z) \right| \le \frac{1}{2}\log\frac{1+\varepsilon_T}{1-\varepsilon_T}
$$

> 界的形式很关键：它同时依赖**平面元素形状**（`λ_min(G_T)`）与**径向变化**（`χ_T`）—— 说明**光滑共形性并不能消除有限三角形条件数对平面表示的依赖**。

**LBS 张量度量形式（Lemma 3.3）**

$$
A(\mu_T) = \Delta_T G_T^{-1},
\qquad
\mu_T = \frac{E_T - G_T^{(2)} + 2i F_T}{E_T + G_T^{(2)} + 2\Delta_T}
$$

**精确调和归约（Theorem 3.4）**

$$
\sum_{T \in \mathcal{F}} \int_{P_T} \nabla u_T A(\mu_T) \nabla v \, dp
=
\sum_{T \in \mathcal{F}} \int_{V_T} \nabla_V b_u \cdot \nabla_V b_v \, dA
\quad \Longrightarrow \quad K_{\text{LBS}} = K_V
$$

> ⚠️ **重要前提**：该等式要求使用**未修改的装配**。若对 Beltrami 系数做裁剪/平滑、改变权重或连通性、或使用不同的积分规则，等式 (33) 失效。

**源网格调和延拓（Corollary 3.5）**

$$
Y_I = P_I, \qquad Y_U = -K_{UU}^{-1} K_{UI} P_I, \qquad Y = H_I P_I
$$

**敏感性放大指标**

$$
a_\theta(v) = \frac{\|P_\theta v\|_2}{\|v\|_2},
\qquad
A(\theta) = \|P_\theta\|_2 = \max_{v \ne 0} a_\theta(v)
$$

---

## 实验结论

- **数据集**：30 个 genus-0 闭曲面（对照 30-mesh cohort）
- **方法**：FLASH（球面共形参数化）、cMCF（共形化平均曲率流）、SDEM（球面密度均衡映射）
- **扰动协议**：作用于 FLASH 的平面 chart 坐标 / cMCF 与 SDEM 的初始状态；4 个扰动方向 × 2 个符号

### FLASH 结构验证 + 预条件结果

- **FLASH 结构验证**：调和实现保留原始修正到数值精度，且**降低了修正阶段运行时**
- **30-mesh cohort 主结果**：
  - 极区 log-condition 上尾 log-condition 中位数降低 **10.17%**
  - 弦角失真（chord-angle distortion）中位数降低 **10.97%**
  - **两项指标在每一个网格上都改善**（无一退化）
- **Stagewise 效应**：修正阶段本身是「被修改 anchor 数据的活跃传播机制」；原始 vs 修正后的逐阶段对比显示预条件在完整修正映射上评估才有效

### cMCF 敏感性（Table 5，960 次运行）

| \|ε\| | Runs | A_term（native） | A_match | max_{k≤K₀} A_k | K_i ≠ K₀_i |
|------|------|------------------|---------|------------------|------------|
| 1e-3 | 240 | 0.353 [0.180, 0.640] | 0.348 | 1.365 [1.061, 2.136] | 1 (0.4%) |
| 3e-3 | 240 | 0.352 | 0.347 | 1.365 | 3 (1.3%) |
| 1e-2 | 240 | 0.350 | 0.347 | 1.365 | 5 (2.1%) |
| 3e-2 | 240 | 0.351 | 0.345 | 1.366 | 18 (7.5%) |
| **All** | **960** | 0.352 [0.180, 0.641] | 0.346 | **1.366 [1.063, 2.144]** | 27 (2.8%) |

> **核心结论**：**终端衰减与轨迹级瞬态放大并存**。中位终端放大 < 1（衰减），但中位峰值放大约 **1.37**，上四分位 **> 2.1**。停止索引变化在 3e-2 扰动下达到 7.5%。

### SDEM 敏感性（Table 6，768 次运行）

| \|ε\| | Stable/eligible | A_term | max_k A_k | A_term > 1 | max_k A_k > 1 |
|------|-----------------|--------|-----------|------------|--------------|
| 1e-3 | 175/192 | 0.255 [0.171, 0.605] | 1.000 [1.000, 12.339] | 38 (21.7%) | 47 (26.9%) |
| 3e-3 | 176/192 | 0.253 | 1.000 [1.000, 8.382] | 25 (14.2%) | 53 (30.1%) |
| 1e-2 | 180/192 | 0.256 | 1.000 [1.000, 3.828] | 14 (7.8%) | 67 (37.2%) |
| 3e-2 | 175/192 | 0.256 | 1.000 [1.000, 1.596] | 9 (5.1%) | 56 (32.0%) |
| **All** | **706/768** | 0.255 [0.171, 0.518] | 1.000 [1.000, 2.874] | 86 (12.2%) | 223 (31.6%) |

> SDEM 的耦合非线性状态导致**跨网格/扰动方向的高度异质性**（峰值放大上四分位达 12.3）。离开稳定子集的运行指示初始表示的**稳定性余量不足**，可用于候选拒绝或自适应初始化。

### 下游影响（Table 7：SDEM 终态质量）

| Metric | Original | Preconditioned | Paired change |
|--------|----------|---------------|--------------|
| Final density CV | 0.00560 | 0.00572 | +0.44% |
| Fixed-polar d | 1.22278 | 1.21986 | −0.17% |
| Fixed-polar CDI | 0.69013 | 0.68505 | −0.11% |
| Global d | 1.58995 | 1.58965 | +0.01% |
| Global CDI | 0.89179 | 0.89213 | −0.00% |
| **Residual flips (total)** | **10** | **5** | – |

> 预条件化 FLASH 初始化把 SDEM 配对运行中的**残余翻转从 10 降到 5**，终态失真相当 —— 说明上游表示改进可传导到下游数值与几何行为。

### 下游重网格化（Table 8：固定模板重网格）

| Metric | 642 verts | 2,562 verts | 10,242 verts |
|--------|-----------|-------------|--------------|
| Template-to-surface LogCond 上尾均值 (top 5%) | −0.16% (16/30) | −0.37% (21/30) | −0.77% (24/30) |
| Edge-length CV | −0.07% (16/30) | −0.18% (20/30) | −0.16% (21/30) |
| Minimum-angle Q05 | +0.06% (19/30) | +0.06% (24/30) | +0.10% (27/30) |

> 收益随模板分辨率提高而**更一致** —— 说明 chart 引起的失真在后续采样操作中持续存在。

---

## 复杂度分析

- **分支稳定性半径计算**：需估计每步不等式的间隙 γ_k、Lipschitz 常数 L_k、累积放大 C_k → O(K · m_k) 界检查
- **FLASH 修正（调和实现）**：从「LBS 线性系统求解」→「源网格 Dirichlet 系统求解」，两者都是稀疏线性系统，**复杂度相同**（O(n) 稀疏 Cholesky/PCG），但**实测运行时下降**（数值条件更好）
- **敏感性 Jacobian `P_θ`**：K 步 active map 的链式乘积 → 显式构造 O(K) 次 2×2 雅可比乘（若每步是仿射/线性），存储 O(1)
- **条件数界评估**：每个三角形需 `λ_min(G_T)`（2×2 广义特征值，O(1)）与 `χ_T`（O(1)）→ 总 O(F)
- **仿射预条件搜索**：5 参数有界族 + 约束多起点，候选数 × 每次评估成本（评估需在修正后球面映射上做 O(F) 畸变计算）→ O(C · F)
- **cMCF/SDEM 敏感性**：每次扰动运行需记录逐步放大 → O(K) 额外存储，O(1) 增量开销

## 数值稳定性

- **Theorem 3.4 的严格前提**：未修改的 Beltrami 系数装配、相同连通性/分片线性基/面积分约定。**裁剪、平滑、改变权重或积分规则都会使 `K_LBS = K_V` 失效**
- **有限三角形界的前提**：`ε_T < 1`（即 `5h_T²/(2λ_min(G_T)) · δ_T < 1`），否则界的对数发散
- **角度畸变与球面面积畸变分离测量** —— 作者明确指出「这避免了把光滑共形性、弦三角形畸变与球面面积畸变混为一谈」，是本文测量方法论的关键
- **分支稳定性是充分条件而非必要条件** —— `r_stab` 是保守下界
- **SDEM 中 62/768 的运行离开稳定子集** —— 说明部分初始表示的稳定性余量不足

---

## 局限性

1. **预条件器使用全局仿射变换** —— 耦合了整个 chart 的调整，限制了处理**空间异质失真**的灵活性
2. **精确 FLASH 敏感性描述是分支特定的** —— anchor 切换需要分片处理；修改 Beltrami 系数可能破坏 `K_LBS = K_V` 等价性
3. **cMCF / SDEM 部分仅达到机理探索阶段** —— 把敏感性纳入初始状态或迭代更新的**优化**尚未完成，是进一步的方法学步骤
4. **分析局限于 genus-0 球面参数化** —— 推广到 genus-1 及更高亏格需要与目标曲面兼容的表示变化

---

## 相关工作

- [[FLASH]] — 球面共形参数化（Kachel & Pinkall）
- [[LBS]] — Linear Beltrami Solver
- [[HarmonicExtension]] — 调和延拓
- [[ConformalParameterization]] · [[SphericalParameterization]] · [[Charts]]
- [[2026-11-06-DC-SQEM-Medial-Mesh-Dual-Contouring]] — 同日几何核心论文

---

## 实现建议

- **实现难度**: **中**（理论部分重，但实现上是「求解源网格 Dirichlet 系统 + 5 参数有界搜索」，代码量不大）
- **预期性能**: 调和替代 LBS 后修正阶段运行时**下降**；预条件搜索为 O(C·F)，可在 GPU 上并行
- **适用场景**:
  - **球面纹理展开**（游戏角色/行星/球形道具的 UV 展开），尤其容易在极点附近出现畸变的模型
  - **迭代式球面参数化的初始化**：本文证明预条件化初始化可减少下游 SDEM 残余翻转
  - **作为通用「表示敏感性」诊断工具**：分支半径 + 峰值放大 + 停止稳定性可作为参数化流水线的 QA 指标
- **工程注意**:
  - 若使用 LBS 库（NVIDIA 的 `nv_topo` / libigl 的 `harmonic_harmonic` 类实现），先确认其**未修改装配**是否满足 Theorem 3.4 前提；若不满足，需自行实现一致的装配
  - 预条件需在**修正后的完整球面映射**上评估，不能在原始 chart 上评估
  - 建议同时记录 A_term 与 max_k A_k —— 单看终端指标会严重低估瞬态放大
- **依赖项**: libigl（稀疏求解 `Eigen::SimplicialLDLT` / `ConjugateGradient`）、Eigen（2×2 广义特征值）；无现成 5 参数预条件器实现，需自行实现

---

## 🔗 相关笔记

- [[2026-11-06-DC-SQEM-Medial-Mesh-Dual-Contouring]] — 同日论文
- [[2026-11-06-T2-Splat-Adaptive-Topology-Mesh-Splatting]] — 同日论文
- [[UVUnwrapping]] · [[ParameterizationDistortion]] · [[NumericalStability]]

---

*Generated by 黄喉 (wawaicai) at 2026-11-06*
