---
tags: [几何, 旋转表示, SO(3), 四元数, 数学基础]
created: 2026-05-13
---

# Representations of 3D Rotations: Mathematical Foundations and Comparative Analysis

## 核心方法

对 **SO(3) 旋转表示**进行全面综述和比较分析，涵盖：Euler角、轴角向量、四元数、旋转矩阵、指数映射、连续/概率方法。

### 评估维度

| 维度 | 评估指标 |
|------|----------|
| 数学 formulation | 连续性 |
| Gimbal lock 敏感性 | |
| 计算效率 | |
| 存储需求 | |
| 插值特性 | |
| 组合运算 | |

## 关键结论

- **四元数主导**：因其紧凑性和计算效率在实践中广泛应用
- **6D 连续表示**：提供更好的连续性
- **Matrix Fisher 分布**：增强的不确定性建模

## 应用场景

- 动画 (animation)
- 姿态估计 (pose estimation)
- 惯性导航 (inertial navigation)
- 3D 形状配准 (3D shape registration)
- 神经网络中的旋转表示

## 创新点

- 首个对 SO(3) 旋转表示的**系统性比较分析**
- 整合代数洞察与实际应用
- 为未来混合方法研究提供基础

## 算法复杂度
- 空间复杂度：四元数 4维 vs 旋转矩阵 9维

## 实现难度
- 算法复杂度：低（综述分析）
- 数值稳定性：N/A
- 依赖项：无

## 开源参考
- 论文: https://arxiv.org/abs/2605.08086
- 暂无代码

## 相关笔记
[[GMT-Geometric-Multigrid-Transformer]] - 另一个涉及几何变换的方法