---
type: paper
created: 2026-09-04
updated: 2026-09-04
tags: [boiling, interface-resolved, phase-change, heat-transfer, multiphase]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2609.03396
---

# Interface-resolved simulations of boiling heat transfer

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Interface-resolved simulations of boiling heat transfer |
| **作者** | Alessio Roccon et al. |
| **发表** | arXiv 2026 (physics.flu-dyn); Computational Physics (physics.comp-ph) |
| **链接** | [原文](https://arxiv.org/abs/2609.03396) |

---

## 核心贡献

> 综述沸腾流传热的界面解析模拟方法现状，指出"流体动力学解析但微观建模"的核心矛盾，sub-grid 闭合模型与流体动力学求解器精度同等重要

1. 系统综述界面解析沸腾模拟的 Formulations
2. 分析成核、微层蒸发、接触线动力学的建模方法
3. 核心结论：界面解析模拟的预测精度取决于微观物理的 sub-grid 闭合

---

## 核心观察

> "Interface-resolved simulations of boiling are **hydrodynamically resolved but microscopically modeled**"

沸腾的界面解析模拟在流体动力学上已解析，但微观上仍然依赖建模：
- 成核（nucleation）
- 微层蒸发（microlayer evaporation）
- 接触线动力学（contact-line dynamics）

这些 sub-grid 闭合对预测精度的影响不亚于流体动力学求解器本身的精度。

---

## 关键技术

| 技术 | 说明 |
|------|------|
| 界面追踪 | 显式或隐式描述液-汽界面 |
| 热力学建模 | 真实气体状态方程、热力学属性 |
| 可压缩性 | 完整可压缩建模 |
| 成核模型 | 壁面成核理论 |
| 微层蒸发 | 微层能量平衡 |
| 接触线 | 多种接触角/滑移模型 |

---

## 开放挑战

1. 精确的成核准则和成核位点密度预测
2. 微层蒸发机制的定量建模
3. 动态接触角的物理建模
4. 微观尺度与宏观流体动力学的耦合

---

## 相关工作

[[Boiling heat transfer]], [[Interface-resolved DNS]], [[Multiphase flow modeling]]
