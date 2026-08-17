---
title: Amulet: Frame Extrapolation Through Sparse Layered Scene Representation and Adaptive Shading
authors: Sebastian Künzel, Fabian Schmierer, Sergej Geringer, Guido Reina, Daniel Weiskopf, Dieter Schmalstieg
date: 2026-08-11
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.10423
pdf: https://arxiv.org/pdf/2608.10423
tags: [rendering, frame-extrapolation, real-time, DLSS, variable-rate-shading, 2026]
status: unread
---

# Amulet: Frame Extrapolation Through Sparse Layered Scene Representation and Adaptive Shading

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Amulet: Frame Extrapolation Through Sparse Layered Scene Representation and Adaptive Shading |
| 作者 | Sebastian Künzel, Fabian Schmierer, Sergej Geringer, Guido Reina, Daniel Weiskopf, Dieter Schmalstieg |
| 来源 | arXiv (cs.GR) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.10423) |
| PDF | [下载](https://arxiv.org/pdf/2608.10423) |
| 机构 | University of Stuttgart |

## 核心贡献
1. **稀疏分层场景表示**: 将场景转换为稀疏、平铺分层的中间表示用于高频率帧外推
2. **显式几何存储**: 显式光栅化并存储潜在可见几何，避免重投影技术的伪影
3. **预测性填充**: 缓存预测性地填充未来视图的着色信息，多帧摊销
4. **自适应着色调度**: 基于梯度的调度器为每个图块分配生命周期

## 技术方案

### 核心思想
Amulet 将场景转换为稀疏、平铺和分层的中间场景表示（缓存），用于高频帧外推。与重投影技术不同，Amulet 显式光栅化并存储潜在可见几何，允许精确着色和新暴露区域的修复。

### 关键创新
1. **分层图像空间缓存**: 存储可见几何，支持精确着色
2. **预测性着色填充**: 预测性地为未来视图填充着色信息
3. **自适应更新调度**: 预测性、基于梯度的调度器动态分配图块生命周期
4. **解耦刷新率**: 将光栅化和着色率与显示器刷新率解耦

### 性能指标
- 可将 60Hz 着色率外推到 240Hz 显示器
- 4K 分辨率下达 250Hz
- 与 DLSS 和神经流方法竞争

## 公式
缓存更新生命周期调度：
```math
L_{tile} = f(\nabla_{temporal}, \Delta_{motion}, I_{occlusion})
```

## 实验结论
- 在多种指标上与 DLSS 和神经流方法竞争
- 可外推比当代方法更多帧且质量高
- 延迟受限帧插值方法在许多场景中质量相近

## 局限性
- 需要场景表示缓存
- 动态场景下缓存维护开销
- 对运动估计准确性敏感

## 可行性分析
- **实现难度**: 中等（需要分层渲染经验）
- **性能预期**: 高（250Hz @ 4K）
- **适用场景**: 高刷新率显示器、游戏渲染、VR/AR

## 相关工作
- [[Variable-Rate-Ray-Tracing]]
- [[Neural-Frame-Interpolation]]

## 笔记
来自斯图加特大学的研究，提出了一种非神经的帧外推方法，在处理遮挡方面有独特优势。与 NVIDIA 的 VRRT 技术形成对比。
