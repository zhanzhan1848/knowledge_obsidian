---
type: paper
created: 2026-05-11
updated: 2026-05-11
tags: [turbulence, drop breakup, DNS, multiphase, interfacial flows]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2605.07504
---

# Causal mechanisms of drop breakup in turbulent flows

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Causal mechanisms of drop breakup in turbulent flows |
| **作者** | Daniel Morón Montesdeoca |
| **发表** | arXiv 2026 (physics.flu-dyn) |
| **链接** | [原文](https://arxiv.org/abs/2605.07504) |
| **DOI** | 10.48550/arXiv.2605.07504 |

---

## 核心贡献

> 揭示湍流中间歇性与液滴破碎无记忆统计之间的因果关系

1. **内外场分解**：将流动分解为外部场（独立于液滴动力学）和内部场（响应变形并耗散界面能）
2. **外场驱动变形**：外场独立于液滴动力学，驱动变形过程
3. **内场产生湍流涡**：内场通过湍流涡旋耗散界面能
4. **简单解析模型**：推导出可复现 DNS 统计结果的解析模型
5. **关键发现**：湍流间歇性与无记忆破碎统计之间存在因果链接

---

## 技术方案

### 核心思想

液滴/气泡在湍流中的破碎决定了工程和环境流中众多过程的速率。界面应力和流体力学应力的非线性耦合是模型简化的根本困难。该研究通过**内外场分解**来克服这一挑战。

### 关键机制

| 机制 | 说明 |
|------|------|
| Outer Field | 独立于液滴动力学，驱动变形 |
| Inner Field | 响应变形，通过产生湍流涡旋耗散界面能 |
| Intermittency | 湍流间歇性是破碎统计的驱动因素 |
| Memoryless Breakup | 破碎过程无记忆性 |

---

## 公式

```math
\begin{aligned}
&\text{Outer field (drives deformation): } \\
&\nabla \cdot \mathbf{u}_\infty = 0, \quad \rho \frac{\partial \mathbf{u}_\infty}{\partial t} + \rho (\mathbf{u}_\infty \cdot \nabla) \mathbf{u}_\infty = -\nabla p_\infty + \mu \nabla^2 \mathbf{u}_\infty \\
&\text{Inner field (dissipates interfacial energy): } \\
&\text{Turbulent eddies generated at interface scale} \\
&\text{Breakup rate: } \Gamma(\lambda) = f(\text{We}, \text{Re}, \text{Oh})
\end{aligned}
```

---

## 实验结论

- **方法**: 直接数值模拟 (DNS) 液滴和气泡系综
- **统计**: 无记忆破碎统计（exponential distribution）
- **发现**: 湍流间歇性 → 无记忆破碎统计（因果链路）
- **应用**: 工程和环境流体中的液滴/气泡破碎过程建模

---

## 局限性

- 当前为简化解析模型，详细界面动力学需进一步研究
- 未考虑高韦伯数下的多尺度破碎级联

---

## 相关工作

- [[Turbulence-Multiphase-Flow]]
- [[VOF-DNS-Droplet]]
- [[Interfacial-Fluid-Dynamics]]

---

## 实现建议

- **实现难度**: ⭐⭐⭐⭐（需要 DNS 模拟和复杂的界面追踪）
- **预期性能**: 适用于液滴破碎率的解析预测
- **适用场景**: 喷雾燃烧、乳液稳定性、降水建模、环境流体力学