# Physics-informed neural network for inverse modeling of granular flows

**arXiv:** [2608.18641v1](https://arxiv.org/abs/2608.18641v1)  
**Published:** 2026-08-19  
**Category:** physics.flu-dyn  
**Tags:** #granular-flow #PINN #inverse-problem #CFD #sparse-measurement

## 核心创新点

- 针对**未知边界条件（入口、出口、壁面）**的颗粒流反演问题
- 提出基于物理信息和测量数据的 PINN 框架，从稀疏观测重建完整流场
- 适用于 CFD 模拟困难场景下的反问题

## 框架设计

### 关键技术创新

1. **无量纲损失函数 formulation**：适配颗粒流特性
2. **物理信息初始化**：提高训练收敛性
3. **动态全局加权**：平衡方程守恒与数据拟合
4. **局部加权颗粒温度数据损失策略**：捕捉非均匀流动特征

### 训练数据

- CFD 高保真解生成的连续介质模型数据
- 稀疏测量数据集成

## 控制方程

- 颗粒流连续介质模型（速度场、浓度场、颗粒温度）
- 本构关系：颗粒温度模型

## 应用场景

- 管道中颗粒流的稳态全流场重建
- 边界条件未知时的流场反演

## 结论

- 建立了复杂颗粒流系统流场重建的鲁棒方法论框架
- 稀疏数据 + 物理规律 + 高保真 CFD 数据训练 → 准确流场重建

## 关键词
#granular-flow #PINN #inverse-problem #sparse-measurement #CFD-surrogate
