---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, fluid, VOF, interface-reconstruction, unstructured-mesh, curvature, capillary-flow, parasitic-currents, OpenFOAM]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2610.38863
---

# Dual Area-Volume-of-Fluid (DAVOF): co-advecting volume and face-area fractions for a closed-form, cell-local interface normal and position on unstructured meshes

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Dual Area-Volume-of-Fluid (DAVOF): co-advecting volume and face-area fractions for a closed-form, cell-local interface normal and position on unstructured meshes |
| **作者** | Tomislav Marić |
| **发表** | arXiv:2610.38863 [physics.comp-ph; math.NA; physics.flu-dyn], 2026-10-28, 45 页 9 图 18 表 |
| **链接** | [原文](https://arxiv.org/abs/2610.38863) |
| **DOI** | 10.48550/arXiv.2610.38863 |
| **代码** | [github.com/tmaric/TwoPhaseFlow](https://github.com/tmaric/TwoPhaseFlow) (branch `davof`)；[github.com/leia-openfoam/leia](https://github.com/leia-openfoam/leia) (branch `development`) |
| **篇幅** | 45 页，9 图，18 表 |

---

## 核心贡献

> 在几何 VOF 中**首次**把每个面的"浸润面积分数" $\alpha_f$ 作为**被输运的状态**与体积分数 $\alpha_k$ 同步对流输运，从而用**纯单元内（cell-local）闭式公式**一次性恢复界面的**法向与位置**——无需邻居单元、无需迭代；并由"一圈恢复法向"构造出**收敛的曲率**，在非结构多面体网格上把几何 VOF 的精度从"不收敛"提升到**二阶**，同时直接压低毛细流的寄生电流。

1. **状态扩展（Dual state）**：经典 UGVOF 每单元只存 1 个值 $\alpha_k$（体积分数），法向必须从邻域模板重建（plicRDF 用 RDF 模板迭代，LVIRA/ELVIRA 用梯度或模板极小化）；MOF 类方法存 4 个值（液体质心）但无面信息；**DAVOF 平均存 $1+F/2$ 个值**（$F$ 为面数），并用**一次闭式求和**恢复法向。
2. **恒等式一（法向）**：对单元内液体子体积 $\Omega_k^-(t)$ 应用散度定理，界面片段的面积-法向向量等于各面浸润面积向量之和的负值——**只用本单元自己的面**，无邻居数据、无迭代。
3. **恒等式二（位置）**：再次应用散度定理（对 $\mathbf{x}$），由 $\alpha_k$ 与 $\{\alpha_f\}$ 闭式给出界面平面位置。
4. **精确性与鲁棒性**：两个恒等式对**平面界面在六面体、扰动六面体、多面体单元上都是精确的**；对非平面（warped）面需改用浸润面积向量与其一阶矩（每面 6 个标量）——此时**扇形和**把法向恢复到 $10^{-13}$、位置到 $10^{-11}h$，而标量面积分数会丢失平面（法向误差 8% @ 顶点位移 $0.1h$、17% @ $0.2h$）。
5. **收敛的曲率**：对一圈邻接单元的恢复平面（质心 + 法向）拟合二次曲面，得曲率张量——**参考实现（paraboloid 拟合、PLIC 重建距离函数）在静态基准上呈零阶（即完全不收敛），而本方法收敛**（椭球上 1.55 阶，二次面状态；Detrixhe–Aslam 状态 1.31 阶）。
6. **系统性理论**：给出两个把"面分数阶数 $q$"与"恢复法向阶数"联系起来的估计，证明任何面向 VOF 界面重构都必须以 $O(h^2)$ 精度构造面分数（静态与输运皆然）。
7. **"面锚定抛物面"再生映射**：用本单元的 $F$ 个面分数拟合 6 系数二次曲面（偏移 + 两斜率 + 曲率张量），使零速度映射成为**恒等映射**——输运循环的阶数不降。

---

## 技术方案

### 核心思想

**几何 VOF 的根本困境**：PLIC 平面需要法向 $\bm{n}$ + 位置 $p$，而单元体积分数 $\alpha_k$ **不携带法向信息**。因此所有 VOF 方法都要从邻域模板重建法向：

| 方法 | 每单元存储 | 法向恢复 | 曲面网格表现 |
|------|-----------|---------|-------------|
| UGVOF (Marić et al.) | 1 | 模板重建 | 不收敛 |
| gradAlpha / isoAlpha | 1 | 模板梯度 | 不收敛（$10^{-1}$） |
| plicRDF (Scheufler & Roenby) | 1 | RDF 模板**迭代** | 不收敛（平面精确可表示却不收敛） |
| MOF 类 | 4 | 单元内恢复 | — |
| **DAVOF** | **$1+F/2$** | **一次闭式求和** | **收敛（二阶）** |

**关键观察**：VOF 方法在通量步**已经算出**每个面在新时刻的浸润部分（isoAdvector 显式算出后丢弃）。**把它留下来作为被输运的状态**，则单元各面的浸润部分与界面片段一起围成液体子体积，**散度定理立即给出界面面积向量**——这个恒等式本质上就是嵌入式边界方法（cut-cell EB）里的孔径关系（aperture relation），但此前**没有任何 VOF 方法把浸润面面积作为输运状态**，这正是恢复能够"单元内化"的原因。

**第二个关键观察**：法向恢复的精度阶数由面分数的精度阶数决定。平面界面即使位置任意，与曲面界面总差 $O(h^2)$（弦高），故给出**一阶**面分数与**一阶**法向；而 $O(h^3)$ 接近界面的曲面（如带正确曲率的抛物面）给出**二阶**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **面分数状态 $\alpha_f$** | 每面被液体浸润的面积比例；与 $\alpha_k$ 同时间步输运（isoAdvector 已计算，直接保留） |
| **散度定理法向** | $\bm{n}_{\tilde\Sigma_k}\lvert A_{\tilde\Sigma_k}\rvert = -\sum_{f\in F_k}\alpha_f\bm{S}_f$，$\bm{S}_f=\lvert S_f\rvert\bm{n}_f$ 为面面积向量 |
| **散度定理位置** | 对 $\bm{x}$ 应用散度定理：$3\lvert\Omega_k^-\rvert = \int_{\partial\Omega_k^-}\bm{x}\cdot\bm{n}\,dS$；平面上 $\bm{x}\cdot\bm{n}$ 为常数 → 由 $\alpha_k$ 与 $\{\alpha_f\}$ 解出带符号距离 $p_k$ |
| **非平面面处理** | 需用浸润面积向量 $\int_{S_f}\chi\,\bm{n}\,dS$ 及其一阶矩 $\int_{S_f}\chi(\bm{x}-\bm{x}_k)\cdot\bm{n}\,dS$；实现上把面离散为顶点扇形三角形，逐三角形求和（fan sums） |
| **一圈曲率** | 对与本单元共享点的界面单元环（point-neighbour ring），用恢复的质心 + 法向拟合 Monge 二次曲面，得曲率张量 $\kappa_1,\kappa_2$ 闭式 |
| **二次面法向（Detrixhe–Aslam）** | 对比方法：在单元内用四面体求积拟合二次曲面 |
| **面锚定抛物面** | 用本单元 $F$ 个面分数拟合 6 系数曲面（阻尼 Gauss–Newton，环张量作为阻尼先验），使零速度再生映射为恒等 |
| **再生映射 (regeneration)** | 每单元由自身状态重建裁剪面并重新切割自身面，测得新的面分数；迭代 $K$ 次等价于一个输运周期（固定 Courant 数下 $K\propto 1/h$） |
| **plicRDF / isoAdvector** | 对照方法：RDF 模板法向 + isoAdvector 通量 |
| **leia OpenFOAM 模块** | 全部数值结果由开源 leia 模块计算，研究、配置与所有表格随论文归档 |

---

## 公式

```math
\text{单元液体子体积的散度定理（法向恒等式）}:\quad
\int_{\partial\Omega_k^-}\bm{C}\cdot\bm{n}\,dS
= \int_{\Omega_k^-}\nabla\cdot\bm{C}\,dV = 0
\quad\Longrightarrow\quad
\bm{n}_{\tilde\Sigma_k}\lvert A_{\tilde\Sigma_k}\rvert
= -\sum_{f\in F_k}\alpha_f\,\bm{S}_f
```

```math
\text{位置恒等式（对 }\bm{x}\text{ 再用一次散度定理）}:\quad
3\lvert\Omega_k^-\rvert = \int_{\partial\Omega_k^-}\bm{x}\cdot\bm{n}\,dS,
\qquad
\bm{x}\cdot\bm{n}_{\tilde\Sigma_k}\ \text{在平面上为常数}
\quad\Longrightarrow\quad
p_k\ \text{由 }\alpha_k\text{ 与 }\{\alpha_f\}\text{ 闭式确定}
```

```math
\text{实现形式（面扇形和，非平面面）}:\quad
\bm{n}_{\tilde\Sigma_k}\lvert A\rvert \approx \sum_{\text{triangles }t}\ \alpha_t\,\lvert S_t\rvert\,\bm{n}_t,
\qquad
\text{每面一阶矩: }\ \int_{S_f}\chi(\bm{x}-\bm{x}_k)\cdot\bm{n}\,dS
\]

```math
\text{阶数估计（面分数阶 }q\text{ → 法向阶）}:\quad
\text{平面（任意定位）}:\ O(h^2)\ \text{偏离曲面界面}
\ \Rightarrow\ \text{一阶面分数，一阶法向};
\qquad
\text{抛物面（正确曲率）}:\ O(h^3)
\ \Rightarrow\ \textbf{二阶面分数，二阶法向}
```

```math
\text{不一致性敏感度（体积缺陷 }\delta V\text{）}:\quad
\text{位置平面位移} = \frac{3\,\delta V}{\lvert A_{\tilde\Sigma_k}\rvert}
\quad\left(\text{体积匹配定位仅 } \frac{\delta V}{\lvert A\rvert}\right)
\ \Longrightarrow\ \text{对空间维数敏感}
```

```math
\text{一圈曲率拟合的误差标度}:\quad
\text{曲率误差} \sim \frac{\sigma\sqrt{45/n}}{L^{2}}
\quad\left(L=O(h)\text{ 的样本块，}n\text{ 个样本，样本误差 }\sigma=O(h^2)\right)
\ \Longrightarrow\ \text{一阶，而非二阶}
```

```math
\text{再生映射中显式位置的失稳（每步放大 }-2\text{ 倍）}:\quad
1-3 = -2
\quad\Longrightarrow\quad
\text{输运循环必须用 }\alpha_k\text{ 定位的平面；显式位置仅作初始猜测与诊断}
```

```math
\text{面锚定抛物面的再生阶（实测）}:\quad
\text{球（精确态）}:\ 1.98,\quad
\text{球（弦态）}:\ 2.00,\quad
\text{椭球}:\ 2.09\quad(\text{两两 }2.12,\,2.18,\,2.00)
\quad\text{vs. 平面裁剪面}:\ q=1\ (0.98\sim1.01)
```

---

## 代码片段

```python
# DAVOF 核心算法骨架（概念性伪代码）
import numpy as np

class DAVOFState:
    """Dual Area-Volume-of-Fluid 状态：体积分数 + 浸润面面积分数"""
    def __init__(self, alpha_k, face_fracs, face_area_vecs):
        self.alpha_k = alpha_k          # 单元液体体积分数
        self.alpha_f = face_fracs       # 每面浸润面积分数 (F,)
        self.S = face_area_vecs         # 每面面积向量 (F,3)

    # ---- 恒等式一：单元内闭式恢复界面法向（无邻居、无迭代）----
    def recover_normal(self):
        # 平面面情形：直接用标量分数
        area_vec = (self.alpha_f[:, None] * self.S).sum(axis=0)
        A_signed = -area_vec             # 界面片段的面积向量
        n = A_signed / np.linalg.norm(A_signed)
        area = np.linalg.norm(A_signed)
        return n, area

    # ---- 恒等式二：闭式恢复界面平面位置 ----
    def recover_position(self, x_k):
        """
        3|Omega_k^-| = ∫_{∂Omega_k^-} x·n dS
        平面上 x·n 为常数 -> 由 alpha_k 与 {alpha_f} 解出带符号距离 p_k
        """
        # 体积项：3 * (alpha_k * |Omega_k|)
        # 面项：sum_f alpha_f * S_f . x_k
        vol_term = 3.0 * self.alpha_k * self.cell_volume
        face_term = (self.alpha_f[:, None] * self.S).sum(axis=0).dot(x_k)
        # |A| * (p_k) = vol_term - face_term
        n, area = self.recover_normal()
        p_k = (vol_term - face_term) / max(area, 1e-30)
        return p_k

    # ---- 非平面面：扇形和版本 ----
    def recover_normal_fan(self, face_triangles):
        """每面离散为顶点扇形三角形，逐三角形求和（更鲁棒，精确到 1e-13）"""
        area_vec = np.zeros(3)
        for tri in face_triangles:
            a_frac, area_t, n_t = tri.wetted_fraction, tri.area_vector, tri.normal
            area_vec += a_frac * area_t
        area_vec = -area_vec
        return area_vec / np.linalg.norm(area_vec), np.linalg.norm(area_vec)

    # ---- 一圈曲率：Monge 二次曲面拟合 ----
    def ring_curvature(self, ring_cells):
        """
        ring_cells: 与本单元共享点的界面单元环
        每个提供 (恢复质心, 恢复法向)；在精确法向的标架下拟合 6 系数 Monge 曲面
        """
        pts = np.array([c.centroid for c in ring_cells])
        nrm = np.array([c.normal     for c in ring_cells])
        # 建立局部标架（以中心法向为 z 轴）
        frame = build_monge_frame(pts, nrm)
        A, b = build_monge_system(pts, frame)      # 6x6 最小二乘
        coeffs = np.linalg.lstsq(A, b, rcond=None)[0]
        k1, k2 = extract_principal_curvatures(coeffs)  # 闭式
        return k1 + k2, coeffs

    # ---- 面锚定抛物面拟合（阻尼 Gauss-Newton）----
    def fit_face_anchored_paraboloid(self, ring_tensor):
        """
        残差：|S_f| 加权的（面裁剪量 - 本单元自身面分数）
        先验：环张量作为阻尼项（面通常只穿过 6 面中的 4~5 面，系统欠定）
        """
        x = init_from_face_anchored_paraboloid(self.alpha_f, self.S)
        for _ in range(max_iter):
            r = face_cut_residual(x, self.alpha_f, self.S)
            J = face_cut_jacobian(x, self.S)
            dx = damped_gauss_newton_step(J, r, prior=ring_tensor)
            x = x + dx
        return x   # (offset, slope_x, slope_y, k_xx, k_xy, k_yy)

    # ---- 再生映射：零速度极限下的状态更新 ----
    def regenerate(self):
        n, area = self.recover_normal()
        p_k = self.alpha_k_anchored_position()      # 必须用 alpha_k 定位（显式位置会失稳）
        curv = self.ring_curvature(...)
        surf = build_paraboloid(n, p_k, curv)
        return cut_faces_with_surface(surf, self.S)  # 新的 alpha_f
```

---

## 实验结论

- **静态恢复（平面）**：法向 $L_\infty$ 误差 $5\times10^{-14}$（Detrixhe–Aslam）/$1\times10^{-12}$（二次面），位置误差 $10^{-16}$ m（单元尺寸 $5\times10^{-4}$ m），$\alpha_k$ 与平面裁剪量之差、状态可实现性均在 $10^{-14}$。**同场对比：plicRDF 法向误差 $1.9\times10^{-4}$，gradAlpha 与 isoAlpha 约 $10^{-1}$**。
- **网格阶梯 $N=20,40,80,160$ × 三类网格**（六面体 / 顶点扰动六面体 / cfMesh 多面体）：两个"面"状态在所有网格、所有 $N$ 上保持舍入误差（法向 $L_2$ $10^{-14}$，最大 $3\times10^{-13}$；位置 $5\times10^{-17}$ m；曲率 $<10^{-9}$ m⁻¹）。**plicRDF 同场法向误差 $2.5\times10^{-4}$（六面体）、$5.3\times10^{-3}$（扰动）、$3.5\times10^{-3}$（多面体），最大值 $0.02/0.38/0.47$，且不收敛**；gradAlpha 与 isoAlpha 处处停在 $10^{-1}$。
- **球面/椭球**：法向阶与面分数阶同阶（球上 DA-Q 法向在扰动与多面体网格上为二阶 2.12/2.14；Detrixhe–Aslam 一阶 0.99–1.26），位置对所有状态与网格均为二阶。误差常数在多面体网格上比六面体小 3.6–5.5 倍（多面体单元面数更多，进入求和的面分数更多；点邻域环样本更多，曲率拟合阶升到 1.83 且误差减半）。
- **一圈曲率**：椭球上收敛 1.55 阶（二次面状态）/1.31 阶（Detrixhe–Aslam），$N=160$ 相对 $L_2$ 误差 $4.6\times10^{-3}$；**参考实现（paraboloid 拟合、重建距离函数）在静态基准上呈零阶——完全不收敛**。
- **合成研究（什么条件下一圈曲率能收敛）**：精确样本 → 曲率 1.15 阶（环面）/1.10（椭球），位置三阶；**每单元独立的 $h^2$ 样本误差（E1）或 4 单元相关误差（E2）→ 曲率完全不收敛**（误差约为精确曲率 RMS 的一半），位置仍二阶；**在固定物理长度上光滑的误差（E3）→ 接近二阶**（1.70/1.72，双环 1.80）。结论：**一圈曲率能否收敛，取决于样本误差在网格尺度上的光滑性，而非拟合方式本身**。
- **再生映射**：平面裁剪面 → $q=1$（符合预测）；**面锚定抛物面 → $q=2$**（球精确态 1.98、球弦态 2.00、椭球 2.09），$N=160$ 的 $L_1$ 误差比平面低 300 倍（球）与 190 倍（椭球）；owner–neighbour 失配 $O(h^2)$（面锚定）vs $O(h)$（平面）。
- **迭代（$K=500$，粗网格 $K=5000$）**：显式位置在回路中每步放大 $-2$ 倍，**10 步内爆炸**；改用 $\alpha_k$ 定位的平面 → 5000 次迭代内逐位恒定（$q=1$）；面锚定抛物面**不是不动点**（每周期一阶漂移 0.89–1.03），法向每次旋转 $O((h/R)^2)$。
- **用 $F$ 个面分数拟合 6 系数曲面**（阻尼 Gauss–Newton）：除 0.0–0.6% 界面单元外全部收敛（细网格上 0.1%），一次应用后与 500 次后 $L_1$ 误差与输入态对参考的误差**三位数字相同**，owner–neighbour 失配 $10^{-5}$–$10^{-8}$，**零速度映射成为恒等映射**。
- **输运中的球**：以平面裁剪 + 环法向输运，携带球移动 **3.3 个直径**，保持有界与守恒，面分数精度为一阶（符合裁剪律预测），达到 plicRDF 的位置与形状误差水平。
- **初步输运实现**（每单元一个抛物面）：分辨率阶梯 $N=32$–$128$ 上保持有界守恒，面分数每周期 2.8（精确法向标架）/2.1（环二次曲面法向标架）阶——**目前达到的最高阶**。

---

## 局限性

- **输运回路尚未闭合**：本文的主体是**静态恢复**与**零速度再生映射**的理论与测量；完整的输运实现只是"初步"的。方法自身承认："**回路的阶数等于喂给它的法向的阶数**"，因此"输运中二阶法向"仍是**研究目标**，第一候选是第 8 节提出的**环状态拟合**。
- **一圈曲率的阶数天花板**：理论上单环拟合在 $\sigma=O(h^2)$ 独立样本误差下**只能是零阶/不收敛**（误差 $\sigma\sqrt{45/n}/L^2$）；本文的收敛依赖于样本误差在固定物理长度上光滑这一**假设**，对真实输运中的网格尺度误差未必成立。
- **正则化长度与几何特征的冲突**：要让曲率收敛需在固定物理长度上平滑，而该长度会与几何特征竞争——文中引用的微腔实验中 $0.07/0.14$ mm 深的特征在 $33$ µm 网格上，$0.5$ mm 的平滑长度会把特征抹平。
- **非平面面需 6 个标量/面**：传输态在非平面面上要携带浸润面积向量与一阶矩，比平面情形的单一 $\alpha_f$ 大幅增加内存与带宽成本（本文的静态测试未逐面存储，而是用扇形和现场计算）。
- **体积-面分数不一致性敏感**：位置恒等式对体积缺陷 $\delta V$ 的敏感度是空间维数（3 倍），意味着若体积分数与面分数由不同的离散操作推进，位置会出现显著漂移；文中指出这正是"输运循环必须用 $\alpha_k$ 定位"的原因。
- **弦缺陷（chord defect）是 $O(h)$**：即使对精确曲面界面，平面截断量与 $\alpha_k$ 也差一个 $O(h)$ 的弦高；文中强调这是几何 VOF 的固有结构，不是本方法引入的。
- **算例规模偏小**：验证算例是球与椭球（解析可验证），未见复杂几何/复杂拓扑（如液滴碰撞、破碎）的系统性测试。
- **与商业软件的对标有限**：文中以 OpenFOAM 几何 VOF 库内的 plicRDF/gradAlpha/isoAlpha 为对照，未与 Basilisk / Palabos / SU2 的界面处理横向比较。

---

## 相关工作

- [[几何VOF方法]]
- [[PLIC界面重构]]
- [[plicRDF与isoAdvector]]
- [[moment-of-fluid-MOF方法]]
- [[毛细流寄生电流]]
- [[界面曲率计算与正则化]]
- [[非结构网格数值方法]]
- [[嵌入式边界方法孔径关系]]
- [[OpenFOAM两相流模块leia]]
- [[弦高缺陷与可实现性缺陷]]

---

## 实现建议

- **实现难度**：🔴 高。核心（法向/位置闭式恢复）本身不难，但**完整输运回路**（面分数的对流输运、面锚定抛物面的重建、owner–neighbour 一致性）需要重构整个 VOF 通量步；非平面面处理还要引入每面 6 标量的状态。
- **预期性能**：静态恢复接近舍入误差（$10^{-13}$ 量级），远优于 plicRDF 的 $10^{-4}$–$10^{-3}$；但**输运回路的阶数当前仍是一阶**，与 plicRDF 的精度提升需靠更好的面分数更新策略（面锚定 + 环状态拟合）才能兑现。
- **适用场景**：
  - **毛细流/表面张力主导的多相流**——本文动机来自 Nagel 等的微腔填充研究：寄生电流曾迫使人为增大黏度 10 倍并使最低 $Ca$ 不可模拟；
  - **非结构多面体网格上的两相流**（STL 几何、复杂管路、芯片微流道）——这正是 Cartesian 网格 PLIC 退化最严重、梯度类方法完全不收敛的场景；
  - **对界面几何精度要求高的多相流后处理**（液滴破碎形态、界面面积统计、界面张力力源精度）。
- **落地建议**：
  1. **优先在非结构网格上试点**——Cartesian 网格上 plicRDF 已是二阶，DAVOF 的增益主要在多面体网格；
  2. **分两步落地**：先实现"静态恢复 + 一圈曲率"（收益明确、无需重写输运），再攻输运回路；
  3. **务必先做再生映射的阶数测量**（论文第 6 节的方法），因为"回路阶数 = 输入法向阶数"意味着如果法向只有一阶，整个方法白做；
  4. **内存预算是首要工程约束**：平面面每单元 $1+F/2$ 个值；非平面面每面 6 标量，需要评估是否值得；
  5. **直接复用作者的 leia OpenFOAM 模块与 TwoPhaseFlow 分支**，可省去大量验证工作。

已传递给 @墨鱼丸。
