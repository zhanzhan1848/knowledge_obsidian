---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, neural-operator, hankel-operator, fno, lno, pde-solver, spectral-method]
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
| **代码** | 摘要中以 `\hnorepo{}` 占位，链接未在摘要文本中呈现（代码与数据链接见论文） |
| **分类** | 神经算子 / PDE 解算子的谱方法学习 |

---

## 核心贡献

> **一句话点题：从"区间上线性常系数边值问题的解算子必为 Toeplitz 算子 + 有限秩 Hankel 型算子"这一结构出发，构造出同时具备非周期卷积、无衰减记忆闭环与有理性频域乘子三大实现的 Hankel 神经算子（HNO），从而补上 FNO/LNO 在边界、初值与瞬态上的先天缺陷。**

1. **理论刻画**：证明良定线性常系数区间边值问题的解算子是 **Toeplitz 算子 + 携带边界信息的有限秩 Hankel 型算子**，其核为有理函数；并援引 Kronecker、Nehari、Adamyan–Arov–Krein 的经典结果，说明该核类具有**稳定极点、有限 Hankel 秩、以及与区间长度无关的范数界**。
2. **方法构造**：HNO 以三种方式实现这一核类——
   (a) **非周期卷积**，用 FFT 计算且为**因果型**；
   (b) **Lur'e 型闭环算子**，用于**无衰减记忆**的动力学；
   (c) **有理性 Fourier 乘子**，其中 **FNO 是其特例**。
3. **问题诊断**：明确指出 FNO 缺少处理**边界、初始状态与瞬态**的显式机制，其误差在**无阻尼振子**上很大，且**随网格加密而增长**；LNO 虽引入极点–留数符号，但在离散 Fourier 网格上求值且**极点不受约束**。
4. **实证**：仅用数据训练，HNO 在**全部 9 个 LNO 基准**以及 **Burgers、Darcy、Navier–Stokes** 三个 FNO 基准上取得**最低平均测试误差**；在 **6 个 ODE 问题**上把更优基线的平均误差降低 **2.1–5.2 倍**；Darcy 误差从 $85^2$ 到 $421^2$ 网格**几乎不变**，而 FNO 的误差**增长八倍**。消融实验支持各组件。
5. **统计显著性说明**：其中两处差异、以及与**参数匹配 FNO** 的 Navier–Stokes 对比**在统计上不显著**（诚实报告）。

---

## 技术方案

### 核心思想

神经算子（FNO）是求解 PDE 的主力方法，但其频谱核心是**在周期网格上做 Fourier 变换**——周期假设天然与"有限区间 + 边界条件"冲突。FNO 因而没有显式机制表达边界、初值或瞬态；在无阻尼振子上误差很大，且网格越细误差反而变大（这是"谱偏差/分辨率反常"的一种表现）。LNO（Laplace 神经算子）试图用极点–留数符号刻画解算子，但符号在离散 Fourier 网格上求值、极点不受约束，因此并未真正兑现其结构先验。

HNO 的出发点是**从解算子的数学结构出发**而不是从通用谱基出发。对区间上的线性常系数常微分边值问题，解算子 \(S\) 可以精确分解为：

- **Toeplitz 部分**：核为有理函数（对应解算子的"体"）；
- **有限秩 Hankel 型部分**：编码初值/边界条件等"边界信息"。

由 Kronecker / Nehari / AAK 理论，这类核有稳定极点、有限 Hankel 秩与范数界（后者保证谱展开在区间加长时保持稳定，这正是 FNO 网格加密反而变差的反面）。

HNO 用三种可计算的实现覆盖这一核类的不同侧面：

1. **非周期（因果）FFT 卷积**：用 FFT 实现零填充的非循环卷积，核取因果形式，直接编码"初始状态 → 后续解"的半无限传播结构；
2. **Lur'e 闭环算子**：\(S = S_0 + S_1 (I - S_2)^{-1} S_3\) 形式的反馈结构，用于**不衰减记忆**（无阻尼）动力学，可表达极点；
3. **有理性 Fourier 乘子**：在 Fourier 域中用有理函数形式参数化乘子；FNO 的复值卷积核是其**特例**（取适当退化参数），因此 HNO 是对 FNO 的严格推广而非并列模型。

训练完全依赖数据（无物理方程约束），这保证了它可以直接套用到任何有解算子可采样的 PDE 上。

### 关键技术

| 技术 | 说明 |
|------|------|
| Toeplitz + 有限秩 Hankel 分解 | 区间边值问题解算子的结构定理 |
| 有理核 | 核为有理函数，对应稳定极点 |
| Kronecker / Nehari / AAK 理论 | 支撑稳定极点、有限 Hankel 秩、与区间长度无关的范数界 |
| 非周期因果卷积（FFT 实现） | 表达初值与半无限传播，避免周期性假设 |
| Lur'e 型闭环算子 | 表达无衰减记忆（无阻尼）动力学 |
| 有理性 Fourier 乘子 | 域内有理形式参数化；**FNO 为其特例** |
| 数据驱动训练 | 无方程约束的算子学习 |
| 网格无关性验证 | $85^2 \to 421^2$ 网格误差近似不变（Darcy） |
| 消融实验 | 分别验证卷积 / Lur'e / 有理乘子各组件的贡献 |
| 统计显著性检验 | 对比结果给出显著性判定（部分差异不显著） |

