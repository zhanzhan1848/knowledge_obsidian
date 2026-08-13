---
title: Amulet: Frame Extrapolation Through Sparse Layered Scene Representation and Adaptive Shading
authors: Sebastian Künzel, Fabian Schmierer, Sergej Geringer, Guido Reina, Daniel Weiskopf, Dieter Schmalstieg
date: 2026-08-11
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.10423
pdf: https://arxiv.org/pdf/2608.10423.pdf
tags: [rendering, real-time rendering, frame extrapolation, rasterization, adaptive shading, 2026]
status: unread
---

# Amulet: Frame Extrapolation Through Sparse Layered Scene Representation and Adaptive Shading

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Amulet: Frame Extrapolation Through Sparse Layered Scene Representation and Adaptive Shading |
| 作者 | Sebastian Künzel, Fabian Schmierer, Sergej Geringer, Guido Reina, Daniel Weiskopf, Dieter Schmalstieg |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.10423) |
| PDF | [下载](https://arxiv.org/pdf/2608.10423.pdf) |

## 核心贡献
1. **稀疏分层场景表示缓存**：将场景变换为稀疏、平铺、分层的中间场景表示（缓存），用于高频帧外推
2. **显式几何存储**：与重投影技术不同，Amulet 显式光栅化并存储潜在可见几何于分层图像空间缓存中，允许对新暴露区域的精确着色和修复
3. **预测性填充着色信息**：缓存通过多个当前帧摊销，预测性填充未来视图的着色信息
4. **自适应着色更新**：基于预测的梯度调度器为每个瓦片分配生命周期，在运动和动态光照下实现自适应着色更新

## 技术方案

### 核心方法
1. 将场景转换为稀疏、平铺、分层的中间场景表示（cache）
2. 层次化从前向后遍历缓存，逐步细化过时或缺失的着色
3. 预测性、基于梯度的调度器为每个瓦片分配生命周期
4. 帧外推：典型应用将 60 Hz 着色率外推到 240 Hz 显示
5. 在 4K 分辨率下实现高达 250 Hz

### 关键创新
- **解耦光栅化和着色率**：从显示刷新率中解耦光栅化和着色率
- **非神经帧外推**：不依赖神经网络的精确多帧外推，显式处理遮挡（disocclusions）
- **零幻觉修复**：避免重投影技术的幻觉问题

## 实验结论
- 在 4K 分辨率下达 250 Hz
- 与 DLSS 和神经流方法在多项指标上具有竞争力
- 可外推比当代方法更多的帧，质量高
- 在许多场景中可与延迟受限的帧插值方法相媲美

## 局限性
- 需要场景几何信息用于分层缓存构建
- 对极端运动场景的自适应调度仍可能产生局部过时着色
- 缓存构建本身有额外开销

## 可行性分析
- 实现难度：中
- 性能预期：在现代 GPU 上可达 250Hz @ 4K，与 DLSS 竞争
- 适用场景：游戏高刷新率显示、VR/AR 低延迟渲染、自动驾驶实时可视化

## 相关工作
- [[DLSS (Deep Learning Super Sampling)]]
- [[Frame Interpolation Methods]]
- [[Reprojection-based techniques]]

## 笔记
与神经方法（DLSS、神经流）相比，这是一个纯光栅化+着色缓存方案，优点是无需训练、确定性行为、显式几何处理。可作为墨鱼丸的帧率提升方案参考。
