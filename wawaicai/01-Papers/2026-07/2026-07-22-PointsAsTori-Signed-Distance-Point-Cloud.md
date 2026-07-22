---
tags: [几何, 点云, SDF, 重建, 曲面拟合]
date: 2026-07-22
source: arXiv cs.GR
arxiv: "2607.16946"
conference: ACM Transactions on Graphics (TOG 2026)
---

# Points as Tori: Fast Pointwise Signed Distance for Point Clouds

## 核心方法

**核心思想**：用 Torus（圆环面）局部拟合点云，实现快速点态符号距离计算。

**技术路线**：
1. **输入**：带法向的点云
2. **处理**：对每个点，用神经网络预测曲率和偏移参数，将点云局部拟合为 Torus
3. **输出**：解析形式的符号距离函数，可任意分辨率查询

**关键创新**：
- Torus 具有**闭合形式 SDF**，便于快速查询
- 前馈网络预测每点曲率和偏移，无需全局优化
- 理论贡献：统一了符号距离、卷绕数和泊松曲面重建

## 算法流程

```
点云 + 法向
    ↓
预训练网络预测每点曲率 κ 和偏移参数
    ↓
每个点 → Torus 参数化
    ↓
解析 SDF 查询：d(p) = SDF_Torus(p, params)
```

## 开源实现

- 主页: https://nzfeng.github.io/research/PointsAsTori
- libigl: 可用 `signed_distance_isosurface` 类似的处理流程
- CGAL: `CGAL::Alpha_shape_3` 或 `CGAL::Jet_smooth_point_set`

## 应用场景

1. **点云偏移** (offset)
2. **形态学操作** (布尔运算)
3. **Sphere tracing 可视化**
4. 点云直接用于应用，无需显式曲面重建

## 可行性分析

| 维度 | 评估 |
|------|------|
| 算法复杂度 | O(n) 前馈，查询 O(1) |
| 实现难度 | 中等（需训练网络拟合 torus） |
| 数值稳定性 | 高（Torus SDF 解析闭式） |
| 依赖项 | PyTorch / TensorFlow |
| 推荐度 | ✅ 强烈推荐 |

## 创新点总结

- **统一理论框架**：首次将 winding numbers、Poisson reconstruction、SDF 统一在 torus 拟合框架下
- **无需全局优化**：相比传统 MLS/PSR 等方法，直接前馈
- **并行化友好**：每个点独立处理，适合 GPU 并行
- **任意分辨率查询**：解析 SDF 可连续查询，不受离散分辨率限制

## 参考文献

```bibtex
@article{pointsastori2026,
  title={Points as Tori: Fast Pointwise Signed Distance for Point Clouds},
  author={Feng, N. et al.},
  journal={ACM Transactions on Graphics},
  volume={45},
  year={2026},
  note={Article 53}
}
```

## 相关笔记

[[2026-07-07-3DMPE-Point-Cloud-Reconstruction]]
[[2026-07-14-SuperFlex-Deformable-Superquadrics-Point-Cloud]]
