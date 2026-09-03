---
type: paper
created: 2026-09-03
updated: 2026-09-03
tags: [Reactive-Transport, CO2-Sequestration, Micro-CT, Pore-Scale, Carbonate-Rock]
status: processed
domain: Fluid Dynamics
agent: caixin
source: https://arxiv.org/abs/2609.01328
---

# Multiphase Reactive Transport in a Heterogeneous Flow Field: Channel Formation in Hydrocarbon-Bearing Carbonate Rock

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Multiphase Reactive Transport in a Heterogeneous Flow Field: Channel Formation in Hydrocarbon-Bearing Carbonate Rock |
| **作者** | (见原文) |
| **发表** | arXiv 2026-09-02 |
| **链接** | [原文](https://arxiv.org/abs/2609.01328) |
| **arXiv ID** | 2609.01328 |

---

## 核心贡献

> 揭示多相条件下孔隙尺度流动异质性是通道形成的决定性因素

1. **实验+Numerical**: 时间分辨 Micro-CT + 孔隙网络分析 + 直接数值模拟
2. **通道形成机制**: 流动异质性与反应交付的耦合，而非仅由体 Pe-Da 决定
3. **有效反应速率**: 快速平流传输未能转化为快速整体溶解（多相条件下）

---

## 技术方案

### 核心思想

碳捕获、利用和封存(CCUS)中，CO2 注入含烃碳酸盐岩储层时会发生通道化溶解。传统模型用体 Peclet 数 (Pe) 和 Damköhler 数 (Da) 预测，但忽略了孔隙尺度流动异质性。

### 关键技术

| 技术 | 说明 |
|------|------|
| Micro-CT | 微米级计算机断层扫描 |
| Pore-Network Analysis | 孔隙网络分析 |
| DNS | 直接数值模拟 |
| CO2 Injection | 二氧化碳注入 |

---

## 实验参数

- 岩心: Ketton 灰岩（含油）
- 注入速率: 0.5 mL/min
- 持续时间: 180 min
- 系统状态: 高 Pe, 低 Da (advection-dominated)

---

## 结论

- 溶解强烈局部化（尽管是平流主导）
- 优先流动通道在原始多孔介质中已存在（孔结构+剩余油占据导致）
- 180 min 形成连续曲折通道
- 有效反应速率 ~1.6×10^-5 mol/m²s，比批反应低一个数量级

---

## 相关工作

- [[Reactive Transport]] - 反应输运
- [[CO2 Sequestration]] - CO2 封存
- [[Pore-Scale Flow]] - 孔隙尺度流动
- [[Carbonate Rock]] - 碳酸盐岩

---

## 实现建议

- **实现难度**: 高（实验+模拟耦合）
- **适用场景**: CO2 地质封存、地热能
