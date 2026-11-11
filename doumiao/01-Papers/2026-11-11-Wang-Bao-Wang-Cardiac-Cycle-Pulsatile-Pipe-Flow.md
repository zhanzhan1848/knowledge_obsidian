---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, turbulence, pipe-flow, pulsatile-flow, dns, wall-turbulence]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2611.12007
---

# Phase-resolved turbulence dynamics in cardiac-cycle-inspired pulsatile pipe flow

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Phase-resolved turbulence dynamics in cardiac-cycle-inspired pulsatile pipe flow |
| **作者** | Xinyu Wang, Yan Bao, Benlong Wang |
| **发表** | arXiv preprint (physics.flu-dyn), 2026-11-09（37 页 / 20 图 / 2 表 / 3 个补充影片；投稿 Journal of Fluid Mechanics） |
| **链接** | [arXiv:2611.12007](https://arxiv.org/abs/2611.12007) |
| **DOI** | — |
| **代码** | 摘要未声明 |
| **分类** | 湍流动力学 / 脉动管流与壁湍流 |

---

## 核心贡献

> **一句话点题：用 DNS 逐相位拆解"心脏周期式"脉动管流中湍流重组的四个阶段，并把近壁高速条带（Q4 sweeps）与外缓冲区低速条带（Q2 ejections）的相位错位与阻力响应定量联系起来。**

1. 用**直接数值模拟（DNS）**研究心脏周期启发波形驱动的脉动管流，涵盖**四个算例**（含 / 不含低流量平台）× **两个雷诺数区间**，给出**相位分辨（phase-resolved）**的湍流动力学。
2. 归纳出**湍流–湍流重组（turbulent–turbulent reorganisation）的四个阶段**，并明确各阶段的主导机制（拉伸 → 涡结构 → 动量输运 → 衰减与尺度再调整）。
3. 发现关键的**相位滞后结构**：加速阶段与早期减速阶段，**流向–法向应力生成先于压力–应变重分配与径向动量输运恢复**，使能量得以在**拉长的条带（streaks）**中累积。
4. 揭示**不同壁距、不同响应类型之间的径向时序差异**：**Q2 驱动的局部起始沿径向向壁面逐次推迟**；**Q4 驱动的起始在黏性底层与缓冲层几乎同步**，峰值则依次向外传播。
5. 发现**条带扰动的空间分工**：早期减速中，近壁高速条带主要发展 **varicose 扰动**（对应 Q4 sweeps），外缓冲区低速条带主要发展 **sinuous 扰动**（对应 Q2 ejections）。
6. 通过**非定常摩擦分解**把相位依赖动力学与阻力响应挂钩，指出**延迟的湍流剪切恢复是维持低阻力区间的原因**；低流量平台进一步延长衰减、削弱下一加速阶段继承的湍流。

---

## 技术方案

### 核心思想

心脏血流是典型的**脉动管流**：一个心动周期内，平均速度先快速加速（射血期）、再减速，中间可能存在一段低流量平台（舒张末期）。这类流动的困难在于——**平均流量恒定并不意味着湍流恒定**：即使壁面剪切的时间平均可以维持在同一个目标值，湍流结构在相位上仍可能严重滞后。因此本文的整条分析主线是**沿"相位"这一维度做完整的统计拆解**，把稳态壁湍流中成熟的知识（Q2/Q4 事件、条带结构、应力生成项、阻力分解）搬到非定常语境下重新审视。

分析框架包含几个标准构件：

- **雷诺应力生成项分解**：特别是流向–法向应力生成 $\overline{u'_\theta u'_r u'_\theta}$ 与压力–应变重分配项、径向动量输运项，三者的**相位差**直接反映湍流重组的"内部不同步"——这正是本文核心发现 A 的来源。
- **Q2/Q4 事件分类**：用速度梯度张量的二次不变量 $Q$ 定义瞬时事件，$Q>0$ 对应 **ejection（抛射）**，$Q<0$ 对应 **sweep（扫掠）**。
- **条带结构的空间定位**：区分近壁（黏性底层 / 缓冲层）高速条带与外缓冲区低速条带，并分析各自伴随的扰动类型（varicose 膨胀型 vs sinuous 蜿蜒型），这构成本文核心发现 B。
- **径向时序对比**：Q2 起始沿径向向壁面**逐次推迟**，Q4 起始在黏性底层与缓冲层**几乎同步**而峰值向外逐次传播（核心发现 C）。
- **非定常摩擦分解**：把壁面剪切（摩擦）拆成相依赖的组成部分，从而把湍流统计量与阻力曲线挂钩。

四个阶段的划分是组织主轴：**加速**（强加速抑制横向脉动与涡结构活动）→ **早期减速**（应力生成先恢复，能量累积于拉长条带）→ **恢复 / 再加速**（压力–应变重分配与径向输运跟进，剪切贡献达峰）→ **衰减与尺度再调整**（并受低流量平台影响）。阻力曲线的**最小阻力点**与**恢复最大值点**之间的重叠区间，正是重分配剧烈、多尺度动量输运快速恢复的时段。低流量平台则延长衰减、削弱下一加速阶段继承的湍流，并进一步**延迟局部不稳定性**、拉长剪切贡献的"起始→峰值"间隔。

### 关键技术

| 技术 | 说明 |
|------|------|
| 直接数值模拟（DNS） | 求解脉动管流瞬时场，用于相位分辨统计（求解器细节摘要未说明） |
| 心脏周期启发波形 | 加速–减速–（可选）低流量平台的时变流量驱动 |
| 四算例 × 两雷诺数区间 | 含 / 不含低流量平台的对照组设计 |
| 雷诺应力生成项分解 | 流向–法向应力生成 vs 压力–应变重分配 vs 径向动量输运的相位对比 |
| Q2 / Q4 事件分类 | 用速度梯度二次不变量区分 ejection（Q2）与 sweep（Q4） |
| 条带（streak）结构分析 | 近壁高速条带与外缓冲区低速条带的识别与扰动类型判别 |
| 相位平均场 | 按心动周期相位做平均，提取条带强度与速度亏损 |
| 非定常摩擦分解 | 把壁面剪切分解并与阻力响应关联 |
| 补充影片（3 部） | 展示相位演化过程 |

---

## 公式

相依赖的壁面摩擦分解（示意性）：

```math
C_f(t) \;=\; \underbrace{\overline{C_f}}_{\text{相平均}}
\;+\; \underbrace{C_f'(t)}_{\text{相脉动}},
\qquad
C_f(t) = 2\,\frac{\overline{\tau_w'(t)}}{\rho U_{ref}^2}
```

雷诺应力生成项与压力–应变重分配（示意性标准形式）：

```math
\underbrace{-\overline{u_\theta' u_r' \frac{\partial u_\theta'}{\partial r}}}_{\text{流向–法向应力生成}}
\;+\;
\underbrace{-\overline{u_r' u_r' \frac{\partial u_\theta'}{\partial r}}}_{\text{径向动量输运}}
\;+\;
\underbrace{\overline{u_\theta'}^2 \frac{\partial u_\theta'}{\partial r}}_{\text{压力–应变重分配}}
\;\approx\; \frac{\partial \overline{u_\theta' u_r'}}{\partial t}
```

二次不变量定义事件（示意性）：

```math
Q = -\tfrac{1}{2}\,\mathrm{tr}(S^2) - \mathrm{tr}(\Omega^2), \qquad
S=\tfrac{1}{2}(A+A^{\mathsf T}),\ \Omega=\tfrac{1}{2}(A-A^{\mathsf T}),\ A=\nabla\mathbf{u}
```

```math
Q > 0 \Rightarrow \text{Q2 (ejection)},\qquad Q < 0 \Rightarrow \text{Q4 (sweep)}
```

相位平均的速度亏损与条带强度（示意性）：

```math
\Delta U^+(\phi, r) = -\overline{u_\theta' u_\theta'}(\phi, r), \qquad
S(\phi, r) = \max_{\Delta \theta}\ \overline{u_\theta'^2}(\phi, r, \Delta \theta)
```

> 上述公式为依据摘要术语（应力生成、压力–应变重分配、Q2/Q4、相平均、非定常摩擦分解）写出的**示意性表达**，摘要未给出论文中的具体方程编号与形式。

---

## 代码片段

```python
# 概念性伪代码：相位分辨的湍流统计与摩擦分解
import numpy as np

def phase_bins(n_bins=64):
    """把心动周期离散成相位 bins。"""
    return (np.arange(n_bins) + 0.5) / n_bins


def generation_terms(u_t, u_r, dudr, phase_idx, n_bins=64):
    """分离：流向–法向应力生成 / 径向动量输运 / 压力–应变重分配。"""
    gen_tn = -np.mean(u_t * u_r * dudr, axis=0)      # 流向–法向生成
    trans_r = -np.mean(u_r * u_r * dudr, axis=0)     # 径向动量输运
    pres_strain = np.mean(u_t * u_t, axis=0) * dudr  # 压力–应变重分配
    out = []
    for b in range(n_bins):
        m = phase_idx == b
        out.append((gen_tn[m].mean(), trans_r[m].mean(), pres_strain[m].mean()))
    return np.array(out)  # [n_bins, 3]


def q_event_classification(A):
    """按 Q 的符号区分 Q2 (ejection) 与 Q4 (sweep)。"""
    S = 0.5 * (A + np.swapaxes(A, -1, -2))
    Om = 0.5 * (A - np.swapaxes(A, -1, -2))
    Q = -0.5 * np.einsum('...ij,...ji->...', S, S) - np.einsum('...ij,...ji->...', Om, Om)
    return np.where(Q > 0, 'Q2_ejection', 'Q4_sweep')


def radial_onset_sequence(q2_mask, q4_mask, radii, n_bins=64):
    """比较 Q2 与 Q4 的径向起始时序（近壁 vs 外缓冲区）。"""
    onset = {}
    for name, mask in (('Q2', q2_mask), ('Q4', q4_mask)):
        onset[name] = [np.argmax(mask[(radii == r) & (phase < n_bins)]) for r in radii]
    return onset


def unsteady_friction_decomposition(tau_w_prime, phase_idx, n_bins=64):
    """非定常摩擦分解：相平均 + 相脉动。"""
    mean_cf = np.zeros(n_bins)
    fluct_cf = np.zeros(n_bins)
    for b in range(n_bins):
        sel = tau_w_prime[phase_idx == b]
        mean_cf[b] = sel.mean()
        fluct_cf[b] = sel - mean_cf[b]
    return mean_cf, fluct_cf
```

---

## 实验结论

- **数据集**: 自产 DNS 数据，脉动管流（心脏周期启发波形），**4 个算例**（含 / 不含低流量平台）× **2 个雷诺数区间**；摘要未给出具体 Re 数值。另含 3 部补充影片与 2 张表。
- **基线**: 摘要未提及传统基线方法；参照框架为**稳态管流 / 壁湍流的经典统计**（Q2/Q4 事件分类、应力生成项分解、非定常摩擦分解）。
- **结果**:
  1. 响应遵循**湍流–湍流重组的四个阶段**。
  2. **强加速**抑制横向脉动与涡结构活动。
  3. 加速与早期减速阶段，**流向–法向应力生成先恢复**，早于压力–应变重分配与径向动量输运 → 能量在**拉长条带**中累积。
  4. 早期减速中，**近壁高速条带**主要发展 varicose 扰动（对应 Q4 sweeps）；**外缓冲区低速条带**主要发展 sinuous 扰动（对应 Q2 ejections）。
  5. 径向时序不同：**Q2 局部起始向壁面逐次推迟**；**Q4 起始在黏性底层与缓冲层几乎同步**，峰值依次向外传播。
  6. 两种响应在**阻力最小点与恢复最大值点之间重叠**，该区间内重分配显著加剧、多尺度动量输运快速恢复。
  7. 湍流随后衰减并重新调整尺度；**低流量平台延长衰减、削弱下一加速阶段继承的湍流**，进一步延迟局部不稳定性并拉长剪切贡献的"起始→峰值"间隔。
  8. 非定常摩擦分解把相位依赖动力学与阻力响应联系，指出**延迟的湍流剪切恢复是维持低阻力区间的原因**。

---

## 局限性

- 仅针对**圆形管流**，未涉及弯管、分叉或真实血管的分叉几何。
- 摘要未说明 DNS 的分辨率、网格与时间步策略、数值耗散处理方式。
- 摘要未给出具体的雷诺数取值、阻力曲线数值、条带长度 / 强度的定量结果。
- 低雷诺数湍流（受限于壁面分辨率）在两个 Re 区间中的处理摘要未说明。
- 属于纯流体力学研究，未涉及与渲染 / 可视化的直接接口；论文未声明代码或数据开源。

---

## 相关工作

- [[2026-11-11-Zheng-Shen-Xie-Velocity-Gradient-Invariants-Lundgren]]
- [[2026-11-11-Sakib-Mychkovsky-Babaee-Low-Rank-Tensor-Manifolds-Turbulence]]
- [[2026-11-11-Zhang-Kaufer-Ronglan-Triantafyllou-Bluff-Body-Wakes-Dataset]]
- [[2026-10-19-SplashSplat-Multi-View-Liquid-Reconstruction]]

---

## 实现建议

- **实现难度**: ❌ 极高（复现成本）。完整 DNS 脉动管流需 HPC 级算力与成熟湍流求解器（OpenFOAM / nekRS 等）；若仅需可视化，可在低分辨率下跑 LES 或使用合成模型。
- **预期性能**: ⚠️ 复现代价高，但**消费级成果价值高**：论文提供的是一套"相位依赖的湍流行为图景"（四阶段 + 条带与事件的空间分层），可直接作为**动画流体艺术的行为脚本**（如心律驱动的血管 / 管道内流动可视化）。
- **适用场景**:
  - ✅ **风格化脉动流动画的相位脚本**：用四阶段（加速 → 早期减速 → 恢复 → 衰减）驱动循环动画的湍流强度曲线、条带强度与低频脉动。
  - ✅ 血管 / 管道内流动的视觉设计：用"近壁高速条带 varicose、外缓冲区低速条带 sinuous"的分层规则决定着色与涡结构细节的朝向。
  - ✅ 血流可视化中"周期性强度起伏"的物理依据来源。
  - ⚠️ 若要做数值预测（阻力、流量），必须依赖真实 DNS/LES，本文的定性结论不足以支撑。
  - ❌ 不适合作为实时渲染求解器的物理内核——相分辨 DNS 的成本与数据量不可接受。

---
