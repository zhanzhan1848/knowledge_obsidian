---
tags: [几何, 高斯溅射, 表面重建]
date: 2026-06-04
category: [Geometry Processing, Surface Reconstruction]
arXiv: 2606.05124
authors: 
title: "Decoupling Appearance and Geometry in Gaussian Splatting"
source: arXiv cs.GR
url: https://arxiv.org/abs/2606.05124
pdf: https://arxiv.org/pdf/2606.05124
---

## 核心方法

论文揭示了 3D Gaussian Splatting (3DGS) 在同时表示纹理和几何时的内在矛盾，并提出解耦方案：

### 关键发现
- 3DGS 默认形式天生不适合同时表示纹理和几何
- 训练时使用完整的 ground-truth 纹理和几何信息验证了这一点

### 解决方案
- 对每个 splat 应用**单一额外几何不透明度参数**
- 可选的 transparency-curated 优化流程

### 实验结果
- 在多种数据集上改进了渲染和几何性能
- 复杂透明物体场景改善显著

## 技术细节

### 问题定义
3DGS 同时编码 appearance 和 geometry 导致两者互相干扰

### 创新点
1. 几何不透明度参数解耦 appearance/geometry 表示
2. transparency-curated optimization pipeline

### 依赖项
- 3D Gaussian Splatting 基础
- Ground-truth geometric input (via vision foundation models)

## 复杂度分析
- 模型大小：52MB DDF (Directed Distance Function)
- 查询时间：不随 Gaussian 数量增长（常数时间）
- 比 SDF sphere tracing 快 26-72 倍

## 开源参考
- 原文未提供代码链接
- 3DGS 相关：Inria, NVIDA

## 可行性评估

**推荐度**: ✅ 推荐关注

**理由**:
- 解决了 3DGS 几何表示的关键问题
- 对透明物体场景有显著改善
- DDF 常数时间查询有实用价值

**适用场景**:
- 神经隐式表面重建
- 透明物体渲染
- 实时几何查询