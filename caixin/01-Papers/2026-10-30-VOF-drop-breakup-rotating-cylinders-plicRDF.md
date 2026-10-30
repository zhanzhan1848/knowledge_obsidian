---
type: paper
created: 2026-10-30
updated: 2026-10-30
tags: [paper, fluid, CFD, VOF, multiphase, drop-breakup, interface-capturing, AMR]
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
| **作者** | Hayato Masuda, Mitsuhiro Ohta, Tomislav Marić, Dieter Bothe (TU Darmstadt) |
| **发表** | arXiv:2610.39154 [physics.flu-dyn], 2026-10-29 |
| **链接** | [原文](https://arxiv.org/abs/2610.39154) |
| **DOI** | - |
| **代码** | - |
| **篇幅** | 18 pages, 16 figures |

---

## 核心贡献

> 首次量化**几何曲率 κ_F** 对剪切流中液滴变形与破裂过程（不只是破裂阈值）的影响，揭示平面剪切与曲面剪切下完全不同的破裂形态学。

1. 采用几何 VOF（plicRDF 界面重构 + isoAdvector 界面输运）+ 自适应网格加密 (AMR)，在**同 Re/Ca** 下对比三种圆弧几何与平面剪切。
2. 发现：平面系统中液滴**对称颈缩**；曲面系统中液滴**非对称变形 + 显著周向拉伸**；高曲率下形成细长丝并碎裂出**多个卫星液滴**。
3. 临界破裂雷诺数 `Re_cr` 随 κ_F **增大而降低**，而破裂前最大无量纲伸长长度**随 κ_F 增大而增加**。
4. 通过内部速度场与变形率张量模，解析区分了对应不同破裂行为的流动/变形结构。

---

## 技术方案

### 核心思想

"几何曲率"作为一个此前被忽略的**几何效应变量**被独立提取出来。研究的核心设计是**控制变量法**：固定 Re 与 Ca，仅扫描无量纲几何曲率 κ_F，从而把几何效应与常规流动参数解耦。

κ_F 的物理含义：曲面剪切场相对于平面对剪场的非均匀性——同一 ω 下，曲面附近流体经历更强的**局部剪切集中**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **几何 VOF** | plicRDF 界面重构 + isoAdvector 界面输运（作者组自研，界面捕获精度高） |
| **AMR 自适应网格** | 破裂区局部加密，捕捉细丝与卫星滴 |
| **曲率参数化** | 无量纲几何曲率 κ_F 系统扫描，三种圆形几何 + 平面参考 |
| **变形率张量分析** | 通过 D 矩阵模量解析识别变形机制（对称颈缩 vs 非对称拉伸） |
| **内部速度场剖析** | 揭示液滴内部流结构差异 |
| **破裂阈值提取** | Re_cr 与破裂前最大伸长长度作为两个独立量化指标 |

---

## 公式

```math
\text{无量纲几何曲率:}\quad
\kappa_{\mathrm{F}} = \frac{R_{\text{curvature}}}{H}\;\text{(几何尺度比)}
```

```math
\text{控制方程（不可压两相）:}\quad
\nabla\cdot\mathbf{u} = 0,\qquad
\rho\left(\frac{\partial \mathbf{u}}{\partial t}+\mathbf{u}\cdot\nabla\mathbf{u}\right)
= -\nabla p + \nabla\cdot\left(\mu(\mathbf{u})(\nabla\mathbf{u}+\nabla\mathbf{u}^{\mathsf T})\right)
+ \mathbf{f}_{\sigma}\delta_{\Gamma}
```

```math
\text{表面张力（CSF / 曲率驱动）:}\quad
\mathbf{f}_{\sigma} = \sigma\,\kappa\,\mathbf{n}\,\delta_{\Gamma}
```

```math
\text{变形率张量:}\quad
\mathbf{D} = \tfrac{1}{2}\left(\nabla\mathbf{u}+\nabla\mathbf{u}^{\mathsf T}\right),
\qquad |\mathbf{D}| = \text{变形率量级}
```

```math
\text{无量纲伸长长度（破裂前）:}\quad
L_{\max}^{*} = \frac{L_{\max}}{D_0}\Big|_{Re=Re_{\mathrm{cr}}}
```

---

## 代码片段

```text
# 数值流程（概念性）
# 1) 几何：三种 κ_F 的同轴反向旋转圆柱（couette-like 剪切）
#    + 平面剪切参考工况
# 2) 求解器
#    - 界面捕获：plicRDF 重构 + isoAdvector 输运
#    - AMR：按界面距离/曲率细化
#    - 表面张力：曲率驱动的体积力（CSF 类）
# 3) 扫描
for kappa_F in [0.0, k1, k2, k3]:
    for Ca in [...]:
        Re_cr = bisect_search(lambda Re: breakup_detected(run(Re, kappa_F, Ca)))
        L_max = max_extension_before_breakup(run(Re_cr, kappa_F, Ca))
```

---

## 实验结论

- **数据集/算例**：同轴反向旋转圆柱间的液滴 (drop)，三种圆弧几何 vs 平面剪切；固定 Re、Ca 对比。
- **基线**：平面剪切系统作为几何无关的参考基准。
- **结果**：
  - **形态学差异**：平面 → 相对对称颈缩 (symmetric neck thinning)；曲面 → 非对称变形 + 明显周向伸长 (azimuthal elongation)。
  - **高曲率**：液滴形成细丝后碎裂，产生**多个卫星液滴**。
  - `Re_cr` 随 κ_F **下降**；而 `Re = Re_cr` 时破裂前最大无量纲伸长长度**随 κ_F 上升**。
  - 内部速度场与 |D| 显示出与各破裂模式对应的不同流动/变形结构。

---

## 局限性

- 仅 2D?（几何为圆柱对，圆柱几何暗示准 2D 间隙流动）——文中未明确声明 3D 扩展。
- 参数扫描为**单因素**（κ_F × Ca），未覆盖 We 数（惯性/表面张力比）的影响。
- 破裂判据依赖 AMR 分辨率，存在分辨率依赖性。
- 曲率参数 κ_F 的具体定义依赖作者几何构造，可迁移性受限。

---

## 相关工作

- [[2026-10-30-DAVOF-dual-area-volume-of-fluid-interface-normal]]
- [[plicRDF]]
- [[isoAdvector]]
- [[液滴破裂]]
- [[变形率张量]]
- [[自适应网格加密]]
- [[毛细破碎]]

---

## 实现建议

- **实现难度**：🟡 中。几何 VOF + AMR 属成熟技术栈，难点在 κ_F 的几何构造与参数化，以及破裂判据的自动化。
- **预期性能**：每个工况需多组网格收敛验证 + 参数扫描，成本高（估计每工况 $O(10^4)$ 时间步量级）；AMR 使有效自由度可控。
- **适用场景**：**非平面剪切**中的多相流破裂——微流控剪切、卷绕涂层、旋转设备间隙；也直接支撑"几何效应必须纳入 CFD 建模"的方法论主张。
- **落地建议**：可将该"几何曲率 κ_F"作为几何 VOF 类问题的新增扫描维度加入既有参数化框架；本文给出的 `Re_cr(κ_F)` 趋势可作为验证基准曲线。

已传递给 @墨鱼丸。
