---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, bluff-body-wake, dns, particle-image-velocimetry, dataset, phase-averaged]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2611.09632
---

# Turbulent wakes behind nine bluff bodies from direct numerical simulation and particle image velocimetry

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Turbulent wakes behind nine bluff bodies from direct numerical simulation and particle image velocimetry |
| **作者** | Zhen Zhang, Theo Käufer, Louise Ronglan, Michael S. Triantafyllou, George Em Karniadakis |
| **发表** | arXiv preprint (physics.flu-dyn), 2026-11-06（13 页，8 图） |
| **链接** | [arXiv:2611.09632](https://arxiv.org/abs/2611.09632) |
| **DOI** | — |
| **代码** | 摘要未声明（数据集存放位置未在摘要中给出） |
| **分类** | 绕流尾迹 / DNS 与 PIV 数据集 |

---

## 核心贡献

> **一句话点题：在 Re = 10,000 下，用壁面分辨率 DNS + 拖曳水池 PIV 对**九种钝体几何**做了交叉验证，产出一套包含时间/展向平均场、升力相位平均场与瞬时三维快照的公共基准数据集。**

1. 覆盖**九种钝体（bluff body）**：圆柱、2:1 椭圆圆柱（0° 与 90°）、短/长等腰三角形（**尖端朝上游或朝下游**两种）、方柱（0° 与 45°）。
2. 每种几何均做了两套实验：
   - **壁面分辨率直接数值模拟（DNS）**，使用**谱元（spectral-element）求解器**；
   - **时间分辨的平面 PIV**，在 **MIT Intelligent Towing Tank（智能拖曳水池）** 中进行。
3. DNS 记录内容：时间平均与展向平均的**速度、压力、雷诺应力**，**以升力信号为键的 24 分箱相位平均场**，**阻力与升力历史**，以及**每种物体一个三维瞬时快照**；PIV 记录在同一坐标系下匹配的**时间平均与相位平均场**。
4. **验证链**：DNS 设置先在 **Re = 3900** 的参考圆柱数据上做验证，再在 Re = 10,000 下把 DNS 与 PIV **逐场对比**。
5. 数据集面向**数据驱动的湍流闭合（closure）、降阶模型（ROM）与尾迹稳定性分析**三类应用。

---

## 技术方案

### 核心思想

钝体绕流是流体力学中经典的几何敏感问题：圆柱、椭圆、三角形、方柱在**分离点位置、分离泡结构、卡门涡街的相位与频谱**上差异显著，而这些差异直接决定了尾迹的相干结构与不稳定模态。工程上却常常只对圆柱有可靠数据，导致几何相关的湍流模型难以验证。

本文的思路是**"同一几何、两种手段、互相校验"**：

- **DNS** 提供完整的三维瞬时场与所有派生统计量（雷诺应力、相位平均场、积分量时间史），代价高但信息完整；采用**谱元求解器**（如 NekRS 类）以在 Re = 10,000 下实现壁面分辨率——这对钝体绕流是相当高的要求。
- **PIV** 提供真实实验中的平面速度场与时间分辨统计，验证 DNS 的可信度并提供实验环境的对照；MIT 智能拖曳水池是固定模型、可控来流的经典设施。

关键的**相位平均**采用**升力信号作为相位参考**（24 个等相位分箱），这与常见的"以周期时间归一化"不同：它把尾迹的**相位锁定到升力信号的极值/过零点**上，从而让九种几何之间可以按物理相位对齐比较，即使它们的涡脱落频率各不相同。

**九种几何的选择也刻意覆盖了不同的分离行为**：椭圆与方柱通过不同的朝向（0°/90°、0°/45°）改变分离点位置与不对称性；三角形则通过**尖端朝上游还是朝下游**产生本质不同的分离与尾迹结构（同向 vs 逆向的钝体尾迹）。

### 关键技术

| 技术 | 说明 |
|------|------|
| 壁面分辨率 DNS | Re = 10,000 下解析壁面粘性层 |
| 谱元求解器 | 高阶空间离散，适合高 Re 钝体绕流 |
| 时间分辨平面 PIV | MIT Intelligent Towing Tank，粒子图像测速 |
| 展向平均 | 去除展向不均匀性，得到准二维统计场 |
| 以升力为键的相位平均 | 24 个相位分箱，实现跨几何的相位对齐 |
| 阻力/升力时间史 | 相位参考信号与目标量 |
| 三维瞬时快照 | 每个物体一个全三维瞬时流场样本 |
| Re = 3900 参考圆柱验证 | DNS 设置的验证步骤 |
| DNS–PIV 逐场对比 | Re = 10,000 下交叉校验 |
| 跨几何尾迹稳定性分析 | 应用方向之一 |

---

## 公式

钝体绕流的相位平均（以升力为相位参考，示意）：

```math
\overline{u_i}(\phi, x, r)
\;=\; \frac{1}{N_\phi}\sum_{k=1}^{N_\phi} u_i\big(t_k(\phi), x, r\big),
\qquad
t_k(\phi) = \inf\{t : C_L(t) = C_L^{\text{ref}}(\phi)\}
```

其中 $C_L$ 为升力系数，$\phi \in [0,2\pi)$ 为归一化相位。

展向平均（示意）：

```math
\overline{u_i}^{\,z}(x,r)
\;=\; \frac{1}{L_z}\int_{z_0}^{z_0+L_z} u_i(x,y,z,r)\,dz
```

雷诺应力与壁面应力（示意）：

```math
\overline{u_i' u_j'} = \overline{u_i u_j} - \overline{u_i}\,\overline{u_j},
\qquad
\tau_w = \mu \left.\frac{\partial \overline{u_\theta}}{\partial r}\right|_{r=R}
\]

尾迹稳定性分析中的相位敏感模态（示意）：

```math
\frac{d}{dt}\begin{bmatrix}\hat{u}(t)\\ \hat{p}(t)\end{bmatrix}
= \mathbf{A}\,\begin{bmatrix}\hat{u}(t)\\ \hat{p}(t)\end{bmatrix},
\qquad
\lambda = \sigma \pm i\,\omega_d
```

> 上述公式为依据摘要术语（相位平均、展向平均、雷诺应力、拖曳/升力、相位稳定分析）写出的示意性表达；摘要未给出论文中的具体方程与无量纲化定义。

---

## 代码片段

```python
# 概念性伪代码：相位平均、展向平均与拖曳/升力统计
import numpy as np

GEOMETRIES = [
    "cylinder", "ellipse_2to1_0deg", "ellipse_2to1_90deg",
    "triangle_short_upstream", "triangle_short_downstream",
    "triangle_long_upstream", "triangle_long_downstream",
    "square_0deg", "square_45deg",
]


def spanwise_average(u, z0, Lz):
    """展向平均：沿 z 方向积分归一化。"""
    z_mask = (z0 <= z) & (z < z0 + Lz)
    return np.trapezoid(u[..., z_mask], axis=-1) / Lz


def phase_average(field, CL, n_bins=24, ref="max"):
    """以升力信号为键的 24 分箱相位平均。"""
    if ref == "max":
        edges = np.linspace(CL.min(), CL.max(), n_bins + 1)
        centers = 0.5 * (edges[:-1] + edges[1:])
        idx = np.clip(np.digitize(CL, edges) - 1, 0, n_bins - 1)
    else:  # "zero_cross"
        s = np.sign(CL)
        cross = np.where(np.diff(s) != 0)[0]
        edges = np.interp(np.arange(n_bins + 1), np.linspace(0, len(cross), n_bins + 1),
                          cross).astype(int)
        idx = np.zeros(len(CL), dtype=int)
        for b in range(n_bins):
            lo, hi = edges[b], edges[b + 1]
            idx[lo:hi] = b
        centers = 0.5 * (edges[:-1] + edges[1:])
    out = np.zeros((n_bins,) + field.shape[1:])
    for b in range(n_bins):
        sel = field[idx == b]
        out[b] = sel.mean(axis=0) if len(sel) else np.nan
    return out, centers


def reynolds_stress(u):
    """雷诺应力张量：⟨u_i u_j⟩ - ⟨u_i⟩⟨u_j⟩。"""
    um = u.mean(axis=0)
    return np.mean(u[..., :, None] * u[..., None, :], axis=0) - um[..., :, None] * um[..., None, :]


def drag_lift_histories(CL, CD):
    """输出阻力与升力时间史，以及统计量。"""
    return {
        "CL": CL, "CD": CD,
        "CL_mean": np.mean(CL), "CD_mean": np.mean(CD),
        "St": float(np.argmax(np.abs(np.fft.rfft(CL - CL.mean()))) /
                    (2 * np.pi * (len(CL) - 1))),
    }


def compare_dns_piv(dns_field, piv_field):
    """DNS 与 PIV 的逐场对比（示意）。"""
    err = dns_field - piv_field
    return {"rmse": float(np.sqrt(np.mean(err ** 2))),
            "nrmse": float(np.sqrt(np.mean(err ** 2)) / np.sqrt(np.mean(piv_field ** 2)))}
```

---

## 实验结论

- **数据集**: 本文自产并公开的跨验证数据集，Re = 10,000，九种钝体几何（圆柱、2:1 椭圆 0°/90°、短/长等腰三角形尖端朝上游/朝下游、方柱 0°/45°）。每种几何包含：DNS 记录（时间与展向平均的速度、压力、雷诺应力；24 分箱的升力相位平均场；阻力与升力时间史；一个三维瞬时快照）与 PIV 记录（同一坐标系下的时间平均与相位平均场）。
- **基线**: **Re = 3900 的参考圆柱数据**用于验证 DNS 设置；Re = 10,000 下的 **DNS 与 PIV 直接对比**作为交叉验证。
- **结果**:
  1. DNS 设置在 Re = 3900 参考圆柱数据上**通过验证**。
  2. 在 Re = 10,000 下，**DNS 与 PIV 逐场对比一致**（摘要未给出具体偏差数值）。
  3. 数据集覆盖九种几何、两种测量手段，可直接支持**数据驱动湍流闭合、降阶模型与尾迹稳定性分析**的开发和测试。
  4. 摘要未给出 Strouhal 数、阻力系数、分离点位置等具体数值。

---

## 局限性

- 仅有 **Re = 10,000** 一个雷诺数，缺少 Re 扫描，无法支持跨 Re 的通用结论。
- PIV 为**平面**测量，仅覆盖单一切平面（摘要未说明是否在多个展向站位重复测量），三维信息依赖 DNS。
- 每种几何**仅有一个三维瞬时快照**，不适合做瞬时三维统计或作为三维训练数据的充分来源。
- 数据集为 **2D 准二维（展向平均）为主**，真实钝体绕流的三维不稳定性（meandering、碗状涡）刻画有限。
- 数据存储位置与许可协议摘要未声明（代码/数据链接未给出）。
- 摘要未提供 PIV 的不确定度、粒子密度与背景湍流水平的具体说明。

---

## 相关工作

- [[2026-11-11-Zheng-Shen-Xie-Velocity-Gradient-Invariants-Lundgren]]
- [[2026-11-11-Wang-Bao-Wang-Cardiac-Cycle-Pulsatile-Pipe-Flow]]
- [[2026-11-11-Sakib-Mychkovsky-Babaee-Low-Rank-Tensor-Manifolds-Turbulence]]
- [[2026-11-05-Zhang-Cai-Huang-Ren-GauSmoke-Hybrid-Physics-Optical-Gaussian-Splatting]]

---

## 实现建议

- **实现难度**: ✅ 低（作为数据消费方）。数据为已整理的场量与时间史，直接读入即可；若要**自建**同等质量的壁面分辨率 DNS（Re = 10,000，谱元求解器）与 PIV 实验，则属于 HPC 级工程。
- **预期性能**: ✅ 高。数据量小到中等（相平均场为 24 帧二维场 + 一个三维快照），CPU 读取与处理完全实时；适合作为**物理驱动渲染的离线数据源**。
- **适用场景**:
  - ✅ **用真实湍流尾迹驱动渲染**：把相位平均场（24 帧）与瞬时三维快照作为纹理/速度场，直接驱动烟雾/水体的粒子或网格求解器，得到"可信的卡门涡街"。
  - ✅ **训练数据驱动的湍流闭合与降阶模型**：九种几何的相位平均场正是这类模型所需的监督样本。
  - ✅ **尾迹稳定性分析的教学与可视化**：相位锁定的数据便于展示涡街的模态演化。
  - ✅ **几何感知的尾迹外观设计**：用不同钝体尾迹的差异来选择"哪类障碍物产生哪类涡街"，服务风格化场景。
  - ⚠️ 三维瞬时样本只有一个快照，不足以训练三维生成模型；需配合其他数据集。
  - ❌ 不适合需要多 Re 缩放或三维展向非定常演化的研究。

---
