---
tags: [几何, 3DGS, 颜色编辑, 参数化, 球谐函数]
---

# Reparametrizing 3D Gaussian Splatting for Real-Time Palette-based Color and Luminance Editing

## 论文信息
- **arXiv**: [2609.03897](https://arxiv.org/abs/2609.03897)
- **日期**: 2026-09-03
- **作者**: (待补充)

## 核心方法
专业颜色编辑需要对颜色（色相和饱和度）和亮度进行精确控制，最好通过独立控件。提出实时交互颜色编辑框架，支持基于调色板的重着色、每调色板色调曲线进行颜色感知亮度调整、像素级颜色约束。

## 技术要点
- **问题**: 
  - 3DGS 资产有 baked-in 光照，难以重新打光
  - 现有调色板方法在原始空间操作，alpha blending 破坏 per-Gaussian sparsity
- **解决**:
  - 重新参数化预训练 3DGS 的球谐函数编码视图相关调色板权重
  - 基于图像空间稀疏性损失联合求解权重和调色板颜色
  - 亮度编辑：沿消色差轴的 per-pixel 权重偏移
  - 视图空间 formulation 解决原始空间方法的问题
  - 迭代重加权最小二乘 + 阻尼块坐标下降
- **效果**: 稀疏、局部化编辑，独立亮度控制每调色板颜色，视图一致的像素级约束

## 几何算法
- 球谐函数重新参数化 (spherical harmonics reparameterization)
- 调色板权重学习 (palette weight learning)
- 视图空间编辑 (view-space formulation)

## 相关笔记
[[2026-09-05-TileGS-Tile-Local-Depth-Binning-Gaussian-Splatting]]
