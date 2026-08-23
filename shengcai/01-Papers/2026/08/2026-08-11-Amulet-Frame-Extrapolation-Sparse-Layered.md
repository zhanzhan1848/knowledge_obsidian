---
title: Amulet: Frame Extrapolation Through Sparse Layered Scene Representation and Adaptive Shading
authors: Sebastian Künzel, Fabian Schmierer, Sergej Geringer, Guido Reina, Daniel Weiskopf, Dieter Schmalstieg
date: 2026-08-11
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.10423
pdf: https://arxiv.org/pdf/2608.10423.pdf
tags: [rendering, real-time, frame-extrapolation, rasterization, adaptive-shading, 2026]
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
1. **Sparse layered image-space cache** - 稀疏分层图像空间缓存
2. **Predictive shading fill** - 预测性填色（对未来视图预先填充着色信息）
3. **Adaptive shading updates** - 基于预测性梯度调度器的自适应着色更新
4. **High-frequency frame extrapolation** - 高频帧外推（60Hz → 240Hz）

## 技术方案

### 与重投影技术对比
- **重投影技术**：存在 hallucination 问题（凭空生成新区域）
- **Amulet**：明确光栅化并存储潜在可见几何，避免 hallucination

### 核心方法
1. 将场景转换为稀疏、分层、分块的中间场景表示（cache）
2. 缓存预测性填充未来视图的着色信息（摊销到多个当前帧）
3. 通过分层前向遍历缓存生成新视图
4. 使用预测性梯度调度器为每个图块分配生命周期

### 性能结果
- 在典型应用中，将 60Hz 着色率外推到 240Hz 显示
- 在 4K 分辨率下实现高达 **250Hz**
- 在多个指标上与 DLSS 和神经流方法竞争
- 可外推比当代方法更多的帧，高质量

## 实现细节
- 非神经方法（explicit handling of disocclusions）
- 解耦光栅化和着色率与显示刷新率
- 单个着色帧可用于合成多个外推帧，只需少量局部更新

## 可行性分析
- 实现难度：中
- 性能预期：250Hz @ 4K，实时帧外推
- 适用场景：高刷新率显示、游戏渲染、超分辨率

## 相关工作
- [[DLSS]]
- [[神经帧插值]]
- [[帧外推技术]]

## 笔记
非神经帧外推方法，可作为 DLSS 等的替代方案。核心创新是稀疏分层缓存和预测性着色填充，适合高刷新率显示应用。
