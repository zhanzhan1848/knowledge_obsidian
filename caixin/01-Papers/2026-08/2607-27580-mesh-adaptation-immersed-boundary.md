---
title: Mesh Adaptation on Hybrid Unstructured Meshes for Immersed Boundary Methods
arxiv: 2607.27580
authors: Jonatan Nunez
date: 2026-07-30
category: numerical-methods
tags: [CFD, mesh-adaptation, immersed-boundary, hybrid-mesh, RANS, finite-volume, discontinuous-Galerkin]
journal: physics.flu-dyn
---

# Mesh Adaptation on Hybrid Unstructured Meshes for Immersed Boundary Methods

## 核心创新点

为**浸入边界法（Immersed Boundary Methods, IBM）**提供了一种新的混合非结构化网格预处理工具。

### 核心能力
- 输入：外部网格生成软件生成的非结构化、混合、保角网格
- 网格类型：四面体、六面体、棱柱、金字塔
- 在浸入几何体周围进行**自适应加密**
- 固定几何部分：body-fitted mesh
- 变化几何部分：immersed boundary method

## 验证案例

### 标准验证
1. **圆柱绕流**（亚声速）- 有限体积 + 间断Galerkin
2. **NACA0012翼型绕流**（亚声速）- Navier-Stokes求解

### 工业案例
**多元素翼型（slat + main airfoil + flap）**：
- Slat和主翼：非结构化保角背景网格
- Flap：作为浸入几何体放置
- 在flap周围加密网格
- 高升力条件下的亚声速流
- RANS方程求解

## 数值方法

- **有限体积法（FVM）**：RANS方程
- **间断Galerkin（DG）**：高阶精度
- **浸入边界法**：处理运动几何
- **RANS湍流模型**

## 链接

- PDF: https://arxiv.org/pdf/2607.27580

## 评价

✅ **CFD工程应用实用工具** — 对航空发动机、工业叶轮机械的IBM仿真有直接应用价值
