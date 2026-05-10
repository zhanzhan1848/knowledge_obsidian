---
tags: [几何, 表面重建, 高斯溅射, 逆渲染]
created: 2026-05-10
venue: arXiv
---

# 3D Surface Splatting for Inverse Rendering

## 核心方法

**3D Surface Splatting (3DSS)** - 首个**可微分表面溅射渲染器**，用于基于多视角图像的物理逆渲染。

核心洞察：表面分离问题可以通过重建核函数直接公式化。推导了基于覆盖率的合成模型，其逐层不透明度直接来自累积的椭圆加权平均(EWA)重建权重。

## 算法流程

1. **Coverage-based Compositing**: per-layer opacity 来自 EWA 重建权重，产生抗锯齿轮廓和有信息量的可见性梯度
2. **Forward Microfacet Shading**: 在协同优化的 HDR 环境光下渲染
3. **Density-aware Adaptive Refinement**: 联合恢复形状、空间变化的 BRDF 材质和光照

## 创新点

- 可微分的表面溅射渲染管线
- EWA 重建核直接处理表面分离问题
- 桥接到 mesh workflow：通过从有向点云方法重建曲面

## 开源实现

- 仓库: https://github.com/3DSS/3DSS (待确认)

## 相关技术

- 表面重建方法：Poisson Surface Reconstruction, Ball Pivoting
- libigl: `point_cloud_to_mesh` 功能
- 与 Gaussian Splatting 对比：3DSS 输出可导出为 mesh

## 会议/引用

arXiv:2605.05876 | Authors: Mae Younes et al.