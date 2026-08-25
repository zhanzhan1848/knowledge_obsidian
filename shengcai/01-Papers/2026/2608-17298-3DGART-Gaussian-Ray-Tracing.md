---
title: "3D Gaussian Accelerated Ray Tracing: Fast training through particle-based backward propagation"
authors: []
date: 2026-08-17
status: 待读
tags: [渲染, 3D Gaussian, ray tracing, 神经渲染, 实时渲染]
keywords: [3D Gaussian Splatting, ray tracing, neural rendering, training acceleration]
links:
  arXiv: https://arxiv.org/abs/2608.17298
  PDF: https://arxiv.org/pdf/2608.17298
reviewDate: 2026-08-25
---

# 3D Gaussian Accelerated Ray Tracing: Fast training through particle-based backward propagation

## 元信息
| 项目 | 内容 |
|------|------|
| 作者 | (待补充) |
| 发表 | arXiv cs.GR, 2026-08-17 |
| 链接 | [arXiv](https://arxiv.org/abs/2608.17298) |

## 核心贡献

**3DGART**：实用的光线追踪高斯渲染训练框架。

**关键发现**：训练瓶颈不是光线遍历本身，而是以像素为中心的反向传播——多个线程同时向相同原始参数累积梯度，导致严重的原子争用和线程串行化。

## 技术方案

**核心思想**：围绕原语而非像素重新组织反向传播。

### 方法流程

1. **保守透视校正屏幕空间边界**：构建紧凑的中间缓冲区
2. **Tile-Primitive 映射**：每个线程累积一个原语在其覆盖像素上的贡献
3. **散射→聚集转换**：将梯度计算从争用密集的散射操作转变为结构化聚集过程

```cpp
// 关键转变
// Before: scatter (contention-heavy)
grad[primitive_id] += contribution  // 原子操作冲突

// After: gather (structured)
for each pixel in primitive.covered_region:
    grad[primitive_id] += contribution  // 无冲突
```

## 实验结论

### Mip-NeRF 360 数据集

| 方法 | 训练速度 | 质量 |
|------|----------|------|
| 3DGART | ~3-3.5x baseline | 提升 |
| 3DGRT | baseline | - |
| 原始 per-pixel | 1x | - |

- 在 Mip-NeRF 360 上，3DGART 相比 per-pixel baseline 实现 **~3-3.5x 训练加速**
- 相比 3DGRT 实现 **~4x 加速**
- **使全光线追踪高斯训练变得实用**，运行时间可与光栅化流水线竞争

## 与 3DGS 原始方法对比

| 特性 | 3DGS (光栅化) | 3DGART (光线追踪) |
|------|---------------|-------------------|
| 视图依赖排序 | 屏幕空间近似 | 精确 |
| 反射/折射/阴影 | 困难 | 支持 |
| 训练速度 | 快 | 竞争性 |
| 二次光线效果 | 受限 | 原生支持 |

## 实用性评估

- **创新性**：⭐⭐⭐⭐⭐ 训练加速创新
- **实用性**：⭐⭐⭐⭐⭐ 实用价值高
- **实现难度**：中（需改写反向传播逻辑）

## 应用场景

- 需要精确反射/折射的实时渲染
- 阴影准确的场景
- 神经渲染训练加速

## 备注

- 相关领域：NeRF, 3D Gaussian Splatting, Ray Tracing, Neural Rendering
