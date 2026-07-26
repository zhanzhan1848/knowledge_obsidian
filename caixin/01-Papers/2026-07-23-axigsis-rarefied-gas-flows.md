# 2607.21277 - AxiGSIS: Axisymmetric General Synthetic Iterative Scheme for Rarefied Gas Flows

## 论文信息
- **arXiv ID**: [2607.21277](https://arxiv.org/abs/2607.21277)
- **作者**: Yifan Wen, Lei Wu
- **日期**: 2026-07-23
- **分类**: physics.flu-dyn, physics.comp-ph
- **DOI**: https://doi.org/10.48550/arXiv.2607.21277

## 核心创新点
1. **轴对称一般合成迭代方案(AxiGSIS)**: 模拟稀薄气体流和静电场下带电粒子输运
2. **有限体积离散速度法**: 定义在二维轴对称子午面 + 三维分子速度空间
3. **GSIS框架**: 双向耦合 - 动理学求解器 ↔ 宏观合成系统
4. **加速收敛**: 特别是近连续流态

## 控制方程
- Boltmann方程 / 动理学描述
- 静电场下的带电粒子输运
- 轴对称假设

## 数值方法
- **离散速度法** (Discrete Velocity Method)
- **GSIS (General Synthetic Iterative Scheme)**:
  1. 动理学求解器计算非平衡应力和热通量
  2. 作为源项导入宏观合成系统
  3. 宏观系统快速迭代更新
  4. 修正流场反馈给动理学求解器
- **Bidirectional coupling**: 宏观 ↔ 微观信息双向传播

## 验证案例
1. **Taylor Couette流**: 稀薄气体Couette流
2. **中性喷嘴膨胀流**: 自由分子/过渡流
3. **静电球体绕流**: 带电粒子与静电场耦合
4. **静电加速喷嘴流**: 带电粒子加速

## 关键发现
- AxiGSIS重现参考动理学解
- 准确捕捉轴对称流动物理
- 带电粒子对静电场的响应准确捕捉
- 相比传统动理学迭代，计算开销大幅降低
- 低到中等Knudsen数流效果显著

## 性能提升
- 更少的空间单元
- 更少的迭代步数
- 特别是低/中等Knudsen数流

## 物理应用
- 稀薄气体动力学
- Micro/Nano流
- 带电粒子输运
- 静电喷雾

## 相关概念
- [[Rarefied Gas Dynamics]] - 稀薄气体动力学
- [[Discrete Velocity Method]] - 离散速度法
- [[Knudsen Number]] - Knudsen数
- [[GSIS]] - 一般合成迭代方案
- [[Boltzmann Equation]] - Boltzmann方程

---
tags: #rarefied-gas #LBM-related #kinetic-theory #GSIS #charged-particle #2026
