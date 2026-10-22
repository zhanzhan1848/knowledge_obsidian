---
type: paper
arxiv_id: 2610.30077
title: "A linear, second-order, unconditionally energy-stable scalar-auxiliary-variable scheme for the CHQ viscoelastic phase-separation model"
date: 2026-10-21
cats: [math.NA, cond-mat.soft]
tags: [SAV, Cahn-Hilliard, phase-separation, energy-stable, BDF2, viscoelastic]
agent: caixin
status: processed
---

# CHQ 粘弹性相分离模型：线性、无条件能量稳定的 SAV 格式

- **arXiv**: [2610.30077](https://arxiv.org/abs/2610.30077) (v1, 2026-10-21 17:27 UTC)
- **作者**: Ritesh Bhola, Michael te Vrugt
- **链接**: https://arxiv.org/abs/2610.30077

## 模型

**CHQ 模型**（Cahn–Hilliard–Qiu）：描述聚合物–溶剂混合物的粘弹性相分离。

- 聚合物体积分数 $\varphi$ 的 Cahn–Hilliard 方程
- 与标量体弹性应力 $q$ 的**阻尼弛豫方程**通过**相依赖的交叉扩散通量**双向耦合

## 数值格式

**标量辅助变量（SAV）** 时间离散化 = SAV 双重阱势重构 + BDF2 + 所有相依赖迁移率的二阶外插。

### 三大性质

| 性质 | 说明 |
|------|------|
| (i) **逐步线性** | 耦合结构证明：任意步长下**恰有一解**；作为参考格式的完全非线性 Newton 求解的廉价线性补充 |
| (ii) **精确质量守恒** | 是离散方程本身的**代数恒等式**；唯一漂移来自迭代线性求解器容差 |
| (iii) **无条件稳定** | 对**修正离散能量**，有**精确的一步能量–耗散恒等式** |

该能量恒等式可延拓到此 filtered 变体，并带**两个显式额外的非负项** —— 即实际产生物理结果的格式本身对同一能量可证稳定。

## 验证

- Fourier–Galerkin 实现验证能量恒等式在每步成立到浮点舍入误差
- 二阶时间精度，**包括陡界面（steep-interface）区间**
- 与独立实现的非线性 Newton–BDF2 求解器结果一致

## 性能

相同网格分辨率下，相对 Newton–BDF2：

- 线性求解器迭代数减少 **2.5–3.0×**
- wall-clock 时间减少 **1.7–2.0×**

## 🥢 流体力学视角评述

- **无条件能量稳定 + 线性 + 精确守恒** 是相场模拟（phase-field / 锐界面法）的理想组合，直接适用于：多相流界面、聚合物共混物形态演化、粘弹性液滴粗化（coarsening）。
- 交叉扩散通量 + 弹性应力的双向耦合是本模型难点；SAV + BDF2 给出稳定线性化，避免 Newton 迭代在高界面梯度下的收敛困难。
- 陡界面区间仍保持二阶精度这一点很关键——SAV 的经典弱点正是界面处精度退化。
- 实现可直接复用：**SAV 重构 + BDF2 + 相依赖迁移率外插** 的模块化结构。

## 关联

- [[phase-field-multiphase]] [[SAV-scheme]] [[Cahn-Hilliard]]
