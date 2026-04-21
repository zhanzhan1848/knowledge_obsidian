---
tags: [渲染, 实时路径追踪, ReSTIR, GRIS, RIS, NVIDIA, 2026]
date: [[2026-04-21]]
status: 重要
source: NVIDIA Research / TweakTown
---

# ReSTIR PT Enhanced: NVIDIA 实时路径追踪新突破

## 元信息

| 标题 | ReSTIR PT Enhanced with Generalized Resampled Importance Sampling |
|------|------|
| 来源 | NVIDIA Research + University of Utah |
| 原始论文 | SIGGRAPH 2022: GRIS (Generalized Resampled Importance Sampling) |
| 新闻来源 | [TweakTown](https://www.tweaktown.com/news/111172/nvidias-new-path-tracing-tech-could-change-game-graphics-forever/index.html) |
| 发布 | 2026-04-21 |

## 核心贡献

### 1. ReSTIR PT Enhanced
- 基于多年 ReSTIR 研究工作的升级版本
- 核心: Generalized Resampled Importance Sampling (GRIS)
- 解决 ReSTIR 最大限制之一: 跨帧重用光照样本时如何保持准确性

### 2. GRIS 理论基础 (SIGGRAPH 2022)
- 扩展 ReSTIR 数学基础
- 允许在相关样本上进行 RIS
- 支持未知 PDF 和多样本域
- 提供方差边界和收敛条件保证

### 3. 性能提升
- **2-3 倍性能提升**
- 更好的图像质量
- 减少噪声
- 更少伪影

## 技术方案

### ReSTIR 原理
通过从相邻像素和前一帧重用光照数据，减少需要追踪的光线数量。允许使用每像素仅一条路径来近似复杂光照（多次弹射、反射、间接光照）。

### GRIS 改进
- 解决早期实现中的相关性引入问题
- 实现稳定收敛
- 支持更高级的样本重用

### 工作流程
```
每像素 1 条路径 → 时空样本重用 (ReSTIR) → GRIS 理论保证 → 高质量路径追踪
```

### 核心公式 (GRIS)
扩展 RIS 理论到相关样本:

```math
\hat{I} = \frac{1}{N} \sum_{i=1}^{N} \frac{w_i f(x_i)}{p(x_i)}
```

其中 $w_i$ 是通过 GRIS 框架正确计算的权重。

### 关键技术点

1. **时空重要性重采样 (Spatiotemporal Reservoir Resampling)**
2. **Shift Mapping**: 复杂像素间路径重用
3. **收敛保证**: 离线渲染器也可保证收敛

## 性能对比

| 指标 | 传统 Path Tracing | ReSTIR PT | ReSTIR PT Enhanced |
|------|-----------------|-----------|-------------------|
| 每像素光线数 | 1024+ | 1 | 1 |
| 帧间稳定性 | 高 | 中 | 高 |
| 图像质量 | 最高 | 中 | 高 |
| 噪声 | 低 | 中-高 | 低 |
| 速度 | 慢 | 快 | 更快 (2-3x) |

## 应用场景

- **游戏实时渲染**: 完全光线追踪游戏更近实用
- **VR/AR**: 高帧率需求
- **交互式渲染**: 设计预览
- **NVIDIA RTX SDK**: 已集成在 NvRTX 5.7

## 原始论文信息

| 项目 | 内容 |
|------|------|
| 论文 | Generalized Resampled Importance Sampling: Foundations of ReSTIR |
| 作者 | Daqi Lin (Utah), Jacopo Pantaleoni (NVIDIA), Cem Yuksel (Utah) |
| 发表 | SIGGRAPH 2022 |
| 链接 | [NVIDIA Research](https://research.nvidia.com/publication/2022-07_generalized-resampled-importance-sampling-foundations-restir) |
| 项目页 | [graphics.cs.utah.edu](https://graphics.cs.utah.edu/research/projects/gris/) |

## 可行性分析

- **实现难度**: 高 (NVIDIA 内部研究，未完全开源)
- **性能预期**: 2-3x 提升，接近实用
- **适用场景**: 游戏、实时渲染、VR
- **开源状态**: 基础 GRIS 理论有公开，实现细节未完全公开
- **推荐度**: ⭐⭐⭐⭐⭐ (重大突破，值得深入研究)

## 行动建议

1. 深入阅读 GRIS SIGGRAPH 2022 论文
2. 研究 NVIDIA NvRTX SDK 中的 ReSTIR 实现
3. 可传递给 @墨鱼丸 评估在渲染引擎中的集成

## 相关链接

- [GRIS 项目页面](https://graphics.cs.utah.edu/research/projects/gris/)
- [NVIDIA RTX Dynamic Illumination SDK](https://developer.nvidia.com/rtx-dynamic-gi)
- [TweakTown 报道](https://www.tweaktown.com/news/111172/nvidias-new-path-tracing-tech-could-change-game-graphics-forever/index.html)
