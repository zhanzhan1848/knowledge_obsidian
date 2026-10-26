---
type: paper
title: "Lanczos Advection: Near-Orthogonal Semi-Lagrangian Reconstruction for Fluid Simulation"
date: 2026-10-26
agent: doumiao
domain: fluid-rendering
category: [surface-rendering, volume-rendering]
tags: [fluid-simulation, semi-lagrangian, advection, lanczos, numerical-diffusion, vorticity, MAC-grid, taichi]
venue: SIGGRAPH Asia 2026
doi: 10.1145/3842541
arxiv: null
status: completed
---

# Lanczos Advection: Near-Orthogonal Semi-Lagrangian Reconstruction for Fluid Simulation

## 📌 基本信息

| 项目 | 值 |
|------|---|
| **作者** | Seung-wook Kim (Hankuk University of Foreign Studies, 韩国外国语大学), Kiwon Um (LTCI, Telecom Paris, IP Paris, 法国) |
| **会议** | SIGGRAPH Asia 2026（2026-12-01~04, 吉隆坡） |
| **期刊** | ACM Transactions on Graphics, Vol. 45, No. 6, Article 245, 2026年12月 |
| **DOI** | [10.1145/3842541](https://doi.org/10.1145/3842541) |
| **PDF** | https://rtg.hufs.ac.kr/publications/SIGRAPHASIA26.pdf (60 MB) |
| **视频** | https://youtu.be/_FFpkrXm-hg |
| **arXiv** | 无 |
| **开源** | Taichi 参考实现承诺随论文公开（基于 covector fluids 开源代码） |
| **页数** | 18 页 |
| **收录位置** | arXiv 无；SIGGRAPH Asia 2026 已公布 |

> **收录理由**：arXiv 无版本，属于会议侧新发现。论文直接攻击流体渲染上游最核心的质量瓶颈——**半拉格朗日平流的数值耗散**。方法是对现有稳定流体（Stable Fluids）求解器的**即插即用扩展**，工程落地成本极低但画质提升显著。

---

## 🎯 核心问题

流体渲染的视觉质量几乎完全由**细节锐度**决定：界面的锐利程度、涡旋的紧致程度、湍流的细尺度结构。求解 NSE 时，**平流项（advection）** 是唯一的非线性部分，也是数值耗散的主要来源。

**现有方案的三难困境：**

1. **半拉格朗日方法（SF, Stam 1999）** —— 无条件稳定、实现简单，是几乎所有高级平流方法（BFECC、MacCormack、MCIP）的基石。但其**回溯后的线性插值**带来严重数值耗散与能量损失。
2. **BFECC / MacCormack / MCIP** —— 通过误差补偿/校正把整个平流流程做准，但**继承**了 SF 内核的初始缺陷。
3. **ENO / WENO / TENO（CFD 高阶格式）** —— 在激波捕捉上极成功，但**其平流算子的能量行为未被充分研究**，且网格取向依赖强、无法直接套用到图形学常用的 MAC 交错网格。

**本文的切入点**：不去换掉整个求解器，而是**只替换 SF 内核中的"插值"这一步**——把低阶双/三线性插值换成基于 **Lanczos 核（窗化 sinc）** 的加权求和。

---

## 🔬 方法：Lanczos 核与近正交重构

### 1. 平流算子的理想性质

离散平流算子定义为：

```
u^(n+1) = A[u^(n)] · u^(n)        (Eq. 2)
```

理想算子 A 应满足三条性质：

| 性质 | 数学表述 | 物理意义 |
|------|---------|---------|
| **归一化（行）** | `Σ_j A_ij = 1` | 分区一致性（partition of unity），防止数值膨胀/收缩 |
| **动量守恒（列）** | `Σ_i A_ij = 1` | 每个节点的总贡献被完整转移 |
| **能量守恒** | `AᵀA = I`（正交） | `‖u(t+Δt)‖₂ = ‖Au(t)‖₂ = ‖u(t)‖₂`，动能严格保持 |

### 2. 理想核：sinc 函数

**归一化 sinc（cardinal sine）**：

```
sinc(x) = sin(πx) / (πx)
```

关键性质：

- **归一化**：`∫ sinc(x) dx = 1`
- **平移不变归一化**：`∫ sinc(x−τ) dx = 1`（任意 τ）
- **平移正交性**（整数移位构成标准正交族）：
  ```
  ∫ sinc(x−j)·sinc(x−k) dx = sinc(j−k) = δ_jk    (j,k ∈ ℤ)
  ```
  非整数偏移 τ 时积分等于 `sinc(τ)`，按 `1/|τ|` 衰减 —— 正是 Kronecker δ 的连续延拓。

**d 维推广（乘积形式）**：

```
sinc_d(x) = Π_{k=1..d} sin(πx_k)/(πx_k)
```

乘积结构把整数移位正交性传递到高维：`∫ sinc_d(x−j)·sinc_d(x−k) dx = Π_ℓ δ_{j_ℓk_ℓ} = δ_jk`。

**关键推导（论文 Eq. 3）**：假设回溯映射 Φ 是**保测度微分同胚**。由于流体速度无散（divergence-free），该映射保体积，即 `det(∂Φ/∂x) = 1`，于是：

```
∫ sinc_d(Φ(x)) dx = ∫ sinc_d(x_b) dx_b = 1
```

这直接给出了**散射归一化（scattering normalization）**性质。

> **理论要点**：在单位间距网格上，若每个算子列的行为类似移位 sinc 基，则**列间相关性被最小化 → 算子趋于正交 → 动能保持能力提升**。这正是低阶核（如线性插值背后的三角核）耗散性明显更强的根因：**自重叠（self-overlap）大 → 列间相关性强**。

### 3. 实用核：Lanczos 核

理想 sinc 支撑无限、衰减慢，无法直接用于有限模板。因此使用 **Lanczos 核**（紧支撑窗化 sinc）：

```
L_a(x) = sinc(x) · sinc(x/a)      |x| < a
L_a(x) = 0                        otherwise        (Eq. 4)
```

其中 `a` 为 **Lanczos 窗半径**（Lanczos sigma factor）。

**两个决定性性质**：

- **基数性（cardinality）**：`L_a(m) = 1` (m=0)，`L_a(m) = 0` (m ∈ ℤ, m≠0) —— 网格对齐采样被精确复现。
- **收敛性**：`lim_{a→∞} L_a(x) = sinc(x)` —— 增大支撑半径即向理想 sinc 逼近。

> **论文的诚实声明**：作者明确表示 **不声称**有限半径的 Lanczos 算子是精确正交的；Lanczos 只是理想 sinc 构造的**紧支撑实用近似**，同时抑制朴素截断带来的振铃（Gibbs）振荡。

**频域对比（论文 Fig. 2）**：sinc 在频域解析上是矩形函数，但因无限支撑被截断，数值傅里叶变换**出现振荡**（导致过冲/欠冲、稳定性和精度受损）。Lanczos 核（a=2.0）的数值频谱**明显更好地逼近其解析函数**，振荡大幅减少。

### 4. 算子构造（维度分裂）

权重函数采用**维度分裂**乘积形式：

```
W(x_b←i, x_j) = Π_{k=1..d} L_a(x_b←i,k − x_j,k)      (Eq. 7)
```

由于权重函数本身不满足分区一致性，施加**逐行归一化**：

```
A_ij = W(x_b←i, x_j) / Σ_j W(x_b←i, x_j)                 (Eq. 8)
```

### 5. 正交性度量

论文定义**正交性偏差**：

```
σ(A) = (1/n)·‖AᵀA − I‖_F                     (Eq. 9)
```

其中 n 为自由度总数，‖·‖_F 为 Frobenius 范数。`1/n` 因子使 σ 在不同网格分辨率间可比（对有界局部支撑的行随机算子，‖AᵀA−I‖_F 至多线性增长）。**σ(A) 越小 → 算子越接近正交 → 潜在动能保持能力越好**。

### 6. 插值限幅器（soft-bound limiter）

Lanczos 核**允许负权重**，导致插值结果可能超出采样值范围 → 过冲/欠冲、振铃伪影、**负密度**，影响稳定性。

**软边界限幅器**两阶段设计：

```
q_min = min_m q_cm ,  q_max = max_m q_cm              (Eq. 11)   ← 源边界（8个角点）
q_lin = 三线性插值（可信源）

若 q_lan ∉ [q_min, q_max]:
    q_i ← q_lin                                          (Eq. 12)   ← 硬回退
否则:
    Δq = q_lan − q_lin
    α  = min(1, λ(q_max − q_min)/|Δq|)                   (Eq. 13)   ← 软边界
    q_i ← q_lin + α·Δq
```

**参数取值**：`λ = 0.02`（速度采样，修正量上限为局部源跨度的 2%）；标量量直接接受 `q_lan`（α=1），因源包络已足够约束。

**有界性证明（论文给出严格论证）**：三线性源是 8 个角点的凸组合，故 `q_lin ∈ [q_min, q_max]`。
- 硬回退时 `q_i = q_lin ∈ [q_min, q_max]` ✔
- 软边界时输出 `(1−α)q_lin + α q_lan`，α ∈ [0,1]，是两个区间内值的凸组合 ✔

因此每个重构值都满足 `q_i ∈ [q_min, q_max]`，插值步是 **L∞-nonexpansive**，且接受的 Lanczos 修正满足 `|q_i − q_lin| ≤ λ(q_max − q_min)` —— **λ 相当于以局部源变化为尺度的信赖域半径**。

### 7. 算法伪代码（论文 Algorithm 1）

```
procedure Advect(q)
  for each node value q_i at x_i on grid:
    x_b←i ← backtrace from x_i
    q_lin ← trilinear interpolation at x_b←i
    [q_min, q_max] ← source bounds from the 8 surrounding corners
    q_lan ← Σ_j q_j W(x_b←i, x_j) / Σ_j W(x_b←i, x_j)      ← Eq.7, Eq.8
    if q_lan ∉ [q_min, q_max]:
      q_i ← q_lin                                          ← hard revert
    else:
      Δq ← q_lan − q_lin
      α ← min(1, λ(q_max − q_min)/|Δq|)
      q_i ← q_lin + α Δq                                    ← soft bound, Eq.13
```

### 8. 关键实现细节

- **支撑半径 a = 2.0**。d 维加权求和中 1D Lanczos 核被求值 **4ᵈ** 次（a=2.0 时）。a=3.0 正交性更好，但**趋近 sinc 可能导致数值不稳定**且计算量更大，故取 2.0。
- **施加位置**：论文实测发现，**主要收益来自"物理量求值"这一步，而非"回溯速度的求值"**（后者改用 Lanczos 效果不显著，见 Fig. 15）。因此实现中回溯速度仍用线性近似。
- **边界处理**：贡献节点落在边界时，直接用零物理量，**不调整权重**。
- **单位网格假设**：Lanczos 核在整数输入处（除 0）为零，故可假设 Δx=Δy=Δz=1，支撑半径直接决定贡献节点数。

---

## 📊 实验与结果

### 求解器设置

- **网格**：交错 MAC 网格（marker-and-cell）
- **数值格式**：标准算子分裂（Chorin 1967）+ 投影法
  - 3D：快速多重网格投影（Sun et al. 2025）
  - 2D：多重网格求解器 + Cholesky 分解直接求解器
- **实现框架**：Taichi，基于 covector fluids (Nabizadeh et al. 2022) 开源代码
- **硬件**：AMD Ryzen 5 7600 (6核 @ 3.80 GHz) + NVIDIA GeForce RTX 4080 SUPER
- **公平性设置**：所有对比中 marker 密度场与速度场采用相同方案的平流；**不施加涡量约束（vorticity confinement）**；粘度默认为 0；投影求解器与边界处理在各方法间完全一致。

### 对比方法

| 类别 | 方法 |
|------|------|
| 基础 | SF (Stam 1999), MacCormack (MC, Selle et al. 2008), MCIP (Song et al. 2005) |
| CFD 高阶 | ENO (Harten 1987), WENO (Jiang & Shu 1996), TENO (Fu et al. 2016) |
| 高级图形学 | SCPF (Elcott 2007, 环流保持), 反射求解器 R (Zehnder 2018), 双向映射 BiMocq (Qu 2019), covector fluids CF (Nabizadeh 2022), 特征映射法 MCM (Sato 2018) |

论文提出的扩展记为 **LSF / LMC**（L = Lanczos 扩展，支撑半径 a=2.0）；下标 2.0 / 3.0 表示支撑半径。

### 关键结果

**1. 正交性（论文 Fig. 3）**
实验设置：旋转流 `(u,v) = (−y, x)`，域 `[−0.5, 0.5]²`，256² MAC 网格，单时间步，精确解回溯。

**σ(A) 实测值**（从 PDF 矢量路径几何解析提取，按图例色标匹配，坐标轴由刻度校准）：

| 方法 | CFL=1 | CFL=5 | CFL=10 | CFL=12 |
|------|-------|-------|--------|--------|
| SF | 0.00372 | 0.00349 | 0.00347 | 0.00348 |
| MC | 0.00248 | 0.00309 | 0.00314 | 0.00317 |
| MCIP | 0.00336 | 0.00306 | 0.00301 | 0.00303 |
| **LSF2.0** | 0.00324 | 0.00298 | 0.00295 | **0.00296** |
| **LSF3.0** | 0.00230 | 0.00208 | ~0.0021 | 0.00210 |
| **LMC2.0** | 0.00233 | 0.00272 | 0.00282 | 0.00284 |
| **LMC3.0** | **0.00184** | **0.00207** | 0.00223 | 0.00230 |
| ENO | 0.00281 | 0.00269 | 0.00270 | 0.00270 |
| WENO | 0.00306 | 0.00285 | 0.00283 | 0.00284 |
| TENO | 0.00307 | 0.00287 | 0.00283 | 0.00284 |

- **LSF2.0（σ≈0.00296 @CFL 12）优于 MCIP（≈0.00303）** —— 论文最反直觉也最重要的结论：**一个"被裁剪的核"比"高阶图学格式"MCIP 更接近正交**。
- LSF3.0 / LMC3.0 正交性优于 LSF2.0 / LMC2.0，但 a=3.0 趋近 sinc 有不稳定风险且更贵 → **选 a=2.0**。
- **诚实校准**：ENO/WENO/TENO 与 LSF2.0/LMC2.0 处于**同一水平带**。Lanczos 变体在 σ(A) 上是"与激波捕捉格式相当"，而非碾压。论文声称的收益是"**相对各自基线的显著改善**"。

**2. 能量保持（论文 Fig. 9，2D 衰减湍流）**
场景：随机初始速度场，256² 网格，Δt = 33 ms，纵轴对数刻度，0–1500 步。

| 方法 | E(0) | E(300) | E(750) | E(1500) | **E(1500)/E(0)** |
|------|------|--------|--------|-----------|--------|
| SF | 7.07e6 | 1.49e6 | 8.66e5 | 5.90e5 | **0.083** |
| MC | 1.43e7 | 4.01e6 | 2.81e6 | 2.16e6 | 0.151 |
| **LSF** | 2.28e7 | 1.04e7 | — | 6.56e6 | **0.288** |
| **LMC** | 2.79e7 | 1.37e7 | 1.07e7 | 9.90e6 | **0.355** |
| MCIP | 1.56e7 | 6.47e6 | 5.13e6 | 4.42e6 | 0.283 |
| ENO | 1.28e7 | 5.23e6 | 4.12e6 | 3.49e6 | 0.273 |
| WENO | 1.55e7 | 7.20e6 | 5.76e6 | 4.95e6 | 0.320 |
| TENO | 1.91e7 | 8.32e6 | 6.64e6 | 5.76e6 | 0.302 |

> **头条数字**：**LMC 在 1500 步后保留约 35.5% 的初始动能，SF 仅约 8.3% —— 高出约 4.3×**。LSF 保留约 28.8%（约 3.5×）。
> 注：各方法 E(0) 绝对值不同（各自随机初场的差异），论文原话是 "LMC presents the least energy decay from the initial kinetic energy"。

**3. 支撑半径消融（论文 Fig. 13，单涡，**无**限幅器）**
256² 网格，Δt = 33 ms。

| 方法 | E(0) | E(300) | E(750) | E(1500) | E(1500)/E(0) |
|------|------|--------|--------|-----------|--------|
| LMC2.0 | 7.45e6 | 1.50e6 | 4.02e5 | 1.24e5 | 0.017 |
| LMC4.0 | 6.45e6 | 1.29e6 | 4.07e5 | 1.47e5 | 0.023 |
| LMC8.0 | 6.72e6 | 1.73e6 | 5.00e5 | 2.23e5 | 0.033 |
| LMC16.0 | 6.18e6 | 1.83e6 | 5.80e5 | 2.54e5 | **0.041** |

> **单调趋势**：**支撑半径越大 → 细节越精细、能量衰减越小，但数值色散越强**。这是默认取 a=2.0 的原因 —— 尽管 a=16.0 能多保留约 2.4× 的能量。**注意该表是无 limiter 的结果，正是无 limiter 时 LMC 会过冲的原因。**

**4. 运行时开销**
- **LSF 相对 SF 为 1.30–1.39×**，且常常**比 MCIP 更便宜**
- **LMC 相对 MC 为 1.28–1.44×**

**2. 视觉质量**（括号内为网格与时间步长）
- **2D 卡门涡街**（Fig. 4，512×256, Δt=100ms）：左侧为基线，右侧为 Lanczos 增强版。**剪切层更锐利**，涡街下游更连贯、更清晰。
- **2D Taylor 涡**（Fig. 5，512×512, Δt=50ms，t=150Δt）：涡更"脆"、涡量更强。
- **2D 跳跃涡对**（Fig. 6，256×256, Δt=200ms）：基线方法涡在数次穿越后扩散，Lanczos 版**保持更久、更锐利**。
- **2D SIGGRAPH logo 密度扩散**（Fig. 7，420×520, Δt=10ms）：**界面显著更锐利**。
- **2D 湍流衰减**（Fig. 8）：LMC 表现出更强涡与更锐利结构。
- **2D 烟羽**（Fig. 10，256×128×128, Δt=5ms 与 Δt=40ms）：**LSF 和 LMC 产生更丰富更细的涡，涡寿命更长**。
- **大 CFL 场景**（Fig. 11，2D Taylor 涡分离，CFL=2，256×768, Δt=33ms, t=50Δt）：SF/ENO/WENO/TENO 严重数值扩散，涡结构糊掉；**只有 LSF 与 MCIP 保持干净分离的涡对**。
- **2D 涡格**（Fig. 14，256×256）：LFM（Leapfrog Flow Maps, Sun et al. 2025）与 NFM（Neural Flow Maps, Deng et al. 2023）"在邻近涡开始合并时出现明显的分离损失"，而 **LLFM 与 LNFM 保持涡核明显分离、格结构维持更久**。
- **3D 场景**：trefoil 结（256³, Δt=1ms）、cinquefoil 结（256³, Δt=2ms）、跳跃涡环（256×128×128, Δt=2ms）—— 全部 8 个基线都得到 Lanczos 增强版，**结结构更动态**。对 CF（covector fluids）及其变体提升幅度较小。
- **Meteor 预告**（Fig. 1，512×256×256, Δt=33ms）：**即使 CFL > 8** 也保持涡量并生成更丰富的小尺度湍流。

**与 MMC 的对比（Fig. 12，2D SIGGRAPH 标签）**
MMC（Lentine et al. 2011，质量-动量守恒）"把质量与动量守恒作为全局校正施加，**这并不直接缓解插值模板内部的耗散**，因此小涡的涂抹基本未解决。相比之下，本文重构用**局部插值步而非显式全局校正**能得到更锐利的内部结构。"

**回溯速度的 Lanczos 插值（Fig. 15，2D Taylor-Green 涡，LMC + RK4）**
"使用额外的 Lanczos 插值配合 RK4 积分器，相比常规线性插值在能量上**仅有可忽略的改善**；两者视觉结果几乎相同。" ⇒ **作者刻意保留回溯速度的线性插值**。

**3. 能量保持（论文 Fig. 9）**
所有方法随时间都逐渐损失初始动能（数值耗散的必然结果），但 **LMC 更好地保持初始动能**。

### 归一化选择的消融（论文第 8 节，重要工程结论）

| 方案 | 对 σ(A) 的影响（相对未修改 LSF2.0） |
|------|------|
| 仅行归一化（**本文采用**） | 增加 **2.69×10⁻⁷ %** |
| 行列归一化 | 增加 **0.019 %** |
| Sinkhorn 行列平衡 | 增加 **0.042 %** |

**结论**：行归一化成本可忽略且保留近正交结构；额外列归一化**对视觉质量无可辨识改善**，却带来每步迭代开销（Sinkhorn）。故采用仅行归一化。作者指出，**在动量敏感场景**下强制精确列和可能更重要，列为未来工作。

### 局限与讨论（论文第 8 节）

- **限幅器不可或缺**：无 limiter 时 LMC / LMC+R 出现过冲（Fig. 21）。
- **保证的边界**：论文强调其 L∞ 保证**仅针对重构步骤本身**，**不是耦合平流-投影求解器的全局稳定性定理**；投影与边界处理非线性依赖被限幅的采样值，全局能量/稳定性定理**留作未来工作**。
- **不适用于有噪声的流场**：论文明确指出，Lanczos 扩展**不能改善基线方法中已有的噪声流**（BiMocq / LBiMocq 对比图）。
- **对极小或极大支撑半径**的两端均有代价（a 小则正交性弱，a 大则不稳且贵）。

---

## 🩸 可行性分析：Lanczos Advection 流体渲染技术

### 渲染方法
- **类型**：表面渲染 / 体积渲染（上游物理）
- **技术**：Lanczos 核（窗化 sinc）加权的半拉格朗日平流重构 + 软边界限幅器

### 视觉质量
- **逼真度**：⭐⭐⭐⭐⭐（在既有求解器上"白拿"的画质提升）
- **风格化支持**：是（对风格化烟雾同样有效，界面更锐利）

### 性能预期
- **帧率**：相对 SF 有额外开销 —— 3D 时 1D 核求值 4³=64 次（a=2.0），2D 时 16 次。相比项目法/快速多重网格的投影成本属于**中等量级额外负载**
- **GPU 需求**：Taichi 友好，完全 GPU 端可跑（论文用 RTX 4080 SUPER）
- **内存占用**：无额外显存需求（就地替换插值权重）

### 实现建议
- **着色器复杂度**：中（需要 Lanczos 核权重 + 双线性/三线性源 + 限幅逻辑）
- **管线要求**：可作为**即插即用扩展**接入任何 MAC 网格 Stable Fluids 管线；建议优先改"物理量求值"那一步，回溯速度保持线性即可
- **推荐度**：✅ **强烈推荐** —— 这是本次检索中**工程性价比最高**的一篇：对现有代码侵入极小、对画质提升明显、理论有正交性/能量保持的严格论证支撑

### 对本库算法 Agent 的落地建议
1. 在现有 Stable Fluids 实现中，把 `sample(field, pos)` 的三线性插值替换为 Lanczos 加权求和（a=2.0）
2. 同时计算三线性值作为**可信源** `q_lin` 与 8 角点包络 `[q_min, q_max]`
3. 施加两阶段软边界限幅器（速度 λ=0.02，标量 α=1）
4. **务必**对比开启/关闭限幅器的结果，避免负密度
5. 用能量曲线（动能 vs 时间）验证保持效果，用 σ(A) 验证正交性

---

## 🔗 关联笔记

- [[Flamescapes-Wildlandfire-Urban-Interface]] — SA2026 火焰渲染
- [[Divisor-Dynamics-Surface-Fluid]] — SA2026 表面流体
- [[KPM-FR-High-Order-Flux-Reconstruction]] — SA2026 高阶通量重构
- [[ML-Operator-Lexicon-PDE-Solvers]] — SA2026 可微求解器
- [[Lanczos-Advection-Near-Orthogonal-SL-Reconstruction]] — 本笔记

## 📚 参考文献（论文中的关键对比工作）

- Stam, J. 1999. *Stable Fluids*. SIGGRAPH.
- Selle, A. et al. 2008. *A Conservative Scheme for Unconstrained Stable Fluids* (MacCormack). ACM TOG 27(3).
- Kim, D. et al. 2005. *Fast Fluid Simulation Using BFECC*. ACM TOG 24(3).
- Song, H. et al. 2005. *Simulation of bubbles and foams based on the variational wave equation*. MCIP.
- Harten, A. et al. 1987. *On high-order accurate schemes for hyperbolic problems*. ENO.
- Jiang, G.-S., Shu, Y. 1996. *High order weighted ENO schemes for hyperbolic conservation laws*. WENO.
- Fu, X. et al. 2016. *TENO*. JCP.
- Elcott, S. et al. 2007. *Stable circulation-preserving, simplicial fluids*. ACM TOG 26(1).
- Zehnder, S. et al. 2018. *Grid-accurate fluid simulation via reflection solver*. ACM TOG.
- Qu, Z. et al. 2019. *Interactive fluid simulation: bidirectional mapping*. (BiMocq)
- Nabizadeh, S. et al. 2022. *Covector fluids*. ACM TOG.
- Sato, T. et al. 2018. *MCM*. (Method of characteristic map)
- Duchon, C. 1979. *Lanczos filtering in one and two dimensions*. J. Applied Meteorology.
- Lanczos, C. 1988. *The Laplacian representation of a function and its approximations*. (Lanczos kernel)
- Chorin, A. J. 1967. *The numerical solution of the Navier-Stokes equations for an incompressible fluid*. Bull. AMS.
- Harlow, F. H., Welch, L. F. 1965. *Numerical solution of Navier-Stokes equations with two-dimensional incompressible flow*. (MAC grid)
- Hu, Y. et al. 2019. *Taichi: An open-source parallel compute framework*.
- Sun, Q. et al. 2025. *Fast multigrid projection*.
