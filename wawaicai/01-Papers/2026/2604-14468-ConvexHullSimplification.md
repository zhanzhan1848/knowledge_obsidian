---
title: "Progressive Convex Hull Simplification"
authors: ["Alec Jacobson", "Jian-fei Li", "Chenran Li"]
date: 2026-04-15
arXiv: "2604.14468"
venue: "arXiv cs.GR"
tags: [几何, 凸包, 简化, 包围体, 碰撞检测]
---

# Progressive Convex Hull Simplification

## 核心问题

凸包作为包围体代理广泛用于：
- 碰撞检测 (Collision Detection)
- 射线相交 (Ray Intersection)
- 距离计算 (Distance Computation)

**痛点**：多面体凸包复杂度随输入线性增长

## 核心方法

将凸包简化为指定数量的半空间，同时最小化体积或表面积增量。

### 关键创新：对偶空间贪婪优化

- 在**对偶表示**中操作
- 复杂度：**O(n log n)** 贪婪优化
- 保证保守性（conservatively simplify）

### 对比现有方法缺陷

| 方法 | 效率 | 紧致性 | 安全性 |
|------|------|--------|--------|
| 现有方法 | 差/中 | 差 | 无保证 |
| 本文 | **优** | **优** | **保证** |

## 验证场景

- 多种输入形状
- 下游应用领域测试

## 算法分析

- **时间复杂度**：O(n log n)
- **空间复杂度**：O(n)
- **数值稳定性**：对偶空间操作稳定

## 开源参考

待发布（ Alec Jacobson 团队）

## 相关笔记

[[几何/包围体]]
[[几何/碰撞检测]]
[[算法/QEM]]