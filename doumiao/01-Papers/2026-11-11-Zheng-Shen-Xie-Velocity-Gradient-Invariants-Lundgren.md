---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, turbulence, velocity-gradient-invariants, lundgren-vortex, q-r-diagram, statistical-modeling]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2611.14095
---

# Modelling velocity gradient invariants in turbulence with Lundgren spiral vortex ensemble

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Modelling velocity gradient invariants in turbulence with Lundgren spiral vortex ensemble |
| **作者** | Zhi Zheng, Weiyu Shen, Jin-Han Xie, Yue Yang |
| **发表** | arXiv preprint (physics.flu-dyn), 2026-11-10 |
| **链接** | [arXiv:2611.14095](https://arxiv.org/abs/2611.14095) |
| **DOI** | — |
| **代码** | 摘要未声明 |
| **分类** | 湍流动力学 / 速度梯度不变量（Q-R 图）与统计建模 |

---

## 核心贡献

> **一句话点题：把 Lundgren 螺旋涡系综编织成的人工湍流场拆解为"拉伸—螺旋臂—耗散"三段物理机制，并据此显式建模速度梯度不变量的联合概率密度 $P(Q,R)$。**

1. 引入"编织 Lundgren 湍流"（WLT，woven Lundgren turbulence）这一**合成湍流场**：由 Lundgren 螺旋涡系综在随机场背景中构成，天然携带**非高斯涡量相关性**与**多尺度相互作用**，这是复现均匀各向同性湍流中所观测 $P(Q,R)$ 的关键。
2. 通过分析 WLT 中**拉伸（stretching）、卷绕（winding）、耗散（dissipation）**三类过程的贡献，证明 **$Q$-$R$ 图可划分为三个不同的物理区域**：拉伸主导的**头部区**、螺旋涡臂主导的**体部区**、耗散主导的**尾部区**。
3. 系统扫描三个关键 WLT 参数并监测各拓扑区域的演化，得到明确的对应规律：**背景应变率↑ → 头部区展宽；螺旋涡截止年龄↑ → 体部区倾角增大；黏性衰减因子↓ → 尾部区延伸**，从而模拟了应变自放大与跨尺度涡拉伸的效应。
4. 基于 WLT 统计量**建立并验证了一个显式的 $P(Q,R)$ 模型**，由拉伸、螺旋、耗散三部分贡献组成；由此把"局部几何"与"全局湍流统计"联系起来，给出可解释的物理框架。

---

## 技术方案

### 核心思想

均匀各向同性湍流中，$Q$-$R$ 图（由速度梯度张量的第二、第三不变量构成）是诊断局部流场结构的经典工具：$Q$ 反映应变与涡量的相对强弱，$R$ 反映特征值分布的不对称性，因而 $P(Q,R)$ 天然把"局部几何"与"全局统计"联系起来。但直接从 DNS 数据统计 $P(Q,R)$ 只能给出结果曲线，难以回答"为什么是这个形状"。

本文用一个**可解析、可调参的合成替代模型**来回答这个问题——Lundgren 螺旋涡系综。Lundgren 涡模型源自早期的湍流生成理论，其核心是"自复制"的螺旋涡结构：每个涡随时间绕自身轴卷绕、并与背景应变场耦合，从而在统计上表现为连续的涡量传递。将一族具有不同"年龄"的螺旋涡放入强度可调的随机场背景中，并施加黏性衰减，就得到既非高斯、又具备多尺度相互作用的 WLT。

关键洞察是：**这个合成场的 $P(Q,R)$ 曲线形状可以被解释性地拆解**。不同阶段的螺旋涡在不同区域扮演不同角色——年轻涡处于拉伸主导区、成熟涡体现卷绕/螺旋臂特征、老化涡进入耗散区。于是 $Q$-$R$ 平面自然被划分为三个物理区域，而不是被经验性地切开。

参数扫描进一步把"参数"赋予直接物理含义：背景应变率对应**应变自放大**与跨尺度涡拉伸；螺旋涡截止年龄控制涡系综的演化深度（年龄越大，卷绕相位越靠后，体部区倾角随之变化）；黏性衰减因子则模拟黏性耗散对尾部结构的抑制（因子越小，高 Re 尾迹延伸得越远）。最终，作者把这些统计关系提炼为一个显式的 $P(Q,R)$ 分解模型——拉伸项、螺旋项、耗散项——并用 WLT 数据做验证，使该模型有望被反向用于解释真实湍流中非高斯性的来源。

### 关键技术

| 技术 | 说明 |
|------|------|
| Lundgren 螺旋涡系综 | 由自复制螺旋涡构成的湍流生成模型，提供可解析的涡结构与速度梯度 |
| WLT（woven Lundgren turbulence） | 在随机场背景中编织一族不同年龄的螺旋涡，得到携带非高斯涡量相关与多尺度相互作用的合成湍流场 |
| 速度梯度不变量 | 由 $\nabla \mathbf{u}$ 的特征值构造 $Q$、$R$，构成 $Q$-$R$ 判据面 |
| $Q$-$R$ 拓扑分区 | 把相平面划分为头部（拉伸主导）、体部（螺旋涡臂主导）、尾部（耗散主导）三区 |
| 参数扫描 | 扫描背景应变率、螺旋涡截止年龄、黏性衰减因子并监测分区演化 |
| 分解式 $P(Q,R)$ 模型 | 将联合概率密度显式写为拉伸贡献、螺旋贡献、耗散贡献之和，并做验证 |

---

## 公式

速度梯度张量的分解与不变量（示意性标准形式，摘要未给出具体公式细节）：

```math
A = \nabla \mathbf{u}, \qquad
S = \tfrac{1}{2}(A + A^{\mathsf T}), \qquad
\Omega = \tfrac{1}{2}(A - A^{\mathsf T})
```

```math
Q = -\tfrac{1}{2}\,\mathrm{tr}(S^2) - \mathrm{tr}(\Omega^2), \qquad
R = -\tfrac{1}{3}\mathrm{tr}(S^3) - \mathrm{tr}(S\Omega^2)
```

由特征值 $(\lambda_1,\lambda_2,\lambda_3)$（$\lambda_1\ge\lambda_2\ge\lambda_3$，且 $\lambda_1+\lambda_2+\lambda_3=0$）构造：

```math
Q = \tfrac{1}{2}\left(\lambda_1^2+\lambda_2^2+\lambda_3^2\right)
```

WLT 中速度梯度的示意性分解（背景应变 + 螺旋涡旋转 − 黏性耗散）：

```math
A(\mathbf{x},t) \;\approx\; \underbrace{S_0}_{\text{背景应变}}
\;+\; \sum_i \underbrace{A_i^{\text{spiral}}(t-t_i)}_{\text{螺旋涡旋转}}
\;-\; \nu \underbrace{\nabla^2 A}_{\text{黏性耗散}}
```

螺旋涡贡献的示意形式（指数衰减 + 绕轴卷绕）：

```math
A_i^{\text{spiral}}(\tau) \;\sim\; \mathrm{e}^{-\nu\, c\, \tau}\,
\mathcal{R}(\omega_i \tau)\,
\Big(\nabla \mathbf{v}_i - \tfrac{1}{3}(\nabla \mathbf{v}_i)\mathbf{1}\Big),
\qquad \tau = t - t_i
```

其中 $\tau$ 为涡龄，$\omega_i$ 为涡旋转角频率，$c$ 为黏性衰减因子，$\mathcal{R}(\cdot)$ 为绕轴旋转矩阵。

最终显式模型的示意性分解形式：

```math
P(Q,R) \;=\; P_{\text{stretch}}(Q,R;\sigma_s)
\;+\; P_{\text{spiral}}(Q,R;\omega,\tau_c)
\;+\; P_{\text{diss}}(Q,R;\nu c)
```

> 上述公式为依据摘要描述（WLT 构造、三参数、三区域、显式分解模型）写出的**示意性表达**，摘要未公布具体参数化形式与论文中的方程编号。

---

## 代码片段

```python
# 概念性伪代码：WLT 构造与 P(Q,R) 分解
import numpy as np

def build_wlt(n_grid=128, n_vortices=400, strain_rate=2.0,
              cutoff_age=1.0, viscous_factor=0.05, seed=0):
    """编织 Lundgren 湍流：随机场背景 + 一族不同年龄的螺旋涡。"""
    rng = np.random.default_rng(seed)
    k = np.linspace(0.0, 2.0 * np.pi, n_grid, endpoint=False)
    kx, ky = np.meshgrid(k, k, indexing="ij")

    # 随机场背景（应变场），强度由 strain_rate 控制
    A = np.zeros((n_grid, n_grid, 2, 2))
    for _ in range(n_vortices):
        phase = rng.uniform(0, 2 * np.pi)
        wave = rng.integers(1, 6)
        S0 = strain_rate * np.array([[np.cos(phase), np.sin(phase)],
                                     [np.sin(phase), -np.cos(phase)]])
        A += S0 * np.cos(wave * kx + phase) * np.cos(wave * ky)

    # 螺旋涡：涡龄在 [0, cutoff_age] 内截断；随龄指数衰减
    for age in rng.uniform(0.0, cutoff_age, n_vortices):
        decay = np.exp(-viscous_factor * age)   # 黏性衰减因子
        omega = rng.uniform(2.0, 6.0)           # 绕轴卷绕角频率
        theta = omega * age
        R = np.array([[np.cos(theta), -np.sin(theta)],
                      [np.sin(theta),  np.cos(theta)]])
        A += decay * (R @ np.eye(2))             # 结构化叠加（示意）
    return A


def invariants(A):
    """从速度梯度张量计算 Q, R。"""
    S = 0.5 * (A + np.swapaxes(A, -1, -2))
    Om = 0.5 * (A - np.swapaxes(A, -1, -2))
    trS2 = np.einsum('...ij,...ji->...', S, S)
    trOm2 = np.einsum('...ij,...ji->...', Om, Om)
    trS3 = np.einsum('...ij,...jk,...ki->...', S, S, S)
    trSO2 = np.einsum('...ij,...jk,...ki->...', S, Om, Om)
    Q = -0.5 * trS2 - trOm2
    R = -(1.0 / 3.0) * trS3 - trSO2
    return Q, R


def partition_regions(Q, R):
    """按物理机制把 Q-R 平面分为头部/体部/尾部三区（示意）。"""
    head = (Q > 0) & (R > 0)                    # 拉伸主导
    body = (Q < 0)                              # 螺旋涡臂主导
    tail = (Q < 0) & (R < 0)                    # 耗散主导（尾部延伸）
    return head, body, tail


def decompose_pdf(Q, R, sigma_s, omega, tau_c):
    """P(Q,R) = 拉伸项 + 螺旋项 + 耗散项（示意）。"""
    P_stretch = np.exp(-(Q / sigma_s) ** 2) * np.exp(-((R - Q) ** 2) / (2 * sigma_s ** 2))
    P_spiral = np.exp(-((Q + 0.25) ** 2) / (2 * sigma_s ** 2)) * np.exp(-(R ** 2) / (2 * tau_c ** 2))
    P_diss = np.exp(-((R + 0.35) ** 2) / (2 * sigma_s ** 2)) * (Q < 0)
    return P_stretch, P_spiral, P_diss
```

---

## 实验结论

- **数据集**: 合成湍流场——由 Lundgren 螺旋涡系综编织而成的 WLT；通过系统扫描背景应变率、螺旋涡截止年龄、黏性衰减因子三组参数生成多组样本，不依赖真实 DNS 数据集。
- **基线**: 摘要未提及传统基线方法；对照对象为**均匀各向同性湍流中已知的 $P(Q,R)$ 曲线形态**（WLT 用以复现其非高斯特征与多尺度相互作用）。
- **结果**: ① $Q$-$R$ 图可稳定划分为三个物理区域（头部=拉伸主导、体部=螺旋涡臂主导、尾部=耗散主导）；② 增大背景应变率 → 头部区展宽；③ 增大螺旋涡截止年龄 → 体部区倾角增大；④ 减小黏性衰减因子 → 尾部区延伸；⑤ 由拉伸、螺旋、耗散三部分构成的显式 $P(Q,R)$ 模型通过 WLT 统计验证；⑥ 摘要未给出具体误差数值与"几倍/百分之几"等定量指标。

---

## 局限性

- 全部结论建立在**合成湍流**（WLT）之上，而非来自真实 DNS 或实验数据；模型对真实湍流的适用性摘要未说明。
- $P(Q,R)$ 显式模型的具体参数化形式、拟合误差等定量结果摘要未说明。
- Lundgren 涡模型本身是较早期的湍流生成模型，其对现代湍流标度律的描述能力需进一步论证。
- 是否能覆盖真实湍流中的**间歇性（intermittency）**与**耗散异常（dissipation anomaly）**摘要未说明。
- 代码与数据开源情况摘要未声明。

---

## 相关工作

- [[2026-11-08-HGKS-Compact-ALE-Gas-Kinetic-Unstructured-Mesh]]
- [[2026-11-11-Sakib-Mychkovsky-Babaee-Low-Rank-Tensor-Manifolds-Turbulence]]
- [[2026-11-11-Zhang-Kaufer-Ronglan-Triantafyllou-Bluff-Body-Wakes-Dataset]]
- [[2026-10-19-SplashSplat-Multi-View-Liquid-Reconstruction]]

---

## 实现建议

- **实现难度**: ⚠️ 中等。WLT 生成与不变量统计本身不难（NumPy 即可完成），但"三区划分 + 分解模型 + 参数扫描 → 显式模型"的完整推导需要湍流统计力学背景。
- **预期性能**: ✅ 高。合成场只需网格级张量运算（百万量级采样点），单次参数扫描在 CPU 上即可跑完；$P(Q,R)$ 的二维直方图统计开销可忽略。
- **适用场景**:
  - ✅ 作为**湍流纹理/粒子系统的统计先验**：用 $P(Q,R)$ 约束体积渲染中湍流结构的分布（螺旋臂 vs 拉伸片层），避免"烟雾看起来像随机噪声"。
  - ✅ 为火焰与烟雾的**涡旋度着色、次表面散射**提供可微的局部几何分布。
  - ✅ 作为教学与评审用的**湍流几何参考模型**，成本远低于真 DNS。
  - ⚠️ 不可直接用于需要真实瞬时涡结构的场景（合成场缺少真实级联细节与间歇性）。
  - ❌ 不适合作为高精度动力学模型的替代（如求解 Navier–Stokes 涡演化）。

---
