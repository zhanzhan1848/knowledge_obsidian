---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, fluid, kinetic-stability, Boltzmann-equation, Orr-Sommerfeld, transient-growth, pseudospectra, Couette, Poiseuille, LBM-kinetic]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2610.38714
---

# Kinetic linear stability theory for incompressible parallel shear flows with the full Boltzmann collision operator

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Kinetic linear stability theory for incompressible parallel shear flows with the full Boltzmann collision operator |
| **作者** | Vassilis Theofilis |
| **发表** | arXiv:2610.38714 [physics.flu-dyn], 2026-10-28 |
| **链接** | [原文](https://arxiv.org/abs/2610.38714) |
| **DOI** | 10.48550/arXiv.2610.38714 |
| **代码** | - |
| **篇幅** | 较长（多表多图） |

---

## 核心贡献

> 首次把**完整 Boltzmann 碰撞算子**线性化并用于**壁面约束平行剪切流的模态/非模态线性稳定性分析**（kLST）：硬球算子与 BGK、ES-BGK、Shakhov 三个弛豫模型共享同一离散，从而可**直接对比**；同时**首次建立气体动力学的能量范数与动能 Reynolds–Orr 方程**，给出动能描述下的**瞬态增长、伪谱与数值横坐标**。

1. **首次在剪切流稳定性特征值问题中使用完整 Boltzmann 碰撞算子**——此前所有基于动力学的剪切流稳定性工作（Zou et al. 2022/2023/2024、Ma et al. 2024、Wu 2026、Karpuzcu & Levin 2025 等）**除一个例外全部基于弛豫模型**，且无一在**实用雷诺数 $O(10^2)$–$O(10^5)$**（碰撞项刚性最强处）系统做过。
2. **四种碰撞算子共享同一离散**：硬球、BGK、ES-BGK、Shakhov 用同一套求积/配点/边界处理，结果可直接对比——此前从无两种碰撞模型在同一流动上的比较。
3. **动理学非模态稳定性理论（首次）**：定义了含 Chu (1965) 扰动能量的**能量范数**，并**写出动能 Reynolds–Orr 方程**，证明**平均剪切是唯一的能量源**，碰撞与壁面只移除能量。
4. **能量稳定性 $Re$ 的"缺失"**：由于碰撞在局部平衡态并不耗散扰动，适当选取的初始扰动能量在**任意雷诺数下都增长**；因此**动能描述中不存在 Joseph (1976) 能量稳定性雷诺数的对应物**（N-S 平面 Couette 为 $Re=20.7$）。这一额外增长被限制在 $O(1/\nu_\mu)$ 的时间尺度内，相对能量增益 $O(\mathrm{Ma}\cdot\mathrm{Kn})$。
5. **四个基准流动全部复现连续介质稳定性理论**：平面 Poiseuille（Orszag 1971, $Re=10^4$）、平面 Couette（$Re=10^3$）、Michalke 双曲正切混合层（$Re=10^2$–$10^5$）、Blasius 边界层（Mack 1976, $Re=580$）。Orr–Sommerfeld 特征值在不可压极限下：三个弛豫模型吻合到**几个 $10^{-7}$**，完整算子到 **$10^{-6}$**。
6. **伪谱解决了非收敛问题**：Zou et al. (2023) 报告 Couette 流谱分支交汇处特征值**随速度节点数增加永不收敛**；本文指出这在连续介质理论中由稳定性矩阵的**非正规性**完全解释，而**伪谱对分支交汇处模态的病态不敏感**，从而给出了该非收敛现象的动理学解释。
7. **快谱方法使完整算子可行**：Gamba, Haack, Hauck, Hu (2017) 的快谱方法用于**全碰撞算子**，在速度空间构造稠密矩阵（$n_b\times n_b$），使完整 Boltzmann 算子的线性化首次在实用 $Re$ 下可行。

---

## 技术方案

### 核心思想

**问题**：气体动力学（动理学）描述下，平行剪切流的稳定性是什么？此前只有弛豫模型 + 二维 + 多数等温的零散工作。

**框架**：
- **基态**：给定速度剖面（闭式或节点值）+ **Chapman–Enskog 修正**，由体力维持定常 → 方法限于**近连续介质、近不可压基流**（$Kn\ll1$，$\mathrm{Ma}^2\ll1$），但**扰动是完全可压缩且完全动理学的**。
- **特征值问题写在"peculiar velocity"（本征速度）**：$\bm{c}=\bm{v}-\bm{u}$。写成 peculiar velocity 后，**碰撞算子与横向（cross-stream）坐标无关，只需构造一次**。
- **四个碰撞算子同一离散**：硬球、BGK、ES-BGK、Shakhov。
- **全分子速度三维 + 温度扰动 + 流向/展向波数全部保留**。
- **边界条件只施加在分布函数上**，且随 $Kn\to0$ 逼近连续介质极限。

**离散与求解**：
- **Legendre 求积 + summation-by-parts (SBP)**、**弱 diffuse-reflection 壁面条件**、**moment-consistent 速度导数** → 离散算子**继承连续算子的能量不等式**；用制造解验证谱精度。
- 碰撞算子在速度空间构造为**稠密矩阵**：完整算子用快谱方法，弛豫模型用 Woodbury 恒等式得到**精确逆**作为预条件子。
- **模态 kLST**：**矩阵自由 shift-invert Arnoldi 迭代**，用弛豫模型精确逆预条件。单次 Arnoldi 步 = 一次移位求解。
- **非模态 kLST**：能量范数（含 Chu 扰动能量）+ 动能 Reynolds–Orr 方程；瞬态增长与伪谱**由同一套预条件移位求解得到**，无需时间推进或特征函数展开。
- 维度：3 个速度维 + 1 个空间维 ⇒ 问题规模**与连续介质的 TriGlobal LST（Theofilis 2011）相当**，因此**从不组装离散稳定性矩阵**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Peculiar velocity 变换** | $\bm{c}=\bm{v}-\bm{u}$；碰撞算子与 cross-stream 坐标无关，只需构造一次 |
| **完整 Boltzmann 碰撞算子** | 硬球；用 Gamba et al. (2017) 快谱方法在速度空间构造 $n_b\times n_b$ 稠密矩阵 |
| **BGK / ES-BGK / Shakhov** | 三个弛豫模型；用 Woodbury 恒等式得到**精确逆**（作为预条件子） |
| **SBP Legendre 配点** | 求积-配点结合，保证能量稳定性；制造解验证谱精度 |
| **弱 diffuse-reflection 壁面条件** | 比强加壁面值**收敛快一个数量级**；且只有弱条件继承"静止气体的数值横坐标 = 0"性质 |
| **Moment-consistent 速度导数** | 修正项使 $c_x^p$ 的矩到四阶精确；去掉修正会产生**虚假的不稳定展向不变模态**（lift-up 机制放大） |
| **能量范数（含 Chu 扰动能量）** | $E=\tfrac12\langle\hat f,\hat f\rangle$，$\langle\phi,\psi\rangle=\int(\phi,\psi)_c\,dy$，为相对熵的二次部分；其流体力学部分即 Chu (1965) 扰动能量，$\mathrm{Ma}\to0$ 时退化为 Orr–Sommerfeld–Squire 的动能 |
| **动能 Reynolds–Orr 方程** | 首次写出；证明平均剪切是唯一能量源 |
| **能量范数中的伴随算子** | $\mathsf{A}^{H}$；验证伴随恒等式到 $10^{-17}$ |
| **移位-求逆 Arnoldi** | 移位 $z_0$ 在目标相速度附近偏移 $3\times10^{-4}(1+\mathrm{i})$；Krylov 维数 6（单特征值）到 24–64（一组）；每个 Ritz 对按真实残差接受 |
| **Jacobi–Davidson 交叉校验** | 同预条件子，独立验证单特征值 |
| **逆 Lanczos 伪谱** | Wright & Trefethen (2001)；$\varepsilon$-伪谱为 $\|W^{1/2}(zI-\mathsf{A})W^{-1/2}\|$ 最小奇异值低于 $1/\varepsilon$ 的点集 |
| **移位求逆有理 Krylov 瞬态增长** | 直接-伴随回路（direct–adjoint loop），随机初值下 4–7 步收敛；每次传播用移位求逆而非时间推进（矩阵刚性：碰撞特征值 $O(\nu_\mu)\propto Re/\mathrm{Ma}$，比关注增长率大 $10^6$–$10^8$ 倍） |
| **数值横坐标 (numerical abscissa)** | $\omega_{\mathrm{num}}$ = $\tfrac12(\mathsf{A}+\mathsf{A}^{H})$ 的最大特征值，Lanczos 迭代；给出 $G(t)\le e^{2\omega_{\mathrm{num}}t}$ |
| **速度空间截断球** | 只在 $\lvert\bm{c}\rvert\le v_{\text{cut}}=L-\Delta v$ 的球内定义未知量（$R_v=6$，$L=6.62$）；立方体角上截断碰撞积分为零，会产生无阻尼弹道模态。球含 $n_b\approx\tfrac\pi6(Q-2)^3$ 个节点（$Q=12$–32 时占 $30$%–$43$%） |
| **速度积分求积** | 矩形法（对高斯加权被积函数谱精确）；$\partial_{c_x}$ 为 Fourier 导数 + rank-5 Maxwellian 加权修正项 |
| **Shakhov / ES-BGK** | 分别用于可压 Couette、Rayleigh–Bénard、超音速 Couette；本文首次把 Shakhov 用于**低速剪切流**，首次把 ES-BGK 用于动能稳定性分析 |

---

## 公式

```math
\text{能量范数（相对熵的二次部分）}:\quad
E = \tfrac{1}{2}\langle \hat f,\hat f\rangle,
\qquad
\langle \phi,\psi\rangle = \int (\phi,\psi)_c \,\mathrm{d}y
```

```math
\text{Chu 扰动能量（范数的流体力学部分）}:\quad
\tfrac12\int\Bigl(|\hat{\bm u}|^2 + \hat\rho^2 + \tfrac32\hat T^2\Bigr)\,\mathrm{d}y
\quad\xrightarrow{\ \mathrm{Ma}\to0\ }\quad
\tfrac12\int|\hat{\bm u}|^2\,\mathrm{d}y
\quad\text{（Orr–Sommerfeld–Squire 瞬态增长的动能）}
```

```math
\text{动能 Reynolds–Orr 方程（首次）}:\quad
\frac{dE}{dt} = \underbrace{P}_{\text{平均剪切产生}}
- \underbrace{D_{\text{collision}} + D_{\text{wall}}}_{\text{碰撞与壁面只移除能量}}
\quad\Longrightarrow\quad
\text{平均剪切是唯一的能量源}
```

```math
\text{不存在能量稳定性 }Re\text{ 的对应物}:\quad
\text{水动力分布无非平衡部分} \Rightarrow \text{碰撞耗散为零，瞬时能量率 = 产生项}
\quad\Longrightarrow\quad
\forall Re:\ \text{适当初扰动的能量增长}
\quad\left(\text{N-S 平面 Couette 的 } Re_{\text{es}}=20.7\ \text{无对应物}\right)
\]
```math
\text{额外增长被限制在 }O(1/\nu_\mu)\text{ 内}:\quad
\text{相对能量增益} \sim \mathrm{Ma}\cdot\mathrm{Kn}
\quad(\text{黏性耗散只在 } 1/\nu_\mu \text{ 碰撞时间后出现})
```

```math
\text{移位求逆 Arnoldi（模态）}:\quad
(\mathsf{A}-z_0\mathsf{I})^{-1},\qquad
z_0 = c_{\text{ref}} + 3\times10^{-4}(1+\mathrm{i})
```

```math
\text{伪谱定义}:\quad
\varepsilon\text{-伪谱} = \bigl\{ z : \lVert W^{1/2}(z\mathsf{I}-\mathsf{A})W^{-1/2}\rVert_2 < 1/\varepsilon \bigr\}
```

```math
\text{数值横坐标与增长上界}:\quad
\omega_{\mathrm{num}} = \lambda_{\max}\!\left(\tfrac12(\mathsf{A}+\mathsf{A}^{H})\right),
\qquad
G(t) \le e^{2\omega_{\mathrm{num}}t}
\quad\left(\omega_{\mathrm{num}}\le0 \iff G(t)\le1\ \forall t\right)
```

```math
\text{刚性说明（为何不做时间推进）}:\quad
\text{碰撞特征值} \sim \nu_\mu \propto Re/\mathrm{Ma},
\qquad
10^{6}\sim10^{8}\ \times\ \text{关注的增长率}
\quad\Longrightarrow\quad
\text{显式积分不可能，隐式积分昂贵}
\quad\Longrightarrow\quad
\text{移位求逆有理 Krylov 直接求 } e^{t\mathsf{A}}\bm{x}
```

```math
\text{速度空间截断球}:\quad
v_{\text{cut}} = L-\Delta v,\qquad R_v=6\ \Rightarrow\ L=6.62,
\qquad
n_b \approx \tfrac{\pi}{6}(Q-2)^3\ \text{（占 } Q^3\text{ 的 }30\%\sim43\%\text{）}
```

```math
\text{数值横坐标的物理值（剪切流）}:\quad
\omega_{\text{num}} = \frac{\max|U'|}{2},
\qquad
\begin{cases}
0.5006\ (Re=20),\ 0.5003\ (Re=1000) & \text{Couette}\\
0.988 \ (Re=1000) & \text{Poiseuille（} \to 1\ \text{当壁面区被分辨）}
\end{cases}
```

```math
\text{不动点（静止气体）的离散数值横坐标}:\quad
\begin{cases}
\text{强加壁面值（Chebyshev / Legendre）}: & +O(N^2)\ \text{（破坏能量性质）}\\
\text{本文的 Legendre + 弱壁面条件}: & \text{继承 } \omega_{\text{num}}=0
\end{cases}
```

```math
\text{非模态瞬态增长的直接-伴随回路}:\quad
\mathsf{A}\text{ 刚性} \Rightarrow
\text{用移位求逆有理 Krylov 直接算 } e^{\pm t\mathsf{A}}
\quad(\tau=t/4,\ \text{每步一次实移位求解 } z=1/\tau)
\quad\Longrightarrow\quad
\text{随机初值下 4–7 步收敛}
```

```math
\text{Mach 数拟合（不可压极限）}:\quad
\begin{cases}
\text{混合层（无壁）}: & \text{距离随 Ma 减半降为 } 1/4 \quad(\mathrm{Ma}^2 \text{ 律})\\
\text{有壁流动}: & \text{出现 } O(\mathrm{Ma})\ \text{线性项}\ \Rightarrow\ \text{固定 } Re \text{ 下稀薄效应的一阶速度滑移}
\end{cases}
```

```math
\text{虚假模态（未修正的速度导数）}:\quad
\text{展向不变扰动 (Couette, } Re=1000, \alpha=0):
\quad
-\mathrm{i}\omega = \begin{cases}
+0.074\ (Q=12),\ +0.0134\ (Q=16) & \text{未修正（虚假增长，与 Ma 无关）}\\
-0.005217\ (Q=16,20) & \text{修正后}
\end{cases}
\quad\text{（Orr–Sommerfeld–Squire 真值 } -0.005223\text{）}
```

---

## 代码片段

```python
# kLST 概念性伪代码：动理学线性稳定性求解
import numpy as np

class KineticLST:
    def __init__(self, collision_model="full",  # 'hard_sphere' | 'bgk' | 'esbgk' | 'shakhov'
                 Q=20, Rv=6.0, N=64, Ma=0.1, Kn=None):
        self.Q, self.Rv, self.N, self.Ma = Q, Rv, N, Ma
        self.L = Rv + 0.62          # 截断球半径
        self.dv = self.L / (Q / 2 - 1)
        self.vcut = self.L - self.dv
        # 速度空间网格：仅球内节点
        pts = velocity_grid(Q, Rv, self.dv)
        self.nb = count_inside_ball(pts, self.vcut)   # ≈ π/6 (Q-2)^3

    # ---- 碰撞算子：速度空间稠密矩阵（只构造一次，与 cross-stream 无关）----
    def build_collision_matrix(self):
        if self.collision_model == "hard_sphere":
            # Gamba, Haack, Hauck, Hu (2017) 快谱方法
            return fast_spectral_collision_matrix(self.nb, self.dv)
        # 弛豫模型：Boltzmann 矩阵的精确逆（Woodbury 恒等式）
        return None

    def build_relaxation_inverse(self):
        """弛豫模型的精确逆，用作 Arnoldi 的预条件子"""
        B = bgk_boltzmann_matrix(self.nb, self.dv)
        return woodbury_exact_inverse(B)

    # ---- 速度导数（moment-consistent 修正）----
    def build_velocity_derivative(self):
        """
        ∂_{c_x} 为 Fourier 导数 + rank-5 Maxwellian 加权修正，
        使 c_x^p (p≤4) 的矩精确。
        去掉修正 → lift-up 把离散剪切项耦合进壁法向 → 虚假不稳定展向不变模态
        """
        D = fourier_derivative_cx(self.nb, self.dv)
        return D + maxwellian_rank5_correction(self.nb, self.dv)

    # ---- 模态 kLST：移位求逆 Arnoldi ----
    def eigenvalues(self, base_state, z0):
        """
        base_state: Chapman-Enskog 修正后的基态（闭式或节点值）
        z0: 目标相速度附近的移位
        Krylov 维数：6（单特征值）~ 24-64（一组）
        每个 Ritz 对按真实残差接受
        """
        A = self.build_stability_operator(base_state)
        M = self.build_relaxation_inverse()
        V, H = arnoldi_shift_invert(A, z0, M, krylov_dim=64,
                                    solver='gmres_preconditioned')
        vals, res = ritz_pairs(V, H)
        keep = [v for v, r in zip(vals, res) if r < 0.1 * cond(ref_eig(v))]
        return keep

    # ---- 非模态 kLST：能量范数瞬态增长 ----
    def transient_growth(self, base_state, times):
        """
        直接-伴随回路，随机初值 4-7 步收敛
        每次传播用移位求逆有理 Krylov（不做时间推进）
        """
        A = self.build_stability_operator(base_state)
        Ah = self.build_adjoint_in_energy_norm(A)     # <Ax,y> = <x, A^H y>
        for t in times:
            x = direct_adjoint_loop(A, Ah, t, tau=t/4)
            G = energy_norm(x)
            yield t, G

    # ---- 伪谱：逆 Lanczos ----
    def pseudospectra(self, base_state, z_grid, eps):
        """
        ε-伪谱 = { z : ||W^{1/2}(zI - A) W^{-1/2}||_2 < 1/ε }
        每步一次直接 + 一次伴随移位求解；几十步收敛
        与特征值不同，伪谱对分支交汇处模态的病态不敏感
        """
        A = self.build_stability_operator(base_state)
        W = energy_weight_matrix(A)
        return inverse_lanczos_pseudospectrum(A, W, z_grid, eps)

    # ---- 数值横坐标（Lanczos）----
    def numerical_abscissa(self, base_state):
        """ω_num = λ_max( ½(A + A^H) )，给出 G(t) ≤ exp(2 ω_num t)"""
        A = self.build_stability_operator(base_state)
        Ah = self.build_adjoint_in_energy_norm(A)
        return lanczos_max_eig(0.5 * (A + Ah))
```

---

## 实验结论

- **Orr–Sommerfeld 特征值（不可压极限）**：三个弛豫模型在四个流动中与连续介质结果吻合到 $1\times10^{-7}$–$5\times10^{-7}$；**完整算子到 $1.7\times10^{-6}$–$8.9\times10^{-6}$**（$Q=20$ 的速度网格误差），在 $Q=24$ 时改善到 $4.6\times10^{-7}$–$1.1\times10^{-6}$。
- **瞬态增长与 resolvent 范数**：复现 Butler & Farrell (1992) 的最优增长与 Trefethen et al. (1993) 的 resolvent 范数到 **0.1%**；**伪谱在病态特征值处仍然收敛**（特征值不收敛的地方伪谱收敛）。
- **离散收敛性**：弛豫模型每加密一档速度网格，特征值变化降 2–3 倍，$Q=20$ 时已在最优网格值的 $5\times10^{-7}$（Poiseuille）/$2.5\times10^{-6}$（Couette）以内；完整算子起始误差更大但收敛更快（$Q=20$ 低于 $10^{-5}$，$Q=24$ 低于 $10^{-6}$）。横向方向 $N\ge48$ 全部在 $7\times10^{-7}$ 内；$N=32$ 时 Poiseuille $Re=10^4$ 的临界层未分辨（误差 $2.7\times10^{-5}$）。
- **离散算子性质验证**：伴随恒等式 $\langle\mathsf{A}\bm x,\bm y\rangle=\langle\bm x,\mathsf{A}^H\bm y\rangle$ 对完整算子及各分项（streaming + 壁面罚项、碰撞、剪切与力、$U'\mathcal{L}_{\bar g}$）都成立到 $10^{-17}$（预条件伴随到 $10^{-13}$）；能量率四项相加到 $10^{-14}$，碰撞项为负且离散碰撞算子自伴到 $10^{-14}$，剪切与力项与连续表达式求积吻合到 $4\times10^{-6}$（未修正速度导数时为 $6\times10^{-5}$）。
- **速度空间截断半径的影响**：$R_v$ 从 6 增到 7（$Q$ 24→28）时最不稳定模态的特征值变化 $\le5\times10^{-7}$（相速度）/$\le2\times10^{-7}$（增长率）→ **$R_v=6$ 时速度空间截断不构成限制**。
- **壁面条件**：弱条件比强条件在 $N$ 上**收敛快一个数量级**，两者趋于同一极限；只有弱条件继承静止气体的 $\omega_{\text{num}}=0$（强条件给出 $O(N^2)$ 的正值）。
- **Mach 数依赖**：混合层（无壁）符合 $\mathrm{Ma}^2$ 律（每半减 Ma 距离降为 1/4）；有壁流动出现 $O(\mathrm{Ma})$ 线性项，Couette 流在 $\mathrm{Ma}\approx0.05$ 以下线性项主导，Poiseuille 与 Blasius 中线性与二次项**符号相反、部分抵消**，Poiseuille 中距离先过极小值再由线性项主导。$\mathrm{Ma}=0.1$ 时动能特征值距 Orr–Sommerfeld 值 $9\times10^{-5}$（Poiseuille）至 $5\times10^{-3}$（混合层）。
- **碰撞模型分组行为（有意思的物理）**：**线性系数 $c_1$** 三个弛豫模型彼此一致到 0.5%（尽管 Pr 数不同），完整算子小 2%–2.4%；**二次系数 $c_2$** 则**按 Pr 数分组**——ES-BGK、Shakhov 与完整算子（均 $\mathrm{Pr}\approx2/3$）彼此一致到约 1%，BGK（$\mathrm{Pr}=1$）偏离达 4%。
- **计算成本**：弛豫模型（预条件子为精确逆）每次线性求解只需 3 次内迭代，单特征值 7–15 s，内存 170–320 MB；**完整算子需 20–38 次内迭代，时间为弛豫模型的 8–24 倍，内存 2–4 倍**。硬球矩阵只需组装一次（$Q=20$ 两核约 2.5 分钟/矩阵；$Q=28$ 单核约 1 小时）。
- **静止气体的瞬态增长**：$G(t)=0.983, 0.911, 0.114, 2.9\times10^{-7}$（$t=0.3, 1, 3, 10$），均小于 1（H 定理要求）。

---

## 局限性

- **基流被限制在近连续介质**：基态是"给定剖面 + Chapman–Enskog 修正 + 体力维持"，故方法限于 $Kn\ll1$、$\mathrm{Ma}^2\ll1$ 的**近连续介质近不可压基流**；**扰动虽完全可压缩完全动理学，但基流不能是真正的动理学解**。文中明确指出这与"混合连续介质/动理学转变预测"的需求仍有差距——后者需要动能稳定性算子接收**动理学基流解**。
- **二维**：所有分析是二维的，**Squire 族不存在**（展向波数被保留但基态二维耦合的处理受限）。
- **完整算子成本高**：比弛豫模型慢 8–24 倍、内存 2–4 倍；速度空间稠密矩阵规模 $n_b^2$ 随 $Q$ 陡增，$Q=28$ 单矩阵组装需约 1 小时。
- **$\varepsilon$-伪谱的标度**：碰撞算子 $O(\mathrm{Kn})$ 尺度上的壁面 Knudsen 层**不被任何此类网格分辨**——这是残差约 $10^{-7}$ 的慢衰减来源。
- **速度导数修正是必需的且有代价**：去掉修正会产生虚假不稳定模态；修正使 $c_x^p$ 的矩到四阶精确，但对高阶矩或非高斯内容未讨论。
- **Shakhov 用于低速剪切流的物理含义未深究**：文中指出 $c_2$ 的分组行为与碰撞算子依赖滑移系数一致，但"**尚未进一步分析**"。
- **$c_2$ 不是完全一致可压缩流的系数**：因为基态温度均匀。
- **与 Wu (2026) 的关系是互补而非竞争**：Wu 的方法为三维设计（密集因子分解不能延展到三维流），本文的方法明确不适用于三维。
- **未报告的量**：瞬态增长的初始斜率（数值横坐标）在剪切流中为无粘极限 $\max|U'|/2$，这是 (16) 的性质而非离散效应，但也意味着**非模态增长分析未能区分"真实非正规性"与"基态剪切率上界"**。

---

## 相关工作

- [[Boltzmann方程与动理学理论]]
- [[线性稳定性分析模态与非模态]]
- [[Orr-Sommerfeld与Squire稳定性理论]]
- [[瞬态增长与伪谱分析]]
- [[BGK单松弛模型]]
- [[Chapman-Enskog展开]]
- [[DSMC直接模拟蒙特卡洛]]
- [[格子Boltzmann方法LBM]]
- [[Couette流与Poiseuille流]]
- [[混合层与Blasius边界层]]
- [[数值横坐标与非正规性]]

---

## 实现建议

- **实现难度**：🔴 高。需要 (a) 速度空间的碰撞算子稠密化（完整硬球需快谱方法）；(b) SBP-Legendre 配点 + 弱壁面条件 + moment-consistent 导数的离散算子；(c) 能量范数及其伴随；(d) shift-invert Arnoldi（Jacobi–Davidson 校验）；(e) 瞬态增长的移位求逆有理 Krylov；(f) 伪谱的逆 Lanczos。每一项都是独立的技术难点。
- **预期性能**：弛豫模型下单特征值 7–15 s / 170–320 MB（单核），完整算子 20–38 次内迭代、8–24 倍时间。**若只关心不可压极限的稳定性，弛豫模型足够（精度 $10^{-7}$）；完整算子的价值在于稀薄效应（$O(\mathrm{Ma})$ 线性项）与模型对比**。
- **适用场景**：
  - **连续介质/动理学转变区的稳定性预测**——这是本文的最终应用目标（基流需为动理学解）；
  - **稀薄气体剪切流的失稳阈值**（微机电（MEMS）流动、稀薄边界层分离）；
  - **比较不同碰撞模型对稳定性谱的影响**（本文首次提供同一离散下的直接对比）；
  - **非模态稳定性理论在动理学框架下的方法学基础**。
- **落地建议**：
  1. **先做弛豫模型版本**（BGK/Shakhov）验证框架，用 Orszag (1971) 特征值作为回归门槛（应到 $10^{-7}$）；
  2. **必须实现 moment-consistent 速度导数**，否则会得到虚假的不稳定展向不变模态（这是最容易踩的坑，且错误看起来"像物理"）；
  3. **弱壁面条件不可省**——强条件会破坏"静止气体数值横坐标 = 0"的性质，给出 $O(N^2)$ 的虚假增长；
  4. **瞬态增长用移位求逆而非时间推进**（刚性 $10^6$–$10^8$ 倍，时间推进完全不可行）；
  5. **关注伪谱而非仅特征值**——分支交汇处特征值不收敛是真实且已知的现象，伪谱是更可靠的诊断；
  6. 若要走向三维，需采用 Wu (2026) 式的迭代路径，本文路线因稠密因子分解无法延展。

已传递给 @墨鱼丸。