---

## 公式

解算子的 Toeplitz + Hankel 分解（论文核心定理的示意形式）：

```math
S \;=\; S_{\text{Toeplitz}} \;+\; S_{\text{Hankel}},
\qquad
\big(S_{\text{Hankel}} f\big)(x) = \int_a^b h(x,y)\,f(y)\,dy,
\quad \mathrm{rank}(S_{\text{Hankel}}) = k < \infty
```

Hankel 核的结构与有限秩条件（示意）：

```math
h(x,y) = \sum_{j=1}^{k} p_j(x)\,q_j(y), \qquad
\det\big[\,c_{i-j}\,\big]_{i,j=1}^{N} \neq 0 \;\Rightarrow\; \mathrm{rank}(H) = N
```

其中 $c_m$ 为核的有理展开的 Taylor 系数（Nehari 型判据）。

有理性 Fourier 乘子（示意）：

```math
\hat{S}(\kappa) \;=\; \frac{\displaystyle\sum_{m=0}^{M} a_m (i\kappa)^m}
{\displaystyle\sum_{n=0}^{N} b_n (i\kappa)^n}
\;\xrightarrow[\text{FNO 特例}]{a_m=0\ \forall m\ge1}\; \hat{K}(\kappa)
```

因果型非周期卷积（示意）：

```math
(S_{\text{causal}} f)(t) = \int_{0}^{t} k(t-\tau)\,f(\tau)\,d\tau,
\qquad
k \text{ 取 } \begin{cases} \text{有理/指数衰减核} \end{cases}
```

Lur'e 闭环算子（示意）：

```math
S \;=\; S_0 + S_1\,\big(I - S_2\big)^{-1} S_3
```

网格无关性对比（示意，用 Darcy 基准）：

```math
\frac{\varepsilon_{\text{HNO}}(421^2)}{\varepsilon_{\text{HNO}}(85^2)} \approx 1,
\qquad
\frac{\varepsilon_{\text{FNO}}(421^2)}{\varepsilon_{\text{FNO}}(85^2)} \approx 8
```

> 上述公式为依据摘要描述（PDE 解算子结构定理、有理核、Lur'e、FNO 特例、误差比值）写出的示意性表达；摘要未给出论文中具体定理编号与记号细节。

---

## 代码片段

```python
# 概念性伪代码：HNO 的三种实现与网格无关性评测
import numpy as np


class HankelNeuralOperator:
    """以解算子结构（Hankel 秩 + 有理核）参数化的算子。"""

    def __init__(self, in_dim=1, out_dim=1, n_basis=64, hankel_rank=8,
                 rational_deg=4, mode="causal"):
        self.W = np.random.randn(n_basis, n_basis) / np.sqrt(n_basis)
        self.b = np.random.randn(in_dim, n_basis)
        self.c = np.random.randn(n_basis, out_dim)
        # 有限秩 Hankel 部分：k 项外和，承载边界/初值信息
        self.P = np.random.randn(hankel_rank, n_basis)
        self.Q = np.random.randn(n_basis, hankel_rank)
        self.a = np.random.randn(rational_deg + 1)   # 有理核分子
        self.bn = np.random.randn(rational_deg + 1)  # 有理核分母
        self.mode = mode  # "causal" | "lure" | "rational"

    def basis(self, x):
        """一维连续基函数（示意）。"""
        n = x.shape[0]
        k = np.arange(self.W.shape[0])
        return np.exp(-((x[:, None] - x[None, :]) ** 2)[..., None] * (k / n)[None, None, :] ** 2)

    def rational_multiplier(self, kappa):
        """有理性 Fourier 乘子；FNO 对应分子只剩常数项的特例。"""
        num = np.polynomial.polynomial.polyval(1j * kappa, self.a[::-1])
        den = np.polynomial.polynomial.polyval(1j * kappa, self.bn[::-1])
        return num / (den + 1e-8)

    def apply(self, u, x, dx):
        """把算子作用到输入场上。"""
        Bu = self.basis(x) @ u                       # 基函数投影
        if self.mode == "causal":
            # 非周期因果卷积（FFT 实现）
            K = np.fft.rfft(np.concatenate([np.zeros(len(x)), Bu[:len(x)//2]]))
            Y = np.fft.irfft(K * np.fft.rfft(Bu, axis=0), n=Bu.shape[0], axis=0)
        elif self.mode == "lure":
            # Lur'e 闭环算子（无衰减记忆）
            S2 = self.W / (1.0 + 1e-3 * np.eye(self.W.shape[0]))
            Y = Bu + self.Q @ np.linalg.solve(np.eye(self.W.shape[0]) - S2,
                                             self.P @ Bu)
        else:                                          # rational
            kap = 2 * np.pi * np.fft.rfftfreq(len(x), d=dx)
            Y = np.fft.irfft(np.fft.rfft(Bu, axis=0) * self.rational_multiplier(kap)[:, None],
                             n=Bu.shape[0], axis=0)
        # 加上有限秩 Hankel 项（边界信息）
        Y = Y + self.Q @ (self.P @ Bu)
        return self.c @ Y.T


def grid_refinement_study(model, sizes=(85, 421)):
    """评测误差随网格加密的变化：HNO 近似不变，FNO 显著增长。"""
    errs = []
    for n in sizes:
        x = np.linspace(0, 1, n)
        u_true = np.sin(2 * np.pi * x)[:, None]
        pred = model.apply(u_true, x, dx=1.0 / (n - 1))
        errs.append(np.linalg.norm(pred - u_true) / np.linalg.norm(u_true))
    return errs
```

