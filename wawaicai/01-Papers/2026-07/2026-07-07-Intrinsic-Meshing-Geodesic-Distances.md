---
tags: [几何, 网格处理, 重网格化, 内在三角化, 测地线]
date: 2026-07-07
source: arXiv
categories: [cs.CG, cs.GR]
authors: [Tim Gabriel, Jean-François Remacle, Christophe Geuzaine]
venue: arXiv:2607.04989
emoji: 🥬
---

# Intrinsic Meshing of Closed Surfaces Using Geodesic Distances

## 核心方法

提出一种**内在三角化（Intrinsic Triangulation）**方法，用于闭合离散曲面的网格生成。核心思想：

1. **内在三角化**：边对应于最短测地路径，面分解为继承自底层网格的几何基元
2. **局部优化操作**：通过边交换(edge swaps)、边分裂(edge splits)、边折叠(edge collapses)、三角形分裂(triangle splits)逐步构建
3. **测地线计算**：使用连续 Dijkstra 方法精确计算测地距离，通过 A* 搜索策略加速，计算成本降至标准传播的约 **3%**
4. **支持细化(refinement)和粗化(coarsening)**：克服了以往基于可展三角形内在方法的局限性

## 算法流程

```
输入: 闭合水密三角网格
     ↓
构建内在网格（基于测地线的边）
     ↓
局部优化（交换/分裂/折叠）
     ↓
基于角度的质量标准
     ↓
输出: 高阶等几何网格
```

## 关键创新点

| 创新点 | 描述 |
|--------|------|
| **非可展内在三角形** | 支持非零高斯曲率区域，突破 developable triangle 限制 |
| **A* 加速测地线** | geodesic 计算降至 3% 标准成本 |
| **同时支持细化+粗化** | 首个完整内在网格框架 |
| **直接生成高阶网格** | 绕过传统"先生成线性网格再弯曲"的流程 |
| **Thingi10K 验证** | 5000个复杂模型，平均 10 秒内完成 |

## 算法复杂度

- **时间复杂度**：O(n log n) 局部操作，A* 搜索 O(E + V log V)
- **空间复杂度**：O(n) 存储内在结构

## 开源实现

- **Gmsh**: https://gitlab.onelab.info/gmsh/gmsh
- 命令行示例：`gmsh model.stl -geodesic -clmin 3 -minIntrinsicAngle 20 -maxIntrinsicAngle 140`

## 相关方法对比

| 方法 | 可展三角形 | 细化 | 粗化 | 高阶支持 |
|------|-----------|------|------|---------|
| Bobenko & Springborn | ✅ | ✅ | ❌ | 有限 |
| Sharp et al. | ✅ | ✅ | ❌ | 有限 |
| Liu et al. | ❌ | ✅ | ✅ (局部) | 有限 |
| **本文** | ✅ | ✅ | ✅ | ✅ 完整 |

## 与 libigl/CGAL 对比

- **libigl**: `geodesic_approx` 提供近似测地线，本文方法精确
- **CGAL**: `Surface_mesh_parameterization` 支持参数化面片，本文针对离散三角网格

## 关键公式

**测地线距离传播**：
$$d(v) = \min_{u \in N(v)} d(u) + \|u - v\|$$

**角度质量标准**（内在距离）：
$$\theta_{intrinsic} = f(d_{geodesic}(a,b), d_{geodesic}(b,c), d_{geodesic}(c,a))$$

## 可行性评估

- **实现难度**：中等（依赖 Gmsh 的 intrinsic mesh 实现）
- **数值稳定性**：高（精确测地线 + A* 保证）
- **依赖项**：Gmsh（已开源）
- **推荐度**：⭐⭐⭐⭐⭐ **强烈推荐**

## 传递建议

将本方法传递给 **@墨鱼丸**，建议集成到网格处理 pipeline 中作为高精度重网格化模块。

## 相关笔记

[[2026-07-DAILY-SUMMARY]]