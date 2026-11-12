---
type: paper
created: 2026-11-12
updated: 2026-11-12
tags: [paper, neural-operator, hankel-operator, fno, pde-solver, burgers, darcy, navier-stokes]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2611.13989
---

# Beyond Fourier and Laplace: The Hankel Neural Operator for Learning Solution Operators of Differential Equations

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Beyond Fourier and Laplace: The Hankel Neural Operator for Learning Solution Operators of Differential Equations |
| **作者** | Biswanath Barman, Rajendra K. Ray |
| **发表** | arXiv preprint (physics.flu-dyn), 2026-11-10（21 页，9 图，9 表） |
| **链接** | [arXiv:2611.13989](https://arxiv.org/abs/2611.13989) |
| **DOI** | — |
| **代码** | 摘要末标注 `\hnorepo{}`（占位符，需查正文获取实际仓库链接） |
| **分类** | 神经算子 / PDE 代理模型 / 流体力学 |

---

## 核心贡献

> **一句话点题：从线性常系数边值问题解算子的数学结构（**Toeplitz 核 + 有限秩 Hankel 算子**）出发构造**Hankel 神经算子（HNO）**，同时用三种方式实现（Fourier 域非周期因果卷积 / 闭环 Lur'e 算子 / 有理 Fourier 乘子），从而在 FNO 的全部基准（含 Burgers、Darcy、Navier-Stokes）上取得最低平均测试误差。**

1. **从解算子结构出发（而非从通用架构出发）**：论文证明，对于区间上良定的线性常系数边值问题，其解算子是**带有理核的 Toeplitz 算子 + 携带边界信息的有限秩 Hankel 型算子**。这是全文的理论基石。
2. **经典结果的三个方向的统一**：Kronecker、Nehari、Adamyan-Arov-Krein 的结果表明该核类具有**稳定极点、有限 Hankel 秩、以及与区间长度无关的范数界**——这些性质给出了网络的**归纳偏置（inductive bias）**来源。
3. **HNO 的三种实现方式**：
   - **(a)** **非周期卷积**用 FFT 求值，采用**因果形式**（causal form）；
   - **(b)** **闭环 Lur'e 算子**（closed-loop Lur'e operator），用于**无衰减记忆（fading memory）**的动力系统；
   - **(c)** **有理 Fourier 乘子**，其特例**包含 FNO**。
4. **实验结果**：
   - 在全部 **9 个 LNO 基准**上平均测试误差最低；
   - 在 FNO 的 **Burgers、Darcy、Navier-Stokes** 基准上平均测试误差最低；
   - 其中 2 项差异，以及与**参数匹配的 FNO** 在 Navier-Stokes 上的对比，**统计上不显著**（作者诚实地报告了这一点）；
   - 在 **6 个 ODE 问题**上把"较优基线"的平均误差降低 **2.1–5.2 倍**；
   - **Darcy 误差从 $85^2$ 到 $421^2$ 网格几乎保持恒定**，而 FNO 的误差增长 **8 倍**。
5. **消融实验**支持每一个组件的必要性。

---

## 技术方案

### 核心思想

**FNO 的三个结构性缺陷**（作者的核心批评）：

1. **周期性**：FNO 在周期网格上用 Fourier 变换，学习的是**核积分算子在变换域中的表示**。但真实问题（边界值问题、瞬态问题）**往往不周期**。
2. **无边界机制**：FNO **没有显式的边界条件处理机制**——边界信息只能隐式地藏在函数空间中。
3. **无初值/瞬态机制**：对带初值的问题，瞬态行为需要额外机制。
4. **误差随网格加密增大**：FNO 在无阻尼振子（undamped oscillator）上误差很大，且**网格细化时误差增长**——这很反直觉，因为网格更密信息更多。原因是 FNO 的 Fourier 乘子在高频处的学习变得困难。

**LNO（Laplace Neural Operator）** 的改进：加入**极点-留数符号（pole-residue symbols）**，但仍在离散 Fourier 网格上求值，且**极点不受约束**。

**HNO 的做法**：回到 PDE 解算子的**数学结构**，并用三种数学对象实现它：

**理论核心**：
线性常系数 ODE/BVP 在区间 $I$ 上的解算子（Green 算子）是：
- **Toeplitz 算子**（卷积部分）：核 $k(t - s)$，对应"初值响应"；
- **有限秩 Hankel 算子**：$\left[\sum_j a_j f(t_j)\right] g(t)$ 形式，对应**边界输入的影响**。

有限秩正是**有限个边界条件**的算子表达。这个"卷积 + 有限秩"的分解，正是 HNO 架构的设计依据：
- 卷积部分 → **FFT 上的非周期因果卷积**（处理初值/瞬态）
- 有限秩部分 → **闭环 Lur'e 算子**（处理边界反馈）

**三种实现的分工**：
- **(a) 非周期因果卷积 + FFT**：处理瞬态/初值主导问题。因果性保证不引入"未来"信息（否则会泄漏）。
- **(b) 闭环 Lur'e 算子**：Lur'e 形式 $\dot{x} = Ax + Bu,\; y = Cx + Du$ 的闭环版本，显式建模**边界条件的反馈**（无衰减记忆的动力系统）。
- **(c) 有理 Fourier 乘子**：$H(\omega) = \sum_k \frac{a_k}{\omega - p_k}$，**FNO 是其特例**（$H(\omega) = 1$，即常数乘子）。极点是**可学习且受约束**的（保证稳定），对应 Nehari 理论。

**关键性质：网格无关的精度**。Darcy 基准上误差从 $85^2$ 到 $421^2$ 几乎不变，而 FNO 增长 8 倍。原因在于 HNO 的**乘子是解析的（有理函数）**，在网格加密时其采样误差收敛更快，而 FNO 的自由参数化 Fourier 乘子在高频处欠拟合。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Hankel neural operator (HNO)** | 基于解算子数学结构的神经算子架构 |
| **Toeplitz + finite-rank Hankel decomposition** | 理论基石：卷积（初值）+ 有限秩（边界） |
| **Non-periodic causal convolution via FFT** | 实现 (a)：因果性避免未来信息泄漏 |
| **Closed-loop Lur'e operator** | 实现 (b)：显式建模边界反馈，处理无衰减记忆动力系统 |
| **Rational Fourier multiplier with learnable stable poles** | 实现 (c)：FNO 的推广，极点受约束保证稳定 |
| **Kronecker / Nehari / Adamyan-Arov-Krein theory** | 提供核类的稳定性、有限秩、范数界的理论保证 |
| **Interior-time regularization (LNO-style)** | 针对边界带状误差带的正则化（需查正文确认） |
| **Ablation on each component** | 验证每个组件必要性 |

---

## 公式

**HNO 的算子形式**（理论）：解算子 $G$ 作用于输入 $f$：

$$\left(G f\right)(t) = \underbrace{\int_{t_0}^{t} k(t - s)\, f(s)\, ds}_{\text{Toeplitz（因果卷积）}} + \underbrace{\sum_{j=1}^{m} a_j\, f(\tau_j)\, g(t)}_{\text{有限秩 Hankel（边界项）}}$$

- $k$：有理核（由微分方程特征方程决定）
- $g$：边界响应函数
- $\tau_j$：边界位置（对应 $m$ 个边界条件）
- $m$ 有限 → Hankel 秩有限

**有理 Fourier 乘子**（实现 c）：

$$\widehat{G}(\omega) = \sum_{k=1}^{K} \frac{a_k}{\omega - p_k}, \qquad \Re(p_k) < 0 \ \text{（稳定性约束）}$$

**FNO 是特例**：$K=0$ 时 $\widehat{G}(\omega) = 1$（恒等乘子）。

**Lur'e 闭环形式**（实现 b）：

$$\dot{x}(t) = A x(t) + B u(t), \qquad y(t) = C x(t) + D u(t)$$

在 HNO 中 $A, B, C, D$ 由可学习参数构成，$u$ 为边界输入。

**HNO 层（可学习版本）**：以核参数化为 $\hat{k}_\theta \in \mathbb{C}^{N}$，Fourier 域逐层更新：

$$\hat{v}_{\ell+1}(\omega) = \sigma\Big(\hat{k}_\theta(\omega)\,\hat{v}_\ell(\omega) + \hat{m}_\theta(\omega)\Big)$$

其中 $\hat{m}$ 对应有限秩 Hankel 项（在 Fourier 域表现为低秩修正）。

---

## 实验结论

- **LNO 基准**：**9 个**，HNO 平均测试误差**最低**
- **FNO 基准**：**Burgers、Darcy、Navier-Stokes**，HNO 平均测试误差**最低**
- **统计显著性**（作者诚实报告）：
  - 其中 **2 项差异不显著**
  - 与**参数匹配的 FNO** 在 **Navier-Stokes** 上的对比**不显著**
- **ODE 基准**：**6 个 ODE 问题**，HNO 把较优基线的平均误差降低 **2.1–5.2 倍**
- **网格无关性（Darcy）**：
  - HNO 误差从 $85^2$ 到 $421^2$ 网格**几乎恒定**
  - FNO 误差增长 **8 倍**
- **消融**：支持每个组件的必要性

---

## 局限性

1. **部分优势不显著**：与参数匹配 FNO 在 Navier-Stokes 上的差异统计不显著——即在**流体 PDE** 这个最相关的场景上，优势并未被确证。
2. **线性常系数假设**：理论基于**线性常系数**边值问题。对**非线性**流动（Navier-Stokes、湍流），结构分析不直接适用；实践中靠训练拟合，但归纳偏置的优势会减弱。
3. **有限秩的约束性**：真实问题边界条件数可能超出训练时的秩设定。
4. **区间长度无关的范数界**是理论结果，**数值实现**未必达到该最优性。
5. **代码链接异常**：摘要中 `\hnorepo{}` 为占位符，需查正文。
6. **未涉及渲染**：纯 PDE 代理方法。对渲染的价值是作为**更精确的流动场求解器**（尤其 Darcy = 地下/多孔介质流动，Burgers = 对流主导流动，Navier-Stokes = 核心流体力学）。
7. **与专用流体力学网络（FNO 的变体、U-Net、Physics-informed）对比不足**：摘要未列出与 DeepONet、PINN 系方法的直接对比。

---

## 相关工作

- [[神经算子]]
- [[FNO 傅里叶神经算子]]
- [[LNO 拉普拉斯神经算子]]
- [[PDE 代理模型]]
- [[神经代理模型]]
- [[Navier-Stokes]]
- [[SimpFlow 简化物理预训练]]（2026-11-09 收录，同期）
- [[Hydrograd v2.0 可微浅水模型]]（2026-11-08 收录）

---

## 实现建议

- **实现难度**: 高（需理解算子理论与 Fourier 分析，代码实现难度中等但调参门槛高）
- **预期性能**: 9 个 LNO 基准 + 3 个 FNO 基准平均误差最低；ODE 上降 2.1–5.2×；Darcy 网格无关
- **适用场景**:
  - ✅ **线性/线性化 PDE 的快速代理**（对流、扩散、传热、多孔介质）
  - ✅ 需要**网格无关精度**的场景（训练与推理分辨率不一致）
  - ✅ **ODE 系统**（优势最明显，2.1–5.2×）
  - ✅ 有**明确边界条件**的问题（有限秩 Hankel 项正好建模边界）
  - ⚠️ **非线性湍流流动**（理论优势不直接适用，需实测）
  - ❌ 已有 FNO 且精度足够（差异统计不显著，迁移收益不确定）

**给 @墨鱼丸 的可行性判断**：**对流体渲染是间接价值**——它是一个可能更准的**流动场求解器**，可用于生成渲染所需的速度场/密度场。特别值得关注的是**网格无关性**（Darcy 上 $85^2 \to 421^2$ 误差恒定），这意味着**可以用低分辨率训练、高分辨率推理**，这对渲染非常有用（低分辨率模拟便宜，高分辨率渲染需要）。但需注意：在 Navier-Stokes 上相对参数匹配 FNO 的优势**统计不显著**，因此不应据此认为"比 FNO 更适合流体渲染"。建议：若团队已在用 FNO 做流动代理，可把 HNO 作为**候选对照**小规模实测，重点测网格无关性在渲染分辨率下的实际收益；不建议直接替换现有方案。
