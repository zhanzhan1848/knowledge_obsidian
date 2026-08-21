---
title: "Differentiable Voxelization of Surface Representations"
authors: [Tobias Djuren et al.]
date: 2026-08-16
tags: [几何, 网格处理, 体素化, 可微分, SIGGRAPH2026]
arxiv: "2608.15934"
doi: "10.1145/3799902.3811203"
subjects: [cs.GR]
conference: "SIGGRAPH Conference Papers 2026"
---

# Differentiable Voxelization of Surface Representations

## 核心方法

**推导了网格表面表示相对于其包围体的体积导数**，实现基于体积属性的网格优化。

### 核心贡献

1. **缠绕数的梯度推导**
   - 推导了缠绕数（winding numbers）对表面参数（顶点集、三角网格）的梯度
   - 对体素网格上的体积值和基于顶点的三角网格都适用

2. **高效优化**
   - 支持多种优化问题
   - 在规则网格（体素表示）上高效计算

### 应用场景

1. **网格变形以解决相交问题**
   - 优化网格形状以消除自相交

2. **可制造性优化**
   - 创建可通过三方向带锯切割的形状

3. **空间填充形状**
   - 创建接近填充三维空间的形状

## 关键创新
- 首次实现 surface → volume 的可微分变换
- 连接了表面建模与空间查询（相交、包围检测）
- SIGGRAPH 2026 论文

## 开源实现
- 论文链接：SIGGRAPH 2026 Article No.: 22
- DOI: https://doi.org/10.1145/3799902.3811203

## 相关技术
- Differentiable Voxelization
- Winding Number
- Surface-Volume Relationship
- Mesh Intersection Resolution
- Manufacturability

## 可行性评估

**推荐度：✅ 推荐实现**

- SIGGRAPH 2026，顶级会议
- 连接表面与体积表示，有重要应用
- libigl 的 `winding_number` 可参考
- 对网格修复、相交处理有直接价值

## 会议信息
SIGGRAPH Conference Papers 2026, Article No.: 22
