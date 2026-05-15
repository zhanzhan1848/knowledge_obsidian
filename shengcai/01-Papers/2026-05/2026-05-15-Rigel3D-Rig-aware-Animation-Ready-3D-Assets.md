---
title: Rigel3D - Rig-aware Latents for Animation-Ready 3D Asset Generation
authors: Nikitas Chatzis et al.
date: 2026-05-13
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.13129
pdf: https://arxiv.org/pdf/2605.13129
tags: [rendering, 3D generation, rigging, skeletal, animation, 2026]
status: unread
---

# Rigel3D - Rig-aware Latents for Animation-Ready 3D Asset Generation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Rigel3D: Rig-aware Latents for Animation-Ready 3D Asset Generation |
| 作者 | Nikitas Chatzis et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.13129) |
| PDF | [下载](https://arxiv.org/pdf/2605.13129) |

## 核心贡献
1. **Rigel3D**：生成动画就绪 3D 资产生成方法
2. 联合建模几何和 rig 结构，通过耦合表面和骨架结构化潜在表示
3. Rig-aware 自编码器解码几何、骨架拓扑、关节坐标和 skinning weights
4. 两阶段潜在生成模型 + 开放词汇关节标注

## 技术方案
现有问题：3D 生成模型输出通常是静态的，缺乏动画所需的骨骼 rigs、关节层次和 skinning weights。

**Rigel3D 架构**：
- 耦合表面和骨架结构化潜在表示
- Rig-aware 自编码器解码 mesh 几何、骨架拓扑、关节坐标、skinning weights
- 两阶段潜在生成模型综合图像条件生成
- 开放词汇关节标注模块嵌入到共享视觉-语言空间

## 实验结论
- 生成多样化、高质量动画就绪资产
- 在多个指标上优于现有 rigging 基线

## 可行性分析
- 实现难度：高
- 性能预期：高质量 rigged 3D 资产生成
- 适用场景：游戏、电影、仿真、 embodied AI

## 相关工作
- 3D generative models
- Auto-rigging
- Skeletal animation

## 笔记
生成 + rigging 联合学习是趋势，生成动画就绪资产有重要应用价值