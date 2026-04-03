---
tags: [几何, 表面重建, Dual Contouring, SDF]
date: 2026-04-03
source: arXiv cs.GR
---

# Dual Contouring of Signed Distance Data

## 核心方法

提出一种从离散采样的符号距离函数 (SDF) 数据重建显式多边形网格的算法，特别擅长恢复尖锐特征。

### 技术基础
- 基于传统的 Dual Contouring of Hermite Data 方法
- 设计和求解二次优化问题，在规则网格的每个单元格内决定网格顶点的最优位置

### 关键创新点
1. **仅依赖离散 SDF 数据**：不需要任意访问函数、梯度信息或大规模数据集训练
2. **最优顶点放置**：通过二次优化决定顶点位置
3. **保持尖锐特征**：擅长恢复几何尖锐特征
4. **无需 Hermite 数据**：不同于传统方法需要精确的法向量信息

### 算法流程
1. 输入：离散采样的 SDF 数据
2. 在规则网格单元格内放置顶点
3. 通过二次优化求解最优位置
4. 连接顶点形成多边形网格
5. 输出：显式多边形网格

## 算法复杂度
- 时间复杂度：O(n) 对于 n 个网格单元格
- 空间复杂度：O(n)

## 实验结果
- 在中分辨率和高分辨率的表面重建任务上达到新 state-of-the-art
- 适用于 3D 建模和设计应用

## 开源实现
- libigl: `extract_signed_distance_function_mesh` 或类似函数
- CGAL: Surface_mesh_reconstruction 包
- 论文代码: 待查找

## 相关笔记
[[Surface Reconstruction]]
[[SDF Processing]]
[[Mesh Generation]]

## 可行性分析

### 技术概述
从离散采样的 SDF 数据重建多边形网格，无需精确的梯度或法向量信息。

### 实现难度
- 算法复杂度：中
- 数值稳定性：良好
- 依赖项：SDF 采样器、二次优化求解器

### 推荐结论
✅ 推荐实现

### 适用场景
- 3D 扫描数据重建
- 医学图像重建
- CAD 模型处理
- 游戏和视觉效果

---
**链接**: https://arxiv.org/abs/2604.00157
**PDF**: https://arxiv.org/pdf/2604.00157
**作者**: Xiana Carrera
**日期**: 2026-03-31
