---
type: paper
created: 2026-08-23
updated: 2026-08-23
tags: [VOF, multiphase, mass-transfer, CFD, finite-volume]
status: processed
domain: fluid-dynamics
agent: caixin
source: https://arxiv.org/abs/2608.19254
---

# A Sharp and Conservative VOF Method for Multicomponent Liquid--Gas Mass Transfer: Bubble Dissolution and Droplet Evaporation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A Sharp and Conservative VOF Method for Multicomponent Liquid--Gas Mass Transfer: Bubble Dissolution and Droplet Evaporation |
| **作者** | Shuo Zhao et al. |
| **发表** | arXiv:2608.19254 [physics.flu-dyn], Aug 2026 |
| **链接** | [原文](https://arxiv.org/abs/2608.19254) |
| **DOI** | 10.48550/arXiv.2608.19254 |
| **代码** | - |

---

## 核心贡献

> 提出一种尖锐（sharp）且守恒的几何 VOF 有限体积方法，用于多组分液-气相间传质

1. **Fully sharp two-field treatment**: 物种和温度方程在液相和气相中分别求解，界面处通过嵌入边界离散化施加 Robin 边界条件和通量跳跃条件
2. **避免正则化**: 不使用体积正则化界面源项，也不依赖前一时间步的界面数据
3. **几何对流格式**: 对体积、动量、能量和物种传输使用一致的几何对流格式
4. **二阶精度**: 验证了二阶精度、准确的界面通量预测和良好的质量/能量守恒性

---

## 技术方案

### 核心思想

多组分液-气传质问题中，多个物种通过界面质量平衡、潜热交换和汽液平衡相互耦合。传统 VOF 方法通过体积正则化处理界面，会模糊界面并引入数值扩散。本文提出完全尖锐的两场处理方法：

- **物种方程**: 在液相和气相中分别求解，通过重构界面上的单向 Robin 条件施加
- **温度方程**: 在两相中分别求解，通过重构界面上的双侧通量跳跃条件施加
- **耦合策略**: 顺序耦合策略确定部分界面质量通量、闭合温度方程并更新热力学平衡状态

### 关键技术

| 技术 | 说明 |
|------|------|
| 几何 VOF | 界面重构（PLIC）用于精确追踪变形界面 |
| 嵌入边界离散化 | 界面处直接施加边界条件，避免正则化 |
| 一致几何对流 | 对所有守恒量使用相同的高阶对流格式 |
| 顺序耦合 | 迭代求解物种和温度场的耦合问题 |
| 汽液平衡状态方程 | 用于计算界面处的平衡分压 |

---

## 公式

### 界面物种守恒

沿界面 $S$ 的物种质量通量满足：
$$\oint_S \rho (Y_i \mathbf{u} - \mathbf{J}_i) \cdot \mathbf{n} \, dS = \dot{m}_i$$

其中 $Y_i$ 为物种质量分数，$\mathbf{J}_i$ 为扩散通量，$\dot{m}_i$ 为界面传质率。

### 温度跳跃条件

跨界面温度满足：
$$k_l \nabla T_l \cdot \mathbf{n} - k_g \nabla T_g \cdot \mathbf{n} = \sum_i \dot{m}_i h_i$$

### Robin 边界条件（物种）

液相侧：$-\rho D_i \nabla Y_i \cdot \mathbf{n} = k_i (Y_i - Y_i^{eq})$，其中 $k_i$ 为传质系数。

---

## 验证算例

- **单组分气泡溶解**: 验证传质精度
- **多组分气泡溶解**: 验证气体置换、挥发逆转和组份驱动马格努斯流
- **单组分液滴蒸发**: 验证蒸发过程
- **非理想乙醇-异辛烷液滴蒸发**: 验证非理想混合物行为
- **坐滴蒸发**: 验证润湿边界条件

---

## 局限性

- 目前仅限二维或轴对称问题
- 需要事先知道热力学平衡关系
- 对高密度比界面追踪有挑战

---

## 实现建议

- **实现难度**: 高（需要几何 VOF 重构、嵌入边界处理、相平衡求解器）
- **预期性能**: 二阶精度，质量/能量守恒
- **适用场景**: 多相流 CFD，气泡动力学，喷雾燃烧，化工过程
- **参考实现**: Basilisk/PHOTOS 等开源代码

---

## 相关工作

- [[VOF方法]]
- [[多相流]]
- [[界面传质]]
- [[几何对流格式]]

---

## 摘要

本文提出了一种尖锐且守恒的几何 VOF-有限体积方法，用于求解多组分液-气相间传质问题。方法的核心创新是完全尖锐的两场处理：物种和温度方程在液相和气相中分别求解，在重构界面上直接施加单向 Robin 条件（物种）和双侧通量跳跃条件（温度）。避免了体积正则化和前一时间步界面数据的显式耦合。验证了二阶精度和良好的守恒性。
