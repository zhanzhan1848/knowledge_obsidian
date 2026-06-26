---
title: Mesh2GS White-Box 3DGS Construction via Plenoptic Sampling
authors: University of Science and Technology of China
date: 2026-06-26
source: arXiv (cs.GR)
url: https://arxiv.org/abs/2606.21898
pdf: https://arxiv.org/pdf/2606.21898
tags: [rendering, 3DGS, global-illumination, neural-rendering, plenoptic-sampling, 2026]
status: unread
---

# Mesh2GS: White-Box 3DGS Construction via Plenoptic Sampling

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Mesh2GS: White-Box 3DGS Construction via Plenoptic Sampling |
| 作者 | University of Science and Technology of China |
| 来源 | arXiv (cs.GR) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2606.21898) |
| PDF | [下载](https://arxiv.org/pdf/2606.21898) |

## 核心贡献
1. 提出基于视场采样理论的白盒 3DGS 构建框架，从网格几何直接生成 3DGS
2. 提出 albedo-shading 分解的 3DGS 更新程序，高效捕捉全局光照
3. 引入神经光照增强模块处理非朗伯效应（如镜面高光）

## 技术方案
** Plenoptic Sampling 引导的 3DGS 构建策略**：
- 理论推导最小采样率和 3D 高斯分布
- 达到奈奎斯特级性能以实现高质量全局光照渲染

** Albedo-Shading 分解**：
- 分离反射率和着色信息
- 高效捕捉全局光照

**神经光照增强模块**：
- 选择性激活以表示非朗伯效应
- 处理镜面高光等效果

## 实验结论
- 在多种场景上优于现有基线方法
- 适用于实时共享渲染和非朗伯效应捕捉
- 可使用低样本路径追踪信号进行高效实时更新

## 局限性
- 代码将根据接受情况发布

## 可行性分析
- 实现难度：中
- 性能预期：高质量全局光照渲染，实时性能
- 适用场景：AR/VR、实时共享渲染、网格到 3DGS 转换

## 相关工作
- 3D Gaussian Splatting (3DGS)
- SuGaR
- GaussianMesh
- 神经辐射缓存

## 笔记
代码将根据接受情况发布