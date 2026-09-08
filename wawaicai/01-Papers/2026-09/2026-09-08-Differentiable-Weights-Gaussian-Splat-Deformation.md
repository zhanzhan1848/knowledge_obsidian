---
tags: [高斯泼溅, 变形, 蒙皮权重, 网格无关]
---

# Differentiable Weights for Skinned Gaussian Splat Deformation

## 论文信息

| 属性 | 内容 |
|------|------|
| arXiv | [2609.05127](https://arxiv.org/abs/2609.05127) |
| 分类 | cs.GR |
| 日期 | 2026-09-04 |
| 作者 | Nina Vesseron |

## 核心问题

3DGS无网格连通性，刚性变换点无法防止拉伸时产生孔洞。

## 核心方法

1. **使用蒙皮权重空间梯度**提供完整网格无关变形流程
2. 自适应重采样分裂仍产生伪影的splats
3. WebGL实时渲染

## 关键创新点

- 网格无关的Gaussian Splat变形
- 权重梯度用于拉伸模拟
- 保持实时渲染能力
- 自适应重采样处理残余伪影

## 开源实现

- 待发布

## 相关笔记

[[TileGS-Tile-Local-Depth-Binning-Gaussian-Splatting]]

## 可行性分析

✅ **关注**

- 网格无关变形技术
- 蒙皮权重梯度可用于变形分析
- 与传统网格变形方法对比
