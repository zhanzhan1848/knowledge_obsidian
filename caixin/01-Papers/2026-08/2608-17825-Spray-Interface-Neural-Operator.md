---
title: "Towards Rapid Prototyping of Spray Injectors: A Regime-Agnostic Neural Operator Surrogate for Gas-Liquid Interface Evolution"
arxiv: "2608.17825"
date: 2026-08-19
tags: [CFD, neural-operator, spray-atomization, VOF, FNO, SDF, two-phase-flow, surrogate-model]
categories: [machine-learning-cfd, spray-atomization]
---

# Towards Rapid Prototyping of Spray Injectors: Neural Operator Surrogate for Gas-Liquid Interface

## 论文信息
- **arXiv**: [2608.17825](https://arxiv.org/abs/2608.17825)
- **Subjects**: Fluid Dynamics (physics.flu-dyn); Computational Physics (physics.comp-ph)
- **关键词**: Fourier Neural Operator, signed distance function, spray atomization, Volume-of-Fluid

## 核心创新点

### 科学问题
- 喷雾雾化在许多工业过程中至关重要
- 实验无法覆盖所有喷雾区域
- CFD 在细结构发展时计算成本过高

### 方法论
1. **主模型**: 边界条件傅里叶神经算子 (FNO)
2. **预测目标**: 有符号距离函数 (SDF) 从液-气界面的演化
3. **训练数据**: 2D sharp interface VOF CFD 模拟，涵盖多种雾化机制
4. **物理信息正则化**:
   - 液体守恒惩罚
   - 窄带 Eikonal 正则化（保持有符号距离几何）
   - 相界惩罚

### 关键发现
- SDF-FNO 比直接在体积分数上训练的 FNO 更好地保留界面特性
- U-Net 性能优于 SDF-FNO
- 物理信息正则化在训练稳定性上有帮助，但对预测误差改善有限
- 成功演示了固定几何形状操作范围内喷射条件的排序

## 数值方法细节
- **VOF 方法**: Sharp interface Volume-of-Fluid 模拟
- **神经网络**: 
  - Fourier Neural Operator (FNO)
  - U-Net 对比
  - 边界条件处理
- **SDF**: Signed Distance Function 用于界面表示
- **长时间自回归预测**: 喷雾界面演化预测

## 物理方程
- 有符号距离函数: $\phi(x,t)$ 表示到界面的距离
- Eikonal 方程: $|\nabla \phi| = 1$
- 液体守恒约束

## 应用价值
- 快速设计空间探索
- 操作条件排序
- 最终实现喷雾控制

## 评估
- ✅ 推荐：展示了神经网络算子在多相流界面演化中的应用潜力
- 对于喷雾系统快速原型设计具有重要价值
