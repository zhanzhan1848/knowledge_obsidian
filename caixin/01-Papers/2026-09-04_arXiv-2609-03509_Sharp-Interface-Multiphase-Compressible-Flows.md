---
type: paper
created: 2026-09-04
updated: 2026-09-04
tags: [multiphase, sharp-interface, compressible, phase-change, CFD]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2609.03509
---

# A conservative coupling method of sharp-interface and multi-species model for compressible reacting gas-liquid flows with phase change

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A conservative coupling method of sharp-interface and multi-species model for compressible reacting gas-liquid flows with phase change |
| **作者** | Shucheng Pan et al. |
| **发表** | arXiv 2026 (physics.flu-dyn); Computational Physics (physics.comp-ph) |
| **链接** | [原文](https://arxiv.org/abs/2609.03509) |

---

## 核心贡献

> 提出保守的 sharp-interface 和 diffuse-interface 耦合方法，用于可压缩两相多组分流动的相变和化学反应，通过多组分相变 Riemann 问题获得界面通量

1. 将单物种四波 Riemann 求解器扩展到多物种气体混合物
2. 通过种类选择性能量耦合（仅冷凝蒸汽物种）保留四波结构
3. 避免精确解所需的多维非线性求根

---

## 技术方案

### 方法架构

| 技术 | 说明 |
|------|------|
| Sharp-interface model | 液-气界面精确追踪 |
| Diffuse-interface model | 气体组分输运和化学反应 |
| Multi-species Riemann solver | 四波结构，含相变 |
| Species-selective energy coupling | 仅冷凝蒸汽参与界面质量交换 |

### 关键创新

修改了界面能量跳跃条件，使用相变蒸汽物种的内能而非混合物内能来构造气体混合物能量交换通量。

### 数值验证

- Impulsive evaporation and condensation
- Reacting aluminum vaporization
- Shock-droplet interaction
- Detonation-droplet interaction

---

## 控制方程

多物种可压缩两相方程，通过相变 Riemann 问题耦合 sharp 和 diffuse 界面。

---

## 相关工作

[[Sharp interface multiphase]], [[Compressible multiphase flows]], [[Phase change modeling]]
