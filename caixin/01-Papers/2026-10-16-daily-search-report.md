---
type: report
created: 2026-10-16
updated: 2026-10-16
tags: [report, daily-search, arxiv, physics.flu-dyn]
status: processed
domain: fluid-dynamics
agent: caixin
date: 2026-10-16
---

# 每日论文搜索报告 — 2026-10-16

## 搜索范围

- **类目**: arXiv `physics.flu-dyn` (主)；附加检查 `cs.FL`
- **时间窗**: 最近 24 小时（公告日 2026-10-16，含首次公告类型为 `new` 的论文）
- **关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence

## 备注：cs.FL 类目

arXiv `cs.FL` 全称 *Formal Languages and Automata Theory*（形式语言/自动机理论），与流体动力学无关。
今晨 `cs.FL` 公告的论文为自动机理论/超逻辑/序列词复合等纯理论 CS 主题，不属于本 vault 范畴。已在 `caixin-daily-misclassification-check` 备忘中标记，下次若发现，应向 shengcai 或豆苗代理推荐（前者关注相关数学结构、后者不需要）。

## 检索结果：physics.flu-dyn (new)

| arXiv ID | 标题（缩写） | 主要技术 | 笔记 |
|----------|------|------|------|
| [2610.20650](https://arxiv.org/abs/2610.20650) | Weber-number scaling ... pressure-swirl sprays | 雾化实验，We 数标度，距离修正 | [[2026-10-16-pressure-swirl-spray-weber-scaling]] |
| [2610.20784](https://arxiv.org/abs/2610.20784) | Two-frequency Steady Streaming pumping | 渐近展开，BVP 维数降阶，低 Re 流体操纵 | [[2026-10-16-two-frequency-steady-streaming-pumping]] |
| [2610.21564](https://arxiv.org/abs/2610.21564) | Leading-edge geometry ... flat plate | 低 Re (1000) 2D CFD，涡脱落起始 | [[2026-10-16-leading-edge-flat-plate-aerodynamics]] |
| [2610.21694](https://arxiv.org/abs/2610.21694) | Hurricane Laura loads on wind turbines (Part I) | LES + aeroelastic 耦合，飓风极端风场 | [[2026-10-16-hurricane-laura-wind-turbine-les-aeroelastic]] |
| [2610.21831](https://arxiv.org/abs/2610.21831) | Ambient-pressure effects ... optical breakdown | 激光诱导击穿，强爆炸波理论，多相 | [[2026-10-16-optical-breakdown-water-droplet-shock]] |
| [2610.22044](https://arxiv.org/abs/2610.22044) | Phononic subsurface ... vortex shedding | 浸没边界法 FSI，钝体振动被动控制 | [[2026-10-16-phononic-subsurface-vortex-shedding-fsi]] |

## 检索结果：physics.flu-dyn (cross / replace)

下列论文为既有论文的修订/跨类目公告，不属于"最近 24 小时新论文"，但与本领域相关，建档参考：

- `2610.20621` XPINN for shock-dominated Burgers equation (physics.comp-ph × physics.flu-dyn)
- `2610.20643` TC-MLNO + Conditional Diffusion for stiff chem. kinetics (physics.comp-ph × physics.flu-dyn)
- `2610.20978` Differentiable PCA-GPR surrogate ... Bayesian inverse UQ (physics.comp-ph × physics.flu-dyn)
- `2610.21996` PANDA-D: dynamic contact angles (cond-mat.soft × physics.flu-dyn)
- `2007.03077v4` Transient compressible flow in compliant viscoelastic tube
- `2604.26107v2` Lacunarity in 2D atomizing liquid jet
- `2606.00649v3` Causality/stability in 2nd-order relativistic MHD
- `2607.04491v3` **Generalizable turbulence closures by PINN (Karniadakis)** — 已建档价值高
- `2608.12048v2` Strain-coupled 1D turbulence, leading-edge noise
- `2610.08654v2` Thermocapillary stabilization of liquid space telescopes
- `2606.12559v2` Latent-EnKF for shock flows (cs.LG × physics.flu-dyn)
- `2607.24927v2` Turbulent flows in compressible active liquid crystals
- `2609.18544v2` Braided endovascular implants (hemodynamics)

## 本日亮点主题

1. **湍流建模/PINN 闭包跨几何泛化** — `2607.04491` v3 (Karniadakis 组)：基于 PINN 解算器无关的湍流闭包，可在 6 类二维钝体尾流 (Re=10⁴) 上训练并以 LOSO 协议在新形状上泛化（详见 [[2026-10-16-…]]）
2. **LES + aeroelastic 极端风场** — 飓风 Laura 风机载荷多分辨率 LES 给出工业设计直接指导
3. **流固耦合 + 声子材料被动控制** — PSub FSI 极限环解耦为 4 类机制，控制潜力可观
4. **PDE 求解器的 ML 增强稳步推进** — XPINN (Burgers)、MLNO (化学反应流)、EnKF (含激波流) 同日出现

## 给 @墨鱼丸 的提议候选（高优先级）

| 主题 | 关联论文 | 建议方向 |
|------|----------|---------|
| PINN 湍流闭包 + 工业形状泛化 | `2607.04491` | 在 OpenFOAM 内集成 LOSO 训练的闭包，发布 benchmark |
| 稳态流双频泵设计 | `2610.20784` | microfluidic 振荡圆柱流求解器参考实现 |
| 雾滴尺寸 We 数 + 距离标度 | `2610.20650` | 喷雾 CFD 入口条件设定标准化 |

## Git 同步

- 状态：已由 `~/.scripts/git-sync.sh` 推送至 `zhanzhan1848/knowledge_obsidian`

---

> 报告生成时间: 2026-10-16 14:05 UTC  
> Agent: 🥬 菜心 / caixin  
> 数据源: arXiv RSS `physics.flu-dyn`、`cs.FL` 公告
