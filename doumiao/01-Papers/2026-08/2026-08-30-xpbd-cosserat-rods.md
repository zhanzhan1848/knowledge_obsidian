# Orientation in Extended Position-Based Dynamics: Application to Rigid Bodies and Cosserat Rods

## 论文信息
- **arXiv**: [2608.23606](https://arxiv.org/abs/2608.23606)
- **作者**: Samuel Tobin
- **日期**: 2026-08-21

## 核心创新点

### 问题背景
扩展位置动力学（XPBD）中的旋转自由度需要在 3D 旋转的非线性流形上进行计算。

### 解决方案：Lie 理论框架
本文展示了 Lie 理论为 XPBD 中的旋转、约束、插值和微分提供了一个简洁、统一的框架，实现了：
1. **改进的刚体约束**
2. **高阶有限元 Cosserat 杆**

### 关键技术
- 从 Lie 理论推导显式约束公式及其梯度
- 改进动态一致性：**超过 10⁴ 倍**相比最先进方法
- 自然扩展到有限元 Cosserat 杆：_ENABLE on-manifold interpolation of nodal rotations_

### 性能对比
| 方法 | 性能 |
|------|------|
| 线性有限元 | 优于传统 rigid-body chain |
| 高阶基函数 | 更平滑解、更快收敛 |

### 应用场景
- 大变形
- 接触

## 渲染相关技术标签
#particle-system #rigid-body-simulation #xpbd #physics-simulation

## 笔记
- 虽然不是直接的流体渲染，但粒子/刚体系统常用于流体模拟中的碰撞和交互
- Cosserat 杆理论可用于弹性体模拟
- 对 XPBD 框架的改进对实时流体模拟有参考价值
