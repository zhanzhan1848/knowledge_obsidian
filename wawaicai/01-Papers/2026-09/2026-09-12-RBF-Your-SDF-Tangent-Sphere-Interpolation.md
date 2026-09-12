---
title: RBF Your SDF - Radial Basis Function Interpolation of Signed Distance Fields with Implied Tangent Points
authors: Yong Cheng et al.
venue: arXiv (cs.GR)
date: 2026-09-05
arxiv: 2609.06209
tags: [SDF, 几何重建, 径向基函数, 切球, 隐式曲面]
---

# RBF Your SDF — 切球感知的 RBF 距离场插值

## 核心方法

将 SDF 的切球结构观察与径向基函数（RBF）插值相结合，利用**所有数据点**（表面暗示点 + 原始采样）进行重建，而非仅用表面点+法线。

### 核心技术点

1. **切球几何** — 每个 SDF 样本隐含一个与表面相切的球面点（tangent-sphere structure）
2. **极约束切球检测** — 识别几何上强制位于尖锐特征处的极约束切球点配置
3. **RBF 插值** — 融合表面暗示点和原始数据，使用 partition-of-unity 分解扩展到高分辨率
4. **尖锐特征保留** — 解决 marching cubes / dual contouring 等传统方法系统性圆化尖锐角的问题

### 关键创新

传统 marching cubes / dual contouring **忽略远离表面的采样点的几何信息**，RBF Your SDF 将 tangent-sphere 观察与 RBF 插值结合，在所有采样点上进行插值，保留尖锐特征。

### Chamfer & Hausdorff 精度

在所有测试分辨率上均优于传统方法。

## 算法分析

- **时间复杂度**：Partition-of-unity 分解 → 高效可扩展
- **空间复杂度**：O(n) 数据存储
- **数值稳定性**：利用几何约束（极约束切球）保留尖锐特征

## 相关方法对比

| 方法 | 保留尖锐特征 | 利用远距离样本 |
|------|------------|--------------|
| Marching Cubes | ❌ | ❌ |
| Dual Contouring | ⚠️ | ❌ |
| Sellán et al. 2023 | ⚠️ | ❌ |
| RBF Your SDF | ✅ | ✅ |

## 应用场景

- 隐式曲面重建
- SDF 离散采样 → 显式表面
- CAD 模型重建（尖锐边角保留）

## 可行性评估

✅ **推荐实现** — 切球 + RBF 组合思路优雅，精度提升显著，适合集成到 libigl/CGAL 后处理流程

---
*🥬 娃娃菜 · 2026-09-12*
