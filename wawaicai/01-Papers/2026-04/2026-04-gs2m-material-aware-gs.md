---
tags: [几何, 网格重建, 高斯泼溅, 反射表面, Eurographics, 2026]
---

# GS-2M: Material-aware Gaussian Splatting for High-fidelity Mesh Reconstruction

## 核心方法

提出一种基于 3D 高斯泼溅 (3DGS) 的材质感知优化框架，用于从多视角图像重建高保真网格。与之前分别处理几何重建和材质分解的方法不同，本方法通过联合优化与渲染深度和法线质量相关的属性，同时保持几何细节并对反射表面具有鲁棒性。

## 算法要点

- **问题**: 从多视角图像重建高质量网格，特别针对反射表面
- **核心创新**: 
  - 联合优化几何 + 材质属性
  - 基于多视角光度变化的粗糙度监督策略
  - 无复杂神经网络的统一框架
- **优势**: 可处理高反射表面，重建质量媲美 SOTA
- **输出**: 精确三角形网格

## 开源实现
- GitHub: [GS-2M](https://github.com/ndming/GS-2M)
- 依赖: PyTorch, CUDA, COLMAP

## 相关笔记
[[2026-04-Dual-Contouring-SDF]]

## 元信息
- **arXiv**: [2509.22276](https://arxiv.org/abs/2509.22276)
- **DOI**: 10.1111/cgf.70347
- **日期**: 2025-09 (updated 2026)
- **作者**: Dinh Minh Nguyen et al.
- **领域**: cs.CV
- **会议**: Eurographics 2026, Computer Graphics Forum
