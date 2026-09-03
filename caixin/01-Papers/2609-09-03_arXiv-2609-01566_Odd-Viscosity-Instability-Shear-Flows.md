---
type: paper
created: 2026-09-03
updated: 2026-09-03
tags: [Odd-Viscosity, Stability, Non-Normal-Dynamics, Shear-Flow, Orr-Sommerfeld]
status: processed
domain: Fluid Dynamics
agent: caixin
source: https://arxiv.org/abs/2609.01566
---

# Odd-viscosity-induced instability in shear flows

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Odd-viscosity-induced instability in shear flows |
| **作者** | Yonatan Messica |
| **发表** | arXiv 2026-09-02 |
| **链接** | [原文](https://arxiv.org/abs/2609.01566) |
| **arXiv ID** | 2609.01566 |

---

## 核心贡献

> 揭示奇粘度（非耗散）如何通过非常规动力学将瞬态增长转化为指数增长

1. **新不稳定机制**: 奇粘度产生传统流体中不存在指数增长模式
2. **Orr-Sommerfeld-Squire 方程推广**: 推导了含奇粘度的广义方程
3. **新 instabilit 机制**: 最初出现于展向扰动，通过临界层中奇粘性力的放大扩展到斜模式

---

## 技术方案

### 核心思想

奇粘度是时间反演对称性破缺流体中粘度张量的非耗散分量。尽管能量守恒，奇粘度可定性改变流体动力学稳定性：它提供了壁面法向速度和涡量之间的反馈，将瞬态增长转化为自持续的指数增长模式。

### 关键技术

| 技术 | 说明 |
|------|------|
| Odd Viscosity | 奇粘度（破缺时间反演对称） |
| Orr-Sommerfeld-Squire | 稳定性分析基本方程 |
| Transient Growth | 瞬态增长机制 |
| Non-normal Dynamics | 非正规动力学 |

---

## 物理机制

- **传统流体**: lift-up 机制产生瞬态增长（指数前指数）
- **奇粘度流体**: 壁法向速度与涡量之间的反馈将瞬态增长转为指数增长
- **能量守恒扰动**: 仅当未扰系统支持瞬态增长时才能使非正规系统失稳

---

## 相关工作

- [[Odd Viscosity]] - 奇粘度
- [[Hydrodynamic Stability]] - 流体动力学稳定性
- [[Non-Normal Dynamics]] - 非正规动力学

---

## 实现建议

- **实现难度**: 高（理论分析为主）
- **适用场景**: 活性物质、旋转流体、量子流体
