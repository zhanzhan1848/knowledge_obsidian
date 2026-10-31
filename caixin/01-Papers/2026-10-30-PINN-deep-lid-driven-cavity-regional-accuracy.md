---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, fluid, PINN, lid-driven-cavity, deep-cavity, regional-collocation, spectral-hp-reference, vorticity-assessment, Reynolds-continuation]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2610.38814
---

# Regional accuracy of physics-informed neural networks (PINNs) for recirculation in a deep lid-driven cavity

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Regional accuracy of physics-informed neural networks (PINNs) for recirculation in a deep lid-driven cavity |
| **作者** | Ehsan Roohi（UMass Amherst）、Christopher J. McDevitt（University of Florida） |
| **发表** | arXiv:2610.38814 [physics.flu-dyn; math-ph], 2026-10-28 |
| **链接** | [原文](https://arxiv.org/abs/2610.38814) |
| **DOI** | 10.48550/arXiv.2610.38814 |
| **代码** | 参考解使用 Nektar++（spectral/$hp$） |
| **许可** | CC BY 4.0 |

---

## 核心贡献

> 强调"**体相速度吻合是不完整的评估**"：在深腔（$D/W=5$）驱动流中，腔底回流弱几个数量级，**平均速度看起来对但涡量偏差高达 41%–53%**。本文用**完全匹配的 Gaussian 正则化顶盖边界条件**建立 PINN 与独立 spectral/$hp$ 参考解的可比性，并提出**区域化配点 + 残差按深度包络缩放 + 跨 $Re$ 迁移初始化**，给出"哪里可信、哪里不可信"的分区评估协议。

1. **匹配边界条件的必要性**：顶盖运动在角点处有跳跃会改变边值问题本身。本文对 PINN 与 CFD **使用同一个 Gaussian 正则化顶盖** $u(x,1)=U_{\rm lid}(x)=[1-e^{-x^2/\delta_x^2}][1-e^{-(x-W)^2/\delta_x^2}]$，$\delta_x=\sqrt{0.001}\,W$，$v(x,1)=0$。因此报告的偏差是**同一个边值问题**的解差，可与用不同顶盖剖面的文献做定性对照，但不进入定量对比。
2. **"体相速度吻合不等于解正确"**：在共同 $121\times605$ 网格上，内部相对速度偏差 **5.130%–7.850%**，而**采样涡量偏差高达 41.104%–53.085%**（相差一个数量级）；腔底区相对速度偏差反而 <5%，绝对 RMS 偏差低至 $1.255\times10^{-10}U$——**弱回流区在相对指标上"看起来很好"，但绝对量级极小，其正确性并未被证明**。
3. **压力评估需分解**：腔底压力 RMS 偏差（$1.033\times10^{-4}$–$7.074\times10^{-5}\,\rho U^2$）**几乎全部来自区域平均偏移** $b_f$，扣除后局部形状 RMS 低至 $8.709\times10^{-12}\,\rho U^2$（相差 7 个数量级）。本文提出恒等式 $(e^{\rm global})^2=b_f^2+(e^{\rm shape})^2$ 显式区分二者。
4. **配置排名依赖区域与观测量**：$Re=1000$ 的 control 工作流**速度偏差最小（5.130%）但采样涡量偏差最大（53.085%）**——单一"最佳配置"的排名在不同观测量上会反转。
5. **改进工作流的效果（$Re=1000$，$161\times801$ 网格）**：内部速度偏差从 **5.624% 降到 2.658%**，压力（gauge 对齐后）RMS 偏差从 $2.793\times10^{-3}$ 降到 $1.167\times10^{-3}\rho U^2$。但作者明确指出：**这是累积训练工作流的比较，不隔离区域采样的单独贡献**。
6. **网格/求导诊断**：每方向隔点取样重算涡量，相对细网格涡量的内部变化为 CFD 的 **1.49%/2.87%/4.57%/6.71%**（$Re=100$→1000），而 PINN 为 **8.82%/7.99%/11.09%/17.54%**——**PINN 的涡量对求导网格更敏感**，这是评估协议必须声明的部分。
7. **CFD 参考解自身的敏感性已量化**：多项式加密 $P=6\to8$ 差异约 0.054%，网格加密 $32\times160\to48\times240$ 差异约 0.065%，时间步减半差异 0.000312%；$t\simeq170$ 到 $t\simeq170$ 之间的场变化 0.002886%（流动缓慢演化）。

---

## 技术方案

### 核心思想

**问题设定**：二维定常不可压流，深矩形腔 $D/W=5$，$\mathrm{Re}\in\{100,250,500,1000\}$（$U=W=1$，$\mathrm{Re}=UW/\nu$）。顶盖运动驱动，静止侧壁与底板约束回流。

**为什么需要区域化评估**：深腔中顶盖下方的**主环流很强**，而深处回流**弱几个数量级**。用体相平均速度做评估会把"上部对、下部错"的情形掩盖。作者的立场是：**"报告的最大研究雷诺数不是测得的失稳阈值"**（表 1 明确区分文献中的"最大研究值"与"转变阈值"），同样地"报告的稳态场不等于已测得稳定性"。

**PINN 表示（硬约束流函数–压力）**：
- 解析提升 $\psi_{\rm lid}$ 提供规定的顶盖运动；$B$ 是边界消失因子；$E$ 是深度包络。
- $\psi=\psi_{\rm lid}+B^2E(y)N_\psi$，$p=E(y)N_p$，$u=\partial_y\psi$，$v=-\partial_x\psi$。
- $B=16\xi(1-\xi)\eta(1-\eta)$，$\xi=x/W$，$\eta=[y-(1-D)]/D$。$B^2$ 保证神经修正及其**一阶导数在壁面消失**。
- 不可压性由 $u_x+v_y=\psi_{yx}-\psi_{xy}=0$ **恒等满足** → 连续性与速度边界条件**无需单独的罚权重**。
- **深度包络** $E(d)=\exp\{-\kappa[s_\beta(d-d_0)-s_\beta(-d_0)]\}$，$d=1-y$，$s_\beta(z)=\beta^{-1}\log(1+e^{\beta z})$，$\beta=10/W$，$d_0=0.25W$，$\kappa=4.212/W$。$\kappa$ 取自 Moffatt 的平行壁 Stokes 流的真实衰减指数，**只设定表示尺度，不拟合 CFD 比较，也不假定为有限 $Re$ 腔的精确衰减率**。$E$ 只提供平滑深度尺度，**不规定涡位置、不强制涡数**。
- **关键是导数链式法则**：$u=\psi_{{\rm lid},y}+A_yEN_\psi+AE_yN_\psi+AE\partial_yN_\psi$（$A=B^2$）。**改变包络会改变速度，即使网络参数不变**。实现中 $B,E$ 及其一阶导解析求值，网络导数用自动微分；动量残差需要速度的二阶导 → **神经流函数的三阶导**。

**训练目标（残差缩放 + 角点掩模）**：
$$J(\theta)=\frac{1}{N}\sum_i\left[\left(\frac{M_iR_{x,i}}{E_i}\right)^2+\left(\frac{M_iR_{y,i}}{E_i}\right)^2\right]$$
- $1/E$ 补偿深处物理残差的衰减（**残差缩放，不是修改方程**）；
- 上角点掩模 $M=[1-e^{-[x^2+(1-y)^2]/r_m^2}][1-e^{-[(x-W)^2+(1-y)^2]/r_m^2}]$，$r_m=0.01W$，降低角点邻域对离散目标的贡献，**但硬约束仍保留规定的壁面速度**；作者强调"小的掩模损失本身不证明该邻域的动量精度"。

**区域化配点（balanced sampler）**：
$$q=0.50q_\Omega+0.30q_{\rm upper}+0.15q_{\rm floor}+0.05q_{\rm corner}$$
- 上带与下带各为一个宽度；角点分量在 $r/W\in[10^{-4},0.25]$、角度 $[0.01,\pi/2-0.01]$ 内对数分布；排除距顶盖角点 $0.02W$ 内的上带点。
- **所有点等权重** → 该混合**故意改变区域权重**，既不是面积均匀积分的无偏估计，也不是残差自适应采样器；**不施加重要性权重**。
- 区域之间**重叠**（下带点也可能来自全域分量）→ 比例描述的是训练投入分配，不是物理域的划分。

**优化**：先 **SOAP**（Shampoo 类，Adam 式更新）10,000 步，lr 0.002，每 50 步重抽区域批次（批次 131,072 点；原 $Re=250/500$ 历史用 262,144 点）；再 **self-scaled Broyden** 20,000 步（固定点集 $N=131072$，$c_1=10^{-4}$，$c_2=0.9$，存储向量生成子与小子块而非稠密 Hessian）。损失分块 65,536 计算以控内存，**每块贡献除以同一全局 $N$**，保持全批量目标与梯度一致。种子 12345，另有 20264 的留出流。

**变体分离两个常被混同的机制**：
- "**soft residual**" 变体：把 $MR/E$ 换成 $MR/\sqrt E$，**输出包络不变**；
- "**half envelope**" 变体：输出与倒数残差尺度都用 $\kappa=2.106/W$。
- 两者分别隔离"**改变场表示**"与"**改变残差侧重**"。但 half-envelope 还要额外做 $Re=500$ 再调节（因为改 $E$ 就改了物理初速度）→ **是工作流比较，不是单因素检验**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **硬约束流函数–压力表示** | 两输出网络（$N_\psi,N_p$），21,122 个可训练参数，6 层 tanh 隐藏层宽 64，双精度 |
| **解析提升 $\psi_{\rm lid}$** | $\psi_{\rm lid}=(y-1)\eta^2[1-e^{-(x-W)^2/\delta_x^2}][1-e^{-x^2/\delta_x^2}]e^{-(1-y)^2/\delta_y^2}$，$\delta_y=0.1W$ |
| **边界消失因子 $B^2$** | 保证修正项与其一阶导在壁面为零；$\nabla(B^2)=2B\nabla B=0$ |
| **深度包络 $E(y)$** | 基于 Moffatt 的 Stokes 流衰减指数；提供深度尺度而非涡结构 |
| **残差倒数缩放 $1/E$** | 补偿深处残差衰减；与方程本身无关 |
| **上角点掩模** | $r_m=0.01W$；改变局部残差侧重，不改物理边界条件 |
| **区域化平衡采样器** | 50% 全域 / 30% 上带 / 15% 下带 / 5% 下角点（对数径向） |
| **SOAP 优化器** | 预条件坐标系统的自适应更新，先降低加权动量残差 |
| **self-scaled Broyden (SSB)** | 固定点集上的第二阶段精化；保留累积生成子而非短滚动历史 |
| **跨 $Re$ 迁移初始化** | $Re=1000$ 的 refined 工作流从已完成的 $Re=500$ 场出发 |
| **独立 spectral/$hp$ 参考解** | Nektar++；基网格 $32\times160$（加密 $48\times240$）；$P+1$ 模态（$P=6$ 用 7 模态，$P=8$ 用 9 模态）；元素界面装配保证连续逼近；**非线性项启用 de-aliasing** |
| **参考解速度修正** | 见 4.1.1（含动量修正项，保证与 PINN 的同一边值问题） |
| **压力 gauge 对齐** | 比较前移除候选与参考在公共区域上的单一平均压力差 |
| **涡量评估的一致性** | 用**同一微分算子**从采样速度场计算涡量（比较的是"采样导数的一致性"，而非网络自身的自动微分涡量） |
| **后处理网格诊断** | 隔点重算涡量，量化求导网格对评估的影响 |

---

## 公式

```math
\text{硬约束表示}:\quad
\psi = \psi_{\rm lid} + B^{2}E(y)\,N_\psi,
\qquad
p = E(y)\,N_p,
\qquad
u = \partial_y\psi,\quad v = -\partial_x\psi
```

```math
\text{边界消失因子与局部坐标}:\quad
B = 16\,\xi(1-\xi)\,\eta(1-\eta),\quad
\xi = x/W,\quad \eta = [y-(1-D)]/D
\quad\Longrightarrow\quad
B=0,\ \nabla(B^{2})=2B\nabla B=0\ \text{于壁面}
```

```math
\text{解析顶盖提升}:\quad
\psi_{\rm lid}=(y-1)\eta^{2}\bigl[1-e^{-(x-W)^{2}/\delta_{x}^{2}}\bigr]\bigl[1-e^{-x^{2}/\delta_{x}^{2}}\bigr]e^{-(1-y)^{2}/\delta_{y}^{2}},
\qquad \delta_y = 0.1\,W
```

```math
\text{深度包络（Moffatt 衰减指数）}:\quad
E(d) = \exp\{-\kappa\,[s_\beta(d-d_0)-s_\beta(-d_0)]\},\quad d=1-y,
\qquad
s_\beta(z)=\beta^{-1}\log(1+e^{\beta z}),
\qquad
\beta=\tfrac{10}{W},\ d_0=0.25W,\ \kappa=\tfrac{4.212}{W}
```
```math
\text{包络导数}:\quad
E_y = \kappa\,\sigma\!\big(\beta[d-d_0]\big)\,E,
\qquad \sigma(z)=\frac{1}{1+e^{-z}}
\quad(\text{正号来自 } d=1-y:\ \text{包络向顶盖增大})
```

```math
\text{速度的完整链式法则（关键）}:\quad
u = \psi_{{\rm lid},y} + A_y E N_\psi + A E_y N_\psi + A E\,\partial_y N_\psi,
\qquad
v = -\psi_{{\rm lid},x} - A_x E N_\psi - A E\,\partial_x N_\psi,
\qquad A=B^{2}
\quad\Longrightarrow\quad
\boxed{\ \text{改变包络会改变速度，即使网络参数不变}\ }
```

```math
\text{训练目标（残差缩放 + 角点掩模）}:\quad
J(\bm\theta)=\frac{1}{N}\sum_{i=1}^{N}\left[\left(\frac{M_iR_{x,i}}{E_i}\right)^{2}+\left(\frac{M_iR_{y,i}}{E_i}\right)^{2}\right]
\]

```math
\text{上角点掩模}:\quad
M=\bigl[1-e^{-[x^{2}+(1-y)^{2}]/r_{m}^{2}}\bigr]\bigl[1-e^{-[(x-W)^{2}+(1-y)^{2}]/r_{m}^{2}}\bigr],
\qquad r_m=0.01\,W
```

```math
\text{区域化采样混合}:\quad
q = 0.50\,q_\Omega + 0.30\,q_{\rm upper} + 0.15\,q_{\rm floor} + 0.05\,q_{\rm corner}
\quad\text{（所有点等权重；不施加重要性权重）}
```

```math
\text{稳态动量方程（PINN 求解对象）}:\quad
\begin{cases}
u_x+v_y = 0\\
R_x = uu_x+vu_y+p_x-\mathrm{Re}^{-1}(u_{xx}+u_{yy}) = 0\\
R_y = uv_x+vv_y+p_y-\mathrm{Re}^{-1}(v_{xx}+v_{yy}) = 0
\end{cases}
\qquad
\mathrm{Re}=\frac{UW}{\nu},\quad U=W=1
```

```math
\text{压力—速度梯度恒等式（未作为额外损失）}:\quad
\nabla^{2}p = -\sum_{i,j}\frac{\partial u_i}{\partial x_j}\frac{\partial u_j}{\partial x_i}
= -\left(u_x^{2}+2u_yv_x+v_y^{2}\right)
```

```math
\text{压力 gauge 对齐}:\quad
\Delta p = p^{\rm PINN}-p^{\rm CFD},
\qquad
(e^{\rm global}_{p,f})^{2} = b_f^{2} + (e^{\rm shape}_{p,f})^{2},
\qquad
b_f=\langle\Delta p\rangle_f,\quad
e^{\rm shape}_{p,f}=\langle(\Delta p-b_f)^{2}\rangle_f^{1/2}
```

```math
\text{self-scaled Broyden 更新}:\quad
\bm d_k = -H_k \bm g_k,\qquad
\bm\theta_{k+1}=\bm\theta_k+\alpha_k\bm d_k,
\qquad
\bm s_k=\bm\theta_{k+1}-\bm\theta_k,\quad \bm y_k=\bm g_{k+1}-\bm g_k
\quad(c_1=10^{-4},\ c_2=0.9)
```

---

## 代码片段

```python
# 深腔 PINN：硬约束流函数-压力表示 + 区域化配点（概念性伪代码）
import numpy as np, torch

class DeepCavityPINN(torch.nn.Module):
    """6 层 tanh，宽 64，双输出 (N_psi, N_p)，21,122 参数"""
    def __init__(self, W=1.0, D=5.0, dx=1e-3**0.5, dy=0.1):
        super().__init__()
        self.W, self.D, self.dx, self.dy = W, D, dx, dy
        self.net = torch.nn.Sequential(
            torch.nn.Linear(2, 64), torch.nn.Tanh(),
            *[l for _ in range(5) for l in (torch.nn.Linear(64, 64), torch.nn.Tanh())],
            torch.nn.Linear(64, 2)
        )
        for m in self.net:
            if isinstance(m, torch.nn.Linear):
                torch.nn.init.xavier_normal_(m.weight); torch.nn.init.zeros_(m.bias)

    # ---- 几何量 ----
    def xi_eta(self, x, y):
        xi = x / self.W
        eta = (y - (1.0 - self.D)) / self.D
        return xi, eta

    def B_factor(self, x, y):
        """边界消失因子（平方形式 B^2）"""
        xi, eta = self.xi_eta(x, y)
        B = 16 * xi * (1 - xi) * eta * (1 - eta)
        return B ** 2

    def psi_lid(self, x, y):
        """解析提升：提供规定的高斯正则化顶盖运动"""
        xi, eta = self.xi_eta(x, y)
        gx  = 1 - torch.exp(-(x - self.W) ** 2 / self.dx ** 2)
        gx2 = 1 - torch.exp(-x ** 2 / self.dx ** 2)
        return (y - 1) * eta**2 * gx * gx2 * torch.exp(-(1 - y) ** 2 / self.dy ** 2)

    def envelope(self, y, kappa=None, d0=0.25, beta=None):
        """深度包络 E(d)（Moffatt 衰减指数）"""
        W = self.W
        kappa = 4.212 / W if kappa is None else kappa
        beta = 10.0 / W if beta is None else beta
        d = 1.0 - y
        s = lambda z: np.log1p(np.exp(beta * z)) / beta
        return torch.exp(-kappa * (s(d - d0) - s(-d0)))

    def forward(self, x, y, kappa=None):
        """返回 u, v, p, N_psi（保留中间量便于残差计算）"""
        N_psi, N_p = self.net(torch.cat([x, y], dim=-1))
        A = self.B_factor(x, y)
        E = self.envelope(y, kappa)
        psi = self.psi_lid(x, y) + A * E * N_psi
        p = E * N_p
        # 完整链式法则（含解析项与包络导数）
        u = d(psi, y)
        v = -d(psi, x)
        return u, v, p, N_psi, A, E

    def residuals(self, x, y, Re, kappa=None):
        u, v, p, _, A, E = self.forward(x, y, kappa)
        ux, uy, vx, vy = d(u, x), d(u, y), d(v, x), d(v, y)
        uxx, uyy = d(ux, x), d(uy, y)
        vxx, vyy = d(vx, x), d(vy, y)
        px, py = d(p, x), d(p, y)
        Rx = u*ux + v*uy + px - (1.0/Re) * (uxx + uyy)
        Ry = u*vx + v*vy + py - (1.0/Re) * (vxx + vyy)
        return Rx, Ry, E

    def loss(self, x, y, Re, r_m=0.01):
        """J = (1/N) sum [ (M Rx/E)^2 + (M Ry/E)^2 ]"""
        Rx, Ry, E = self.residuals(x, y, Re)
        M = self.corner_mask(x, y, r_m)
        return (((M*Rx)/E)**2).mean() + (((M*Ry)/E)**2).mean()

    def corner_mask(self, x, y, r_m):
        """上角点掩模（降低角点邻域贡献，不改物理边界条件）"""
        W = self.W
        m1 = 1 - torch.exp(-(x**2 + (1-y)**2) / r_m**2)
        m2 = 1 - torch.exp(-((x-W)**2 + (1-y)**2) / r_m**2)
        return m1 * m2

# ---- 区域化平衡采样器 ----
def balanced_sampler(W, D, n_total, rng):
    """
    q = 0.50 全域 + 0.30 上带 + 0.15 下带 + 0.05 下角点（对数径向）
    所有点等权重；不施加重要性权重
    """
    n_omega = int(0.50 * n_total)
    n_upper = int(0.30 * n_total)
    n_floor = int(0.15 * n_total)
    n_corner = n_total - n_omega - n_upper - n_floor

    xy = np.empty((n_total, 2))
    # 全域均匀
    xy[:n_omega] = rng.uniform([0, 1 - D], [W, 1], size=(n_omega, 2))
    # 上带（宽 1，贴顶盖），排除顶盖角点 0.02W 半径内的点
    pts = rng.uniform([0, 1 - 1], [W, 1], size=(n_upper, 2))
    near_corner = ((pts[:,0] < 0.02*W) & (pts[:,1] > 1 - 0.02*W)) | \
                  ((pts[:,0] > W - 0.02*W) & (pts[:,1] > 1 - 0.02*W))
    xy[n_omega:n_omega+n_upper] = pts[~near_corner]
    # 下带（宽 1，贴底板）
    xy[n_omega+n_upper:n_omega+n_upper+n_floor] = \
        rng.uniform([0, 1 - D], [W, 1 - D + 1], size=(n_floor, 2))
    # 下角点：对数径向 r/W in [1e-4, 0.25]，角度 [0.01, pi/2-0.01]
    left = rng.random(n_corner) < 0.5
    r = W * 10**rng.uniform(-4, np.log10(0.25), n_corner)
    ang = rng.uniform(0.01, np.pi/2 - 0.01, n_corner)
    cx = np.where(left, 0.0, W); cy = 1 - D
    xy[n_omega+n_upper+n_floor:, 0] = cx + np.where(left,  r*np.cos(ang), -r*np.cos(ang))
    xy[n_omega+n_upper+n_floor:, 1] = cy + r*np.sin(ang)
    return xy
```

---

## 实验结论

- **内部偏差（共同 $121\times605$ 网格，对各算例自己的 Nektar++ 快照；压力已移除一个内部均值）**：

| $\mathrm{Re}$ | 速度 (%) | 速度 RMS ($U$) | 压力 (%) | 压力 RMS ($\rho U^2$) | $\omega$ (%) | $\omega$ RMS ($U/W$) |
|---|---|---|---|---|---|---|
| 100 | 7.605 | 0.008049 | 21.887 | 0.005838 | 42.775 | 0.519629 |
| 250 | 6.711 | 0.007674 | 10.758 | 0.002498 | 41.104 | 0.510146 |
| 500 | 7.850 | 0.009541 | 8.715 | 0.002082 | 44.876 | 0.562423 |
| 1000 | 5.130 | 0.006542 | 10.673 | 0.002665 | **53.085** | 0.664919 |

- **腔底区偏差（$0.02W$ 壁面带排除）**：

| $\mathrm{Re}$ | 速度 (%) | 速度 RMS ($U$) | 压力 RMS ($\rho U^2$) | $\omega$ (%) | $\omega$ RMS ($U/W$) |
|---|---|---|---|---|---|
| 100 | 1.387 | $1.255\times10^{-10}$ | $1.033\times10^{-4}$ | 1.109 | $4.259\times10^{-10}$ |
| 250 | 2.966 | $9.133\times10^{-10}$ | $2.444\times10^{-4}$ | 2.972 | $2.915\times10^{-9}$ |
| 500 | 4.915 | $2.332\times10^{-9}$ | $5.348\times10^{-4}$ | 5.299 | $7.867\times10^{-9}$ |
| 1000 | 1.874 | $1.256\times10^{-9}$ | $7.074\times10^{-5}$ | 1.565 | $4.027\times10^{-9}$ |

  → **腔底相对速度偏差 <5%，但绝对 RMS 低至 $10^{-10}U$**——作者强调："在没有区域参考不确定度上界的情况下，这些 RMS 并不证明该弱回流的绝对精度"。

- **腔底压力分解（表 9）**：区域平均偏移 $b_f$ = $1.033\times10^{-4}$ / $2.444\times10^{-4}$ / … $\rho U^2$；扣除偏移后的**局部形状 RMS** 低至 $1.152\times10^{-10}$（$Re=100$）与 $8.709\times10^{-12}$（$Re=250$）——**全局 RMS 几乎完全由区域偏移主导**。
- **改进工作流（$Re=1000$，$161\times801$ 网格，CFD $t\simeq317$）**：内部速度偏差 **5.624% → 2.658%**；gauge 对齐压力 RMS 偏差 **$2.793\times10^{-3}$ → $1.167\times10^{-3}\rho U^2$**。
- **后处理网格诊断（隔点重算涡量）**：内部变化 CFD **1.49% / 2.87% / 4.57% / 6.71%**，PINN **8.82% / 7.99% / 11.09% / 17.54%**（$Re=100$→1000 递增）。
- **CFD 参考解敏感性（$Re=1000$，$D/W=5$，$t\simeq170$）**：多项式加密（$P=6\to8$）差异 **0.054%**；网格加密（$32\times160\to48\times240$）差异 **0.065%**；时间步减半差异 **0.000312%**；$t\simeq160\to170$ 的场变化 **0.002886%**。灵敏度算例导出场采样在 $201\times1001$ 网格上（$\Delta x=\Delta h=0.005W$），重复元素边界值取平均（速度展布为零）。
- **流动结构**：$h/W=4.5$ 处的负水平速度槽形状随 $Re$ 变化并移动；$h/W=4.98$ 处四个 CFD 场在紧贴正则化顶盖下方有不同速度与剪切剖面，**神经曲线追踪了大部分大尺度变化，但在侧壁附近有局部偏离**。

---

## 局限性

- **改进工作流的归因不清**：作者反复强调"control vs refined 衡量的是**累积工作流**（含不同初始化历史与训练代价），**不隔离区域采样的单独贡献**"；只有 control vs soft-residual 是**初始化匹配**的比较。
- **四个算例的 CFD 快照时刻不同**（$tU/W=120,160,160,317$）→ "本文比较描述的是这些保留场，**不利用其排序建立匹配时刻或渐近稳态的 $Re$ 趋势**"。要做时间评估需要每个 $Re$ 的一串后期场。
- **腔底区的"好结果"是可疑的**：绝对 RMS 低至 $10^{-10}U$ 主要意味着**该处信号本身极弱**；没有区域参考不确定度上界，**不能据此宣称弱回流被正确解析**。
- **涡量偏差高达 41%–53%，而速度偏差仅 5%–8%**——说明评估对**导数量**极度敏感；这一偏差可能部分来自后处理网格（PINN 的涡量在隔点重算下变化 8%–17.5%），但作者未把两者完全分离。
- **只有一个几何**（$D/W=5$）、一个顶盖剖面（固定 $\delta_x=\sqrt{0.001}W$）、一个"能量稳定"标度（$U=W=1$，$Re$ 以腔**宽**为参考尺度而非深度）；结论不能外推到其他 $D/W$。
- **训练预算是混杂因素**：最终阶段的名义迭代预算相同，但**累积训练历史不同**（原 $Re=250/500$ 用 262,144 点批次，其余用 131,072）。
- **"soft residual" 与 "half envelope" 的变体并未真正单因素化**：half-envelope 需要额外的 $Re=500$ 再调节（因为改 $E$ 改了物理初速度）。
- **未做稳定性评估**：这是定常 PINN 的区域精度研究；**未验证这些定常解在 $Re$ 下是否物理稳定**（作者引用 Hopf 分岔文献但明确指出 $D/W=5$ 的阈值未知）。
- **掩模区域的动量精度未单独验证**：作者自己指出"小的掩模损失本身不构成该邻域动量精度的证据"。
- **压力为独立网络输出**，其梯度用于平衡对流与扩散；作者同时指出不把 $\nabla^2p=-\left(u_x^2+2u_yv_x+v_y^2\right)$ 作为额外损失（会重复约束）。

---

## 相关工作

- [[物理信息神经网络PINN]]
- [[顶盖驱动方腔流]]
- [[深腔流动与层叠涡结构]]
- [[流函数硬约束表示]]
- [[区域化配点与残差自适应采样]]
- [[Spectral-hp有限元与Nektar++]]
- [[涡量与压力评估指标]]
- [[Reynolds数延拓与解迁移]]
- [[Moffatt角落涡与粘性层叠]]
- [[高斯正则化顶盖边界条件]]

---

## 实现建议

- **实现难度**：🟡 中偏高。核心是**硬约束表示 + 包络 + 区域采样 + SOAP/SSB 优化器**；SOAP（Shampoo 类）与 self-scaled Broyden 的实现是主要工程量。**不需要 CFD 求解器**即可训练，但**需要独立的 spectral/$hp$ 参考解**才能做本文式的分区评估。
- **预期性能**：内部速度偏差 5.1%–7.9%（改进工作流降到 2.66%）；**涡量偏差 41%–53% 是主要短板**；腔底相对速度偏差 <5% 但绝对量级 $10^{-10}U$，需谨慎解读。
- **适用场景**：
  - **深腔/长通道类几何**——顶盖驱动、底部存在弱回流的工业流动（反应器、熔池、腔体冷却）；
  - **PINN 的可信度评估协议设计**——本文的"分区 + 多观测量 + 参考解自敏感性 + 网格诊断"四件套是一套可复用的评估模板；
  - **需要区域化精度的流动**（近壁强梯度 vs 深处弱流动同时存在）。
- **落地建议**：
  1. **先复制评估协议，再谈算法**：同时报告速度、压力、涡量在**内部区**与**弱流区**的偏差；只看速度会得到过于乐观的结论（本文正是这一点）。
  2. **参考解必须做自敏感性分析**（本文的 0.054%/0.065%/0.000312% 是很好的范例），并声明评估网格与求导算子；
  3. **压力必须做 gauge 分解**（$b_f$ vs 形状 RMS）——本文显示两者相差 7 个数量级，混报会误导；
  4. **不要把弱流区的相对误差当作精度证据**——必须同时给绝对 RMS，并声明"无区域参考不确定度上界"；
  5. **区分"改变场表示"与"改变残差侧重"**：soft residual（$MR/\sqrt E$，输出包络不变）与 half envelope（改 $\kappa$）是两个不同机制，不能合并为一个"包络选项"；
  6. **跨 $Re$ 迁移时注意物理初速度会变**（改 $E$ 就改了初速度），迁移前需再调节（本文 half-envelope 案例的做法）；
  7. **若关心涡量精度，必须提高求导网格密度**——本文显示 PINN 涡量在隔点重算下变化达 17.5%，且 PINN 的导数一致性明显差于 CFD。

已传递给 @墨鱼丸。
