---
title: Divide and Truncate (DAT) - Penetration and Inversion Free Framework for Coupled Multi-physics Systems
tags: [几何, 物理仿真, 碰撞处理, 网格]
cite: arXiv:2604.15513
date: 2026-04-16
authors: [Anka He Chen]
venue: cs.GR
---

# Divide and Truncate (DAT) - Penetration-Free Multi-physics Framework

## 核心方法

统一的多物理系统耦合框架，通过 penetration-free 碰撞处理连接刚体、柔体、薄壳、棒、动画对象。

### 关键创新

1. **空间分区**：将环境空间划分为互斥区域
2. **位移截断**：将位移截断到区域内
3. **Planar-DAT变体**：仅限制朝向附近表面的运动
   - 解决人工阻尼问题
   - 解决死锁问题

### 保障
- 保证 penetration-free 接触解决
- 材质无关：每个物体独立响应碰撞
- 求解器无关：可与任何迭代优化器无缝集成

## 覆盖的物理系统
- 刚体 (rigid bodies)
- 体积分段柔体 (volumetric soft bodies)
- 薄壳 (thin shells)
- 棒 (rods)
- 动画对象 (animated objects)

## 算法优势

| 问题 | 现有方法 | DAT |
|------|----------|-----|
| 人工阻尼 | 存在 | 解决 |
| 死锁 | 存在 | 解决 |
| 材质依赖 | 是 | 否 |
| 求解器依赖 | 是 | 否 |

## 开源实现
- 待查找

## 相关笔记
[[物理仿真]]
[[碰撞检测]]
[[网格处理]]