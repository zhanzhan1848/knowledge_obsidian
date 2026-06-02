---
title: "Subgrid Marching Tetrahedra"
authors: ["Keenan Crane et al."]
date: 2026-05-30
tags: [几何, 网格重建, Marching Tetrahedra, 等值面提取]
venue: arXiv cs.GR
---

# Subgrid Marching Tetrahedra

## 核心方法

提出一种从四面体网格中提取无交叉流形三角形网格的方法。相比经典 Marching Cubes/Tets，**子网格 marching 允许在单个晶胞内存在任意数量的表面碎片**，能够捕获细小结构和薄片。

**关键创新**：推广了来自几何拓扑的**法坐标(Normal Coordinates)**，通过沿每条网格边的任意整数相交计数来编码表面连通性。这种编码绕过了经典的奈奎斯特-香农限制，对固定网格可以解析的特征尺寸没有下限。

## 算法特点

1. **无需内外判断** - 允许有边界的表面
2. **无需一致方向输入** - 对输入几何方向无要求
3. **局部并行** - 每个四面体独立重建，跨 tet 边界形成符合网格
4. **可处理多表面** - 单胞内多表面片

## 应用场景

- 标准等值面绘制
- 将多边形汤转换为流形、无交叉网格

## 开源实现

- GitHub: 待确认

## 相关论文

- Marching Cubes (Lorensen & Cline, 1987)
- Marching Tetrahedra

## 可行性评估

✅ **推荐实现** - Keenan Crane 团队工作，算法严谨，对网格重建有实质改进
