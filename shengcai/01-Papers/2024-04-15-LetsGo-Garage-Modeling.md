---
title: LetsGo: Large-Scale Garage Modeling and Rendering via LiDAR-Assisted Gaussian Primitives
authors: Jiadi Cui, and others
date: 2024-04-15
source: arXiv
url: https://arxiv.org/abs/2404.09748
pdf: https://arxiv.org/pdf/2404.09748
tags: [rendering, paper, 2024, gaussian-splatting, lidar, large-scale, garage]
status: important
---

# LetsGo: Large-Scale Garage Modeling and Rendering via LiDAR-Assisted Gaussian Primitives

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | LetsGo: Large-Scale Garage Modeling and Rendering via LiDAR-Assisted Gaussian Primitives |
| 作者 | Jiadi Cui, and others |
| 来源 | arXiv |
| 年份 | 2024 |
| 链接 | [原文](https://arxiv.org/abs/2404.09748) |
| PDF | [下载](https://arxiv.org/pdf/2404.09748) |

## 核心贡献
1. **Polar Device**: Development of a handheld scanner equipped with IMU, LiDAR, and fisheye camera for accurate data acquisition
2. **GarageWorld Dataset**: Creation of eight expansive garage scenes with diverse geometric structures, publicly available for research
3. **LiDAR-Assisted Enhancement**: Demonstration that LiDAR point clouds significantly enhance 3D Gaussian splatting algorithms
4. **Depth Regularizer**: Novel depth regularizer that effectively eliminates floating artifacts in rendered images
5. **Multi-Resolution Representation**: Multi-resolution 3D Gaussian representation designed for Level-of-Detail (LOD) rendering

## 技术方案
The LetsGo framework addresses challenges in large-scale garage modeling through:

- **Data Acquisition**: Using the Polar handheld device with IMU, LiDAR, and fisheye camera
- **Enhanced Gaussian Splatting**: Leveraging LiDAR point clouds to improve traditional 3D Gaussian splatting algorithms
- **Depth Regularization**: Novel depth regularizer to eliminate floating artifacts
- **Multi-Resolution Rendering**: Adapted scaling factors for individual resolution levels and random-resolution-level training
- **Web-Based Rendering**: Enables efficient rendering of large-scale scenes on lightweight devices

The approach specifically addresses challenges posed by monotonous colors, repetitive patterns, reflective surfaces, and transparent vehicle glass in garage environments.

## 实验结论
- LiDAR point clouds significantly enhance Gaussian splatting performance for garage scenes
- Multi-resolution representation enables efficient rendering on lightweight devices
- The method achieves superior rendering quality and resource efficiency compared to traditional approaches
- Depth regularization effectively eliminates floating artifacts in rendered images

## 局限性
- Requires specialized hardware (Polar device) for data acquisition
- Limited to garage environments and may not generalize well to other scene types
- Multi-resolution approach adds complexity to the implementation
- Performance may degrade with extremely large scenes

## 可行性分析
- 实现难度：中 - Requires understanding of Gaussian splatting and LiDAR processing
- 性能预期：高质量渲染，适合大规模场景，支持实时渲染
- 适用场景：大规模室内场景建模、AR/VR应用、建筑可视化、城市规划

## 相关工作
- [[Dynamic-Scene-Reconstruction]]
- [[Virtualized-3D-Gaussians]]
- [[Stochastic-Ray-Tracing-of-Transparent-3D-Gaussians]]

## 笔记
This paper presents an innovative approach to large-scale garage modeling using LiDAR-assisted Gaussian splatting. The development of the Polar device and GarageWorld dataset represents a significant contribution to the field. The multi-resolution approach is particularly interesting for real-time applications on lightweight devices.