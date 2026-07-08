---
type: paper
created: 2026-07-08
updated: 2026-07-08
tags: [combustion, flamelet, RANS, Navier-Stokes, turbulence, strain-rate]
status: processed
domain: computational-fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2607.06322
---

# Strain-Rate-Consistent ε-Based Non-Premixed Flamelet Model

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Strain-Rate-Consistent ε-Based Non-Premixed Flamelet Model |
| **作者** | Sylvain L. Walsh, Yalu Zhu, Feng Liu, William A. Sirignano |
| **发表** | arXiv 2607.06322v1, 2026-07-07 |
| **链接** | [原文](https://arxiv.org/abs/2607.06322) |
| **DOI** | - |

---

## 核心贡献

> 针对传统flamelet/progress-variable (FPV) 公式中的应变率不一致问题，提出基于湍动能耗散率ε的替代耦合方案

1. 识别传统FPV公式中 flamelet 状态选择与局部应变率环境脱节的问题
2. 提出 **ε-Z flamelet模型**，用ε推断施加在flamelet上的应变率 S*
3. 局部 flamelet 状态直接由湍流场和压力相关可燃极限约束
4. 物质选择性输运允许产物在局部淬灭区域持续存在

---

## 技术方案

### 核心思想

在 FPV 公式中，flamelet 状态通过输运的进度变量选择，其演化由对流、扩散和化学产生主导，而非由局部应变率环境决定。这导致在高应变区域优先采样近平衡 flamelet 状态。

### 关键技术

| 技术 | 说明 |
|------|------|
| Reynolds-averaged Navier-Stokes (RANS) | 2D 跨音速加速反应混合层 |
| Flamelet/Progress-Variable (FPV) | 传统 flamelet 模型 |
| ε-Z Flamelet Model | 基于耗散率的替代耦合 |
| Turbulence kinetic energy dissipation ε | 推断 flamelet 应变率 |

### 控制方程

- **应变率推断**: S* = f(ε, 湍流尺度)
- **产物持续性**: 输运方程允许产物通过淬灭区域
- **反应物可用性标度**: 当输运组合偏离 flamelet 流形时限制查表源项

---

## 数值方法

- **离散化**: 有限体积法
- **求解器**: RANS 稳态求解
- **化学动力学**: 单步反应

---

## 实验结论

- ε-Z 公式在高应变区域比传统 FPV 更准确
- 产物在局部淬灭区域得以保持
- 火焰结构更符合物理预期

---

## 局限性

- 仅 2D RANS 验证
- 单步化学动力学
- 需进一步验证 LES/DNS

---

## 相关工作

- [[Flamelet model]]
- [[Progress variable]]
- [[RANS turbulence modeling]]
- [[Non-premixed combustion]]

---

## 实现建议

- **实现难度**: ⭐⭐⭐⭐ 较高 (需修改flamelet库生成和查表机制)
- **适用场景**: 燃气轮机燃烧室、航空发动机、干法燃烧
