# Solution of the Newtonian Plane Couette Flow with Dynamic Wall Slip using Machine-Learning Methods

> **arXiv**: [2606.18499](https://arxiv.org/abs/2606.18499)  
> **Category**: physics.flu-dyn  
> **Submitted**: Wed, 17 Jun 2026

## 核心创新点

- **PINN vs DeepONet 对比**: 首次系统对比 Physics-Informed Neural Networks 和 data-driven DeepONets 在动态壁面滑移 Couette 流问题上的表现
- **动态滑移边界**: 上壁速度 + 滑移边界条件联合参数化
- **操作符学习**: DeepONet 学习从参数到解的连续映射算子

## 控制方程

- **物理模型**: 牛顿流体平面 Couette 流，动态壁面滑移
- **传统求解**: Crank-Nicolson 格式
- **滑移模型**: 动态滑移边界条件（滑移速度随时间/位置变化）

## 关键结果对比

| 方法 | 点-wise 精度 | 泛化能力 | 推理速度 |
|------|------------|---------|---------|
| PINN | L₂ 误差 0.083% | 需逐案重训练 | 慢（逐案求解）|
| DeepONet | 平均误差 0.36% (unseen), 0.88% (OOD) | 强泛化 | **540X 加速** |

## 技术要点

- **PINN**: 物理约束神经网络，需实例重训练
- **DeepONet**: 数据驱动操作符网络，一次训练，跨参数泛化
- **动态滑移**: 非平稳边界条件，增加问题复杂度

## 应用场景

- 微观流体力学（微通道、滑移壁面）
- 实时流动预测
- 参数化流动分析

## 关联技术

- [[PINN (Physics-Informed Neural Networks)]]
- [[DeepONet (Deep Operator Networks)]]
- [[Couette 流]]
- [[壁面滑移边界条件]]
- [[机器学习求解 PDE]]

## 可行性分析: ML 加速 Couette 流求解

## 控制方程
牛顿流体 Couette 流，动态滑移边界

## 数值方法
- 传统：Crank-Nicolson（基准）
- PINN：物理约束神经网络
- DeepONet：算子学习

## 计算成本
- PINN：单次推理慢，但无需网格
- DeepONet：训练成本高，推理极快 (540X)
- 适合实时/参数化场景

## 推荐结论
✅ 推荐 — DeepONet 在参数化流动问题上优势明显，适合需要快速推理的场景

---
*Tags*: #PINN #DeepONet #Couette流 #机器学习 #CFD #操作符学习
