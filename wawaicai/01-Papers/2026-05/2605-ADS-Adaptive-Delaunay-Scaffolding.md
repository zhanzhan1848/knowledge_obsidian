---
tags: [几何, 采样, 隐式曲面, Delaunay, 网格生成]
created: 2026-05-10
venue: SIGGRAPH 2026
---

# Random Sampling of Occupancy Functions using Adaptive Delaunay Scaffolding

## 问题定义

从隐式占用函数(OF)进行密集随机采样和曲面重建。

## 核心方法

**Adaptive Delaunay Sampling (ADS)**

1. 维护逐步计算的 **Delaunay 四面体化** 作为采样和 surfacing 脚手架
2. 从初始粗 Delaunay 脚手架开始
3. 重复细化**跨边**(crossing edges) - 端顶点位于曲面两侧的边
4. 使用 Delaunay 准则将新顶点纳入脚手架

## 关键技术

- **Marching Tetrahedra**: 从细跨边交点生成等值面 mesh
- **Normal Estimation**: 密集采样近细特征和高曲率区域
- **O(N)** 数量级的函数评估减少

## 性能对比

- 比现有方法少 **一个数量级** 的函数评估
- 验证：150 个不同分辨率输入的采样

## 创新点

- 同时提供：**伪随机 OF 表面采样** + **连接采样点的等值面 mesh**
- 自适应 Delaunay 脚手架驱动采样和 surfacing

## 开源实现

- 代码链接待确认

## 相关技术

- Delaunay Tetrahedralization: CGAL, tetgen
- Marching Tetrahedra: libigl 有实现
- 隐式曲面采样: wavelet噪声等

## 会议/引用

SIGGRAPH 2026 | Authors: Suzuran Takikawa et al.
arXiv:2605.03235