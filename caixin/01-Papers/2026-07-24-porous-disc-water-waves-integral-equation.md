---
type: paper
created: 2026-07-24
updated: 2026-07-24
tags: [wave-scattering, porous-disc, boundary-element-method, integral-equation, water-waves]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2607.21102
---

# A One-Dimensional Integral Equation for a Porous Horizontal Disc under Water Waves

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A One-Dimensional Integral Equation for a Porous Horizontal Disc under Water Waves |
| **作者** | Luiz Fernando de Moraes Campos Filho, Leandro Farina, Juliana Sartori Ziebell |
| **发表** | arXiv 2026-07-23 |
| **链接** | [原文](https://arxiv.org/abs/2607.21102) |
| **DOI** | 10.48550/arXiv.2607.21102 |
| **代码** | - |

---

## 核心贡献

> 将水下多孔圆板波散射问题公式化为单位圆盘上的二类超奇异Fredholm积分方程

1. 多孔圆板波散射的积分方程 formulation
2. 边界元法(BEM)数值求解
3. 孔隙率参数G对水动力的影响分析

---

## 技术方案

### 核心思想

将波-结构相互作用问题转化为超奇异Fredholm积分方程，通过BEM求解获得水动力系数。

### 关键技术

| 技术 | 说明 |
|------|------|
| 超奇异Fredholm积分方程 | 二类积分方程 formulation |
| 边界元法 (BEM) | 高效数值求解 |
| 附加质量与阻尼系数 | 水动力特性评估 |

---

## 控制方程

自由表面波（线性波理论）与多孔结构的相互作用

---

## 实验结论

- 孔隙率参数G影响水动力性能
- 低孔隙率板（G为实数）增加附加质量和水动力
- 高孔隙率板（G为虚数）减少这些效应但增加阻尼系数
- 与文献结果一致性良好

---

## 实现建议

- **实现难度**: 中等（需积分方程求解基础）
- **适用场景**: 海洋工程、波浪能装置

---

## 相关概念

- [[波-结构相互作用]]
- [[边界元法]]
- [[多孔介质]]
- [[水动力学]]
