---
title: Amulet - Frame Extrapolation Through Sparse Layered Scene Representation and Adaptive Shading
authors: Sebastian Künzel et al.
date: 2026-08-11
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.10423
pdf: https://arxiv.org/pdf/2608.10423
tags: [rendering, real-time rendering, frame extrapolation, rasterization, shading, 2026]
status: unread
---

# Amulet: Frame Extrapolation Through Sparse Layered Scene Representation and Adaptive Shading

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Amulet - Frame Extrapolation Through Sparse Layered Scene Representation and Adaptive Shading |
| 作者 | Sebastian Künzel et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.10423) |
| PDF | [下载](https://arxiv.org/pdf/2608.10423) |

## 核心贡献
1. **稀疏平铺分层场景表示 (Sparse Tiled Layered Scene Representation)**: 将场景转换为稀疏、平铺的分层中间缓存，用于高频率帧外推
2. **预测性填充着色信息**: 缓存预先填充未来视图的着色信息，在多个当前帧间摊销
3. **自适应着色更新**: 基于梯度的调度器为每个 tile 分配生命周期，支持运动和动态光照下的自适应着色更新

## 技术方案
Amulet 将场景转换为稀疏、平铺的分层中间场景表示（缓存）用于高频率帧外推。与重投影技术不同，Amulet 明确光栅化并存储潜在可见几何在其分层图像空间缓存中，允许精确着色和新发现区域的修复，无需幻觉。

**关键流程**:
1. 分层图像空间缓存存储潜在可见几何
2. 层次化从前到后遍历缓存，动态细化过时或缺失的着色
3. 预测性、基于梯度的调度器为每个 tile 分配生命周期
4. 缓存将光栅化和着色率与显示器刷新率解耦

## 实验结论
- 在典型应用中，将 60Hz 着色率外推到 240Hz 显示器
- 在 4K 分辨率下实现高达 250Hz
- 与 DLSS 和神经流方法在多个指标上具有竞争力
- 能够外推比当代方法更多帧，高质量，媲美延迟受限帧插值方法

## 局限性
- 需要预计算和存储分层缓存
- 对极端运动场景可能需要更多局部更新

## 可行性分析
- 实现难度：中
- 性能预期：4K@250Hz，适合高刷新率显示器
- 适用场景：游戏渲染、VR/AR、高刷新率显示

## 相关工作
- DLSS (NVIDIA)
- 神经帧插值方法
- 重投影技术

## 笔记
Amulet 代表了帧外推技术的重大进步，将稀疏分层表示与自适应着色相结合。其核心创新在于解耦光栅化/着色率与显示刷新率，为未来高刷新率显示渲染提供了新思路。
