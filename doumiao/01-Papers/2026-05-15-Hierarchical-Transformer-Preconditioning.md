# Hierarchical Transformer Preconditioning for Interactive Physics Simulation

> **日期**: 2026-05-15  
> **来源**: arXiv cs.GR  
> **ID**: [arXiv:2605.13343](https://arxiv.org/abs/2605.13343)  
> **领域**: 物理仿真 / 流体模拟基础

## 核心贡献

提出 **Hierarchical Transformer Preconditioner**，一种基于弱可接受性 H 矩阵划分的神经预条件器，用于实时物理仿真。

### 关键技术

1. **H-Matrix 分区**
   - 提供多尺度结构先验（密集对角叶 + 粗化非对角块）
   - 支持 O(N) 扩展的完整图近似逆计算

2. **Transformer 网络架构**
   - 低秩远场因子建模逆矩阵
   - 高速公路连接（轴向缓冲 + 全局摘要令牌）跨变压器深度传播上下文

3. **cosine-Hutchinson 探测目标**
   - 学习 MA 在收敛关键谱子空间上的作用
   - 优化 MAz 与 z 的角度对齐，而非强制特征值聚类到指定位置

## 渲染/仿真方法
- **类型**: 体积渲染 / 物理仿真
- **技术**: 神经预条件器 + Transformer

## 性能表现
- **帧率**: ~143 FPS (N=1,024) 至 ~21 FPS (N=16,384)
- **速度提升**:
  - 2.2x over GPU Jacobi
  - ~28x over GPU IC/DILU (AMGX)
  - 2.7x over neural SPAI

## 应用场景
- **刚体仿真**: 多相 Poisson 系统
- **流体相关**: 可用于流体模拟的压力求解器加速

## 创新点

- **O(N) 复杂度**: 固定块大小下的线性扩展
- **CUDA Graph 捕获**: 完整求解循环作为单一 CUDA Graph
- **不适调谱定位**: 移除 SAI 风格目标的不必要谱放置约束

## 关键公式
- PCG 迭代中的预条件器应用简化为批量密集 GEMM
- 支持规则内存访问

## 参考链接
- [PDF](https://arxiv.org/pdf/2605.13343)