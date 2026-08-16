---
title: Amulet - Frame Extrapolation Through Sparse Layered Scene Representation and Adaptive Shading
authors: Sebastian Künzel et al.
date: 2026-08-12
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.10423
pdf: https://arxiv.org/pdf/2608.10423
tags: [rendering, real-time-rendering, frame-extrapolation, rasterization, shading, paper, 2026]
status: unread
---

# Amulet - Frame Extrapolation Through Sparse Layered Scene Representation and Adaptive Shading

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Amulet: Frame Extrapolation Through Sparse Layered Scene Representation and Adaptive Shading |
| 作者 | Sebastian Künzel et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.10423) |
| PDF | [下载](https://arxiv.org/pdf/2608.10423) |

## 核心贡献
1. 提出**Amulet**——一种将场景转换为稀疏、平铺、分层中间场景表示（cache）的高频帧外推方法
2. Cache支持未来视图的预测填充（amortized over多帧），解耦光栅化和着色率与显示器刷新率
3. 层级化前向遍历cache，结合基于梯度的自适应调度器动态分配tile生命周期
4. 可从60Hz着色率外推到240Hz显示，4K分辨率下达250Hz

## 技术方案
**核心思想**：显式光栅化并存储潜在可见几何到分层image-space cache，而非重投影技术：
- 区分rasterization和shading rate，允许低频光栅化高频着色
- Cache预测填充未来视图着色信息
- 层级化前向→后向遍历，动态细化stale/missing着色
- 自适应着色更新调度器

**与传统方法对比**：
| 方法 | 光栅化 | 着色 | 适用性 |
|------|--------|------|--------|
| 重投影 | 无显式几何 | 全量 | 有hallucination问题 |
| DLSS | 神经网络 | 神经网络 | 质量依赖模型 |
| Amulet | 显式光栅化 | 自适应细化 | 准确无幻觉 |

## 实验结论
- 典型应用：从60Hz着色率外推到240Hz显示
- 4K分辨率下达250Hz
- 质量与DLSS和neural-flow方法竞争
- 可外推比当代方法更多帧，高质量，延迟绑定帧插值方法可比较

## 局限性
- 需要预先生成cache，对新场景有初始化开销
- 动态场景下cache可能快速失效

## 可行性分析
- 实现难度：**中**（需要rasterization pipeline扩展）
- 性能预期：GPU资源友好，适合游戏渲染
- 适用场景：游戏帧生成、高刷新率显示、VR/AR

## 相关工作
- [[DLSS]]
- [[帧插值]]
- [[实时渲染]]

## 笔记
这是非神经网络的帧外推方案，值得关注。与NVIDIA DLSS和AMD FSR等技术形成直接竞争。
