# DiffPhD: Unified Differentiable Solver for Heterogeneous Materials in Elastodynamics

> **日期**: 2026-05-15  
> **来源**: arXiv cs.GR  
> **ID**: [arXiv:2605.14526](https://arxiv.org/abs/2605.14526)  
> **领域**: 可微仿真 / 软体模拟 / 物理仿真

## 核心贡献

**DiffPhD** 是一个统一的 GPU 加速可微 Projective Dynamics 框架，用于非均匀材料的弹性动力学仿真。

### 关键挑战与解决方案

1. **异质材料 + 极端刚度对比**
   - **Stiffness-aware projective weights**: 将异质性嵌入全局系统

2. **超弹性 + 大变形**
   - **Trust-region eigenvalue filtering**: 后向传递稳定超弹性梯度
   - **Type-II Anderson Acceleration**: 双门收敛方案

3. **接触丰富交互**
   - **统一 GPU 管道**: 前向、后向和接触计算重用单一稀疏因子
   - **Stiffness-amplified Rayleigh damping**: 零递归成本的异质感知耗散

## 渲染/仿真方法
- **类型**: 体积仿真 / 物理仿真
- **技术**: 可微 Projective Dynamics (DiffPD)

## 性能表现
- **GPU 加速**: 统一的 CUDA 管道
- **应用场景**: Real2Sim 转移、系统辨识、轨迹优化

## 创新点

- **异质材料支持**: 同时处理刚度对比、摩擦和接触
- **GPU 端到端**: 单一稀疏因子贯穿前向/后向/接触计算
- **可微仿真**: 支持系统辨识和 Real2Sim 转移

## 相关技术
- Projective Dynamics
- Anderson Acceleration
- H-矩阵
- GPU 并行计算

## 参考链接
- [PDF](https://arxiv.org/pdf/2605.14526)