---
tags: [渲染, 可微模拟, 异质材料, GPU加速, 弹性动力学, 接触, 2026]
date: [[2026-05-16]]
status: 待读
---

# DiffPhD: Unified Differentiable Solver for Projective Heterogeneous Materials in Elastodynamics

## 基本信息

| 属性 | 值 |
|------|-----|
| 作者 | Shih-Yu Lai, Peter Yichen Chen, Tiantian Liu 等 |
| 链接 | [arXiv:2605.14526](https://arxiv.org/abs/2605.14526) |

## 核心贡献

1. 提出 **DiffPhD**，统一 GPU 加速可微 Projective Dynamics 框架
2. 解决异质材料、大刚度对比、超弹性大变形和丰富接触交互的挑战
3. 关键创新：
   - 刚度感知投影权重：将异质性嵌入全局系统
   - Trust-region 特征值过滤：为稳定超弹性梯度在反向传播中提升
   - 类型-II Anderson 加速：双门收敛方案稳定大步长刚度对比下的前向迭代
   - 统一 GPU 管道：前向、反向和接触计算重用单一稀疏因子

## 技术方案

### 核心问题
现有可微模拟方法（如 DiffPD）难以处理：
- 异质材料与极端刚度对比
- 大变形下的超弹性
- 丰富接触交互

### DiffPhD 关键设计
1. **刚度感知投影权重**：将异质性嵌入全局系统
2. **Trust-region 特征值过滤**：在反向传播中提升，稳定超弹性梯度
3. **类型-II Anderson 加速**：双门收敛方案
4. **统一 GPU 管道**：单一稀疏因子用于前向、反向和接触计算

## 可行性分析

- **实现难度**：高（涉及 GPU 编程和数值优化）
- **实用价值**：高（Real2Sim 转换、系统辨识、轨迹优化）
- **渲染相关度**：中（可微模拟可用于渲染管线优化）

## 相关链接

- [PDF](https://arxiv.org/pdf/2605.14526)
- [HTML](https://arxiv.org/html/2605.14526v1)