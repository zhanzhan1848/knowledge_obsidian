---
title: Progressive Convex Hull Simplification
authors: Alec Jacobson et al.
date: 2026-04-15
source: arXiv cs.GR
url: https://arxiv.org/abs/2604.14468
pdf: https://arxiv.org/pdf/2604.14468
tags: [rendering, geometry, convex-hull, simplification, BVH, ray-tracing, 2026]
status: unread
---

# Progressive Convex Hull Simplification

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Progressive Convex Hull Simplification |
| 作者 | Alec Jacobson et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.14468) |
| PDF | [下载](https://arxiv.org/pdf/2604.14468) |

## 核心贡献
1. 提出保守简化凸包到指定半空间数量的方法
2. O(n log n) 贪婪优化算法，在对偶空间中高效运行
3. 最小化简化后体积或表面积的增加

## 技术方案

### 问题背景
凸包作为碰撞检测、射线相交和距离计算等任务的紧密边界代理非常有用。然而，多面体凸包的复杂度随输入线性增长。

### 技术方法
1. **对偶表示**：在的对偶空间中工作
2. **贪婪优化**：O(n log n) 时间复杂度
3. **保守性保证**：确保简化的凸包始终包围原始形状

```math
\min_{\mathbf{H}'} \text{Volume}(\text{CH}(\mathbf{H}')) \quad \text{s.t.} \quad |\mathbf{H}'| = k
```

### 应用领域
- 碰撞检测加速
- 射线相交测试
- 距离计算
- BVH 构建优化

## 实验结论
- 与现有方法相比效率更高、紧密度更好、安全性更有保障
- 在各种输入形状和下游应用领域展示了方法的有效性

## 局限性
- 主要适用于凸形状，非凸形状需要预处理分解

## 可行性分析
- 实现难度：中
- 性能预期：可显著加速大规模场景的碰撞检测和光线追踪
- 适用场景：游戏引擎、物理模拟、光线追踪加速结构

## 相关工作
- BVH construction algorithms
- Collision detection acceleration
- Ray tracing acceleration structures

## 笔记
 Alec Jacobson 是著名的几何处理研究者
