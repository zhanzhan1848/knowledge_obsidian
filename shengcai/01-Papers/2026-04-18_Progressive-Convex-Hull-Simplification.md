---
type: paper
created: 2026-04-18
updated: 2026-04-18
tags: [paper, convex-hull, BVH, ray-tracing, collision-detection, geometry]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.14468
---

# Progressive Convex Hull Simplification

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Progressive Convex Hull Simplification |
| **作者** | Alec Jacobson et al. |
| **发表** | arXiv (2026) |
| **链接** | [原文](https://arxiv.org/abs/2604.14468) |
| **DOI** | 10.48550/arXiv.2604.14468 |
| **代码** | TBD |

---

## 核心贡献

> 在对偶空间中 O(n log n) 贪心优化，将凸包简化为指定数量半空间同时最小化体积/表面积增量

1. 将凸包简化问题转换到对偶表示空间中求解
2. O(n log n) 贪心优化算法，高效且安全
3. 在碰撞检测、射线求交、距离计算等下游任务验证效果

---

## 技术方案

### 核心思想

凸包是碰撞检测、射线求交、距离计算等任务的有界代理，但多面体凸包复杂度随输入线性增长。本文研究将凸包保守简化为指定半空间数量的问题，同时最小化体积或表面积增量。

### 关键技术

| 技术 | 说明 |
|------|------|
| 对偶表示 | 将原始空间半空间问题转换到对偶空间点问题 |
| 贪心优化 | O(n log n) 迭代选取最佳半空间保留 |
| 保守简化 | 保证简化的凸包始终包含原始凸包（安全性） |
| 体积/表面积度量 | 支持两种优化目标 |

### 数学框架

```math
\min_{\mathcal{H}' \subseteq \mathcal{H}, |\mathcal{H}'| = k} \text{Volume}(\text{CH}(\mathcal{H}'))
```

其中 CH 为凸包，k 为目标半空间数。

---

## 实验结论

- **应用**: 碰撞检测、射线求交（Ray Tracing BVH）、距离计算
- **对比**: 现有方法存在效率低、精度差或不安全的问题
- **结果**: 本文方法在效率、紧致性、安全性三方面均优于现有方法

---

## 局限性

- 贪心策略可能不是全局最优
- 对某些非凸几何逼近精度有限

---

## 相关工作

- [[Fast Voxelization & LOD for Microgeometry Rendering]] — 体素化 + LOD

---

## 实现建议

- **实现难度**: 中（需要理解对偶空间变换 + 贪心优化）
- **预期性能**: O(n log n) 可扩展到大规模几何
- **适用场景**: 射线追踪加速结构构建、GPU 碰撞检测、游戏引擎边界体积

