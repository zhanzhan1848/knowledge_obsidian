---
title: StopThePop: Sorted Gaussian Splatting for View-Consistent Real-time Rendering
authors: Lukas Radl, and others
date: 2024-02-01
source: SIGGRAPH 2024 (Journal Track)
url: https://arxiv.org/abs/2402.00525
pdf: https://arxiv.org/pdf/2402.00525
tags: [rendering, paper, 2024, gaussian-splatting, real-time, view-consistency, optimization]
status: important
---

# StopThePop: Sorted Gaussian Splatting for View-Consistent Real-time Rendering

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | StopThePop: Sorted Gaussian Splatting for View-Consistent Real-time Rendering |
| 作者 | Lukas Radl, and others |
| 来源 | SIGGRAPH 2024 (Journal Track) |
| 年份 | 2024 |
| 链接 | [原文](https://arxiv.org/abs/2402.00525) |
| PDF | [下载](https://arxiv.org/pdf/2402.00525) |

## 核心贡献
1. **Hierarchical Rasterization**: Novel hierarchical rasterization approach that systematically resorts and culls splats with minimal processing overhead
2. **Artifact Elimination**: Effectively eliminates popping artifacts and view inconsistencies during view rotation
3. **Performance Optimization**: Achieves 1.6x faster rendering than original Gaussian Splatting
4. **Memory Efficiency**: Reduces memory requirements by 50% while maintaining quality
5. **Authentic Representation**: Prevents cheating view-dependent effects with popping, ensuring more authentic representation

## 技术方案
The StopThePop method addresses limitations in Gaussian Splatting through:

- **Per-Pixel Depth Computation**: Addresses the issue of reducing Gaussians to 2D splats with single view-space depth
- **Hierarchical Approach**: Systematically resorts and culls splats with minimal processing overhead instead of full per-pixel sort
- **Software Rasterizer**: Custom software rasterizer that eliminates popping artifacts and view inconsistencies
- **Consistency Enforcement**: Reduces number of Gaussians by approximately half with nearly identical quality
- **Multi-view Consistency**: Ensures consistent rendering across different viewpoints

The approach specifically targets the efficiency-accuracy trade-off in Gaussian Splatting pipelines.

## 实验结论
- **Performance**: Rendering performance nearly doubled (1.6x faster than original)
- **Memory**: 50% reduction in memory requirements
- **Quality**: Comparable quantitative results for test images
- **Consistency**: Improved consistency for novel view synthesis in motion
- **Overhead**: Only 4% slower on average than original Gaussian Splatting

## 局限性
- Custom software rasterizer implementation complexity
- May require additional computational resources for the sorting process
- Performance benefits may vary depending on scene complexity
- Additional development effort needed for integration into existing pipelines

## 可行性分析
- 实现难度：中高 - Requires understanding of rasterization and sorting algorithms
- 性能预期：显著提升渲染性能和内存效率，适合实时应用
- 适用场景：实时渲染、AR/VR、游戏开发、交互式3D应用

## 相关工作
- [[Virtualized-3D-Gaussians]]
- [[Stochastic-Ray-Tracing-of-Transparent-3D-Gaussians]]
- [[Dynamic-Scene-Reconstruction]]

## 笔记
This paper addresses a critical limitation in Gaussian Splatting - the popping artifacts during view rotation. The hierarchical rasterization approach is innovative and computationally efficient. The significant performance improvements (1.6x faster, 50% less memory) make this approach highly practical for real-time applications. The publication in SIGGRAPH 2024 Journal Track indicates the method's importance and quality.