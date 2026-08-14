---
title: CoherentRaster - Efficient 3D Gaussian Splatting for Light Field Displays
authors: Gyujin Sim, Seungjoo Shin et al. (POSTECH, ETRI)
date: 2026
source: SIGGRAPH 2026
url: https://doi.org/10.1145/3799902.3811217
project: https://sgj0402.github.io/coherent-raster-project-page/
tags: [rendering, 3D Gaussian Splatting, light field display, rasterization, SIGGRAPH, 2026]
status: unread
---

# CoherentRaster: Efficient 3D Gaussian Splatting for Light Field Displays

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | CoherentRaster: Efficient 3D Gaussian Splatting for Light Field Displays |
| 作者 | Gyujin Sim, Seungjoo Shin et al. (POSTECH, ETRI) |
| 来源 | SIGGRAPH 2026 |
| 年份 | 2026 |
| 链接 | [DOI](https://doi.org/10.1145/3799902.3811217) |
| 项目页 | [coherent-raster-project-page](https://sgj0402.github.io/coherent-raster-project-page/) |

## 核心贡献
1. **亚像素级光栅化**: 将 3D Gaussian Splatting 适配到光场显示器的亚像素级布局
2. **跨视图一致属性复用**: 消除相邻视图间的冗余计算
3. **视图一致重映射**: 恢复因交错亚像素布局而降低的 warp 级内存效率

## 技术方案

**问题**: 光场显示 (LFD) 需要渲染编码多视图依赖观测的交错图像，多视图要求引入大量计算开销

**方法**: CoherentRaster 执行亚像素级光栅化，直接为每个亚像素确定哪些高斯贡献及其颜色

**两大策略**:

### 跨视图一致属性复用 (Cross-view Coherent Attribute Reuse)
- 相邻视图观察几乎相同的场景内容
- 将相邻视图分组为簇，在每个簇的代表视图计算属性（2D 协方差、深度、SH 颜色）
- 仅 2D 均值在各视图间变化需要重新计算

### 视图一致重映射 (View-coherent Remapping)
- 恢复因亚像素交错布局而降低的 alpha blending 内存访问效率
- 确保 GPU warp 级别的内存访问一致性

## 实验结论
- 在消费级硬件上实现实时、高质量光场合成
- 高分辨率光场图像实时渲染

## 可行性分析
- 实现难度：中
- 性能预期：实时，适合消费级 GPU
- 适用场景：光场显示器、VR/AR

## 相关工作
- 3D Gaussian Splatting (3DGS)
- Light field displays
- Neural rendering for LFDs

## 笔记
CoherentRaster 将 3DGS 扩展到光场显示，解决了多视图渲染的计算效率问题。跨视图属性复用是核心创新点，对其他多视图渲染场景也有参考价值。
