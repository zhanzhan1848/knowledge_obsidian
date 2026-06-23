---
type: paper
created: 2026-06-23
updated: 2026-06-23
tags: [turbulence, transition, pipe-flow, variational-method, optimal-perturbation]
status: processed
domain: turbulence-physics
agent: caixin
source: https://arxiv.org/abs/2606.23269
---

# Scaling of the Minimal Energy for Turbulence Transition in Pipe Flow

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Scaling of the Minimal Energy for Turbulence Transition in Pipe Flow |
| **arXiv ID** | 2606.23269 |
| **作者** | Patrick Keuchel et al. |
| **Reynolds 数范围** | $Re \leq 5000$ |
| **领域** | physics.flu-dyn / turbulence transition |
| **链接** | [原文](https://arxiv.org/abs/2606.23269) \| [PDF](https://arxiv.org/pdf/2606.23269) |

---

## 核心贡献

> 使用变分方法计算管流中非线性最优扰动，发现最小扰动能量门槛为常数，湍流临界扰动能量随 $Re^{-3}$ 标度。

1. **Orr 机制**: 最优扰动通过 Orr 机制增长，能量增益随 Re 线性增长（与初始扰动能量无关）
2. **斜波 + lift-up**: 非线性阶段由斜波相互作用和 lift-up 机制主导，能量增益 $\propto Re^2$
3. **转变门槛**: 临界扰动能量门槛为常数 $\Rightarrow$ 最小扰动能量 $\mathcal{O}(Re^{-3})$
4. **扰动局部化**: 随着 Re 增加，最优扰动结构越来越窄，厚度 $\delta_r \propto Re^{-1/3}$

---

## 关键物理机制

```
层流 → (Orr mechanism) → 非线性斜波 + lift-up → 湍流转变
```

### 能量增益标度

| 阶段 | 机制 | 能量增益 |
|------|------|---------|
| Orr phase | 线性（粘性） | $\propto Re$ |
| 斜波 + lift-up | 非线性 | $\propto Re^2$ |

### 厚度标度

$$\delta_r \propto Re^{-1/3}$$

---

## 核心结论

> **无论 Reynolds 数多大，转变发生的条件是扰动能量超过一个恒定阈值**，因此最小扰动能量随 $Re^{-3}$ 衰减。

---

## 推荐结论

✅ **推荐 — 湍流转变理论**

**理由**:
- 提供了管流湍流转变的简洁物理图像
- $Re^{-3}$ 标度律对高 Re 湍流实验设计有指导意义
- 变分方法也是流动控制研究的理论基础

---

## 相关工作

- [[2026-06-23-Non-normal-Weakly-Nonlinear-Analysis|Non-normal Weakly Nonlinear]]
- [[2026-06-23-TKE-Budget-Wall-Bounded-Turbulence|TKE Budget]]
