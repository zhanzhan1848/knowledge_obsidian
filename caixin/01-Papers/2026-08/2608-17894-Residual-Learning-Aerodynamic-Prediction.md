---
title: "A Residual Learning Approach for Unsteady Aerodynamic Load Prediction"
arxiv: "2608.17894"
date: 2026-08-19
tags: [CFD, machine-learning, aerodynamics, LSTM, unsteady-aerodynamics, aeroelasticity]
categories: [machine-learning-cfd, aerodynamic-prediction]
---

# A Residual Learning Approach for Unsteady Aerodynamic Load Prediction

## 论文信息
- **arXiv**: [2608.17894](https://arxiv.org/abs/2608.17894)
- **Subjects**: Fluid Dynamics (physics.flu-dyn); Machine Learning (cs.LG)
- **关键词**: LSTM, residual learning, unsteady aerodynamics, CFD, Wagner function

## 核心创新点

### 问题背景
- 航空弹性应用中的非定常气动载荷预测
- 跨音速流动区域存在激波运动
- 传统低阶气动模型难以准确捕捉复杂流动现象

### 方法论
1. **基线模型**: 使用基于 Wagner 函数的解析非定常气动模型
2. **残差学习**: 训练 LSTM 神经网络学习 CFD 升力系数与 Wagner 预测之间的差异
3. **对比研究**: 将残差模型与直接神经网络模型进行比较

### 关键发现
- 当输入与 Wagner 公式变量一致时，残差模型表现最佳
- 残差模型泛化能力更好（leave-one-out 和 leave-family-out 测试）
- 直接模型在某些高频情况下仍然更准确
- 残差学习方法可作为增强经典低阶气动理论的模块化方法

## 数值方法细节
- **CFD 数据**: NLR 7301 翼型 benchmark，高保真 CFD 升力数据
- **训练数据**: 预定义俯仰和沉浮运动的跨音速流动
- **神经网络**: LSTM（长短期记忆网络），适合处理具有气动记忆效应的序列数据
- **验证**: 正弦和非正弦运动、外部 benchmark case

## 公式/方法
- Wagner 函数用于描述升力随时间的滞后响应
- 残差模型: $\Delta C_L = C_L^{CFD} - C_L^{Wagner}$
- 直接模型: 直接预测 $C_L^{CFD}$

## 计算成本
- 27 页，21 图，9 表
- 需大量 CFD 模拟数据用于训练

## 相关研究链接
- [[LSTM fluid dynamics]]
- [[Physics-informed neural networks]]
- [[Reduced order modeling aerodynamics]]

## 评估
- ✅ 推荐：展示了残差学习在增强经典气动理论方面的潜力
- 适用于需要结合物理先验和机器学习的工程应用
