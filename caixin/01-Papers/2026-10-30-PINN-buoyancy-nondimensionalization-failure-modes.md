---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, fluid, PINN, physics-informed-neural-network, buoyancy-driven-flow, Rayleigh-Benard, non-dimensionalization, gradient-imbalance, natural-convection]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2610.38889
---

# Inherent Failure Modes of Physics-Informed Neural Networks for Buoyancy-Driven Flow: Role of Non-Dimensionalization in Network Training

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Inherent Failure Modes of Physics-Informed Neural Networks for Buoyancy-Driven Flow: Role of Non-Dimensionalization in Network Training |
| **作者** | K. Chand, A. Peyvan, H. Luo（Vanderbilt University, 机械工程系） |
| **发表** | arXiv:2610.38889 [physics.flu-dyn], 2026-10-28 |
| **链接** | [原文](https://arxiv.org/abs/2610.38889) |
| **DOI** | 10.48550/arXiv.2610.38889 |
| **代码** | - |
| **篇幅** | 含附录 A/B/C（稀疏数据同化、自适应损失加权、非定常从静止起动） |

---

## 核心贡献

> 系统证明**无量纲化方式（而非网络结构）是 PINN 处理浮力驱动流动成败的决定性因素**：在**完全相同的网络、损失、权重、采样点与随机种子**下，**自由落体标度**（浮力系数 $B=1$）在 $Ra\le10^4$ 时平均努塞尔数误差 **<1.1%**，而**热扩散标度**（浮力系数 $B=Ra\cdot Pr$）误差达 **157%–650%**，并在 $Ra=10^5$ **完全发散**；机理是**浮力系数在残差中出现两次**，导致梯度按 $B^2$ 放大——**每提升一个数量级的 $Ra$，梯度放大因子增大两个数量级**。

1. **非无量纲化（物理量纲化）是 PINN 可训练性的关键设计变量**：此前文献多用"浮力系数 $B\approx O(1)$"的标度，但**其理由从未被重新检验**。本文首次把"标度选择"作为唯一自变量做受控对比。
2. **定量梯度失衡机理**：由 $y$-动量残差 $\mathrm{mom}_v = R - B\theta$（$R$ 含对流、压力梯度与粘性项）出发，初始化附近 $u,v\approx0$、$\theta=O(1)$，故 $\mathrm{mom}_v\approx -B\theta$，其平方损失的参数梯度为
   $$\frac{\partial \mathcal{L}_v}{\partial w} = 2\,\mathrm{mom}_v\frac{\partial \mathrm{mom}_v}{\partial w} \approx 2B^{2}\theta\frac{\partial\theta}{\partial w}$$
   ——**浮力系数进入梯度两次**（一次经残差幅值，一次经残差对参数的导数），温度相关贡献按 $B^2$ 标度。
3. **直接梯度测量证实**：$Ra=10^4$ 时热扩散标度的 $y$-动量残差梯度初始比无滑移边界条件梯度**大 $8.35\times10^{8}$ 倍**，且训练全程保持 5–7 个数量级差；自由落体标度初始比值仅 $O(10)$，前 100 步内各动量梯度迅速趋于同量级。
4. **两个常用缓解手段均失效**：
   - **稀疏数据同化**（20 个 DNS 参考点，权重 20）：热扩散标度误差仅从 88.7%/90.7%/95.8% 降到 82.0%/83.2%/95.0%，$\overline{\mathrm{Nu}}$ 误差仍 >600%；更糟的是**流拓扑被破坏**（出现两个回流区，而非正确的单个离轴回流区），且热壁局部努塞尔数被高估 5–15 倍、冷壁近零，**完全不满足稳态热平衡**。
   - **基于梯度范数的自适应损失加权**：粗粒度方案使 $\overline{\mathrm{Nu}}$ 从 29.26 恶化到 40.69（DNS 为 2.218）；细粒度方案把 $y$-动量残差权重压到 $7.8\times10^{-6}$（等效于压制浮力主导项），误差仍 100%。
   - 结论：**把 PDE 残差当作一组来处理不足以缓解梯度失衡**；再调损失权重也**无法消除浮力系数带来的放大因子**。
5. **硬约束边界条件的独立价值**：若温度 Dirichlet 条件仅用软罚项，热扩散 PINN 会收敛到**平凡解** $\theta\approx0,\ u,v\approx0$（内部残差小但边界条件完全违背）。采用硬约束输出变换可阻止这一失效模式，**但不足以保证收敛**。
6. **非定常扩展的局限**：自由落体 PINN 从静止起动（$Ra=10^4$）时，长时间平均努塞尔数误差仅 0.7%，但**无法捕捉瞬态努塞尔数过冲**（参考峰值 2.41 vs PINN 约 2.30），早期瞬态速度误差约 20%。

---

## 技术方案

### 核心思想

**物理问题**：差分加热方腔（自然对流），$\mathrm{Pr}=0.71$，$Ra=10^3$–$10^5$。这是 PINN 最常被"演示"的算例之一，本文要回答一个此前被忽视的问题：**为什么同样的 PINN 结构在有些浮力问题上是失败的？**

**核心论断**：PINN 的损失函数是**PDE 残差的无量纲加权和**。当无量纲化方式把一个**大系数**（$B=Ra\cdot Pr$）直接放进 PDE 残差中时，该系数会以**平方**的形式进入梯度。这不是可以通过调损失权重解决的问题——权重作用在损失项之间，而放大因子在**残差内部**。

**两种标度对比**：

| 标度 | 特征速度 | 浮力系数 $B$ | 粘性系数 | 热扩散系数 |
|------|---------|------------|---------|-----------|
| **热扩散 (thermal-diffusive)** | $U=\alpha/L$ | $Ra\cdot Pr$ = 710 / 7100 / 71000 | $\mathrm{Pr}=0.71$ | $1$ |
| **自由落体 (free-fall)** | $U=\sqrt{g\beta\Delta\theta L}$ | **$1$**（与 $Ra,\mathrm{Pr}$ 无关） | $\sqrt{\mathrm{Pr}/\mathrm{Ra}}$ = 0.0267/0.00843/0.00267 | $1/\sqrt{Ra\,\mathrm{Pr}}$ = 0.0375/0.0119/0.00375 |

**场量换算关系**：两种标度描述同一物理系统，但无量纲速度、流函数相差 $\sqrt{Ra\cdot\mathrm{Pr}}$ 倍，压力相差 $Ra\cdot\mathrm{Pr}$ 倍；**温度与努塞尔数与速度标度无关**（这是能做直接比较的关键）。

### 关键技术

| 技术 | 说明 |
|------|------|
| **网络结构** | 全连接 MLP：2 个空间输入 $(x,y)$，**4 个隐藏层 × 64 神经元**，3 个输出 $(\psi_{\text{raw}}, p, \theta_{\text{raw}})$；$\tanh$ 激活（**ReLU 等分段线性激活的二阶导几乎处处为零，不适合表示粘性/扩散项**）；Xavier-normal 权重初始化，偏置为零 |
| **流函数硬约束** | $u=\partial\psi/\partial y$，$v=-\partial\psi/\partial x$ → 连续方程**恒等满足**，损失中无需包含连续性残差 |
| **边界硬约束** | $\psi=x(1-x)y(1-y)\psi_{\text{raw}}$（四壁 $\psi=0$，保证无穿透）；$\theta=(1-x)+x(1-x)\theta_{\text{raw}}$（热壁 $\theta=1$、冷壁 $\theta=0$）。**切向无滑移与上下壁绝热条件仍为软约束** |
| **损失函数** | $\mathcal{L}=\mathcal{L}_{\text{pde}}+20\mathcal{L}_{\text{vel}}+20\mathcal{L}_{\theta}+\mathcal{L}_p$，$\mathcal{L}_p=\langle p\rangle^2$（压力归一化，消除任意常数） |
| **配点** | 8,000 个内部随机配点；每壁 400 点 |
| **训练** | Adam 5,000 步（初始 lr $10^{-3}$，余弦退火至 0）+ L-BFGS 3,000 步（strong-Wolfe 线搜索）。**两种标度下架构、损失、权重、配点预算、随机种子完全相同** |
| **DNS 参考解** | 自研有限体积求解器，同心（collocated）网格；**对流项显式 Adams–Bashforth，扩散项 Crank–Nicolson**；CFL < 0.3；均匀 $64\times64$ 网格 |
| **场量对比** | PINN 是连续可微表示，**直接在其上求值于 DNS 网格点，无需插值** |
| **稀疏数据同化** | 20 个 DNS 参考点（$x\approx0.5$ 线上），数据损失权重 20；设 $\tau=0$（仅速度）/$\tau=1$（速度+温度） |
| **自适应损失加权** | 梯度范数加权的粗/细两种粒度方案 |
| **非定常扩展** | 从静止起动的非定常对流，两个随机初始化 |

---

## 公式

```math
\text{热扩散标度的无量纲方程（浮力系数 } B = Ra\cdot Pr\text{）}:\quad
\begin{cases}
u_x + v_y = 0\\
u_t + uu_x + vu_y = -p_x + \mathrm{Pr}(u_{xx}+u_{yy})\\
v_t + uv_x + vv_y = -p_y + \mathrm{Pr}(v_{xx}+v_{yy}) + \underbrace{Ra\cdot\mathrm{Pr}}_{B}\,\theta\\
\theta_t + u\theta_x + v\theta_y = \theta_{xx} + \theta_{yy}
\end{cases}
\qquad
Ra=\frac{g\beta\Delta\theta L^3}{\nu\alpha},\quad \mathrm{Pr}=\frac{\nu}{\alpha}
```

```math
\text{自由落体标度的无量纲方程（浮力系数 } B=1\text{）}:\quad
\begin{cases}
u_x + v_y = 0\\
u_t + uu_x + vu_y = -p_x + \sqrt{\mathrm{Pr}/Ra}\,(u_{xx}+u_{yy})\\
v_t + uv_x + vv_y = -p_y + \sqrt{\mathrm{Pr}/Ra}\,(v_{xx}+v_{yy}) + \theta\\
\theta_t + u\theta_x + v\theta_y = \tfrac{1}{\sqrt{Ra\,\mathrm{Pr}}}(\theta_{xx}+\theta_{yy})
\end{cases}
```

```math
\text{两标度的场量换算}:\quad
u_{\text{diff}} = \sqrt{Ra\cdot\mathrm{Pr}}\,u_{\text{ff}},\quad
\psi_{\text{diff}} = \sqrt{Ra\cdot\mathrm{Pr}}\,\psi_{\text{ff}},\quad
p_{\text{diff}} = Ra\cdot\mathrm{Pr}\,p_{\text{ff}},\quad
\theta,\ \overline{Nu}\ \text{与速度标度无关}
```

```math
\text{梯度放大机理（核心）}:\quad
\mathrm{mom}_v = R - B\theta,\qquad
\mathcal{L}_v = \mathrm{mom}_v^2
\quad\Longrightarrow\quad
\frac{\partial\mathcal{L}_v}{\partial w}
= 2\,\mathrm{mom}_v\frac{\partial\mathrm{mom}_v}{\partial w}
\approx 2(-B\theta)(-B)\frac{\partial\theta}{\partial w}
= 2B^{2}\theta\frac{\partial\theta}{\partial w}
\quad\Longrightarrow\quad \boxed{\ \propto B^2\ }
```

```math
\text{梯度放大因子表（热扩散标度）}:\quad
\begin{array}{c|c|c|c}
Ra & B = Ra\cdot\mathrm{Pr} & B^2 & \overline{Nu}\ \text{误差}\\
10^{3} & 710 & 5.0\times10^{5} & 157.7\%\\
10^{4} & 7{,}100 & 5.0\times10^{7} & 648.5\%\\
10^{5} & 71{,}000 & 5.0\times10^{9} & \text{NaN（发散）}
\end{array}
\quad\Longrightarrow\quad
\text{每升一个数量级 }Ra,\ \text{放大因子升两个数量级}
```

```math
\text{硬约束变换}:\quad
\psi = x(1-x)y(1-y)\,\psi_{\text{raw}},\qquad
\theta = (1-x) + x(1-x)\,\theta_{\text{raw}}
\quad\Longrightarrow\quad
\psi=0\ \forall\text{四壁},\quad \theta(0)=1,\ \theta(1)=0
```

```math
\text{总损失}:\quad
\mathcal{L} = \mathcal{L}_{\text{pde}} + 20\,\mathcal{L}_{\text{vel}} + 20\,\mathcal{L}_{\theta} + \mathcal{L}_p,
\qquad \mathcal{L}_p = \langle p\rangle^2
```

```math
\text{努塞尔数与局部努塞尔数}:\quad
\mathrm{Nu}_{\text{local}}(y) = -\left.\frac{\partial\theta}{\partial x}\right|_{x=0},
\qquad
\overline{\mathrm{Nu}} = \text{热壁积分}
\quad\text{（梯度由自动微分求取）}
```

---

## 代码片段

```python
# PINN 浮力驱动流动：非无量纲化对比（概念性伪代码）
import numpy as np, torch

class BuoyancyPINN(torch.nn.Module):
    """硬约束流函数-压力-温度 PINN"""
    def __init__(self, scaling="free_fall", hidden=64, n_layers=4):
        super().__init__()
        self.scaling = scaling
        # 输入 (x,y) -> 输出 (psi_raw, p, theta_raw)
        self.net = torch.nn.Sequential(
            torch.nn.Linear(2, hidden), torch.nn.Tanh(),
            *[l for _ in range(n_layers - 1)
              for l in (torch.nn.Linear(hidden, hidden), torch.nn.Tanh())],
            torch.nn.Linear(hidden, 3)
        )
        # Xavier-normal 初始化 + 零偏置
        for m in self.net:
            if isinstance(m, torch.nn.Linear):
                torch.nn.init.xavier_normal_(m.weight)
                torch.nn.init.zeros_(m.bias)

    def forward(self, x, y):
        psi_raw, p, theta_raw = self.net(torch.cat([x, y], dim=-1))
        # --- 硬约束变换 ---
        psi   = x * (1 - x) * y * (1 - y) * psi_raw        # 四壁 psi=0
        theta = (1 - x) + x * (1 - x) * theta_raw           # 热/冷壁 Dirichlet
        # --- 流函数恢复速度（连续方程恒等满足）---
        u = torch.autograd.grad(psi, y, grad_outputs=torch.ones_like(psi),
                                create_graph=True)[0][..., 0]
        v = -torch.autograd.grad(psi, x, grad_outputs=torch.ones_like(psi),
                                 create_graph=True)[0][..., 0]
        return u, v, p, theta

    def residuals(self, x, y, Ra, Pr):
        u, v, p, theta = self.forward(x, y)
        if self.scaling == "diffusive":
            B, visc, diff = Ra * Pr, Pr, 1.0
        else:                       # free_fall
            B = 1.0
            visc = (Pr / Ra) ** 0.5
            diff = 1.0 / (Ra * Pr) ** 0.5
        # 自动微分求一阶/二阶导
        ux, uy, vx, vy = grad(u, x), grad(u, y), grad(v, x), grad(v, y)
        uxx, uyy = grad(ux, x), grad(uy, y)
        vxx, vyy = grad(vx, x), grad(vy, y)
        px, py = grad(p, x), grad(p, y)
        tx, ty = grad(theta, x), grad(theta, y)
        txx, tyy = grad(tx, x), grad(ty, y)
        # 动量残差（注意浮力系数 B 直接进入残差）
        mom_x = u*ux + v*uy + px - visc*(uxx + uyy)
        mom_y = u*vx + v*vy + py - visc*(vxx + vyy) + B*theta   # <== B 在这里
        en   = u*tx + v*ty - diff*(txx + tyy)
        return mom_x, mom_y, en

def gradient_imbalance_probe(model, Ra, Pr, n_iters=500):
    """直接测量各损失项对所有参数的 L2 梯度范数（原始未加权）"""
    stats = {}
    for name in ["mom_x", "mom_y", "energy", "bc_vel", "bc_theta"]:
        g = torch.autograd.grad(raw_loss_term(model, name), params,
                                retain_graph=True, allow_unused=True)
        stats[name] = torch.norm(torch.stack([x.norm() for x in g if x is not None]))
    return stats
# 预期：diffusive 的 mom_y 梯度 >> bc_vel 梯度（初始 8.35e8 倍）；
#       free_fall 各梯度量级相当（初始比值 O(10)）
```

---

## 实验结论

- **训练收敛（残差损失）**：自由落体标度平滑近单调下降，最终损失 $1.8\times10^{-5}$（$Ra=10^3$）、$6.4\times10^{-5}$（$10^4$）、$4.8\times10^{-4}$（$10^5$）；热扩散标度在 Adam 阶段就停在**高 3–8 个数量级**的平台，$Ra=10^3$/$10^4$ 最终损失为 12.1 与 5079，$Ra=10^5$ 在 L-BFGS 阶段**发散**（损失尖峰趋近 $10^{16}$，最终为 **NaN**）。
- **平均努塞尔数误差（对 DNS）**：

| 标度 | $Ra$ | $\overline{Nu}$ (DNS) | $\overline{Nu}$ 误差 | $u_{\max}$ 误差 | $v_{\max}$ 误差 |
|------|-------|--------------------|-------------------|---------------|---------------|
| Diffusive | $10^3$ | 1.101 | **157.7%** | 1.9% | 20.3% |
| Free-fall | $10^3$ | 1.101 | **0.0%** | 0.8% | 1.1% |
| Diffusive | $10^4$ | 2.218 | **648.5%** | 84.1% | 54.2% |
| Free-fall | $10^4$ | 2.218 | **1.1%** | 0.3% | 0.3% |
| Diffusive | $10^5$ | 4.492 | **NaN（发散）** | NaN | NaN |
| Free-fall | $10^5$ | 4.492 | **11.5%** | 2.4% | 4.3% |

- **DNS 自验证**：$Ra=10^3$ 时 $\overline{Nu}=1.101$，与 Wan et al. 的 1.073 吻合到 2.6%。
- **梯度失衡实测（$Ra=10^4$）**：热扩散标度的 $y$-动量残差梯度初始比无滑移边界条件梯度**大 $8.35\times10^{8}$ 倍**，训练全程保持 5–7 个数量级差；自由落体标度初始比值 $O(10)$，前 100 步内两个动量残差梯度显著下降并趋于同量级。
- **稀疏数据同化（$Ra=10^4$，20 点，权重 20）**：
  - 热扩散：无数据 $u/v/\theta$ 误差 88.7/90.7/95.8%，$\overline{Nu}$ 误差 672%；$\tau=0$（仅速度）后 82.0/83.2/95.0%，$\overline{Nu}$ 误差 619%；$\tau=1$ 后 82.5/84.3/95.3%，误差 614%。**加入稀疏监督后流拓扑被破坏**（出现两个回流区：一个在 $x\approx0.2$，一个在 $x\approx0.55$，而正确解是单个离轴回流区）。热壁局部努塞尔数被高估约 5–15 倍且剖面近乎平坦、两端尖峰；冷壁预测接近零（DNS 从约 3.5 平滑降到 0.6）。热壁/冷壁 $\overline{Nu}$ 分别约 17 与接近 0，**完全不满足稳态热平衡**（DNS 为 2.2184 / 2.2183，平衡到 0.005%）。
  - 自由落体：无数据 0.98/1.24/0.92%，$\overline{Nu}$ 误差 2.40%；$\tau=0$ 后 0.61/1.16/0.41%，误差 1.53%；$\tau=1$ 后 0.57/1.06/0.26%，误差 1.41%。
- **自适应损失加权（$Ra=10^4$，仅 Adam 5,000 步）**：
  - 热扩散固定权重对照：$u/v/\theta$ 误差 99.7/104.5/100.1%，$\overline{Nu}=29.26$（DNS 2.218）。
  - 热扩散粗粒度自适应：100.0/100.0/97.5%，$\overline{Nu}=40.69$（**更差**）；最终权重 $\lambda_{\text{vel}}=1.1\times10^{10}$、$\lambda_\theta=7.4\times10^{11}$，而 $y$-动量残差权重保持 1。
  - 热扩散细粒度自适应：100.0/100.0/89.9%，$\overline{Nu}=9.97$，但 $\lambda_{\text{mom}_v}=7.8\times10^{-6}$（**把浮力主导项直接压制**）。
  - 自由落体固定权重对照：11.0/15.1/16.7%，$\overline{Nu}=2.807$；细粒度自适应反而恶化到 99.5/99.6/36.9%，$\overline{Nu}=1.016$。
- **非定常（自由落体，从静止起动，$Ra=10^4$，两个随机初始化）**：长时间平均努塞尔数误差 0.7%；**瞬态过冲未捕捉**（参考峰值 2.41，PINN 约 2.30）；早期瞬态速度误差约 20%。

---

## 局限性

- **结论范围限于所测条件**：仅方腔自然对流、$\mathrm{Pr}=0.71$、$Ra\in[10^3,10^5]$、固定网络（4×64）与固定损失权重。虽然机理（$B^2$ 梯度放大）是普适的，但**具体的误差数字与阈值不可外推**。
- **固定训练预算是误差的重要混杂因素**：作者自己指出 $Ra=10^5$ 时自由落体 PINN 的 11.5% 误差"可能归因于固定训练预算"，即该误差**部分不是方法缺陷而是算力限制**。同样地，稀疏数据与自适应加权的实验结论均在"固定预算"下成立。
- **硬约束只处理了一部分边界条件**：切向无滑移与上下壁绝热仍为软约束；论文未比较"全部硬约束"的变体。
- **对比的是"两个极端"**：只比较了热扩散标度（$B$ 最大）与自由落体标度（$B=1$）两种，**未系统扫描中间标度**（例如部分自由落体混合标度），因此"最优标度"的普适性未论证。
- **未考虑无量纲化的边界**：$B=1$ 的标度把扩散系数压到 $\sqrt{\mathrm{Pr}/Ra}$ 与 $1/\sqrt{Ra\cdot\mathrm{Pr}}$，**在 $Ra$ 很大时这两个系数很小**——这本身会改变边界层厚度，从而改变所需的空间分辨率。作者承认这是"不同的失效来源"（本文主要研究梯度失衡，未量化这一项）。
- **非定常部分只有一组算例**（$Ra=10^4$）、两个随机初始化，**瞬态过冲未捕捉**的机理未深入分析（是时间离散缺失？还是 PINN 对瞬态本征时间的分辨率不足？）。
- **DNS 参考解分辨率有限**：均匀 $64\times64$ 同心网格对 $Ra=10^5$ 的方腔可能欠分辨；作者引用 Wan et al. 仅在 $Ra=10^3$ 做了 2.6% 的交叉验证，**高 $Ra$ 下无独立验证**。
- **梯度失衡的"检测器"未被形式化**：文中测量了梯度失衡，但未提出可操作的准则（如"选使最大梯度比最小化的标度"）供他人直接套用。

---

## 相关工作

- [[物理信息神经网络PINN]]
- [[自然对流与Rayleigh-Benard对流]]
- [[无量纲化与非量纲方程]]
- [[努塞尔数与热传递]]
- [[自动微分与哈密顿量]]
- [[硬约束边界条件实现]]
- [[梯度失衡与损失加权]]
- [[DNS参考解与网格无关性验证]]
- [[非定常对流与瞬态过冲]]

---

## 实现建议

- **实现难度**：🟡 中。PINN 本身的实现门槛不高（MLP + 自动微分 + 硬约束变换）；真正的成本是**大量重复训练**（每个 $Ra$ × 每种标度 × 多种缓解策略 × 多个种子）。
- **预期性能**：自由落体标度在 $Ra\le10^4$ 可达到 <1.5% 的平均努塞尔数误差，与 DNS 相当；热扩散标度在该区间**不可用**。
- **适用场景**：任何**浮力/浮升力驱动的 PINN 问题**——自然对流、混合层、Rayleigh–Bénard、浮升力驱动的通道流——都会遇到同样的 $B^2$ 问题。本文的建议直接适用。
- **落地建议**：
  1. **首选自由落体标度**（或其他保证浮力系数 $B=O(1)$ 的标度）。这是本文最可操作的结论：**改标度比改网络有效得多**。
  2. **做一个 10 行代码的自检**：分别计算两动量残差与边界条件损失对全部参数的 L2 梯度范数，看比值是否达到 $10^2$ 以上。比值大 → 标度有问题。
  3. **不要指望稀疏数据或自适应加权救场**——本文明确证明它们不能移除残差内部的放大因子；自适应加权甚至可能把物理项压掉（如 $\lambda_{\text{mom}_v}=7.8\times10^{-6}$）而使结果更差。
  4. **必须用硬约束处理温度 Dirichlet 条件**，否则热扩散标度会收敛到 $\theta\approx0$ 的平凡解（软罚项下内部残差也很小，极易误判为"收敛成功"）。
  5. **对高 $Ra$ 增大训练预算**——$Ra=10^5$ 的 11.5% 误差主要是预算问题；同时注意 $B=1$ 标度下扩散系数变小，边界层变薄，需要更多配点。
  6. **评估时不要只看全局标量**：本文显示热扩散 PINN 的 $\overline{Nu}$ 误差 157% 时，热壁/冷壁热流甚至不满足稳态热平衡（17 vs 0），且局部努塞尔数剖面形状完全错误。**应同时检查局部量与整体物理一致性**。

已传递给 @墨鱼丸。
