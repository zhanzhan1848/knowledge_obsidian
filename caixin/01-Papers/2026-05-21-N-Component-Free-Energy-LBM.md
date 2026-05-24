---
type: paper
created: 2026-05-21
updated: 2026-05-24
tags: [LBM, multiphase-flow, free-energy, surface-tension, reduction-consistency]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2605.22214v1
---

# N-Component Free Energy Lattice Boltzmann Method with Reduction Consistency and Global Momentum Conservation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | N-Component Free Energy Lattice Boltzmann Method with Reduction Consistency and Global Momentum Conservation |
| **作者** | Michael Rennick, Xitong Zhang, Tim Niklas Bingert, Mathias J. Krause, Halim Kusumaatmaja |
| **发表** | arXiv (Submitted to J. Chem. Physics) |
| **链接** | [原文](https://arxiv.org/abs/2605.22214v1) |
| **DOI** | https://doi.org/10.1063/5.0327062 |
| **代码** | - |

---

## 核心贡献

> 提出一种可模拟任意数量不混溶流体的自由能格子玻尔兹曼方法，具有严格的约化一致性和全局动量守恒特性。

1. **约化一致性 (Reduction Consistency)**: 严格保证不存在的流体组分不会自发形核
2. **全局动量守恒**: 引入新型表面张力离散化方案，动量守恒达到机器精度
3. **通量修正**: 通过与迁移率无关的通量修正强制约化一致性
4. **多组分扩展**: 原则上可模拟任意数量不混溶组分的流体系统

---

## 技术方案

### 核心思想

自由能方法通过定义流体的自由能函数来描述多相多组分系统的热力学平衡状态。该方法在格子玻尔兹曼框架内通过化学势梯度驱动流体运动。

### 关键技术

| 技术 | 说明 |
|------|------|
| Free Energy Lattice Boltzmann | 自由能格子玻尔兹曼多相流方法 |
| Reduction Consistency | 约化一致性，防止消失组分自发形核 |
| Surface Tension Discretization | 表面张力力的新型离散格式，保证全局动量守恒 |
| Flux Correction | 通量修正机制，独立于迁移率 |

### 基准测试用例

- **液滴透镜 (Liquid lenses)**: 两相界面接触角验证
- **Janus 液滴**: 非对称表面张力液滴行为
- **四元相分离 (Quaternary phase separation)**: 多组分相分离动力学
- **六组分层状泊肃叶流 (Six-component layered Poiseuille flow)**: 多层流动验证

---

## 实验结论

- 液滴透镜、Janus液滴、四元相分离、六组分层状泊肃叶流等基准测试均与理论预测高度吻合
- 在微流控乳化液滴生成和图案化液面应用中展示了方法的有效性

---

## 相关工作

- [[LBM-multiphase]]
- [[surface-tension-models]]

---

## 实现建议

- **实现难度**: 中等 (需要理解自由能框架和格子玻尔兹曼基础)
- **预期性能**: 标准 D3Q19 或 D2Q9 格子即可
- **适用场景**: 微流控、多相流、乳化液滴、数字微流控

---

## 备注

- 该文已被 Journal of Chemical Physics 接收
- 代码/数据开源情况待确认