---

## 实验结论

- **数据集**: 全部为数值/合成 PDE 基准——**9 个 LNO 基准**、FNO 的 **Burgers、Darcy、Navier–Stokes** 基准、以及 **6 个 ODE 问题**（含无阻尼振子）。共 21 页、9 图、9 表。训练完全来自数据。
- **基线**: **FNO**（Fourier Neural Operator）与 **LNO**（Laplace Neural Operator）；Navier–Stokes 任务额外对比了**参数匹配的 FNO**。
- **结果**:
  1. HNO 在**全部 9 个 LNO 基准**上取得**最低平均测试误差**。
  2. 在 **Burgers、Darcy、Navier–Stokes** 三个 FNO 基准上同样取得最低平均测试误差；其中两处差异**统计上不显著**，与参数匹配 FNO 的 Navier–Stokes 对比也**不显著**。
  3. 在 6 个 ODE 问题上，把**更优基线**的平均误差降低 **2.1–5.2 倍**。
  4. **网格无关性**：Darcy 误差从 $85^2$ 到 $421^2$ **几乎恒定**；FNO 在同一区间误差**增长八倍**。
  5. FNO 在无阻尼振子上误差大且随网格加密而增长；消融实验支持 HNO 各组件的必要性。

---

## 局限性

- 核心定理针对**线性、常系数、区间上的边值问题**；非线性 PDE、多维复杂几何、变系数问题上的结构推广摘要未说明。
- HNO 的**性能优势并非在所有基准上统计显著**（论文诚实报告了三处不显著比较）。
- 极点–留数类方法通常面临**训练不稳定**问题；HNO 用有理性乘子与闭环结构处理，但稳定性条件摘要未说明。
- 摘要中的代码链接为占位符（`\hnorepo{}`），实际可获取性需查阅论文正文。
- 计算成本与参数量相对 FNO 的开销倍数摘要未给出（FFT + 矩阵求解的复杂度讨论未在摘要中体现）。
- 实验均为**二维/一维基准**，未见三维高分辨率湍流或真实实验数据验证。

---

## 相关工作

- [[2026-11-11-Sakib-Mychkovsky-Babaee-Low-Rank-Tensor-Manifolds-Turbulence]]
- [[2026-11-11-Zheng-Shen-Xie-Velocity-Gradient-Invariants-Lundgren]]
- [[2026-11-11-Wang-Bao-Wang-Cardiac-Cycle-Pulsatile-Pipe-Flow]]
- [[2026-11-05-Zhang-Cai-Huang-Ren-GauSmoke-Hybrid-Physics-Optical-Gaussian-Splatting]]

---

## 实现建议

- **实现难度**: ⚠️ 中等。三个组件（非周期因果卷积、Lur'e 闭环、有理乘子）都不算难，但**流形/有理参数化 + 数值稳定性**是主要坑；建议先复现 Darcy 网格加密实验作为验收标准。
- **预期性能**: ✅ 中等偏好。推理成本与 FNO 同量级（FFT 主导），但 HNO 的网格无关性意味着**在细网格上不需重训**，长期成本显著更低；ODE 类问题误差降低一个数量级级别。
- **适用场景**:
  - ✅ **有边界、有初值、有瞬态的 PDE 代理模型**：如带壁面边界条件的 Navier–Stokes 代理、管道/边界层流动的快速求解，可替代部分 CFD 采样。
  - ✅ **Navier–Stokes 类基准的速度场预测**，用于生成渲染所需的流场先验（训练一次、细网格直接推理）。
  - ✅ 训练**降阶模型（ROM）**或作为 MANTRA 一类的稀疏重建工具的上游求解器。
  - ⚠️ 若用于实时渲染的每帧物理解算，仍偏重；建议离线烘焙为纹理/低维基。
  - ❌ 不适合强非线性、多相、激波等超出"线性常系数"假设的流场。

---
