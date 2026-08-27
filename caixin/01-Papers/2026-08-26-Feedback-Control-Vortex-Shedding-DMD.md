---
type: paper
created: 2026-08-26
updated: 2026-08-26
tags: [vortex-shedding, feedback-control, data-driven, DMDc, reduced-order-model, LQG, fluid-dynamics]
status: new
agent: caixin
---

# Feedback Control of Vortex Shedding Using Data-Driven Modelling

## 论文信息

| 字段 | 内容 |
|------|------|
| **arXiv** | [2608.24435](https://arxiv.org/abs/2608.24435) |
| **类别** | physics.flu-dyn |
| **作者** | Jack Proudfoot, Chris J. Nicholls, Brian M. T. Tang, Marko Bacic |
| **发表日期** | 2026-08-25 |
| **DOI** | 10.48550/arXiv.2608.24435 |
| **文件大小** | 17,716 KB |

## 核心贡献

基于数据驱动建模的圆柱绕流涡街反馈控制研究（Re=1000）。使用动态模态分解与控制（DMDc）从2D非稳态模拟数据中提取线性降阶模型，并设计LQG控制器。揭示了降阶模型阶数与控制性能的复杂关系。

## 关键发现

### 模型阶数效应（重要发现）
- **至少需要 4 阶模型**才能有效抑制涡街
- **最佳性能**：9 阶模型
- **高阶模型（>14阶）性能反而下降**：由于"水床效应"（waterbed effect）
- **物理解释**：Bode 积分定理，未建模动力学频段敏感性增加

### 控制性能
- 升力系数方差降低 **28.6 dB**
- 阻力降低 **26%**
- 2D URANS 训练 → 3D DDES 验证，仍有 **13.7%** 阻力降低

### 工程意义
- 2D URANS 仿真足以用于降阶建模和控制设计
- 证明了数据驱动控制在湍流分离流中的可行性

## 数值方法

### 训练数据
- 2D 非稳态模拟（URANS）
- 仅使用升力测量信号

### 降阶建模
- **DMDc（Dynamic Mode Decomposition with Control）**
- 线性状态空间模型
- 不同阶数（4~20阶）对比

### 控制设计
- **LQG 控制器**
- 外扰抑制、噪声衰减、参数不确定性分析

## 物理机制

### 涡街控制物理
- 旋涡脱落频率（Strouhal 频率）附近的相位控制
- 升力反馈 → 主动表面振荡/吹吸

### 水床效应
- 灵敏度函数积分约束（Bode  integrals）
- 高阶模型引入更多未建模高频模态 → 控制性能下降

## 控制方程

N-S 方程线性化（ حول定常解）：
$$\frac{\partial \mathbf{u}}{\partial t} = \mathbf{A}\mathbf{u} + \mathbf{B}\mathbf{w}$$

其中 $\mathbf{w}$ 为控制输入，$\mathbf{A}$ 为系统矩阵（从 DMDc 提取）。

## 计算成本

- 仿真数据：2D URANS，Re=1000
- DMDc 计算：O(n³)，n 为数据快照数
- LQG 求解：Riccati 方程，O(n³)

## 工程应用

- 海洋平台、桥梁的涡激振动（VIV）控制
- 管线湍流减阻
- 主动流动控制（AFC）

## 可行性分析

🥢 可行性分析：涡街反馈控制

## 控制方程
- 线性化 N-S（系统矩阵 A 从 DMDc 数据驱动识别）
- LQG 最优控制：状态估计 + 线性二次调节

## 数值方法
- 离散化：DMDc（动态模态分解）
- 求解器：LQG（Kalman 滤波 + 线性二次调节）
- 稳定性：闭环极点位置分析

## 计算成本
- 离线数据采集：2D URANS 长时间序列
- DMDc 识别：SVD 截断 + 最小二乘
- 在线控制：低阶矩阵乘法，实时可行

## 推荐结论
✅ 推荐实现（主动流动控制研究）
