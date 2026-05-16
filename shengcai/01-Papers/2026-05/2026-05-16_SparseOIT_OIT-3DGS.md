---
tags: [渲染, 3DGS, Order-Independent Transparency, 透明渲染, 主动集方法, 2026]
date: [[2026-05-16]]
status: 待读
---

# SparseOIT: Improving Order-Independent Transparency 3DGS via Active Set Method

## 基本信息

| 属性 | 值 |
|------|-----|
| 作者 | Wentao Yang 等 |
| 链接 | [arXiv:2605.13855](https://arxiv.org/abs/2605.13855) |

## 核心贡献

1. 提出 **SparseOIT**，基于主动集方法的 OIT-3DGS 重建算法
2. 观察到 OIT 修改变渲染方程后，高斯 splats 之间依赖关系非常稀疏
3. 利用这种稀疏性，通过主动集方法加速优化过程
4. 加速比与潜在稀疏性成正比

## 技术方案

### 核心问题
3D Gaussian Splatting (3DGS) 使用体积渲染，不适合非兰伯特性或透明材质。OIT 方法通过移除或修改深度排序步骤来解决此问题。

### SparseOIT 方法
- 维护活跃的高斯 splats 主动集
- 利用 OIT 渲染方程引入的稀疏变量依赖
- 结合重建算法和几何正则化的联合设计
- 性能优于 OIT 系列方法，达到与体积渲染 SOTA 3DGS 方法相当的水平

## 可行性分析

- **实现难度**：中（需要理解 OIT 渲染方程和主动集优化）
- **实用价值**：高（解决 3DGS 透明渲染问题）
- **渲染相关度**：高（直接关联 3DGS 渲染优化）

## 相关链接

- [PDF](https://arxiv.org/pdf/2605.13855)
- [HTML](https://arxiv.org/html/2605.13855v1)