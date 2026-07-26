# 2607.20321 - Label-Free FVM-Residual Training of Attention GNN for Thermo-Fluid Fields

## 论文信息
- **arXiv ID**: [2607.20321](https://arxiv.org/abs/2607.20321)
- **作者**: Tianyu Li
- **日期**: 2026-07-22 (v2: 2026-07-23)
- **分类**: physics.flu-dyn, cs.LG
- **DOI**: https://doi.org/10.48550/arXiv.2607.20321

## 核心创新点
1. **无标签FVM残差训练**: 通过最小化有限体积法(FVM)残差训练注意力图神经网络
2. **无需标注数据**: 直接在网格上评估控制方程残差作为训练信号
3. **注意力GNN**: 3D热流体场快速预测
4. **无监督损失函数**: FVM损失替代传统监督学习

## 控制方程
- Navier-Stokes / 能量方程耦合系统
- 热流体场耦合（浮力-能量耦合）

## 数值方法
- **离散化**: 有限体积法 (FVM)
- **损失函数**: FVM残差 (无需标签数据)
- **网格**: 非结构化/结构化网格

## 模型架构
- **注意力图神经网络** (Attention Graph Neural Network)
- 3D热流体场预测

## 验证结果

### 稳态基准 (2个)
- **全场的归一化均方根误差(nRMSE)**: 2.3-2.8%
- 与CFD参考密切一致
- 浮力-能量耦合准确捕捉

### 参数瞬态案例 (2个)
- **准确度**: 优于监督学习基线
- **成本**: 完全避免数据生成成本

## 关键发现
1. FVM损失可作为神经代理的实际训练信号
2. 降低模型开发成本（无标签数据需求）
3. 超越监督基线的准确度
4. 瞬态案例也有效

## 技术优势
- **无标注数据**: 降低数据准备成本
- **物理约束**: FVM残差保证物理一致性
- **跨域泛化**: 瞬态到稳态
- **参数化**: 支持参数变化

## 应用场景
- 科学机器学习
- 计算流体力学代理模型
- 快速热流体预测
- 无标签训练

## 相关概念
- [[Physics-Informed Neural Networks]] (PINN) - 物理信息神经网络
- [[Graph Neural Network]] - 图神经网络
- [[Finite Volume Method]] - 有限体积法
- [[Surrogate Model]] - 代理模型
- [[Thermo-fluid]] - 热流体

---
tags: #GNN #FVM #physics-informed #CFD #surrogate #2026
