---
tags: [几何, 离散微分几何, 弹性带, 能量模型]
date: 2026-05-09
category: [arXiv, cs.GR]
venue: arXiv
---

# A Unified Discrete Differential Geometry Framework for One-Dimensional Energy Models

## 核心方法

提出一个基于**离散微分几何 (DDG)** 的统一框架，将能量表述为中心线上耦合弯曲-扭转应变度量函数，而非传统 DER 的二次弯曲和扭转能量的线性求和。

### 五种 ribbon 模型对比
1. **Kirchhoff** 模型
2. **Sadowsky** 模型
3. **Wunderlich** 模型
4. **Sano** 模型（与壳有限元模拟最接近）
5. **Audoly** 模型

### 超临界 pitchfork 分岔验证
- 直 ribbon 纵向约束成预屈曲拱形
- 施加横向位移，诱导超临界 pitchfork 分岔
- Sano 模型在宽度依赖位移预测上与壳 FEA 最接近

## 算法复杂度
- 时间复杂度：O(N) per-iteration
- 空间复杂度：O(N)
- 梯度/海瑟矩阵：解析推导，支持隐式时间积分

## 创新点
- 首次在统一 DDG 框架下对比五种 ribbon 模型
- 能量基于耦合弯曲-扭转应变度量（非线性）
- JAX 高性能实现，O(N) 每迭代

## 开源参考
- https://github.com/StructuresComp/discrete-elastic-ribbon
- https://github.com/StructuresComp/discrete-elastic-ribbon-jax

## 可行性分析
- ✅ 可推荐实现
- 难度：中
- 数值稳定性：解析梯度/海瑟矩阵，隐式时间积分稳定
- 依赖：JAX

## 相关笔记
[[离散微分几何]]
[[弹性杆力学]]
