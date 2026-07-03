---
type: paper
created: 2026-07-03
updated: 2026-07-03
tags: [physics.flu-dyn, navier-stokes, multiphase-flow, poiseuille-flow, coexistence]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2607.02310
---

# Pressure-drop localization and momentum insulation in liquid-gas coexistence Poiseuille flow

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Pressure-drop localization and momentum insulation in liquid-gas coexistence Poiseuille flow |
| **作者** | Naoko Nakagawa, Shin-ichi Sasa |
| **发表** | arXiv 2607.02310, 2026-07-02 |
| **链接** | [原文](https://arxiv.org/abs/2607.02310) / [PDF](https://arxiv.org/pdf/2607.02310) |
| **DOI** | 10.48550/arXiv.2607.02310 |
| **代码** | N/A |
| **subjects** | Fluid Dynamics (physics.flu-dyn); Statistical Mechanics (cond-mat.stat-mech) |

---

## 核心贡献

> 研究液-气共存的泊肃叶流（Poiseuille flow）中压力降定位和动量绝缘效应

1. **压力降局部化**: 发现弱驱动下，压差集中在相界面区域，常规泊肃叶粒子流被强烈抑制
2. **动量绝缘效应**: 识别出描述共存泊肃叶流的极小无量纲参数 $A^L$ 和 $A^G$（来自微观-宏观长度比的平方）
3. **界面冷却机制**: 等温储层下，残余粒子流产生界面冷却效应

---

## 技术方案

### 核心思想

利用泊肃叶流和傅里叶热传导的体区域方程，结合粒子和能量守恒，分析液-气共存体系的流体动力学行为。

### 关键物理量

| 参数 | 含义 |
|------|------|
| $A^L, A^G$ | 极小无量纲参数，描述共存泊肃叶流 |
| $Fr$ | 弗劳德数（分层流特征）|

---

## 公式

### 体积区域方程
- 泊肃叶流：$u_{par}(y) = u_{max} \left(1 - \frac{y^2}{h^2}\right)$
- 傅里叶热传导：$q = -\kappa \nabla T$

### 界面条件
- 粒子守恒
- 能量守恒
- 压力降集中在界面区域

---

## 物理机制

### 压力降局部化
在弱驱动条件下，液相和气相区域的压力梯度几乎为零，压差全部集中在相界面附近很薄的区域内。

### 动量绝缘
由于 $A^L, A^G \ll 1$，动量从壁面到流体的传递被界面有效阻挡，导致主流区速度接近零。

### 界面冷却
等温边界条件下，残余的粒子流通过界面时产生冷却效应，这是液-气共存流特有的非平衡效应。

---

## 实验结论

- **参数范围**: 弱驱动，宏观液相和气相区域共存
- **核心发现**: 压力差集中在界面；粒子流被强烈抑制
- **应用场景**: 多相流管道输运、相变传热、微通道流体

---

## 局限性

- 限于一维稳态分析
- 假设绝热壁面
- 未考虑表面张力效应

---

## 相关概念

- [[泊肃叶流]]
- [[液-气相变]]
- [[多相流]]
- [[界面传热]]

---

## 实现建议

- **实现难度**: ⭐⭐（理论分析为主）
- **数值方法**: 需耦合求解N-S方程与相变模型
- **适用场景**: 多相流管道设计、蒸发冷却系统
