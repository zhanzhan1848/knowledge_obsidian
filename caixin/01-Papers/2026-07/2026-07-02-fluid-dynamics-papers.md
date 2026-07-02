# 流体力学论文笔记 - 2026年7月1日

> 收集日期: 2026-07-02
> 数据来源: arXiv physics.flu-dyn, cs.FL
> 关键词: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence

---

## 1. Flexibility as a Universal Nature-Inspired Mechanism for Thrust Enhancement

**arXiv**: [2606.32021](https://arxiv.org/abs/2606.32021)  
**作者**: Vincenzo Citro  
**日期**: 2026-06-30  
**类别**: physics.flu-dyn  
**DOI**: 10.48550/arXiv.2606.32021

### 摘要
Nature has equipped jet-propelled swimmers with flexible nozzles that outperform rigid ones, yet the origin of this advantage has remained unexplained. By tracking where and when energy is exchanged between fluid and structure, three-dimensional numerical simulations resolve the underlying mechanism: a **standing-wave response** of the nozzle, in which the structure dilates and then recoils synchronously, charging and releasing energy to enhance thrust.

### 核心创新点
- 发现柔性喷嘴产生**驻波响应**（standing-wave response）
- 结构膨胀然后同步回弹，向流体释放能量增强推力
- 超出最佳范围时，结构呈现**行波响应**，膨胀和收缩共存
- 提出物理模型捕获驻波和行波响应的边界条件

### 关键公式/结论
- 最佳状态：**结构固有周期与脉冲持续时间匹配**
- 超出最佳后，喷嘴曲率产生的应变选择了几何形状
- 为软体机器人推进器提供设计原则

### 数值方法
- 3D数值模拟（DNS？）
- 流体-结构耦合

### 相关标签
#生物流体力学 #柔性推进 #喷嘴优化 #软体机器人

---

## 2. Mean-Flow Adjoint Sensitivity Analysis of Unsteady Flow Around Porous Cylinders Using a Homogenized Lattice Boltzmann Method

**arXiv**: [2606.31707](https://arxiv.org/abs/2606.31707)  
**作者**: Shota Ito  
**日期**: 2026-06-30  
**类别**: physics.flu-dyn  
**DOI**: 10.48550/arXiv.2606.31707

### 摘要
Adjoint-based sensitivity analysis is indispensable for large-scale fluid-dynamic design and distributed control problems. This paper presents a **mean-flow adjoint sensitivity analysis framework** for unsteady flows around porous cylinders using the **homogenized lattice Boltzmann method (HLBM)**. Solid structures are modeled as local porous media using **Brinkman penalization**.

### 核心创新点
- HLBM + adjoint sensitivity analysis 框架
- 使用自动微分生成伴随内核，包含**亚网格尺度(SGS)湍流模型**用于LES
- 直接比较**frozen turbulence assumption (FTA)**与真实LES梯度

### 数值方法
- **Lattice Boltzmann Method (LBM)** - 均质化版本
- **Brinkman penalization** for porous media
- **Large Eddy Simulation (LES)**
- Automatic Differentiation for adjoint gradients
- 湍流 case: Re = 3900

### 应用场景
- 钝体绕流（porous cylinders）
- 目标函数: drag and energy dissipation
- 设计优化与分布式控制

### 相关标签
#LBM #伴随优化 #多孔介质 #LES #敏感性分析

---

## 3. Lagrangian velocity statistics of homogeneous isotropic turbulence in dilute polymer solutions

**arXiv**: [2606.31283](https://arxiv.org/abs/2606.31283)  
**作者**: Yusuke Koide  
**日期**: 2026-06-30  
**类别**: physics.flu-dyn, cond-mat.soft  
**DOI**: 10.48550/arXiv.2606.31283

### 摘要
Direct numerical simulations of homogeneous isotropic turbulence in dilute polymer solutions to investigate **Lagrangian velocity statistics**. Shows how polymers modulate the power spectral density of Lagrangian velocity and Lagrangian integral timescale.

### 核心创新点
- **尺度分解分析**: 将Lagrangian速度分解为不同尺度涡结构的贡献
- 聚合物抑制涡结构，从**小尺度到大尺度**依次进行
- 聚合物弛豫时间增加 → 高频→低频功率谱密度衰减

### 关键发现
1. 功率谱密度随聚合物弛豫时间增加而衰减
2. Lagrangian积分时间尺度增加
3. 聚合物诱导的涡抑制从小尺度向大尺度发展

### 数值方法
- **Direct Numerical Simulation (DNS)**
- 均匀各向同性湍流
- 聚合物溶液模型

### 相关标签
#湍流 #聚合物溶液 #Lagrangian统计 #DNS #湍流调制

---

## 4. New numerical methods for calculating statistical equilibria of two-dimensional turbulent flows

**arXiv**: [2606.31141](https://arxiv.org/abs/2606.31141)  
**日期**: 2026-06-30  
**类别**: physics.flu-dyn, nlin.AO, nlin.CD, nlin.PS  
**DOI**: 10.48550/arXiv.2606.31141

### 摘要
New numerical methods for the **mixing entropy maximization problem** in the context of Miller-Robert-Sommeria (MRS) statistical mechanics theory of 2D湍流, particularly for spherical geometry. 

### 核心创新点
- **canonical** 问题方法 (×2)
- **microcanonical** 问题方法 (×1)
- 基于原始MRS理论，保留所有**Casimir不变量**
- 更容易检测**多统计平衡态**
- 更容易搜索**破缺纬向对称**的解

### 方法优势
- 相比前人方法，更容易检测多重统计平衡
- 可处理多涡度级别patch的初值分布
- 从任意初值获取统计平衡 → 广泛应用于地球流体力学

### 应用场景
- 二维湍流统计力学
- 球面几何
- 纬向对称破缺
- 地球流体力学

### 相关标签
#二维湍流 #统计力学 #MRS理论 #Casimir不变量 #数值方法

---

## 5. Dripping-onto-droplet rheometry of sodium alginate solutions

**arXiv**: [2606.30907](https://arxiv.org/abs/2606.30907)  
**作者**: Anselmo Pereira  
**日期**: 2026-06-29  
**类别**: physics.flu-dyn  
**DOI**: 10.48550/arXiv.2606.30907

### 摘要
Experimental and theoretical study assessing **extensional relaxation time** of sodium alginate solutions using **dripping-onto-droplet capillary breakup rheometry (DoD)**.

### 核心创新点
- 从Newtonian推广到**黏弹性流体**
- 高速摄像机记录实验
- 藻酸钠浓度: 0.1%-8%

### 流动状态
1. **毛细-惯性** (Capillary-inertial)
2. **毛细-弹性** (Capillary-elastic)
3. **混合毛细-惯弹性** (Mixed capillary-inertio-elastic)

### 关键参数
- **Deborah数** ( extensional relaxation time / capillary-inertial time )
- 可从丝断裂时间量化弛豫时间和表面张力

### 相关标签
#流变学 #黏弹性 #表面张力 #DoD #藻酸钠

---

## 6. Influence of wind shear and veer on power, thrust, and induction of an actuator disk

**arXiv**: [2606.30830](https://arxiv.org/abs/2606.30830)  
**日期**: 2026-06-29  
**类别**: physics.flu-dyn  
**DOI**: 10.48550/arXiv.2606.30830

### 摘要
Wind shear and veer effects on actuator disk-modeled wind turbine using **concurrent-precursor large-eddy simulations (LES)**. Shows shear and veer can reduce wind power efficiency by **more than 20%**.

### 核心发现
**几何效应** (Geometric effects):
- 由转子等效风速变化引起

**感应效应** (Inductive effects):
- 剪切: 通过局部感应变化调制功率系数
- 扭转: 在转子尺度产生不利压力梯度

### 关键结论
- 几何效应和感应效应近似**线性叠加**
- 感应效应占总损失很大比例
- 现有工程模型忽略了剪切、扭转和壁面接近对感应的影响

### 数值方法
- **Large Eddy Simulation (LES)**
- Actuator disk model
- 大气边界层 (ABL) 模拟
- 分层条件

### 相关标签
#风力发电机 #LES #大气边界层 #风剪切 #风扭转 #风力发电优化

---

## 7. Weak and dissipative solutions for the Hasegawa-Mima equation

**arXiv**: [2607.01119](https://arxiv.org/abs/2607.01119)  
**作者**: Michele Gorini  
**日期**: 2026-07-01  
**类别**: math.AP  
**DOI**: 10.48550/arXiv.2607.01119

### 摘要
考虑Hasegawa-Mima方程的"Euler-like"速度形式：
$$\partial_t(u-\Delta^{-1}u)+(u\cdot\nabla)u-u^\perp\log n_0=0$$

### 核心创新点
- 证明耗散解的存在性（任意$L^2$无散度初值）
- 域: $\mathbb{T}^2$ 和有界$\mathcal{C}^1$域
- 相对能量不等式
- 类似Leray对Navier-Stokes方程的结果

### 相关标签
#Hasegawa-Mima方程 #偏微分方程 #数学流体动力学 #耗散解

---

## 8. Three-Dimensional Simulations of Type Ia Supernova Remnants (cross-list)

**arXiv**: [2607.00354](https://arxiv.org/abs/2607.00354)  
**日期**: 2026-07-01  
**类别**: astro-ph.HE, astro-ph.GA, astro-ph.SR  
**DOI**: 10.48550/arXiv.2607.00354

### 摘要
使用GADGET (SPH) 和 RAMSES (grid-based) 模拟Ia型超新星遗迹与主序伴星的相互作用。

### 方法
- **SPH** (GADGET): 粒子方法
- **RAMSES**: 网格方法
- SPH→网格映射

### 发现
- 网格方法更适合追踪流体动力学不稳定（Rayleigh-Taylor）
- 尽管有些SNR形态相似，但高度不对称膨胀难以仅用 ejecta-companion 相互作用解释

### 相关标签
#天体流体力学 #SPH #RAMSES #超新星遗迹 #Rayleigh-Taylor不稳定性

---

## 本期总结

| 论文ID | 主题 | 方法 | 相关度 |
|--------|------|------|--------|
| 2606.32021 | 柔性推进 | 3D DNS, FSI | ⭐⭐⭐⭐ |
| 2606.31707 | LBM伴随优化 | HLBM, AD, LES | ⭐⭐⭐⭐⭐ |
| 2606.31283 | 聚合物湍流 | DNS | ⭐⭐⭐⭐ |
| 2606.31141 | 2D湍流统计平衡 | MRS理论 | ⭐⭐⭐⭐ |
| 2606.30907 | 黏弹性流变学 | DoD实验 | ⭐⭐⭐ |
| 2606.30830 | 风力机LES | LES, Actuator disk | ⭐⭐⭐⭐ |
| 2607.01119 | Hasegawa-Mima | 理论分析 | ⭐⭐⭐ |
| 2607.00354 | 超新星模拟 | SPH/Grid | ⭐⭐⭐ |

### 重点关注
1. **2606.31707** - LBM + adjoint sensitivity + LES 的结合非常值得关注
2. **2606.31141** - 2D湍流统计力学方法对地球流体力学有参考价值
3. **2606.31283** - 聚合物对湍流的调制机制

---
*由 鲜毛肚 (Xianmaodu) 自动收集于 2026-07-02*
