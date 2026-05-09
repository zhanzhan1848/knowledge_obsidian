---
tags: [几何, 点云, 重建, 逆渲染, 曲面]
date: 2026-05-09
category: [arXiv, cs.GR]
venue: arXiv
---

# 3D Surface Splatting for Inverse Rendering (3DSS)

## 核心方法

**3D Surface Splatting (3DSS)** 是首个**可微分曲面 splatting 渲染器**，用于基于多视角图像的物理反渲染。

核心洞察：表面分离问题可以直接用重建核函数本身来表述。

### 关键技术点
1. **Coverage-based Compositing Model** - 每层不透明度直接来自累积的 Elliptical Weighted Average (EWA) 重建权重，产生抗锯齿轮廓和稀疏覆盖边缘的信息性可见性梯度
2. **Forward Microfacet Shading** - 在协同优化的 HDR 环境光下进行前向微面元着色
3. **Density-aware Adaptive Refinement** - 密度感知自适应细化
4. **Oriented Surface Samples** - 优化表示是一组定向表面样本，可通过定向点云方法重建曲面，天然桥接到基于 mesh 的工作流

## 算法复杂度
- 时间复杂度：O(N) per iteration（密度感知自适应细化）
- 空间复杂度：O(N)

## 创新点
- 首次将表面 splatting 问题建立在重建核函数直接表述的基础上
- coverage-based compositing 避免了对数透明度的不连续性
- joint recovery of shape, SVBRDF materials, and illumination

## 开源实现
- 代码：待确认（arXiv 页面）
- 定向点云曲面重建方法可参考 libigl `point_triangle_distance`

## 可行性分析
- ✅ 可推荐实现
- 难度：中
- 数值稳定性：EWA 核函数具有良好的数值特性
- 依赖：可微分渲染框架（PyTorch/TensorFlow）

## 相关笔记
[[点云重建]]
[[神经隐式表示]]
