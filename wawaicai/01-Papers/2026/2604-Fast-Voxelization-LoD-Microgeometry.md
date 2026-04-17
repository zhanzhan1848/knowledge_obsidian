---
title: "Fast Voxelization and Level of Detail for Microgeometry Rendering"
authors: ["Javier Fabre", "Carlos Castillo", "Carlos Rodriguez-Pardo", "Jorge Lopez-Moreno"]
date: 2026-04-16
arXiv: "2604.13191"
journal: "The Visual Computer ( CGI 2026)"
tags: [几何, 体素化, LOD, 微几何, 各向异性散射]
---

## 核心问题

具有各向异性微结构（纤维、拉丝金属）的材料：
- 高度稀疏（小体积占用）
- 需要高空间分辨率
- 复杂方向特性决定外观

## 核心贡献

### 1. 高效并行体素化方法

- **CUDA 实现**
- 支持三角网格和含纤维的体积织物
- 设计目标：多分辨率快速数据聚合

### 2. 层级 SGGX 聚类表示

- 比 baseline 方法更高精度
- 提供 Level-of-Detail 结构
- 适合 MIP mapping 类降采样

## 技术亮点

- **并行体素化**：适应 GPU 并行架构
- **LoD 支持**：多分辨率聚合视觉外观
- **验证**：Path tracer 测试，纤维织物模型

## 潜在应用

- 织物渲染（纤维级别细节）
- 拉丝金属表面
- 体积材质编辑

## 开源参考
- 代码待发布

## 相关笔记
[[几何/体素化]]
[[几何/LOD]]
