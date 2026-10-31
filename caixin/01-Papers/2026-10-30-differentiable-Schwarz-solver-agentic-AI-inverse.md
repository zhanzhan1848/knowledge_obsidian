---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, fluid, Schwarz-domain-decomposition, differentiable-solver, inverse-modeling, discrete-adjoint, thin-boundary-layer, agentic-AI, LLM-optimizer, FEniCS]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2610.38672
---

# Differentiable Schwarz-Coupled Solvers for Thin Boundary Layer Transport: Inverse Modeling via Agentic AI Optimization

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Differentiable Schwarz-Coupled Solvers for Thin Boundary Layer Transport: Inverse Modeling via Agentic AI Optimization |
| **作者** | Siva Viknesh、Amirhossein Arzani（University of Utah, 机械工程系 + SCII + 生物医学工程系） |
| **发表** | arXiv:2610.38672 [physics.flu-dyn; physics.comp-ph], 2026-10-28 |
| **链接** | [原文](https://arxiv.org/abs/2610.38672) |
| **DOI** | 10.48550/arXiv.2610.38672 |
| **代码** | 将公开：https://github.com/siva-viknesh/Differentiable-FEM-Solver（同行评审后） |
| **资助** | NSF Award No. 2247173 |

---

## 核心贡献

> 把**奇异摄动理论的尺度分离**（内层用拉伸坐标 $\eta=y/\delta$）与 **Schwarz 域分解的双向信息交换**结合，构造**完全可微分**的多域输运求解器（FEniCS + dolfin-adjoint，离散伴随法），并把 **LLM/agentic AI 作为优化器**接入反演流程：在**函数基表示**下 agent 能**按预设准入策略在优化过程中动态扩充基函数库**，从而在**更少的迭代次数**下恢复空间变化的壁面通量。

1. **多域 Schwarz 求解器（针对含分离/再附着的薄边界层）**：此前 Schwarz + 摄动理论的工作几乎全部针对**无分离流动**（近壁切向速度有界 away from zero），或把含壁面层的子域放在物理坐标中。本文首次把**内子域放在拉伸的壁法坐标中**（$\xi=x/L$，$\eta=y/\delta$），同时**在两个子域都保留完整的对流–扩散方程**（不做任何一方主导的简化），并通过**有限重叠区的 Dirichlet 数据双向交换**耦合。
2. **完全可微分 + 硬约束反演**：用**离散伴随法**（dolfin-adjoint）计算梯度；控制方程与边界条件作为**硬约束**施加 → **反演精度只受数据量与前向离散误差限制，而不是若干竞争损失项的平衡**（这是与 PINN 类软约束方法的本质区别）。
3. **跨子域的伴随灵敏度传播**：测量位于一个子域、未知参数位于另一个子域的**本征多域设置**下，灵敏度能穿过 Schwarz 耦合传播 → 支持"用远场数据反演近壁参数"。
4. **三种网格分辨率下的成本优势**：Schwarz 求解器在同等 $m$ 下总 DOF 比单域多 6.3%–7.0%，但**内子域的层内网格数与 $D$ 无关**（层在 $\eta$ 中是 $O(1)$），因此**薄层的解析不随 $Pe$ 变难**，只需更粗的物理网格即可。
5. **LLM 作为优化器的两种模式**：
   - **被动 LLM 优化**：Qwen3-8B（本地 Ollama API），输入 = 提示词 + 优化策略 + 最近 10 个 epoch 的历史（参数、失配、伴随梯度），输出 = 从策略中选择一种方法及其阻尼/步长控制。
   - **主动 agentic 优化**：GPT 5.6 Terra（Codex），额外**可访问反演代码本身**，用全部历史，并可**修改基函数库的构成**。
6. **核心结论——agentic AI 的优势出现在函数基表示**：当未知量是**高维节点场**（离散轮廓重建）时，agentic 并不占优；**当未知量用函数基参数化时**，agent 能**在优化过程中扩充基函数库**（按预设准入策略分阶段加入预定义族并初始化其参数），**用远少的迭代次数（75 vs 500 vs 1200 epochs）达到更好精度**。
7. **严格的成功判据**：恢复成功定义为**最终稳定平台期**内的相对误差 $e^N\le1\%$（而非"首次进入 1% 带"），因为轨迹可能在瞬态中穿过真值后稳定到别处；这使不同方法可按"**达到目标所需的最粗网格**"（等精度比较）来对比。

---

## 技术方案

### 核心思想

**问题**：高 Péclet 数输运在壁面形成薄边界层（厚度 $\delta$），虽只占渐近小体积却控制壁面浓度与壁面通量。经典做法是**层自适应网格**，但**层厚随扩散系数变化时网格必须重新设计**（如大动脉中 $Pe\sim10^7$–$10^8$，浓度层为微米级）。

**为何引入 Schwarz**：匹配渐近展开是**单向耦合**（外层给内层），在**分离/再附着点**处（近壁切向速度变号、层尺度失效）失效；而 Schwarz 提供**双向交换**（每次迭代内外互传 Dirichlet 数据），且各子域可独立离散、可用非匹配网格。

**本文的组合**：
- **内子域** $\Omega_{\rm in}$：贴壁，用**拉伸坐标** $(\xi,\eta)$，物理高度 $7\delta$；网格在 $\eta$ 上的划分数**与 $D$ 无关**；
- **外子域** $\Omega_{\rm out}$：体相，用**物理坐标** $y$；用 **SUPG** 稳定化；
- **重叠区** $\Omega_{\rm overlap}$：厚度 $5\delta$（从 $y=2\delta$ 到 $y=7\delta$），每次 Schwarz 迭代交换 Dirichlet 数据并**欠松弛**。

**可微分性与反演**：
- **前向**：FEniCS（dolfin-adjoint）实现，分片线性离散；
- **梯度**：**离散伴随法**；
- **反演**：控制方程与边界条件为**硬约束**，参数用伴随梯度更新（Adam，lr $10^{-1}$，每 50 epoch 衰减 0.75）；
- **未知量参数化**：三种——(a) 常数标量；(b) 离散节点场（需 Tikhonov 正则化，$\alpha^*$ 未知）；(c) **函数基** $g(x)=\sum_j c_j\phi_j(x;\bm\beta_j)$（线性系数 + 非线性参数 $\bm\beta_j$ 联合优化，结构类似 ADAM-SINDy）。

**LLM/agent 优化策略库**：归一化梯度 (G)、Adam (A)、动量 (M)、阻尼 Newton (N)、割线法 (S)、梯度线性回归 (Rg)、目标二次拟合 (Rj)、梯度括号求根 (Bg)、目标括号精化 (Bj)。agentic 库另含 Barzilai–Borwein、共轭梯度、Levenberg–Marquardt、投影梯度。

### 关键技术

| 技术 | 说明 |
|------|------|
| **拉伸坐标变换** | $\xi=x/L$，$\eta=y/\delta$；滑移壁 $\delta\sim Pe^{-1/2}$（$\delta=\sqrt D$，$L=U=1$）；无滑移壁 Lévêque 标度 $\delta\sim Pe^{-1/3}$（$\delta=D^{1/3}$） |
| **内层方程（滑移壁）** | $v_\xi\partial_\xi C + \frac{v_\eta}{\sqrt D}\partial_\eta C = D\partial_{\xi\xi}C + \partial_{\eta\eta}C$ |
| **内层方程（Lévêque 标度）** | $\frac{v_\xi}{D^{1/3}}\partial_\xi C + \frac{v_\eta}{D^{2/3}}\partial_\eta C = D^{2/3}\partial_{\xi\xi}C + \partial_{\eta\eta}C$ |
| **保留壁向扩散项** | 渐近小但保留，**对离散问题提供温和稳定化** |
| **SUPG** | 外子域稳定化 |
| **重叠欠松弛** | $C^{(k)}_{\rm overlap}=\omega\widehat C^{(k)}_{\rm overlap}+(1-\omega)C^{(k-1)}_{\rm overlap}$，$\omega=0.5$ |
| **Schwarz 收敛判据** | 交换迹与重叠区场收敛，容差 $\varepsilon=10^{-10}$，最多 200 次迭代 |
| **离散伴随 (dolfin-adjoint)** | 梯度精确；伴随恒等式使灵敏度可跨子域界面传播 |
| **硬约束反演** | 方程与边界条件不做软罚项 |
| **双策略 LLM 优化** | 被动（Qwen3-8B / Ollama，temperature 0.5，30 次独立种子运行，报中位数与 IQR）；主动（GPT 5.6 Terra / Codex，5 次运行，每次全新项目） |
| **agent 扩充基函数库（实验 4）** | 从 $\mathcal{D}^{(0)}=\{1,x,x^2\}$ 起步；每 $\Delta n$ epoch 最多修订一次；仅在**当前库失配达到平台期**时准入下一族；族顺序固定：三~五次多项式 → Fourier → 多项式×Fourier 乘积；上限 6 多项式 + 2 Fourier + 12 乘积；**agent 自行决定新基函数的初值** |
| **基准问题** | 2D 定常双涡流 $\psi=0.1\sin(2\pi x)\sin(\pi y)$（**底壁处发生流动分离**）；$D\in\{10^{-4},10^{-5},10^{-6}\}$，$Pe\approx6.3\times10^3/6.3\times10^4/6.3\times10^5$ |
| **四类壁面通量剖面** | 常数 / 多项式包络 $4x(1-x)$ / Fourier 包络 $0.5[1-\cos(6\pi x)]$ / 混合 $2x(1-x)[1-\cos(6\pi x)]$，$A=10$ |
| **网格阶梯 M0–M5** | $m=128\to4096$；Schwarz 内网格 $m\times(m/8)$，外网格 $m\times(15m/16)$ |
| **三种数据区策略** | inner（$0.1\delta\le y\le1.95\delta$）、outer（$2\delta\le y\le1$）、overlap（$2\delta\le y\le7\delta$） |

---

## 公式

```math
\text{拉伸坐标下的内层方程（滑移壁，}\delta=\sqrt D\text{）}:\quad
v_\xi\frac{\partial C}{\partial \xi}+\frac{v_\eta}{\sqrt D}\frac{\partial C}{\partial \eta}
= D\frac{\partial^{2}C}{\partial \xi^{2}}+\frac{\partial^{2}C}{\partial \eta^{2}}
```

```math
\text{内层方程（Lévêque 标度，}\delta=D^{1/3}\text{）}:\quad
\frac{v_\xi}{D^{1/3}}\frac{\partial C}{\partial \xi}+\frac{v_\eta}{D^{2/3}}\frac{\partial C}{\partial \eta}
= D^{2/3}\frac{\partial^{2}C}{\partial \xi^{2}}+\frac{\partial^{2}C}{\partial \eta^{2}}
\qquad
(\text{壁向扩散项虽渐近小，但保留以稳定离散问题})
```

```math
\text{一般形式（变换前的尺度关系）}:\quad
\frac{\delta}{L}v_\xi\frac{\partial C}{\partial\xi}
+ v_\eta\frac{\partial C}{\partial\eta}
= \frac{D\delta}{L^{2}}\frac{\partial^{2}C}{\partial\xi^{2}}
+ \frac{D}{\delta}\frac{\partial^{2}C}{\partial\eta^{2}}
```

```math
\text{重叠区欠松弛}:\quad
C^{(k)}_{\rm overlap}=\omega\,\widehat C^{(k)}_{\rm overlap}+(1-\omega)C^{(k-1)}_{\rm overlap},
\qquad \omega\in(0,1]
```

```math
\text{拉伸坐标下的壁面通量条件}:\quad
\left.\frac{\partial C}{\partial \eta}\right|_{\eta=0} = \delta\,g(L\xi)
\qquad(\text{内侧上边界取外解的迹 } C^{\rm top}_{\rm overlap}\ \text{为 Dirichlet})
```

```math
\text{双涡流基准的速度场}:\quad
\bm v(x,y)=\bigl[0.1\pi\sin(2\pi x)\cos(\pi y),\ -0.2\pi\cos(2\pi x)\sin(\pi y)\bigr],
\qquad \nabla\cdot\bm v=0
```

```math
\text{四类壁面通量剖面（峰值归一化，}A=10\text{）}:\quad
\begin{aligned}
g_{\rm const}   &= -10\\
g_{\rm poly}    &= -40\,x(1-x)\\
g_{\rm Fourier} &= -5\bigl[1-\cos(6\pi x)\bigr]\\
g_{\rm hybrid}  &= -20\,x(1-x)\bigl[1-\cos(6\pi x)\bigr]
\end{aligned}
\qquad
K(x)\in\{1,\ 4x(1-x),\ 0.5[1-\cos(6\pi x)],\ 2x(1-x)[1-\cos(6\pi x)]\}
```

```math
\text{Péclet 数与层厚}:\quad
\mathrm{Pe}=\frac{UL}{D}\approx 6.3\times10^{3,4,5},
\qquad
\delta\sim\mathrm{Pe}^{-1/2}\ \Longrightarrow\ \delta\in[10^{-2},10^{-3}]
\quad(\text{因 } v_x(x,0)=0.1\pi\sin(2\pi x)=O(U))
```

```math
\text{Schwarz 几何（重叠区厚度 }5\delta\text{）}:\quad
\eta_{\rm top}=7,\quad \eta_{\rm interface}=2,
\qquad
y=2\delta\ \text{与}\ y=7\delta
\quad\Longrightarrow\quad
2\delta\le y\le 7\delta
```

```math
\text{严格的成功判据（平台期而非首次进入）}:\quad
e^{n}=\frac{|\theta^{n}-\theta|}{|\theta|},
\qquad
\text{成功}\iff e^{N}\le1\%,
\qquad
n_{\rm t}=\text{从 }N\text{ 向前回溯直到 }e^n>1\%\text{ 的后一 epoch}
```

```math
\text{函数基参数化}:\quad
g(x)=\sum_j c_j\,\phi_j(x;\bm\beta_j),
\qquad
\theta=\{c_j,\bm\beta_j\}_{j=1}^{K}
\quad\Longrightarrow\quad
\text{未知量个数由库决定而非由网格决定}
```

```math
\text{agent 扩充库的准入规则}:\quad
\mathcal{D}^{(0)}=\{1,x,x^{2}\}
\ \longrightarrow\
\text{三~五次多项式}\ \longrightarrow\ \text{Fourier}\ \longrightarrow\ \text{多项式}\times\text{Fourier}
\qquad
(\text{仅在失配达到平台期时准入，每 }\Delta n\text{ epoch 最多修订一次})
```

```math
\text{Schwarz 网格分解（与单域对比）}:\quad
\begin{cases}
\text{单域}: & m\times m\ \text{网格},\ (m+1)^2\ \text{DOF}\\
\text{Schwarz}: & \text{内 } m\times(m/8)\ +\ \text{外 } m\times(15m/16)\\
& \text{总 DOF 比单域多 } 6.3\%\ (\text{M5})\sim7.0\%\ (\text{M0})
\end{cases}
\quad
\text{但内层网格划分数与 } D\ \text{无关}
```

---

## 代码片段

```python
# 可微分 Schwarz 耦合求解器 + LLM/agentic 反演（概念性伪代码）
import numpy as np

class SchwarzCoupledTransport:
    """FEniCS + dolfin-adjoint：内子域（拉伸坐标）+ 外子域（物理坐标）"""

    def __init__(self, D, Pe, m=256, eta_top=7.0, eta_interface=2.0,
                 omega=0.5, tol=1e-10, max_iter=200):
        self.D, self.Pe = D, Pe
        self.delta = np.sqrt(D)                      # 滑移壁标度 δ ~ Pe^{-1/2}
        self.eta_top, self.eta_if = eta_top, eta_interface
        self.omega, self.tol, self.max_iter = omega, tol, max_iter
        # 内网格：m 沿壁 × m/8 沿 η（与 D 无关！）
        self.inner = Mesh_1D_stretched(m, m//8, eta_top)
        # 外网格：m 沿壁 × 15m/16 沿物理 y
        self.outer = Mesh_1D_physical(m, 15*m//16, y0=self.delta*eta_if, y1=1.0)

    # ---- 内子域：拉伸坐标下的完整对流-扩散方程 ----
    def inner_solve(self, C_trace_top, g_wall):
        # (δ/L) v_ξ ∂C/∂ξ + v_η ∂C/∂η = Dδ/L² ∂²C/∂ξ² + D/δ ∂²C/∂η²
        # 滑移壁：L=U=1, δ=√D → 除以 √D
        # 边界：η=0 处 ∂C/∂η = δ g(Lξ)；η=η_top 处 Dirichlet = C_trace_top
        # 侧边：齐次 Dirichlet
        return fem_solve_stretched(self.inner, self.D, self.delta,
                                    wall_flux=g_wall, top_trace=C_trace_top)

    # ---- 外子域：物理坐标 + SUPG ----
    def outer_solve(self, C_trace_bottom):
        # 原方程 + SUPG 稳定化
        # 边界：下人工边界 Dirichlet = C_trace_bottom；上/侧：齐次 Dirichlet
        return fem_solve_supg(self.outer, self.D, bottom_trace=C_trace_bottom)

    # ---- 一次交替 Schwarz 扫描 ----
    def schwarz_sweep(self, C_overlap, g_wall):
        # 1) 内解 -> 在 η_interface 处探测 -> 驱动外解
        C_in = self.inner_solve(C_overlap["top"], g_wall)
        C_bottom = probe(C_in, self.eta_if)
        # 2) 外解 -> 在 η_top 处探测 -> 驱动内解
        C_out = self.outer_solve(C_bottom)
        C_top = probe(C_out, self.delta * self.eta_top)
        # 3) 重叠场欠松弛
        C_overlap = (self.omega * C_out_in_overlap
                     + (1 - self.omega) * C_overlap)
        return C_overlap

    def forward(self, g_wall, n_iter=None):
        C_overlap = {"top": 0.0, "mid": 0.0}     # 初值：远场浓度
        for k in range(n_iter or self.max_iter):
            C_overlap = self.schwarz_sweep(C_overlap, g_wall)
            if self.converged(C_overlap):
                break
        return C_overlap, k

    # ---- 可微分：离散伴随梯度（dolfin-adjoint）----
    def misfit_and_gradient(self, theta, obs_zone, observations):
        """
        控制方程与边界条件为硬约束
        obs_zone: 'inner' | 'outer' | 'overlap'
        """
        C = self.forward(g_wall=theta)
        J = misfit(C, observations, obs_zone)
        # 伴随灵敏度跨 Schwarz 界面传播
        dJ = compute_adjoint_gradient(C, observations, obs_zone)
        return J, dJ


# ================= LLM / agentic 优化器 =================
OPT_POLICY = ["G", "A", "M", "N", "S", "Rg", "Rj", "Bg", "Bj"]   # 被动 LLM 策略库
AGENT_POLICY = ["A", "G", "M", "BB", "CG", "LM", "PG"]            # agentic 策略库


def passive_llm_optimize(solver, theta0, obs, n_epochs=150, model="qwen3:8b"):
    """
    被动 LLM 优化：每 epoch 输入
      1) 提示词（作为最小化引擎）
      2) 优化策略（可用方法清单）
      3) 最近 10 个 epoch 的历史（参数、失配、伴随梯度）
    输出：选择一种方法 + 阻尼/步长控制 + 推理记录
    控制器执行所选方法，把更新后的参数送回求解器
    """
    hist = []
    theta = theta0
    for e in range(n_epochs):
        J, g = solver.misfit_and_gradient(theta, obs)
        hist.append((theta, J, g))
        prompt = build_prompt(hist[-10:], OPT_POLICY)
        resp = ollama_chat(model, prompt, temperature=0.5)
        method, controls = parse_selection(resp)     # 例如 ("N", {"damping": 0.1})
        theta = apply_method(method, theta, J, g, hist, **controls)
    return theta, hist


def agentic_staged_library_optimize(solver, theta0, obs, n_epochs=75, delta_n=10):
    """
    主动 agentic + 分阶段基函数库扩充（实验 4）：
      - 起始库 D^(0) = {1, x, x^2}，agent 决定初值
      - 每 delta_n epoch 最多修订一次库
      - 仅当失配达到平台期时，准入下一族（顺序固定）
      - agent 决定新基函数的初值，并写入 theta 定义
      - 上限：6 多项式 + 2 Fourier + 12 乘积
    """
    library = {"families": ["poly2"], "controls": {"c": [...], "beta": [...]}}
    theta = theta0
    for e in range(n_epochs):
        J, g = solver.misfit_and_gradient(theta, obs)
        # 平台期检测：由 agent 从失配历史判断（无预设数值阈值）
        if e % delta_n == 0 and agent_detects_plateau(loss_history):
            admit_next_family(library, agent_proposed_initial_values())
            theta = rebuild_theta(library)     # 仅改写 θ 定义，前向/伴随不变
        method, controls = agent_select_method(AGENT_POLICY, theta, J, g, full_history)
        theta = apply_method(method, theta, J, g, history, **controls)
    return theta, library
```

---

## 实验结论

- **前向网格收敛（$D=10^{-6}$，最难的算例）**：相对 M4 参考解的壁面剖面误差从 M1 的 **29.81%** 降到 M2 的 **10.16%**、M3 的 **2.17%**；M3 与 M4 几乎完全一致 → 采用 **M4 作为高保真参考解**（对所有扩散系数）。
- **前向求解器对比**：加入了一个**无反馈的"单向"方法**（只传接口信息、不做内外交替更新）作为对照，用于**隔离"双向" Schwarz 耦合的贡献**。Schwarz 求解器在粗网格（M1）上即可给出接近 M4 的壁面剖面。
- **成本结构**：Schwarz 求解器在同等 $m$ 下总 DOF 比单域多 **6.3%–7.0%**（M0: 17,802 vs 16,641；M1: 70,418 vs 66,049；M2: 280,098 vs 263,169；M3: 1,117,250 vs 1,050,625；M4: 4,462,722 vs 4,198,401；M5: 17,838,338 vs 16,785,409），**但内子域的层内网格划分数与 $D$ 无关**。
- **反演：常值壁面通量（$g=-10$，初值 $-5$）**
  - **$D=10^{-4}$，inner 数据**：单域在 M1 上成功（91 epoch，236.72 s，收敛值 $-10.0174$）；**Schwarz 在 M1 上成功（65 epoch，113.37 s，$-9.9907$）**；**单向方法未达到目标**（收敛到 $-11.1426$，误差 11.4%）。
  - **$D=10^{-5}$，inner 数据**：**Schwarz 在 M0（最粗网格）上就成功（93 epoch，29.70 s，$-10.0771$）**，而单域需要 M2（788.93 s）；单向仍未达标（$-11.1304$）。
  - **$D=10^{-5}$，outer 数据**：单域 M1（167.95 s）、Schwarz M3（5914.58 s）——**Schwarz 在外区数据下反而更贵**（说明双向耦合在某些配置下增加了成本）。
  - **单向方法在所有配置下均未达到 1% 目标**（收敛到约 $-11.1$，即约 11% 偏差）→ **双向 Schwarz 耦合对反演是必要的**。
- **优化器对比（一维标量反演，150 epoch 预算）**
  - **经典方法**：Newton、secant、Brent 收敛最快（到目标 3–7 epoch）；Brent 墙钟时间在几乎所有情况下最快（13.1–23.2 s）。
  - **被动 LLM（Qwen3-8B，30 次运行）**：inner 数据下 **88/90 次成功**（$D=10^{-4}$ 为 29/30），中位收敛值与 Newton/secant 相差至多 0.001% / 0.11%；选法分布以 **Newton 65.4%–90.0%** 与**归一化梯度 9.7%–34.0%** 为主。
  - **主动 agent（GPT 5.6 Terra，5 次运行）**：inner 数据下 **15/15 全部成功**；overlap 数据下 14/15 成功但**中位收敛值偏差达 0.6%**（$D=10^{-5}$），且试验间散布明显大于 inner 数据。
  - **墙钟时间**：LLM 类优化器**普遍慢于经典方法**（被动 LLM 113–178 s vs Brent 13–23 s；agent 23–61 s vs damped Newton 12–17 s）。唯一例外是 $D=10^{-6}$ 的 agent + inner 数据（50.8 s，优于 damped Newton 与 secant）。
  - **方法选择混合的差异**：被动 LLM 主要选 Newton + 归一化梯度（与图 5 中观察到的振荡一致）；**agent 主要依赖 secant 与回归/二次拟合/括号类方法**（Rg/Rj/Bg/Bj，合计 58%–70%），利用更多历史条目，与其更小的振荡一致。
- **函数基识别（四个实验）**
  - **实验 1（理想库 + Adam，1200 epoch）**：多项式包络相对 $L_\infty$ 误差 **0.714%**，Fourier 包络 **7.139%**，墙钟 7.5–7.9 min。
  - **实验 2（公共库 + Adam，1200 epoch）**：误差大幅劣化——多项式 **13.020%**，Fourier **12.221%**，墙钟 11–13 min。
  - **实验 3（公共库 + agentic，500 epoch）**：多项式 **7.093% [IQR 2.118]**，墙钟 **358.7 min [28.08]**——精度介于 1 与 2 之间，但**墙钟成本远高**（因为 agent 每次调用的开销）。
  - **实验 4（分阶段扩充库 + agentic，75 epoch，$\Delta n=10$）**：多项式 **0.152% [IQR 0.080]**，只用 **2 个基函数项**，墙钟 **19.8 min [1.72]**——**在 75 个 epoch 内达到了比 1200-epoch Adam 更低的误差**。
  - agentic 实验 4 的库上限为 6 多项式 + 2 Fourier + 12 乘积；族按固定顺序准入；新基函数初值由 agent 决定。

---

## 局限性

- **LLM/agent 在低维问题上并无速度优势**：一维标量反演中，**Brent/Newton/secant 更快更稳**；LLM 类优化器墙钟时间普遍高一个数量级。作者明确"不主张 LLM 与 agentic AI 能取代经典方法"，只指出在特定场景可能是可行策略。
- **agentic 路线的高时间成本**：实验 3 中 agentic 用了 358.7 min（IQR 28.08 min），而 Adam 只要 12.9 min；即使实验 4 降到 19.8 min，**仍比 Adam 的 12.9 min 贵**（尽管迭代数从 1200 降到 75，误差从 13.0% 降到 0.152%）。**"迭代更少"不等于"墙钟更快"**。
- **agent 的运行成本与可复现性**：被动 LLM 用开源 Qwen3-8B 跑 30 次；主动 agent 用闭源 GPT 5.6 Terra，只跑 5 次且**无种子**（靠自身非确定性），试验数远少于被动方案；不同算例与不同数据区（inner vs overlap）下 agent 的**一致性差异明显**（15/15 vs 14/15，且中位值偏差 0.6%、散布更大）。
- **基准是二维、低复杂度、单一流动**：定常双涡流，仅 3 个扩散系数、4 类通量剖面（常量/单瓣/振荡/组合）；**未在真实几何或实验数据上验证**。
- **agent 扩充的基函数族是预设的**：准入顺序固定（三~五次多项式 → Fourier → 多项式×Fourier），**结构搜索空间被人工限制**；作者自己也类比为"结构受限的符号回归"。且**目标是恢复剖面而非恢复精确解析表达式**——与方程发现的目标不同（后者关心物理可解释的项）。
- **离散轮廓重建路径的困难**：节点场表示使逆问题维度随网格增长，需 Tikhonov 正则化而 $\alpha^*$ 未知 → 昂贵且有时失败。作者未给出系统解决方案，只由函数基路径绕过。
- **Schwarz 在外区数据下不一定更快**：$D=10^{-5}$、outer 数据时 Schwarz 需 M3 且墙钟 5914.58 s，而单域在 M1 上 167.95 s 即可——**优势依赖具体配置**。
- **单向对照的失败原因未完全分解**："双向耦合的贡献"被隔离出来，但单向方法为何失败（是缺少内部反馈，还是收敛方式问题）未详细分析。
- **FEniCS/dolfin-adjoint 的生态限制**：伴随梯度需完整前向/伴随记录；"观测位置还决定记录哪些伴随运算"（Schwarz 的拉伸内网格在 inner 区比单域同层网格有更多节点）——**数据位置同时影响信息内容与伴随计算量**，这是评估中易被忽略的混杂。
- **代码尚未公开**（同行评审后），复现门槛较高。

---

## 相关工作

- [[Schwarz域分解与重叠迭代]]
- [[奇异摄动理论与匹配渐近展开]]
- [[薄边界层与高Péclet输运]]
- [[可微分求解器与离散伴随法]]
- [[反问题与参数反演]]
- [[Tikhonov正则化与病态逆问题]]
- [[函数基与稀疏识别SINDy]]
- [[大语言模型作为优化器]]
- [[Agentic AI科学计算工作流]]
- [[SUPG稳定化与有限元对流扩散]]
- [[双涡流基准]]

---

## 实现建议

- **实现难度**：🔴 高。需要 (a) 拉伸坐标下的 FEM 求解器；(b) 交替 Schwarz + 欠松弛 + 重叠区管理；(c) 离散伴随（dolfin-adjoint 或自研）；(d) 函数基参数化 + 非线性参数联合优化；(e) LLM/agent 优化循环 + 基库管理策略。
- **预期性能**：薄层解析方面**优势明确**（内层网格与 $D$ 无关，粗网格即可），但**总墙钟优势依配置而定**（outer 数据下 Schwarz 反而慢 35 倍）。反演精度上，**双向 Schwarz 明显优于单向**（单向始终约 11% 偏差）。
- **适用场景**：
  - **高 Pe 输运反演**：动脉壁面传质（本文动机）、涂层/催化层内的传质、膜分离；
  - **含分离/再附着的薄层**：经典匹配渐近在此失效，Schwarz 的双向交换是必要的；
  - **壁面通量/扩散系数反演**，且测量点可能远离未知参数所在位置（跨子域伴随传播）；
  - **未知通量有紧凑解析形式**的场景——此时用 agent 扩充函数基的收益最大。
- **落地建议**：
  1. **先实现无 LLM 的版本**：Schwarz + 离散伴随 + 函数基 + Adam/LM，即可复现主要工程收益；**agent 是在此之上的可选层**；
  2. **不要在一维/低维问题上用 LLM 优化器**——本文已证明 Brent/Newton/secant 更快更稳；
  3. **采用"平台期"成功判据而非"首次进入误差带"**，否则会高估瞬态穿越真值的方法；
  4. **按"达到目标所需的最粗网格"比较方法**（等精度比较），而非同网格比较；
  5. **保留单向对照算例**，用于确认双向耦合确实被激活；
  6. **把 agent 的基库准入策略写成显式的、预设顺序的规则**（而非让模型自由发挥），并给库规模设上限；
  7. **注意 wall-clock 才是约束**：本文中"75 epoch 胜过 1200 epoch"对应的是 19.8 min vs 12.9 min 的混合结果，**在工程预算下需实测**。

已传递给 @墨鱼丸。
