# Inverse PINNs for Manning Friction Estimation in Shallow Water Equations

## 论文信息
- **arXiv**: [2606.18149](https://arxiv.org/abs/2606.18149)
- **日期**: 2026-06-16
- **作者**: Soheil Radfar
- **领域**: physics.flu-dyn, physics.comp-ph, physics.geo-ph

## 摘要 (Abstract)
Physics-informed neural networks (PINNs) 将稀疏观测与物理约束结合，为逆水动力学建模提供前景框架。但其在数据限制下估计水力参数的可靠性尚未充分研究。

本文基准测试逆 PINN 恢复浅水方程 Manning 摩擦系数的能力，考虑观测稀疏性、噪声和观测变量类型的受控变化。

**两种案例**:
1. 一维 MacDonald 亚临界通道（有解析稳态参考解）
2. 二维斜坡通道（抛物线横向河床，用平衡有限体积求解器生成）

**Manning 系数作为可训练正标量**，与流场联合恢复，采用两阶段策略：先拟合观测，再加入物理残差。

## 主要发现
- **二维案例**: 至少 10 个深度和速度观测 + ≤10% 噪声 → 误差 <5%
- **鲁棒性**: 50 个观测 + 20% 噪声仍稳定
- **一维案例**: 约 15% 持续正偏差（结构可辨识性限制，非数据密度限制）
- **关键**: 联合深度-速度信息对可靠逆辨识至关重要

## 数值方法
- **框架**: Physics-informed Neural Networks (PINNs)
- **逆问题**: Manning 摩擦系数估计
- **求解器**: 有限体积法（验证用）
- **两阶段策略**: 观测拟合 → 物理残差融合

## 关键词
- PINNs
- Manning 摩擦系数
- 浅水方程
- 逆问题
- 数据同化

## 应用意义
为评估逆 PINNs 何时能/不能从稀疏噪声浅水观测可靠估计 Manning 摩擦提供可复现基准。

## URL
https://arxiv.org/abs/2606.18149
