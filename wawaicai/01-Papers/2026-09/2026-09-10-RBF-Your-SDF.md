---
tags: [几何, SDF, RBF-插值, marching-cubes, surface-reconstruction]
date: 2026-09-10
domain: geometry
conference: arXiv
authors: [Yong Cheng, Yotam Gingold]
---

# RBF Your SDF: Radial Basis Function Interpolation of Signed Distance Fields with Implied Tangent Points

## 核心方法

**RBF Your SDF** — 将 SDF 离散样本用径向基函数（RBF）插值，结合切球（tangent-sphere）结构，保留尖锐特征（棱角）。

**关键洞察:**
- 传统 marching cubes / dual contouring 仅使用表面附近样本
- Sellán et al. (2023) 等利用 tangent-sphere 结构，但通过表面重建提取零等值面，忽略了远处样本
- 本文：**融合 tangent-sphere 观察 + RBF 插值全部数据（隐含表面点 + 原始样本）**

**技术细节:**
1. 检测"极约束切球"（extremely constrained tangent points）→ 识别尖锐特征处的球面
2. partition-of-unity 分解 → 大分辨率下可扩展
3. 角点保留能力显著优于 surface-reconstruction 方法

## 关键创新点

- 首次将 RBF 插值与 SDF tangent-sphere 结构结合
- 尖锐特征（棱角）保真度大幅提升
- Chamfer & Hausdorff 精度全面提升

## 算法复杂度

- Partition-of-unity 分解 → O(n log n) 可扩展
- 支持大 grid 分辨率

## 开源参考

- arXiv: https://arxiv.org/abs/2609.06209
- libigl: marching cubes `igl::marching_cubes` 可作 baseline
- CGAL: 3D box intersection / interpolation

## 推荐度

✅ **推荐** — SDF 重建基础问题的重要改进，思路清晰，实现难度适中。

## 链接

- 2026-09-05 提交
