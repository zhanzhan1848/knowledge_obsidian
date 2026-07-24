---
type: paper
created: 2026-07-24
updated: 2026-07-24
tags: [microfluidics, mixing, FEM, toroidal-mixer]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2607.20841
---

# Mixing Performance of Toroidal Ring Mixers: Effects of Flow Rate Ratios and Geometric Asymmetry

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Mixing Performance of Toroidal Ring Mixers: Effects of Flow Rate Ratios and Geometric Asymmetry |
| **作者** | Mohammad Majidi, Taehong Kim, Jiaqi Li, Dongjie Jia, Ehsan Rahimi, Pavlos P. Vlachos, Arezoo M. Ardekani |
| **发表** | arXiv 2026-07-23 |
| **链接** | [原文](https://arxiv.org/abs/2607.20841) |
| **DOI** | 10.48550/arXiv.2607.20841 |
| **代码** | - |

---

## 核心贡献

> 研究了几何不对称性和流率比对环形微通道混合器混合性能的影响

1. 对称与非对称环形微通道混合器的系统对比研究
2. 流动参数（流率比、几何不对称性）对混合效率的影响规律
3. 高保真数值模拟 + 实验验证

---

## 技术方案

### 核心思想

采用稳定化有限元方法（stabilized FEM）求解对流-扩散方程，研究微流控设备中的混合问题。

### 关键技术

| 技术 | 说明 |
|------|------|
| 稳定化有限元法 | 求解对流占优问题，避免数值振荡 |
| 浓度场分析 | 通过浓度场评估混合均匀性 |
| 速度场分析 | 分析速度场与混合性能的关系 |

---

## 控制方程

- 对流-扩散方程（混合场）
- 不可压缩Navier-Stokes方程（流场）

---

## 实验结论

- 非对称环形混合器在低至中等总流率下表现优于传统设计
- 无需改变混合器整体尺寸即可改善混合效果
- 流率比是影响混合性能的关键参数

---

## 实现建议

- **实现难度**: 中等（需要FEM基础）
- **适用场景**: 微流控芯片、纳米颗粒制备

---

## 相关概念

- [[微流控混合]]
- [[有限元法]]
- [[Moffatt涡]]
