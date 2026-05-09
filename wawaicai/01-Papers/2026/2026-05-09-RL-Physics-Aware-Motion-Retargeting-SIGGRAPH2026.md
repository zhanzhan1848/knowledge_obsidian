---
tags: [几何, 运动重定向, 强化学习, 机器人, SIGGRAPH2026]
date: 2026-05-09
category: [arXiv, cs.GR]
venue: SIGGRAPH 2026
---

# Reinforcement Learning for Physics-Aware Motion Retargeting

## 核心方法

**双层优化框架**，联合将参考运动适配到机器人形态，同时使用强化学习训练跟踪策略。

### 技术流程
1. **Upper-level**: 推导出上层次损失的近似梯度，使优化可处理
2. **Sparse Semantic Rigid-body Correspondences**: 仅需稀疏语义刚体对应
3. **Physics Simulation Integration**: 直接集成物理模拟，产生物理可信运动

### 关键创新
- 无需手动调参，自动识别最优参数化值
- 跨不同化身保留特征运动
- 支持 quadruped（四足）形态

## 验证
- 仿真 + 硬件验证
- 形态与人类差异大的机器人（包括四足）

## 问题解决
- 足部滑动 (foot sliding)
- 自碰撞 (self-collisions)
- 动力学不可行运动 (dynamically infeasible motions)

## 算法复杂度
- 时间复杂度：双层优化 O(N) 每迭代
- 空间复杂度：O(N) 刚体状态

## 创新点
- 首个 physics-aware motion retargeting + RL 联合框架
- 自动参数调优，无需人工干预
- 支持跨形态（人→四足）

## 可行性分析
- ✅ 可推荐实现
- 难度：高
- 数值稳定性：物理模拟需稳定积分
- 依赖：物理引擎 (MuJoCo/Isaac Gym), RL 框架

## 相关笔记
[[网格变形]]
[[强化学习]]
