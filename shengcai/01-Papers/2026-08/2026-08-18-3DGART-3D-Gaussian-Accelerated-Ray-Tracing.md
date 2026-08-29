---
title: "3D Gaussian Accelerated Ray Tracing: Fast training through particle-based backward propagation"
authors: Laurent Vit et al.
date: 2026-08-18
tags: [渲染, ray tracing, 3D Gaussian Splatting, 训练加速, 2026]
status: 重要
source: arXiv cs.GR
link: https://arxiv.org/abs/2608.17298
---

# 3DGART: 3D Gaussian Accelerated Ray Tracing

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | 3D Gaussian Accelerated Ray Tracing: Fast training through particle-based backward propagation |
| 作者 | Laurent Vit et al. |
| 发表 | arXiv (2026-08-18) |
| 链接 | [arXiv](https://arxiv.org/abs/2608.17298) |

## 核心贡献

1. **问题诊断**：识别 3D Gaussian Ray Tracing 训练慢的根本原因不是光线遍历，而是像素为中心的反向传播中的原子竞争
2. **原始中心反向传播**：将梯度计算从竞争激烈的散射操作转换为结构化的聚集式过程
3. **保守透视校正屏幕空间边界**：构建紧凑中间缓冲区和 tile-primitive 映射
4. **训练加速**：在 Mip-NeRF 360 上实现约 3-3.5 倍原始训练加速

## 技术方案

### 核心观察
- 像素为中心的反向传播中，许多线程同时累积梯度到相同原始参数
- 导致严重的原子竞争和线程串行化

### 解决方案
- 围绕原始（primitive）而非像素重组反向传播
- 每个线程累积一个原始在其覆盖像素上的贡献
- 梯度计算从散射变为聚集操作

## 实验结果

| 数据集 | 加速比 |
|--------|--------|
| Mip-NeRF 360 | ~3-3.5x 训练速度提升 |
| vs 3DGRT | ~4x 训练速度提升 |
| 质量 | 有所改善 |

## 意义

- 使完全射线追踪的 Gaussian 训练变得实用
- 运行时间可与光栅化管线竞争
- 保留射线追踪的优势

## 创新性：⭐⭐⭐⭐⭐
## 实用性：⭐⭐⭐⭐⭐
## 实现难度：中（需要修改反向传播逻辑）

## 标签
#渲染 #ray-tracing #3DGS #训练加速 #2026
