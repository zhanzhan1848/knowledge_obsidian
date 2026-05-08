---
tags: [渲染, 高斯泼溅, 光场显示, 实时, 2026]
date: [[2026-05-08]]
status: 待读
---

# CoherentRaster: Efficient 3D Gaussian Splatting for Light Field Displays

## 元信息

| 标题 | CoherentRaster: Efficient 3D Gaussian Splatting for Light Field Displays |
|------|------------------------------------------------------------------------|
| 作者 | Gyujin Sim et al. |
| 链接 | [arXiv](https://arxiv.org/abs/2605.04509) |
| 发表 | cs.GR |
| 日期 | 2026-05-06 |

## 核心贡献

1. **Cross-view Coherent Attribute Reuse**：消除相邻视点之间的冗余计算
2. **View-coherent Remapping**：恢复因交织子像素布局而降级的 warp 级内存效率
3. **亚像素级光栅化**：实现高效的光场渲染框架

## 技术方案

### 问题
- 光场显示 (LFD) 需要渲染包含许多视图相关观察的交织图像
- 多视图需求导致大量计算开销，难以实现实时渲染
- 直接扩展 3DGS 到 LFD 计算成本高昂
- 现有加速方法要么在空间不相干子像素布局下 GPU 效率低，要么依赖计算密集的多平面中间体

### 方法
- 基于 3DGS 的光场渲染框架
- 执行亚像素级光栅化
- 跨视图连贯属性复用
- 视图连贯重映射

### 性能
- 在消费级硬件上实现实时、高质量光场综合的高效管道

## 推荐度

⭐⭐⭐⭐⭐

光场渲染的重要进展，对实时渲染和新型显示技术有重要价值。

---
**原始链接**：[arXiv 2605.04509](https://arxiv.org/abs/2605.04509)