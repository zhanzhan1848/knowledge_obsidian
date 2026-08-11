---
tags: [几何, 参数化, 体积参数化, 重网格化]
date: 2026-08-09
source: arXiv cs.GR
---

# Adaptive Volumetric Parameterization of Simply Connected 3-Manifolds with Applications

## 论文信息

- **arXiv**: [2608.08672](https://arxiv.org/abs/2608.08672)
- **作者**: Gary P. T. Choi
- **日期**: 2026-08-09 (v1)
- ** Subjects**: Graphics (cs.GR); Computational Geometry (cs.CG); Numerical Analysis (math.NA)

## 核心问题

体积参数化是将 3-manifold 映射到简化体积域的过程，在计算机图形学和成像科学中有重要应用。然而，现有方法无论 3-manifold 形状如何，都使用标准化域（如实心球），这会引入显著的几何失真，影响后续形状处理和分析任务。

## 核心方法

### 三阶段优化框架

1. **3D 准保角形状更新 (3D Quasi-conformality Shape Update)**
   - 联合控制局部形状失真和质量失真
   - 使用准保角映射保持局部角度

2. **基于扩散的密度均衡更新 (Diffusion-based Density-equalizing Update)**
   - 平衡参数化域中的元素分布
   - 避免局部过密或过疏

3. **几何校正程序 (Geometric Correction Procedure)**
   - 移除元素折叠（element foldings）
   - 确保参数化的有效性

### 三种目标域设置

| 模式 | 描述 | 灵活性 |
|------|------|--------|
| Prescribed Solid Ellipsoid | 预定义实心椭球 | 低 |
| Volume-normalized Adaptive Ellipsoid | 体积归一化自适应椭球，可变半径 | 中 |
| Sea-embedded Free-boundary Domain | 海嵌入式自由边界域 | 高 |

## 应用场景

- **多分辨率体积重网格化** (Multiresolution Volumetric Remeshing)
- **体积注册** (Volumetric Registration)
- **体积 Morphing** (Volumetric Morphing)

## 算法复杂度

- 时间复杂度：需 O(n) 迭代优化
- 空间复杂度：O(n) 存储体积网格

## 开源实现

- **libigl**: 准保角映射相关函数
- **CGAL**: 体积网格处理

## 推荐度

✅ **推荐实现** - 对体积参数化有重要贡献，可应用于 CAD/CAE 体积网格生成

## 创新点

1. 自适应目标域选择，不局限于球体
2. 联合优化形状+质量失真
3. 元素折叠移除保证有效性
4. 支持多分辨率和局部自适应

## 局限性

- 仅适用于单连通 3-manifold (Simply Connected)
- 自由边界域计算成本较高

## 相关笔记

[[2026-08-11-DAILY-SUMMARY]]
