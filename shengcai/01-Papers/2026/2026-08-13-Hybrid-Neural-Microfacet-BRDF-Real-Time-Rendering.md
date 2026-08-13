---
title: A Hybrid Neural-Microfacet BRDF Model for Real-Time Rendering
authors: Louis De Oliveira, Anastasia Karpova, Georges Nader, Antoine Houdard, Pierre Mezieres, Damien Rioux-Lavoie, Romain Pacanowski
date: 2026-08-10
source: arXiv cs.GR (Eurographics Symposium on Rendering EGSR 2026)
url: https://arxiv.org/abs/2608.09604
pdf: https://arxiv.org/pdf/2608.09604.pdf
tags: [rendering, PBR, BRDF, neural rendering, real-time rendering, microfacet, 2026]
status: unread
---

# A Hybrid Neural-Microfacet BRDF Model for Real-Time Rendering

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | A Hybrid Neural-Microfacet BRDF Model for Real-Time Rendering |
| 作者 | Louis De Oliveira, Anastasia Karpova, Georges Nader, Antoine Houdard, Pierre Mezieres, Damien Rioux-Lavoie, Romain Pacanowski |
| 来源 | arXiv cs.GR (Eurographics Symposium on Rendering EGSR 2026) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.09604) |
| PDF | [下载](https://arxiv.org/pdf/2608.09604.pdf) |
| 项目页 | https://ubisoft-laforge.github.io/world/hybridrdf |

## 核心贡献
1. **混合模型架构**：将 GGX 型微面元模型与神经网络结合，兼具两者优势
2. **微型网络校正**：神经网络仅校正微面元近似的外观，允许比现有神经模型小得多的网络
3. **等内存优势**：在相同内存成本下，比 SOTA 神经模型更好地近似测量数据
4. **低评估开销**：相比微面元模型仅有少量额外评估开销
5. **艺术家可编辑性**：保持微面元模型的可编辑性，支持重要性采样

## 技术方案

### 混合 BRDF 模型
```
BRDF = f_microfacet(θ) + Δf_neural(θ)
```
- **微面元组件**：GGX 型微面元模型，提供基础近似
- **神经组件**：小型神经网络校正微面元与实测数据的差异

### 核心思想
- 微面元模型提供物理基础和效率
- 神经网络捕获复杂光-表面相互作用（衍射、彩虹色、多层材质等）
- 只需校正残差，网络规模大幅缩小

### 采样支持
- 继承微面元模型的重要性采样方案
- 可用于离线路径追踪和实时渲染

## 实验结论
- 相同内存成本下，比 SOTA 神经模型更好地近似测量
- 评估开销仅比标准微面元模型略高
- 适用于离线渲染和实时渲染

## 局限性
- 仍依赖微面元基础模型的选择
- 神经网络部分需要针对特定材质类型训练
- 极端入射角下校正可能不稳定

## 可行性分析
- 实现难度：中（需训练小型 MLP 网络）
- 性能预期：适合实时渲染管道，可集成到现有 PBR 管线
- 适用场景：游戏、电影预演、实时产品可视化

## 相关工作
- [[微面元 BRDF 模型]]
- [[神经材质]]
- [[Measured BRDF 数据库]]

## 笔记
这是 Ubisoft La Forge 的工作，已被 EGSR 2026 接收。混合架构是神经渲染实用化的重要方向，值得推荐给墨鱼丸关注。
