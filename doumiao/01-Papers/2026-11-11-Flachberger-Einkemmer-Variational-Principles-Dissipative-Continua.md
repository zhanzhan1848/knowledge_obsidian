---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, fluid-rendering, variational-principles, thermodynamics, dissipative-systems, navier-stokes, cfd, physics-flu-dyn]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2611.12045
---

# Variational principles for dissipative continua: transport theorems, inertia, and the minimum-maximum duality

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Variational principles for dissipative continua: transport theorems, inertia, and the minimum-maximum duality |
| **作者** | Wolfgang Flachberger, Lukas Einkemmer — **University of Vienna** |
| **发表** | arXiv preprint (physics.flu-dyn, math-ph), 2026-11-09；**22 页 / 2 图** |
| **链接** | [arXiv:2611.12045](https://arxiv.org/abs/2611.12045) |
| **DOI** | — |
| **代码** | 摘要未声明 |
| **分类** | 变分原理 / 耗散连续介质 / 热力学 / NS 方程 |

---

## 核心贡献

> **耗散过程的变分原理分两族：非平衡定态的"最小原理"（Helmholtz/Kirchhoff/Prigogine）与连续介质弛豫的"最大原理"（Ziegler/Hackl/Fischer）。本工作证明：二者的区别由"regime"决定——闭系统的**冻结态弛豫**（最大耗散）vs 开系统的**受驱动定态**（最小耗散）——而底层的 **Rayleighian 泛函在两种情形下都是凸的且都被最小化**。这就是所谓"**最小-最大对偶**"。

1. **问题：文献中两族原理被割裂**
   - **最小原理族**（非平衡定态）：Helmholtz、Kirchhoff、Prigogine；
   - **最大原理族**（连续介质弛豫）：Ziegler、Hackl、Fischer；
   - 此前对扩散情形的区分刚刚被厘清（作者指出这一点），但**更一般的联系**尚未建立。

2. **核心论断：极值性由 regime 决定，而非由泛函决定**
   - **regime = 冻结态下的弛豫**（闭系统）→ **最大耗散 (maximum dissipation)**；
   - **regime = 受驱动的定态**（开系统）→ **最小耗散 (minimum dissipation)**；
   - **关键：底层 Rayleighian 泛函在两种情形下都是凸的，且都被最小化**。

3. **对"惯性"争议的处理**
   - 近期有论断认为**惯性超出了 Rayleighian 原理的适用范围**；
   - 本工作表明：带惯性时**变分过程中必须固定驱动力 (driving force)**，这比无惯性情形（驱动力是状态函数）**不那么优雅**；
   - 但**把能量率写成"率 × 驱动力"**仍能得到正确方程；
   - 且**只要冻结的力不依赖于被变分的率**，极值性陈述依然成立。

4. **应用**
   - 该框架**直接适用于非定常 Stokes 流 (unsteady Stokes flow)**；
   - 对 **Navier–Stokes 流**，需要**变换到物质坐标 (material coordinates)**——此时粒子加速度是状态的二阶时间导数，且**对流项（Euler 描述下非变分的）在该形式下不再出现**。

5. **测试**：在 **Stokes → 非定常 Stokes → Navier–Stokes** 的复杂度递增序列上验证，外加**耗散拉格朗日力学**。

---

## 技术方案

### 核心思想

**Rayleighian 泛函**：
$$R(\dot{x}) = \tfrac{1}{2}\,(\dot{x}, A\,\dot{x}) - (b, \dot{x})$$
其在 $\dot{x}$ 上最小 → 得到 Euler–Lagrange 方程。

**关键问题**：这个泛函是"最小"的，为什么还有"最大原理"？

**本工作的答案**：**极值性的方向取决于物理 regime，而非泛函本身**：
- 受驱动的定态（open system, driven steady state）→ $\dot{x}$ 的最小化 → **最小耗散**；
- 冻结态下的弛豫（closed system, relaxation at frozen state）→ 表现为**最大耗散**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Rayleighian functional** | 凸泛函，两种 regime 下均最小化 |
| **Reynolds transport theorem** | 固定连续体元的能量率（固定态 vs 冻结态的关键） |
| **Minimum–maximum duality** | 最小/最大两族原理的统一解释 |
| **Inertia handling** | 变分时固定驱动力；"率 × 驱动力"的能量率写法 |
| **Material coordinates** | 把 NS 的对流项移出 Euler 形式 → 恢复变分结构 |
| **Unsteady Stokes flow** | 无需坐标变换即适用 |
| **Dissipative Lagrangian mechanics** | 另一族测试对象 |

---

## 公式

```math
% Rayleighian 泛函（凸）
R(\dot{x}) = \tfrac{1}{2}\langle \dot{x}, A\,\dot{x}\rangle - \langle b, \dot{x}\rangle,
\qquad A \succ 0
\quad\Rightarrow\quad \min_{\dot{x}} R

% Euler–Lagrange → 运动方程
A\,\ddot{x} + \partial_x V = b,
\qquad
\frac{\partial R}{\partial \dot{x}} = 0 \iff A\dot{x} = b

% 能量率 = 率 × 驱动力（带惯性时变分须固定驱动力）
\dot{E} = \langle \dot{x}, b\rangle,
\qquad \text{（变分时 } b \text{ 固定 → 极值性成立）}

% 物质坐标下的 Navier–Stokes（对流项消失）
x = X(a,t),\quad \mathbf{u} = \dot{X}(a,t),
\qquad
\rho\,\ddot{X} = \nabla\cdot\sigma - \rho\,\phi\,\mathbf{u}
\quad\text{（Euler 形式的对流项不出现）}
```

---

## 代码片段

```python
# 概念伪代码：Rayleighian 变分与两种 regime
def rayleighian(xdot, A, b):
    """凸泛函：两种 regime 下都是最小化目标。"""
    return 0.5 * xdot @ A @ xdot - b @ xdot

def solve_equilibrium(x, A, b, regime):
    """regime: 'driven_steady' (open) | 'relaxation' (closed, frozen state)"""
    if regime == "driven_steady":
        # 最小耗散：min R  →  A xdot = b
        xdot = np.linalg.solve(A, b)
    else:
        # 最大耗散：冻结态弛豫，驱动力固定 → 同样 min R，但驱动力由当前状态冻结
        b_frozen = b(x)                       # 冻结驱动力
        xdot = np.linalg.solve(A, b_frozen)
        # 极值性陈述成立的前提：冻结力不依赖于被变分的率
    return integrate_motion(x, xdot)

def ns_in_material_coordinates(X, a, sigma, phi):
    """NS 变到物质坐标：对流项消失 → 恢复变分结构。"""
    Xddot = laplacian_stress(sigma, X) / rho - phi * Xdot
    return Xddot
```

---

## 实验结论

- **测试对象**：**Stokes → 非定常 Stokes → Navier–Stokes**（复杂度递增序列）；**耗散拉格朗日力学**；
- **基线**：既有最小原理族（Helmholtz/Kirchhoff/Prigogine）与最大原理族（Ziegler/Hackl/Fischer）；
- **结果**：
  - 证明**极值性由 regime 决定**（冻结态弛豫 = 最大耗散；受驱动定态 = 最小耗散）；
  - **Rayleighian 泛函在两种 regime 下均凸且均被最小化** → 建立"**最小-最大对偶**"；
  - 澄清了**惯性争议**：驱动力须冻结，但"率 × 驱动力"的写法仍给出正确方程；
  - **非定常 Stokes 流直接适用**；**NS 需变到物质坐标**（对流项消失，粒子加速度为二阶时间导数）。

---

## 局限性

- **理论论文**（22 页 / 2 图），无渲染或数值实验；
- "最小-最大对偶"的适用范围限于**线性/凸 Rayleighian**情形（框架本身预设凸性）；
- NS 的适用需要**物质坐标变换**，实践中对复杂几何/移动边界不总是方便；
- 摘要未声明代码。

---

## 相关工作

- [[2026-11-11-Shu-Huang-Chen-Same-Physics-Different-Gradients]] — 可微模拟的伴随方法理论
- [[2026-11-11-Liu-Hydrograd-Shallow-Water-Differentiable-Model]] — 可微模拟实例
- [[2026-11-11-Barman-Ray-Hankel-Neural-Operator]] — 算子学习
- [[2026-11-08-HGKS-Compact-ALE-Gas-Kinetic-Unstructured-Mesh]] — ALE（物质坐标/移动网格相关）
- [[2026-11-11-Bonart-Amortized-Transport-Map-Wetting-Inverse-Problem]] — 逆问题

---

## 实现建议

- **实现难度**：🟡 中（理论 + 数值验证；无大型实现）
- **预期性能**：无性能主张
- **适用场景**：
  - ✅ **理解求解器里"能量耗散"从哪来** → 有助于设计**物理合理的能量耗散模型**（着色器中的耗散项、稳定性分析）
  - ✅ **为可微求解器写伴随方程**时的理论依据（能量率 = 率 × 驱动力）
  - ✅ **非定常 Stokes 流**（低 Re 水流、粘性主导）的变分原理依据
  - ⚠️ 物质坐标变换的实用性 ⚠️
  - ❌ 直接的渲染算法来源
