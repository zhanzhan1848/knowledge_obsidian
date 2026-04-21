---
tags: [几何, 碰撞检测, 多物理场, 穿透避免]
arXiv: 2604.15513
authors: [Anka He Chen, et al.]
date: 2026-04-16
venue: arXiv cs.GR
---

# Divide and Truncate (DAT): Penetration and Inversion Free Framework for Coupled Multi-physics Systems

## 核心方法

**问题定义**：多物理场耦合系统的穿透无碰撞处理，包括刚体、柔性体、薄壳、杆件、动画物体。

**DAT 框架**：
- 将环境空间划分为独占区域（exclusive regions）
- 截断位移使其保持在区域内 → 保证穿透自由接触解决
- **Planar-DAT 变体**：仅限制朝向邻近表面的运动，切向运动不受约束 → 解决人工阻尼和死锁问题

**技术特点**：
- 材质无关（material-agnostic）：每个物体独立响应接触
- 求解器无关（solver-agnostic）：可作为后处理步骤集成到任何迭代优化器
- 支持复杂多体交互模拟

## 算法复杂度
- 分区 + 截断：O(n) 空间分区构建
- 接触优化：迭代优化器后处理步骤

## 实现难度
- 算法复杂度：中（几何空间分区）
- 数值稳定性：良好（保证无穿透）
- 依赖项：几何处理库

## 推荐结论
✅ 推荐实现（接触处理方向）

## 相关笔记
[[网格处理, 碰撞检测]]
