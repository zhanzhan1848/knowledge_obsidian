---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, fluid-rendering, gas-kinetics, hypersonic-flow, boundary-layer, receptivity, ugks, cfd, physics-flu-dyn]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2611.13727
---

# Kinetic Non-Equilibrium Receptivity Analysis of Hypersonic Flows via a Complex Linearized Unified Gas-Kinetic Scheme

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Kinetic Non-Equilibrium Receptivity Analysis of Hypersonic Flows via a Complex Linearized Unified Gas-Kinetic Scheme |
| **作者** | Yue Zhang, Caihong Su, Chao Li, Kun Xu — **Chinese Academy of Sciences / USTC** |
| **发表** | arXiv preprint (physics.flu-dyn, physics.comp-ph), 2026-11-10 |
| **链接** | [arXiv:2611.13727](https://arxiv.org/abs/2611.13727) |
| **DOI** | — |
| **代码** | 摘要未声明 |
| **分类** | 气体动理学 / 高超声速 / 边界层稳定性 / 数值格式 |

---

## 核心贡献

> **近空间稀薄区让 Navier–Stokes 的稳定性/感受性分析失效**（速度滑移、温度跳变、非平衡输运）。本工作用 **CLUGKS（复线性化统一气体动理学格式）**——**无需混合耦合**地**内在捕捉**动理学激波结构、壁面滑移、温度跳变与非傅里叶热流——并给出**精确的复数线性化稳定性分析框架**。

1. **问题：Navier–Stokes 在近空间退化**
   - 近空间（near-space）区间，**前缘激波附近与壁面附近出现局部稀薄 (local rarefaction)**；
   - 由于**速度滑移、温度跳变、非平衡输运**，基于 NS 的稳定性与感受性分析**退化**。

2. **方法：CLUGKS**
   - **UGKS (Unified Gas-Kinetic Scheme)** 提供**跨连续介质到稀薄区的多尺度动理学描述**；
   - 在其上构建**复线性化 UGKS (CLUGKS)**：
     - 在**时谐假设 (time-harmonic assumption)** 下，对离散 UGKS 残差做**一阶摄动**，且用**复振幅 (complex amplitudes)**；
     - 把**扰动方程转化为稳态椭圆系统 (steady elliptic system)**；
     - 用**伪时间推进 (pseudo-time marching) + LU-SGS 加速**求解。

3. **关键优势：无需混合耦合**
   - **动理学激波结构、壁面滑移、温度跳变、非傅里叶热流被内在捕捉**，**不需要 hybrid coupling**。

4. **验证（3 个基准）**
   - 等温壁面处的**驻波 (standing acoustic wave)**；
   - **Mach 2 正激波**与斜入射声波的相互作用；
   - **高超声速钝楔 (blunt wedge)** 的自由来流声学感受性。

5. **应用结果（氩气钝楔，等效高度 40 km 与 50 km）**
   - **40 km**：UGKS 与 NS 的**壁面响应**在**周期与相位上吻合良好**；但 UGKS 中**壁面滑移维持了弱正的空间增长率**（下游）。
   - **50 km**：稀薄加剧 → 产生**动理学温度前驱 (temperature precursor)** 与**增厚、合并的激波层**；
     - **壁压响应仍接近**，但**温度与热流扰动出现显著偏差**。

6. **结论**：**中等稀薄下连续介质模型能捕捉主导的壁压特征；但在更高高度，解析激波处的动理学非平衡（尤其其热学足迹）至关重要**。

---

## 技术方案

### 核心思想

**复线性化 (complex linearization)** 的技术路线：
- 稳定性分析需要：$e^{\lambda t}$ 的模 $|\lambda| < 0$ 判稳；
- 把 $e^{\lambda t}$ 替换为 $e^{i\omega t}$（$\lambda \to i\omega$）→ 扰动变成**复值**；
- 于是"特征值问题"变成**稳态椭圆 PDE** → 可以直接用现有 CFD 求解器求解 → 极其高效。

**UGKS 的多尺度特性**保证同一套格式同时覆盖连续介质与稀薄区。

### 关键技术

| 技术 | 说明 |
|------|------|
| **UGKS** | 统一气体动理学格式：连续-稀薄多尺度统一 |
| **Complex linearization** | 特征值问题 → 稳态复值椭圆问题 |
| **Pseudo-time marching + LU-SGS** | 椭圆系统的直接求解（无需求特征值） |
| **Wall slip / temperature jump** | 动理学边界效应，内在出现 |
| **Non-Fourier heat flux** | 非傅里叶热流（稀薄区有限输运时间） |
| **Kinetic temperature precursor** | 高稀薄时的温度前驱 |

---

## 公式

```math
% 复线性化：特征值 λ → iω，扰动写成复值
\frac{\partial \hat{f}}{\partial t} = i\omega\,\hat{f},
\qquad \hat{f} = \hat{f}_r + i\,\hat{f}_i

% 一阶摄动后的稳态椭圆系统
\frac{\partial}{\partial x}\Big(\mathcal{A}\,\frac{\partial \hat{f}}{\partial x}\Big) + i\omega\,\hat{f} = 0

% 壁面滑移与温度跳变（动理学边界层）
u_w^{\text{wall}} = u_w^{\text{slip}}(Kn),\qquad
T_w^{\text{wall}} = T_w^{\text{jump}}(Kn)

% Knudsen 数（稀薄程度）
Kn = \frac{\lambda_{\text{mfp}}}{L}
```

---

## 代码片段

```python
# 概念伪代码：CLUGKS 复线性化稳定性分析
def clugks_receptivity(config, freq, mode="blunt_wedge", p_amb=None):
    """复线性化：特征值问题 → 稳态椭圆系统 → pseudo-time marching + LU-SGS。"""
    # 1) 时谐假设：λ -> iω，扰动场为复值
    omega = 2 * np.pi * freq
    f_hat = zeros_like_complex(config.grid)

    # 2) 伪时间推进求解复值椭圆系统（LU-SGS 加速）
    for it in range(config.max_iters):
        # UGKS 一阶摄动残差（复值）
        resid = ugks_linearized_residual(f_hat, omega, config)
        # 伪时间推进 + LU-SGS 加速（每个子步做一次预条件求解）
        dphi = lusgs_solve(resid, config)
        f_hat += dphi * config.dt_pseudo
        if residual_norm(resid) < config.tol:
            break

    # 3) 壁面响应提取（壁压 / 壁温 / 热流）
    wall = extract_wall_response(f_hat, config)
    # 4) 感受性：把壁响应与外扰动联系起来
    return receptivity(wall, config)
```

---

## 实验结论

- **基准/算例**：
  - 等温壁面驻波；
  - **Mach 2 正激波 + 斜入射声波**；
  - **高超声速钝楔**自由来流声学感受性；
  - **氩气钝楔，等效高度 40 km 与 50 km**；
- **基线**：**Navier–Stokes**（壁面响应对比）；
- **结果**：
  - **40 km**：UGKS 与 NS 的壁面响应在**周期与相位**上吻合良好；UGKS 中壁面滑移维持**弱正空间增长率**（下游）；
  - **50 km**：稀薄加剧 → **动理学温度前驱** + **增厚合并的激波层**；**壁压响应仍接近**，但**温度与热流扰动显著偏差**；
  - 结论：**中等稀薄下连续介质模型可捕捉主导壁压特征；更高高度必须解析激波处的动理学非平衡（尤其热学足迹）**。

---

## 局限性

- **高超声速/稀薄气体**，与常规火焰/烟雾渲染的**燃烧气体（稠密、含化学）** 场景差距大；
- **复线性化**只给出**中性稳定性/感受性**（$\mathrm{Re}\,\lambda = 0$），**不能直接给出增长率**；
- 需解**复值椭圆系统** → 数值上比实数场贵；
- 摘要未声明代码；
- 论文偏基础流体力学。

---

## 相关工作

- [[2026-11-08-HGKS-Compact-ALE-Gas-Kinetic-Unstructured-Mesh]] — 气体动理学（非结构网格，同属该方向）
- [[2026-11-11-Stewart-Menke-Egya-Conservative-Darcy-Brinkman-Stokes-DBS2]] — 守恒形式离散（方法论同源）
- [[2026-11-05-Zhang-Ren-FastVEM-Fluid-Simulation]] — 求解器层
- [[2026-11-05-Zhang-Cai-Huang-Ren-GauSmoke-Hybrid-Physics-Optical-Gaussian-Splatting]] — 火焰/烟雾渲染

---

## 实现建议

- **实现难度**：🔴 高（需 UGKS + 复线性化 + LU-SGS）
- **预期性能**：离线；复值场求解成本约为实值的 2×
- **适用场景**：
  - ✅ **渲染方向**：**高空/稀薄火焰与等离子体的热学足迹**（"温度前驱"现象对发光/黑体色的空间分布有直接影响）——这是本工作对渲染**最可迁移的洞察**
  - ✅ **"复线性化"这一通用技术**：把任何稳定性问题转成稳态椭圆问题 → 可用于**燃烧不稳定性的实时监控**
  - ✅ **方法论**：非平衡输运何时必须显式建模的判据
  - ⚠️ 稠密燃烧气体（常规 VFX 火焰）收益有限 ⚠️
  - ❌ 常规实时渲染管线
