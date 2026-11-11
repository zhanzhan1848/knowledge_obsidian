---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, fluid-rendering, drop-impact, multiphase-flow, lubrication-theory, coalescence, bouncing, physics-flu-dyn]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2611.07942
---

# Bouncing or Merging in Drop-Bath Impacts

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Bouncing or Merging in Drop-Bath Impacts |
| **作者** | Peter Lewin-Jones, Daniel M. Harris, Radu Cimpeanu, Duncan A. Lockerby, James E. Sprittles — **University of Cambridge / TU Delft** |
| **发表** | arXiv preprint (physics.flu-dyn), 2026-11-05；**45 页 / 19 图**；**投稿 Journal of Fluid Mechanics** |
| **链接** | [arXiv:2611.07942](https://arxiv.org/abs/2611.07942) |
| **DOI** | — |
| **代码** | 摘要未声明 |
| **分类** | 液滴撞击 / 多相流 / 润滑理论 / 表面力 |

---

## 核心贡献

> **液滴撞击液池后是"弹开"还是"合并"，取决于夹在液滴与液池之间的极薄气膜是否破裂**。本工作用**带显著曲率的润滑理论描述**该气膜、放进**有限元框架**、并纳入**范德华分离压**与**依赖气体平均自由程的气体动理学效应**——**仅用独立测量的材料参数**，首次与实验**定量吻合**了区分弹跳/合并的**临界撞击速度**。

1. **物理图景**
   - 液滴撞击液面 → **液池表面变形**，在液滴与液池之间**困住一层薄气膜**；
   - 之后液滴要么**从液池弹开 (bounce)**，要么**气膜破裂 → 与液池合并 (merge)**。

2. **模型的关键要素**
   - **润滑理论 (lubrication)** 描述**变形中的被困气膜**，且**计入其显著曲率**（这是与朴素模型的本质区别）；
   - **有限元框架 (finite-element)**；
   - **微观/纳米尺度物理**：
     - **范德华驱动的分离压 (van der Waals-driven disjoining pressure)**；
     - **气体动理学效应**，依赖气体的**平均自由程 (mean free path)**。

3. **核心成果**
   - **仅用独立测量的材料参数**，获得与实验**首次定量一致**的**临界撞击速度**（区分弹跳 vs 合并）。

4. **延伸研究**
   - 研究**低环境气压**下的液滴-液池撞击行为；
   - 撞击**浅液池 (shallow bath)** 与**薄膜 (thin film)** 时的弹跳-合并阈值；
   - 发现随**液池深度减小**会出现 **bounce–merge–bounce–merge 的转变 (bounce-merge-bounce-merge transition)**。

---

## 技术方案

### 核心思想

这是一个**跨尺度问题**：
- 宏观：液滴与液池的形变（流体动力学）；
- 微观：被困气膜的破裂（分子尺度：范德华力 + 平均自由程）。

气膜能否承受住，是**唯一的仲裁者** → 所以必须把**分子尺度效应**带进来，否则无法定量。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Lubrication theory with curvature** | 薄膜润滑理论 + 显著曲率修正（关键） |
| **Finite element framework** | 弱形式数值求解 |
| **Disjoining pressure (van der Waals)** | 范德华分离压 → 薄膜破裂判据 |
| **Gas-kinetic effects (mean free path)** | Knudsen 数相关的气体动理学修正 → 低气压行为 |
| **Critical impact velocity** | 区分弹跳/合并的阈值（定量匹配实验） |
| **Bounce-merge transition with bath depth** | 随深度减小的多次转变 |

---

## 公式

```math
% 薄膜润滑（薄膜厚度 h 远小于特征长度 L）
\partial_t h = -\nabla\cdot\left(\frac{h^3}{12\mu}\,\nabla p_{\text{film}}\right) + \text{(曲率项)}

% 分离压（范德华）
\Pi(h) = -\frac{A}{6\pi h^3}\quad\ (A = \text{Hamaker 常数})

% Knudsen 数 → 气体动理学修正（Maxwell/Eppinger）
Kn = \frac{\lambda_{\text{mfp}}}{h},
\qquad
\text{气体动理学修正} \;\Rightarrow\; \text{有效粘性/渗透率随 } Kn \text{ 变化}

% 合并判据：气膜厚度降至破裂阈值
h_{\text{rupture}} \sim h(\Pi) \ \text{(由分离压与气体动理学决定)}
\quad\Rightarrow\quad
\begin{cases}
\text{bounce} & \text{if } h > h_{\text{rupture}} \ \text{at impact}\\
\text{merge}  & \text{otherwise}
\end{cases}
```

---

## 代码片段

```python
# 概念伪代码：液滴-液池撞击的薄膜润滑 + 破裂判据
def simulate_drop_bath_impact(R, V, mu_l, rho_l, gamma, p_amb, bath_depth):
    """返回 'bounce' / 'merge' 及临界速度扫描。"""

    def gas_kinetic_viscosity(h):
        """Knudsen 修正：平均自由程 λ_mfp 依赖环境压强。"""
        lam = k_B * T / (np.sqrt(2) * np.pi * sigma**2 * p_amb)
        Kn = lam / h
        return mu_g * f_Maxwell(Kn)          # Maxwell/Eppinger 修正

    def film_pressure(h, curvature):
        """薄膜压力 = 润滑项 + 分离压 + 曲率项。"""
        p_lub = laplacian(h**3 * curvature) / (12 * mu_l)
        p_disj = -A / (6 * np.pi * h**3)      # 范德华分离压
        return p_lub + p_disj

    # 时间推进被困气膜 → 记录最小厚度
    h = init_film(R, V)
    while impact_in_progress(h):
        h = evolve_thin_film(h, film_pressure, gas_kinetic_viscosity)
    h_min = h.min()

    # 破裂判据：膜厚度低于由分离压/气体动理学决定的阈值
    h_crit = rupture_threshold(gamma, p_amb, A, mu_g)
    return ("bounce" if h_min > h_crit else "merge"), h_min

def critical_velocity(**kw):
    """二分搜索区分 bounce/merge 的临界撞击速度（与实验定量吻合）。"""
    lo, hi = 0.1, 10.0
    for _ in range(40):
        mid = 0.5 * (lo + hi)
        if simulate_drop_bath_impact(V=mid, **kw)[0] == "bounce":
            lo = mid
        else:
            hi = mid
    return 0.5 * (lo + hi)
```

---

## 实验结论

- **算例**：液滴-液池撞击；理论驱动的对照实验；
- **基线**：实验测量（临界撞击速度）；
- **结果**：
  - **仅用独立测量的材料参数**，首次与实验**定量吻合**的**临界撞击速度**；
  - 研究了**低环境气压**下的行为；
  - **浅液池 / 薄膜**情形的弹跳-合并阈值；
  - **随液池深度减小，出现 bounce–merge–bounce–merge 转变**。

---

## 局限性

- **需要薄膜破裂的微观判据**（范德华 + 平均自由程）→ 参数多，且破裂本身有随机性（摘要未提统计处理）；
- **二维/轴对称假设**（摘要未明确，但有限元框架通常如此）；
- 论文为 **45 页 JFM 投稿**，属长文、细节在正文；
- 依赖**独立测量**的材料参数 → 实验成本高；
- 摘要未声明代码。

---

## 相关工作

- [[2026-11-11-Mishra-Pal-Singular-Jet-Drop-Impact-Crater-Collapse]] — 液滴撞击的射流侧（相图）
- [[2026-10-31-Masuda-Drop-Decomposition-Cylindrical-Curvature]] — 液滴破碎
- [[2026-10-19-SplashSplat-Multi-View-Liquid-Reconstruction]] — 飞溅重建
- [[2026-11-05-Zhang-Cai-Huang-Ren-GauSmoke-Hybrid-Physics-Optical-Gaussian-Splatting]] — 液体渲染

---

## 实现建议

- **实现难度**：🔴 高（薄膜润滑 + 分子尺度参数 + 破裂判据）
- **预期性能**：离线；可给出**临界撞击速度**的定量预测
- **适用场景**：
  - ✅ **液滴撞击特效的物理判据**："弹开 vs 合并"在视觉上完全不同（分离 vs 融合）——本工作给出**可查询的判据**而不用试错
  - ✅ **低气压环境**（高空/太空）下的液滴行为
  - ✅ **浅水/薄膜撞击**（水花、涟漪）的边缘情形
  - ⚠️ 作为实时渲染的逐帧求解 ❌
  - ❌ 无表面活性剂/高粘度的复杂液体
