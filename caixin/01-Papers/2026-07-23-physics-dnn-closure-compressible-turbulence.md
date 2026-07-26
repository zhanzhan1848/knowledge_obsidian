# 2607.21152 - Physics-Assisted DNN Closure for Velocity Gradient Dynamics in Compressible Flows

## 论文信息
- **arXiv ID**: [2607.21152](https://arxiv.org/abs/2607.21152)
- **作者**: Deep Shikha, Sawan S Sinha
- **日期**: 2026-07-23
- **分类**: physics.flu-dyn
- **DOI**: https://doi.org/10.48550/arXiv.2607.21152

## 核心创新点
1. **热力学梯度场(TGF)张量**: 表示可压缩流中热力学场对速度梯度动力学的影响
2. **H-EHEE模型 (Hybrid Enhanced Homogenized Euler Equation)**: 结合现象学和数据驱动的封闭框架
3. **压力Hessian张量 $\rho\boldsymbol{H}$ 封闭**: 基于现有现象学封闭
4. **旋转张量 $\boldsymbol{B}$ 的DNN封闭**: 神经网络学习旋转生成机制
5. **振动非平衡效应封闭**: 数据驱动的振动非平衡效应封闭

## 控制方程
- 可压缩湍流速度梯度演化方程
- 热力学梯度场(TGF)张量
- 压力Hessian张量 $\rho\boldsymbol{H}$
- 旋转张量 $\boldsymbol{B}$

## 数值方法
- **方法**: 物理辅助深度神经网络 (Physics-Assisted DNN)
- **张量基**: 新型张量基，允许非对称特征
- **验证**: DNS数据对比

## 关键发现
- H-EHEE模型与DNS统计密切一致
- 在高度可压缩流态显著优于现有模型
- 捕捉小尺度结构的非线性物理

## 模型架构
- **H tensor 封闭**: 现象学方法
- **B tensor 封闭**: 神经网络学习
- **振动非平衡**: 数据驱动封闭
- **结合方式**: 混合现象学 + 数据驱动

## 性能指标
- 多种湍流马赫数范围测试
- 与DNS和现有可压缩速度梯度模型对比
- 高度可压缩流态显著改进

## 应用场景
- 可压缩湍流
- 高马赫数流动
- 小尺度结构动力学
- 振动非平衡效应

## 相关概念
- [[Velocity Gradient Dynamics]] - 速度梯度动力学
- [[Turbulence Modeling]] - 湍流建模
- [[Compressible Flow]] - 可压缩流
- [[Neural Network Closure]] - 神经网络封闭
- [[Pressure Hessian]] - 压力Hessian
- [[Baroclinic Torque]] - 旋转矩

---
tags: #turbulence #deep-learning #compressible-flow #closure-modeling #velocity-gradient #2026
