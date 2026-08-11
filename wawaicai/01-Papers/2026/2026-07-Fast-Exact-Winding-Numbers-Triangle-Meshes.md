---
tags: [几何, 卷绕数, 网格处理, SIGGRAPH2026]
date: 2026-07
venue: SIGGRAPH 2026 (TOG)
---

# Fast and Exact Winding Numbers for Triangle Meshes

## 论文信息

- **DOI**: https://doi.org/10.1145/3811339
- **作者**: Peiyuan Xie, Christian Hafner, Chris Wojtan (ISTA)
- **venue**: SIGGRAPH 2026 (SIG/TOG)
- **代码**: https://git.ista.ac.at/wojtan-group/peiyuan-xie/boundaryblaze
- **项目页**: https://visualcomputing.ist.ac.at/publications/2026/FEWN/

## 核心问题

卷绕数（Winding Number）是判断点是否在网格内部的重要工具，广泛应用于重建、查询、和网格处理。传统方法在精度和速度之间存在权衡。

## 核心方法

### Boundary Blaze 算法

利用边界元方法（boundary element method）的数学框架，将卷绕数计算问题转化为边界积分问题。

**核心公式**:
$$w(p) = \frac{1}{4\pi} \sum_{i} \Omega_i(p)$$

其中 $\Omega_i(p)$ 是三角形 $i$ 对点 $p$ 形成的立体角。

### 关键创新

1. **精确计算**: 通过解析公式计算立体角，避免数值积分
2. **网格加速**: 使用 BVH 或类似结构加速远场计算
3. **层次化方法**: 对近距离和远距离三角形采用不同策略

## 性能对比

| 方法 | 精度 | 速度 |
|------|------|------|
| 传统 Sampling | 高 | 慢 |
| Winding Number Field | 低 | 快 |
| **Boundary Blaze (本文)** | **精确** | **快** |

## 开源实现

- 代码开源: https://git.ista.ac.at/wojtan-group/peiyuan-xie/boundaryblaze
- libigl: `winding_number()` 函数可参考

## 推荐度

✅ **强烈推荐** - 精确+快速，SIGGRAPH TOG 论文

## 相关论文

- [[Spatially Accelerated Winding Numbers for Curved Geometry]]
- [[The Antipodal Method: Fast, Accurate, and Robust 3D Generalized Winding Numbers]]
- [[ADS: Random Sampling of Occupancy Functions using Adaptive Delaunay Scaffolding]]

## 相关笔记

[[2026-08-11-DAILY-SUMMARY]]
