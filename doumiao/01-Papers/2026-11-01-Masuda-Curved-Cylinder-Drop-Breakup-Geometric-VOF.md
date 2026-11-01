---
type: paper
created: 2026-11-01
updated: 2026-11-01
tags: [paper, fluid-rendering, VOF, plicRDF, isoAdvector, AMR, drop-breakup, liquid-surface, water-rendering, curved-geometry]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.39154
---

# Numerical analysis of geometrical effect on drop deformation and breakup between rotating cylinders

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Numerical analysis of geometrical effect on drop deformation and breakup between rotating cylinders |
| **作者** | Hayato Masuda (大阪都市大学), Mitsuhiro Ohta (德岛大学), Tomislav Marić (TU Darmstadt), Dieter Bothe (TU Darmstadt) |
| **发表** | arXiv preprint (physics.flu-dyn) 2026-10-29，**18 页 / 16 图** |
| **链接** | [原文](https://arxiv.org/abs/2610.39154) |
| **DOI** | — |
| **代码** | — |
| **方法** | 几何 VOF（plicRDF 界面重构 + isoAdvector 界面输运）+ 自适应网格加密 (AMR) |

---

## 核心贡献

> **⭐ 曲面容器内的液体破碎，不能套用平面参数。** 无量纲几何曲率 $\kappa_{\mathrm F}=d/R_{\mathrm i}$ 不仅平移临界 $Re_{\mathrm{cr}}$，还**质变破碎形态**：从"对称颈部细化"变为"周向拉长 + 丝状介导破碎 + 卫星滴"。内部流动结构同步从**环流主导 (recirculation-dominated)** 转变为**拉伸主导 (elongation-dominated)**。

1. **三类几何 + 平面基准**：

| 构型 | $R_i$ [m] | $R_o$ [m] | $\kappa_{\mathrm F}=d/R_i$ | $r_0$ [m] |
|------|------|------|------|------|
| Type 1 | 0.025 | 0.038 | **0.52** | 0.03082 |
| Type 2 | 0.018 | 0.031 | **0.72** | 0.02362 |
| Type 3 | 0.0125 | 0.0255 | **1.04** | 0.01785 |
| 平面 | — | — | **0**（极限） | — |

   间隙 $d=0.013$ m，轴向高 $H=0.026$ m（周期边界），液滴初始半径 $R_d=0.0025$ m。
2. **形态质变**：
   - **平面**：相对**对称的颈部细化** → 典型 pinch-off → 两个大小相近的子滴
   - **Type 1**（$\kappa=0.52$）：**曲率诱导迁移** + 轻微非对称变形，颈部两侧不均等伸长，子滴不再对称；$Re=1.2, Ca=0.3$ 时伴生**一个小卫星滴**
   - **Type 3**（$\kappa=1.04$）：液滴沿**周向**被强烈拉伸成**新月形薄丝**，丝状区逐渐变细并**破裂成多个碎片 + 若干卫星滴**
3. **内部流动结构的转变**：
   - 平面：颈部前后有**平衡的局部环流**
   - Type 1：前部环流**消失**，速度矢量指向伸长区（拉伸主导）；后部仍保留局部环流 → **中间态**
   - Type 3：前后环流**均被抑制**，速度沿伸长方向对齐，细丝内**无明显闭合涡结构**
4. **变形率张量 $\Gamma=|\mathbf D|$ 的空间分布质变**：
   - 平面：高 $\Gamma$ 区域**关于伸长轴对称**，集中在中央颈部
   - Type 1：高 $\Gamma$ **偏向迁移方向的前部**
   - Type 3：最大 $\Gamma$ 出现在**迁移前缘尖端**，且**分布于整个丝状区**而非局部颈部
5. **临界 Reynolds 数随曲率下降**：$Re_{\mathrm{cr}}$ 随 $\kappa_{\mathrm F}$ **单调下降**（$Ca=0.2$ 与 $0.3$ 均成立）→ 曲率**促进**破碎。
6. **破碎前最大伸长长度反而随曲率上升**：在 $Re=Re_{\mathrm{cr}}$ 时，$L_a/(2R_d)$ 随 $\kappa_{\mathrm F}$ **增加** → **不能用 $Re_{\mathrm{cr}}$ 下降单独解释**拉伸增强，**破碎机制本身被改变**。
7. **无 Taylor 涡出现**（本文条件），确保了曲率效应的干净分离。

---

## 技术方案

### 核心思想

**旋转同心圆筒间的剪切流**。内外筒反向旋转、等幅壁面周向速度：$|R_i\omega_i|=|R_o\omega_o|$。

**理论周向速度分布**（Couette 型，含 $1/r$ 分量 —— 这是曲率的来源）：

$$
u_\theta(r) = \left(\frac{\omega_o R_o^2-\omega_i R_i^2}{R_o^2-R_i^2}\right) r + \frac{(\omega_i-\omega_o)R_i^2R_o^2}{R_o^2-R_i^2}\,\frac{1}{r}
$$

**局部剪切率**（注意：随半径变化，非常数）：

$$
\dot\gamma(r) = \left|\frac{d u_\theta}{dr} - \frac{u_\theta}{r}\right|
$$

液滴初始置于 $u_\theta(r_0)=0$ 的位置（驻点），代表剪切率取 $\dot\gamma_{\mathrm R}=\dot\gamma(r_0)$。

**无量纲数**：

$$
Re = \frac{\rho_s \dot\gamma_{\mathrm R} R_d^2}{\mu_s},\qquad Ca = \frac{\mu_s \dot\gamma_{\mathrm R} R_d}{\sigma}
$$

**平面基准（Renardy & Cristini 2001）**：$Re \sim 1/Ca$ —— 临界时 $Re \cdot Ca$ 近似常数。本文证实该关系在曲面下被破坏。

### 数学表述

单场形式的两相不可压 NS 方程（VOF 单场法）：

$$
\nabla \cdot \mathbf{u} = 0
$$
$$
\frac{\partial(\rho\mathbf{u})}{\partial t} + \nabla\cdot(\rho\mathbf{u}\otimes\mathbf{u}) = -\nabla p - (\mathbf{g}\cdot\mathbf{x})\nabla\rho + \nabla\cdot(2\mu\mathbf{D}) + \rho\mathbf{g} + \mathbf{f}_\Sigma
$$

表面张力用 **CSF (continuum surface force)**：

$$
\mathbf{f}_\Sigma := \sigma \kappa \mathbf{n}_\Sigma \delta_\Sigma
$$

体积分数输运（几何 VOF，控制体积分形式）：

$$
\alpha_c(t^{n+1}) = \alpha_c(t^n) - \frac{1}{|\Omega_c|}\sum_{f\in F_c} V_f^\alpha
$$

物性线性混合（本文取 $\rho_d=\rho_s$、$\mu_d=\mu_s$，粘度比 = 1）：

$$
\rho = \alpha_c \rho_d + (1-\alpha_c)\rho_s,\qquad \mu = \alpha_c\mu_d + (1-\alpha_c)\mu_s
$$

### 关键技术

| 技术 | 说明 |
|------|------|
| **plicRDF 界面重构** | 基于 Ray Tracing / 多面体求交的精确局部平面界面重构，优于代数 VOF 与简单 PLIC |
| **isoAdvector 界面输运** | 无需显式界面几何（MOU）即可输运体积分数 —— 关键：把 VOF 变成"几何 VOF" |
| **AMR 自适应网格加密** | 界面附近局部加密，保证液滴/细丝分辨率 |
| **CSF 表面张力** | 曲率 $\kappa$ 由 plicRDF 重构得到 |
| **变形率张量 $\Gamma = \|\mathbf D\|$** | 度量局部拉伸/压缩强度，用于解释破碎机制 |
| **伸长长度定义** | 曲面：$L_a = r_0 \Delta\theta_a$（周向弧长）；平面：沿长轴测量 |
| **临界 $Re$ 判定** | 以 0.1 为步长扫描 $Re$，固定 $Ca\in\{0.2,0.3\}$，取发生破碎的最小 $Re$ |

---

## 渲染落地价值 ⭐⭐⭐

| 场景 | 价值 |
|------|------|
| **曲面容器中的液体破碎** | ⭐ 直接对应：杯子/杯壁倾倒、瓶内液体摇晃、水滴撞圆柱、管道内液体破裂 |
| **plicRDF + isoAdvector 组合** | ⭐⭐ 工业级 VOF 界面处理方案，**生产级画质**的开源实现路径（OpenFOAM 系）；比传统"粒子+重建"高一个层级 |
| **AMR + VOF** | 液滴破碎的细丝与卫星滴需要极高分辨率 → AMR 是必需项而非可选项 |
| **破碎形态库** | 三档形态（对称 pinch-off / 非对称+卫星滴 / 丝状介导+多卫星滴）可作为**形态查找表** |
| **可调参数** | $\kappa_{\mathrm F}$ 是"容器曲率"的直接代理 → 美术可直觉调参："杯子越圆越容易起丝" |
| **拉伸主导 vs 环流主导** | → 破碎前视觉信号不同（拉长 vs 颈缩），可用于**破碎前兆的视觉提示** |

**关于渲染侧落地的判断**：直接用 VOF 做实时渲染成本过高，但 **plicRDF + isoAdvector + AMR** 的组合给出了**渲染级界面质量的参考上限**，且这些算法可移植到：
- 粒子液体（SPH/Flex）的**界面重构后处理**（把粒子云转成尖锐界面）
- **屏幕空间流体 (SSF)** 的尖锐化步骤（配合 SDF/PLIC 思路）

---

## 局限性

- 粘度比固定为 1（$\mu_d=\mu_s$），未覆盖乳化液真实场景
- $Ca$ 仅测试 0.2 / 0.3 两点，$Re$ 扫描步长 0.1 较粗
- 二维单液滴，未含多液滴相互作用
- 离线 DNS（VOF + AMR 成本极高）
- 无公开代码

---

## 相关工作

- [[2026-10-31-Masuda-Drop-Decomposition-Cylindrical-Curvature]] （同一作者前作：几何 VOF 框架与工具验证）
- [[2026-10-30-DAVOF-Interface-Normal-Position-VOF]]
- [[2026-10-29-PhaseSurf-Metric-Phase-Fields-Thin-Structures]]
- [[2026-06-09-Hybrid-VoF-PhaseField-Surfactant]]
- [[2026-10-26-Lanczos-Advection-Near-Orthogonal-SL-Reconstruction]]

---

## 实现建议

- **实现难度**: 🔴 高（plicRDF/isoAdvector/AMR 三件套；可退化为 PLIC + 显式几何输运）
- **预期性能**: 离线小时级；实时不可行，但**算法可移植到渲染后处理**
- **适用场景**: 曲面液体破碎的物理依据、渲染级界面锐化算法参考
- **推荐度**: ✅ 推荐（本期**最贴近渲染**的一篇）
