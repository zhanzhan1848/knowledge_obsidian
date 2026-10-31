---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, fluid, drop-breakup, VOF, multiphase-flow, capillary-number, rotating-cylinders, Curvature-effects, OpenFOAM]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2610.39154
---

# Numerical analysis of geometrical effect on drop deformation and breakup between rotating cylinders

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Numerical analysis of geometrical effect on drop deformation and breakup between rotating cylinders |
| **作者** | Hayato Masuda（大阪都市大学）、Mitsuhiro Ohta（德岛大学）、Tomislav Marić（TU Darmstadt）、Dieter Bothe（TU Darmstadt） |
| **发表** | arXiv:2610.39154 [physics.flu-dyn], 2026-10-29 |
| **链接** | [原文](https://arxiv.org/abs/2610.39154) |
| **DOI** | 10.48550/arXiv.2610.39154 |
| **代码** | 基于 TwoPhaseFlow 项目分支（interFlow 求解器，OpenFOAM v2312） |
| **计算资源** | TU Darmstadt Lichtenberg 高性能计算集群 |
| **备注** | 论文声明使用了 ChatGPT-5.5 改善可读性（作者已复核） |

---

## 核心贡献

> 在**同心反向旋转圆柱间的剪切流**中，系统研究**几何曲率**对液滴变形与破碎的影响：发现曲率不仅**降低临界破碎雷诺数 $Re_{\text{cr}}$**，而且**根本改变破碎机制本身**——从平面的"对称颈部收缩二分裂"变为"曲率诱导迁移 + 周向拉伸主导"的丝状破碎（伴多卫星滴）；并定义无量纲几何曲率 $\kappa_{\mathrm{F}}=d/R_{\mathrm{i}}$ 作为控制参数。

1. **首次系统研究流线曲率对牛顿液滴破碎的影响**：以往临界破碎条件（$Re\cdot Ca\approx$ const，Renardy & Cristini 2001）几乎全部基于**平面剪切**（无曲率流线）；Dressler et al. (2008) 只研究了聚合物共混物中的液滴，未澄清曲率本身的作用。
2. **几何曲率 $\kappa_{\mathrm{F}}=d/R_{\mathrm{i}}$**：三种同心几何——Type 1 $(R_i,R_o)=(0.025,0.038)$ m → $\kappa_{\mathrm{F}}=0.52$；Type 2 $(0.018,0.031)$ → $0.72$；Type 3 $(0.0125,0.0255)$ → $1.04$；平面情形为 $\kappa_{\mathrm{F}}=0$。隙宽 $d=0.013$ m 与高度 $H=0.026$ m 固定，通过改变圆柱半径改变曲率。
3. **曲率诱导的方位角迁移**：尽管内、外圆柱壁面切向速度大小相等（$|R_i\omega_i|=|R_o\omega_o|$），但方位角速度剖面 $\propto 1/r$ 的非线性使液滴**内侧壁面的局部速度大于外侧**，液滴因此**向内圆柱旋转方向迁移**——这是曲率效应的根源。
4. **破碎形貌的定性转变**（$Re=1.2$，$Ca=0.3$）：
   - **平面**：倾斜长椭球 → 中央区域形成颈部 → 近乎**对称的二分裂**；
   - **Type 1**：不对称变形，颈部两侧伸长不均，产生一个**小卫星滴**；
   - **Type 3**：沿周向**强烈拉伸成扁平新月状**，形成细丝状区 → 破裂成多个碎片 + 若干卫星滴。
5. **内部流动结构的转变**：由"颈部两侧对称回流环"（平面）→ 前部回流消失、后部保留（Type 1）→ 整体被周向拉伸流取代、无闭合涡结构（Type 3）。无量纲变形率张量幅值 $\Gamma=\sqrt{2\mathbf{D}:\mathbf{D}}/\dot\gamma_{\mathrm{R}}$ 的最大值位置也从"颈部"移到"迁移液滴的前端尖端"（Type 3）。
6. **临界破碎雷诺数随曲率下降**：$Ca=0.2$ 与 $0.3$ 下 $Re_{\text{cr}}$ 均随 $\kappa_{\mathrm{F}}$ 增大而下降（$Re$ 步长 0.1 扫描）；$Ca$ 越低（表面张力相对越强）$Re_{\text{cr}}$ 越高，与已有结论一致。
7. **临界条件下的最大伸长长度反而随曲率增大**：$L^{*}_{\max}$（破碎前一瞬的最大无量纲伸长长度）在 $Ca=0.2$ 与 $0.3$ 下均随 $\kappa_{\mathrm{F}}$ 增大。**这证明曲率增强伸长不能仅用"$Re_{\text{cr}}$ 下降导致更接近阈值"来解释**——曲率同时改变了破碎前的变形过程。
8. **伸长速率的量化差异**：破碎前伸长长度随时间近似线性增长，斜率为**平面 0.44 → Type 1 1.28 → Type 2 1.96 → Type 3 4.8**——曲率不仅影响伸长**幅度**，还影响**速率**。

---

## 技术方案

### 核心思想

**背景**：剪切流中的液滴变形与破碎对乳化、液-液萃取、雾化、烹饪等过程至关重要；破碎后的液滴尺寸与分布直接决定乳状液稳定性与比表面积。此前临界条件（$Re\cdot Ca\approx$ const）几乎都在平面剪切下建立，但**实际剪切流常有曲率**（Janssen et al. 1994 指出半径足够大时才近似为平面剪切）。

**关键物理**：同心反向旋转圆柱间的方位角速度剖面为

$$u_\theta = \frac{\omega_o R_o^2 - \omega_i R_i^2}{R_o^2 - R_i^2}\,r + \frac{(\omega_i-\omega_o)R_i^2 R_o^2}{R_o^2 - R_i^2}\,\frac1r$$

对**有限尺寸**的液滴，内侧壁面（靠近 $R_i$）的局部速度大于外侧 → 液滴质心偏离初始零点并**向内圆柱方向迁移**。同时局部剪切率 $\dot\gamma(r)=\lvert du_\theta/dr - u_\theta/r\rvert$ 随径向位置变化（平面情形则空间均匀），且液滴与内圆柱的初始间隙随曲率增大而减小。这三者（流线曲率、剪切率非均匀、壁面邻近）共同导致**不对称变形与周向伸长**。

**参考位置的选择**：液滴初始置于 $u_\theta(r_0)=0$ 的半径 $r_0$ 处（Type 1: $r_0=0.03082$ m；Type 2: $0.02362$ m；Type 3: $0.01785$ m），代表剪切率取 $\dot\gamma_{\mathrm{R}}=\dot\gamma(r_0)$。

### 关键技术

| 技术 | 说明 |
|------|------|
| **几何 VOF** | plicRDF（Scheufler & Roenby 2019）界面重构 + isoAdvector（Roenby et al. 2016）界面输运 |
| **CSF 表面张力力** | $\bm{f}_\Sigma=\sigma\kappa\bm{n}_\Sigma\delta_\Sigma$（Brackbill et al. 1992） |
| **单场两相流 (single-field)** | 密度与黏度按体积分数线性混合；$\rho_d=\rho_s$，$\mu_d=\mu_s$（本构简化） |
| **两级 AMR** | 基础网格 $\Delta x^{\ell=0}$ + 界面加密层 $\ell=1$ |
| **求解器** | interFlow（TwoPhaseFlow 分支），OpenFOAM v2312，二阶格式 |
| **网格无关性检验** | Type 1、$Re=1.0$、$Ca=0.3$：三档基础网格（$\ell=0$: $R_d/4$、$R_d/8$、$R_d/10$），最细单元 $R_d/8$、$R_d/16$、$R_d/20$；初始单元数 252,800 / 2,022,400 / 4,283,136 |
| **代码验证** | 平面剪切下与 Li et al. (2000)（VOF）与 Ohta et al. (2025)（CLSVOF）对比 Taylor 变形参数 |
| **Taylor 变形参数** | $D=(L_d-B_d)/(L_d+B_d)$，$D=0$ 为未变形球，$D\to1$ 为接近破碎 |
| **伸长长度 $L_a$** | 圆弧几何：$L_a=r_0\Delta\theta_a$（$\Delta\theta_a$ 为前后尖端夹角，由重构界面算出）；平面：取长轴长度；无量纲化用 $2R_d$ |
| **内部速度分析** | $\bm{u}_{\text{rel}}=\bm{u}_l-\langle\bm u\rangle_d$（相对液滴平均平动速度） |
| **变形率张量幅值** | $\sqrt{2\mathbf{D}:\mathbf{D}}$，$\mathbf{D}=\tfrac12(\nabla\bm u+(\nabla\bm u)^T)$，归一化为 $\Gamma$ |
| **临界 $Re$ 判定** | $Re$ 以 0.1 步长扫描，$Re_{\text{cr}}$ = 扫描范围内**观察到破碎的最低 $Re$**（分辨率 0.1） |

---

## 公式

```math
\text{同心反向旋转圆柱的方位角速度剖面}:\quad
u_\theta(r) =
\frac{\omega_o R_o^2 - \omega_i R_i^2}{R_o^2 - R_i^2}\,r
+\frac{(\omega_i - \omega_o)R_i^2 R_o^2}{R_o^2 - R_i^2}\,\frac{1}{r}
```

```math
\text{局部剪切率（圆几何）与参考剪切率}:\quad
\dot\gamma(r) = \left|\frac{du_\theta}{dr} - \frac{u_\theta}{r}\right|,
\qquad
\dot\gamma_{\mathrm{R}} = \dot\gamma(r_0)\ \text{（} r_0 \text{ 处 } u_\theta=0\text{）}
\]
```math
\text{圆几何中 } \dot\gamma(r)/\dot\gamma_{\mathrm{R}} = (r_0/r)^2 \quad\text{（平面中为空间均匀）}
```

```math
\text{雷诺数与毛细数（基于初始液滴半径 } R_d\text{）}:\quad
Re = \frac{\rho_s \dot\gamma_{\mathrm{R}} R_d^2}{\mu_s},
\qquad
Ca = \frac{\mu_s \dot\gamma_{\mathrm{R}} R_d}{\sigma}
```

```math
\text{无量纲几何曲率}:\quad
\kappa_{\mathrm{F}} = \frac{d}{R_i}
\qquad
\begin{cases}
\text{Type 1}: 0.52\\ \text{Type 2}: 0.72\\ \text{Type 3}: 1.04\\ \text{平面}: 0
\end{cases}
```

```math
\text{单场两相流的连续性与动量方程}:\quad
\begin{cases}
\nabla\cdot\bm u = 0\\[2pt]
\dfrac{\partial(\rho\bm u)}{\partial t} + \nabla\cdot(\rho\bm u\otimes\bm u)
= -\nabla p - (\bm g\cdot\bm x)\nabla\rho
+ \nabla\cdot(2\mu\bm D) + \rho\bm g + \bm f_\Sigma
\end{cases}
\qquad
\rho = \alpha_c\rho_d+(1-\alpha_c)\rho_s,\quad
\mu = \alpha_c\mu_d+(1-\alpha_c)\mu_s
```

```math
\text{CSF 表面张力}:\quad
\bm f_\Sigma = \sigma\,\kappa\,\bm n_\Sigma\,\delta_\Sigma
```

```math
\text{体积分数输运（几何 VOF 的基础）}:\quad
\alpha_c(t^{n+1}) = \alpha_c(t^n) - \frac{1}{|\Omega_c|}\sum_{f\in F_c} V_f^\alpha
```

```math
\text{Taylor 变形参数}:\quad
D = \frac{L_d - B_d}{L_d + B_d}
\qquad (D=0:\ \text{球};\ \ D\to1:\ \text{接近破碎})
```

```math
\text{伸长长度（圆几何）}:\quad
L_a = r_0\,\Delta\theta_a,
\qquad
\varGamma = \frac{\sqrt{2\bm D:\bm D}}{\dot\gamma_{\mathrm{R}}}
```

```math
\text{平面剪切的既有临界关系（本文作为对比基准）}:\quad
Re \sim \frac{1}{Ca}
\qquad\Longleftrightarrow\qquad
Re\cdot Ca \approx \text{const}\ \text{（临界条件下）}
```

```math
\text{曲率导致的三重效应}:\quad
\begin{cases}
\text{① 流线曲率} & \Rightarrow \text{方位角速度剖面非线性} \Rightarrow \text{内/外侧速度失衡}\\
\text{② 剪切率非均匀} & \Rightarrow \dot\gamma(r)/\dot\gamma_{\mathrm{R}}=(r_0/r)^2\\
\text{③ 壁面邻近} & \Rightarrow \text{液滴与内圆柱的初始间隙随 } \kappa_{\mathrm{F}}\text{ 减小}
\end{cases}
\quad\Longrightarrow\quad
\text{不对称变形 + 周向伸长}
```

---

## 代码片段

```python
# 旋转圆柱间液滴变形与破碎：概念性伪代码
import numpy as np

def circular_couette_velocity(r, wi, wo, Ri, Ro):
    """同心反向旋转圆柱的方位角速度剖面（Eq.2）"""
    A = (wo*Ro**2 - wi*Ri**2) / (Ro**2 - Ri**2)
    B = (wi - wo)*Ri**2*Ro**2 / (Ro**2 - Ri**2)
    return A*r + B/r

def zero_velocity_radius(wi, wo, Ri, Ro):
    """求 u_theta(r0)=0 的半径（液滴初始放置位置）"""
    A = (wo*Ro**2 - wi*Ri**2) / (Ro**2 - Ri**2)
    B = (wi - wo)*Ri**2*Ro**2 / (Ro**2 - Ri**2)
    # A*r + B/r = 0 -> r0 = sqrt(-B/A)（取物理根）
    return np.sqrt(-B/A) if (A*B) < 0 else None

def local_shear_rate(r, wi, wo, Ri, Ro):
    """|du_theta/dr - u_theta/r|"""
    A = (wo*Ro**2 - wi*Ri**2) / (Ro**2 - Ri**2)
    B = (wi - wo)*Ri**2*Ro**2 / (Ro**2 - Ri**2)
    return abs(A - B/r**2)

def representative_shear_rate(r0, wi, wo, Ri, Ro):
    return local_shear_rate(r0, wi, wo, Ri, Ro)

def taylor_deformation(centroid, interface_points):
    """D = (L_d - B_d)/(L_d + B_d)，由重构界面的主轴得到"""
    Ld, Bd = principal_axes(interface_points)
    return (Ld - Bd) / (Ld + Bd)

def azimuthal_elongation_length(interface_points, r0):
    """L_a = r0 * Δθ_a（前后尖端夹角）"""
    dtheta = angle_between_tips(interface_points)
    return r0 * dtheta

def rate_of_deformation_magnitude(u_grad, gamma_R):
    """Γ = sqrt(2 D:D) / γ_R，D = (∇u + (∇u)^T)/2"""
    D = 0.5 * (u_grad + u_grad.T)
    return np.sqrt(2.0 * np.einsum('ij,ij->', D, D)) / gamma_R

def simulate_drop_breakup(geometry, Re, Ca, sigma, steps=5000):
    """
    geometry: (Ri, Ro, d, H, kappa_F, r0)
    求解器：interFlow / OpenFOAM v2312
    界面：plicRDF 重构 + isoAdvector 输运
    网格：两级 AMR，基础 Δx = R_d/8，界面层 Δx = R_d/16
    """
    Ri, Ro, d, H, kF, r0 = geometry
    mesh = build_annular_mesh(Ri, Ro, d, H, Rd=0.0025)
    amr = two_level_amr(base_dx=Rd/8, refined_dx=Rd/16, region="interface")
    solver = InterFlowSolver(mesh, amr, sigma=sigma, order=2)

    # 壁面速度大小相等 -> 反向旋转
    wi, wo = solve_angular_velocities_for_Re_Ca(Re, Ca, r0, Ri, Ro)
    u = solver.initialize_with_couette_profile(circular_couette_velocity, wi, wo, Ri, Ro)
    drop = place_sphere_at(R=0.0025, r=r0)

    hist = {"D": [], "La": [], "Gamma_max": [], "u_rel": [], "breakup": False}
    for n in range(steps):
        u = solver.step(u, dt=adaptive_cfl())
        iface = solver.reconstruct_interface(plicRDF)
        for _ in range(2):                      # isoAdvector 多步输运
            iface = isoAdvector_advect(iface, u)
        alpha = solver.update_volume_fractions(iface)

        D_taylor = taylor_deformation(drop.centroid, iface.points)
        La = azimuthal_elongation_length(iface.points, r0)
        Gamma = rate_of_deformation_magnitude(drop.velocity_gradient, gamma_R)
        hist["D"].append(D_taylor); hist["La"].append(La); hist["Gamma_max"].append(Gamma.max())

        # 破碎检测：界面拓扑断裂 / 出现卫星滴
        if detect_breakup(iface, drop):
            hist["breakup"] = True
            break
    return hist


def find_critical_Re(geometry, Ca, sigma, Re_min=0.1, Re_max=2.0, dRe=0.1):
    """Re 以 0.1 步长扫描，Re_cr = 观察到破碎的最低 Re（分辨率 0.1）"""
    Re = Re_min
    while Re <= Re_max:
        h = simulate_drop_breakup(geometry, Re, Ca, sigma)
        if h["breakup"]:
            return Re
        Re += dRe
    return None
```

---

## 实验结论

- **代码验证（平面剪切）**：域尺寸 $L=8R_d$、$W=4R_d$、$H=8R_d$，与 Li et al. (2000) 与 Ohta et al. (2025) 相同；上下板速度 $\pm U$，$\dot\gamma_{\mathrm{R}}=2U/H$；两级 AMR（$\ell=0$: $R_d/8$，$\ell=1$: $R_d/16$）。Taylor 变形参数对比：

| $Re$ | 本文 | Li et al. (2000) | Ohta et al. (2025) |
|-------|------|-----------------|--------------------|
| 0.1 | 0.389 | 0.3968 | 0.3960 |
| 0.5 | 0.450 | 0.453 | 0.4570 |
| 0.6 | 0.4721 | 0.4768 | 0.458 |
| 0.75 | **破碎** | **破碎** | **破碎** |

- **网格无关性（Type 1，$Re=1.0$，$Ca=0.3$）**：最粗网格（$R_d/8$）的变形参数趋于近常值**且不破碎**；两个较细网格（$R_d/16$、$R_d/20$）均预测破碎，但破碎时刻不同（$t\dot\gamma_{\mathrm{R}}=54.12$ 与 $73.50$）→ **定量预测对网格分辨率仍然敏感**。综合定性一致性与算力，选最细 $R_d/16$。
- **破碎形貌（$Re=1.2$，$Ca=0.3$）**：平面为近对称二分裂；Type 1 为不对称 + 一个小卫星滴；Type 3 为强周向拉伸成新月状细丝 → 碎裂为多个碎片与若干卫星滴。**平面高 $Re$ 下的丝状破碎（Renardy & Cristini 2001b；Jeong & Lee 2026）在 Type 3 以相同名义 $Re$/$Ca$ 出现 → 曲率通过迁移与前后不对称促进伸长，而非通过增加名义惯性。**
- **内部流动结构**：平面为颈部两侧对称回流环；Type 1 前部回流消失（速度矢量指向伸长部分），后部保留局部回流；Type 3 整体被周向拉伸流取代，细丝区无闭合涡结构。
- **变形率分布 $\Gamma$**：平面大值近对称分布且最大值在颈部；Type 1 大值在尖端与颈部但偏向迁移前方；Type 3 **最大值在前端尖端**而非中央颈部，且整个细丝区均有较大 $\Gamma$。
- **伸长长度演化（$Re=1.2$，$Ca=0.3$）**：伸长长度随时间**近似线性**增长，斜率 **平面 0.44 / Type 1 1.28 / Type 2 1.96 / Type 3 4.8**（无量纲伸长长度 vs 无量纲时间）。
- **临界条件（$Ca=0.2$ 与 $0.3$，$Re$ 步长 0.1）**：$Re_{\text{cr}}$ 在所有几何下均**随 $\kappa_{\mathrm{F}}$ 增大而下降**；$Ca=0.2$ 时 $Re_{\text{cr}}$ 高于 $Ca=0.3$（表面张力相对更强，需更大惯性）。示例：Type 1、$Ca=0.3$ 时 $Re_{\text{cr}}=0.9$（$Re=0.8$ 时伸长长度停在约 1.8 不破碎）。
- **临界条件下的最大伸长**：$L^{*}_{\max}$ 在 $Ca=0.2$ 时大于 $Ca=0.3$（因 $Ca=0.2$ 需更高 $Re_{\text{cr}}$），且**在两个 $Ca$ 下均随 $\kappa_{\mathrm{F}}$ 增大**。→ **曲率对伸长的影响不能仅由 $Re_{\text{cr}}$ 下降解释**。

---

## 局限性

- **密度比与黏度比均为 1**：$\rho_d=\rho_s$、$\mu_d=\mu_s$ 是明确的简化。真实乳液中黏度比对破碎条件影响显著（Komrakova et al. 2015 用 LBM 证明临界 $Ca$ 随黏度比增大而下降），因此本文的临界 $Re$ 数值的**普适性受限**。
- **仅等幅反向旋转**：$|R_i\omega_i|=|R_o\omega_o|$。单圆柱旋转、或其他转速配比（会改变零速半径位置与流型）未研究，作者列为未来工作。
- **壁面条件与 Taylor 涡**：文中注明"在本文计算条件下未观察到 Taylor 涡"，但轴向（顶部/底部）为周期边界——**这与实际有限长圆柱（进出口）不同**，可能影响长波非定常模态。
- **$Re_{\text{cr}}$ 的分辨率仅 0.1**：这是较粗的扫描步长，$Re_{\text{cr}}$ 与 $\kappa_{\mathrm{F}}$ 的定量关系因此只能视为趋势而非精确曲线；且 $Re_{\text{cr}}$ 本身对网格分辨率敏感（同一 $Re=1.0$ 算例的破碎时刻在 $R_d/16$ 与 $R_d/20$ 下相差 36%）。
- **液滴尺度假设**：液滴相对隙宽很小（$R_d=0.0025$ m vs $d=0.013$ m）；但 Type 3 的 $\kappa_{\mathrm{F}}=1.04$ 已使液滴与内圆柱间隙很小，此时**壁面邻近效应与液滴尺寸效应难以分离**，而作者把两者一并归为"曲率效应"。
- **未做局部力平衡与界面应力时空演化的深入分析**：作者自己指出"需要进一步的局部力平衡与界面应力时空演化研究来阐明机理"。
- **只涉及单液滴**：未研究多液滴相互作用或破碎后的液滴尺寸分布（后者对过程设计最关键）。
- **未与专门的曲率剪切流理论（如管道弯曲流中的液滴破碎）对比**，也未与 Dressler et al. (2008) 的聚合物共混物结果直接对照。

---

## 相关工作

- [[体积流体VOF方法]]
- [[液滴变形与破碎]]
- [[Taylor变形参数]]
- [[毛细数与雷诺数]]
- [[plicRDF与isoAdvector]]
- [[旋转圆柱间的Couette流]]
- [[多相流中的界面曲率与表面张力]]
- [[自适应网格加密AMR]]
- [[乳化与液液萃取过程]]

---

## 实现建议

- **实现难度**：🟢 中。可直接使用 OpenFOAM v2312 + TwoPhaseFlow（interFlow）分支；本文的贡献在于**问题设置与几何参数化**（$\kappa_{\mathrm{F}}=d/R_i$、零速半径放置、伸长长度定义），而非新算法。
- **预期性能**：单算例成本中等（三维 VOF + 两级 AMR，最细 $R_d/16$，Type 1 基础网格约 202 万单元）。**网格收敛是主要瓶颈**：破碎时刻对分辨率高度敏感，$Re_{\text{cr}}$ 的扫描（每种几何 × 2 个 $Ca$ × 约 20 个 $Re$ 值）算例量大。
- **适用场景**：
  - **弯道/环形通道内的液液两相流**（换热器、管道弯头、微反应器）——曲率对液滴尺寸分布的影响直接关系到过程设计；
  - **离心机、旋转填充床、环形间隙设备**中的液滴破碎；
  - **乳液制备工艺**——需要预测临界破碎条件以控制液滴尺寸；
  - 作为**曲率效应的基准案例**（$Re\cdot Ca\approx$ const 的平面关系需要修正）。
- **落地建议**：
  1. **复现时先做平面验证**（本文表 2 给了明确基准：$Re=0.1/0.5/0.6$ 的 Taylor 变形参数与 $Re=0.75$ 的破碎），确认代码与网格设置一致后再进入圆几何；
  2. **网格至少做到最细 $R_d/16$**，且**报告破碎时刻随分辨率的变化**（本文的 $R_d/16$ vs $R_d/20$ 差异很大），否则 $Re_{\text{cr}}$ 的定量曲线不可信；
  3. **$Re_{\text{cr}}$ 的扫描步长建议细化到 0.05 或用二分法**（本文的 0.1 分辨率只够看趋势）；
  4. **不要只用 Taylor 变形参数 $D$ 描述圆几何**：高曲率下液滴形状严重偏离椭球，$D$ 无法表征周向伸长，**必须同时报告 $L_a/(2R_d)$**；
  5. **先做单圆柱旋转的对照组**（零速半径位置与流型完全不同），以分离"曲率"与"旋转配置"两个因素；
  6. **黏度比至少加一个非 1 的算例**（如 $\mu_d/\mu_s=0.1$ 与 10），因为它与曲率会耦合影响临界条件。

已传递给 @墨鱼丸。
