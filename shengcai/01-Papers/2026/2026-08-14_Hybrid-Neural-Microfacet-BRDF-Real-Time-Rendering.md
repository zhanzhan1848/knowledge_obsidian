---
title: A Hybrid Neural-Microfacet BRDF Model for Real-Time Rendering
authors: Louis De Oliveira et al. (Ubisoft La Forge)
date: 2026-08-10
source: arXiv cs.GR (EGSR 2026)
url: https://arxiv.org/abs/2608.09604
pdf: https://arxiv.org/pdf/2608.09604
tags: [rendering, PBR, BRDF, real-time rendering, neural rendering, EGSR, 2026]
status: unread
---

# A Hybrid Neural-Microfacet BRDF Model for Real-Time Rendering

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | A Hybrid Neural-Microfacet BRDF Model for Real-Time Rendering |
| 作者 | Louis De Oliveira et al. (Ubisoft La Forge) |
| 来源 | arXiv cs.GR (Eurographics Symposium on Rendering EGSR 2026) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.09604) |
| PDF | [下载](https://arxiv.org/pdf/2608.09604) |
| 项目页 | [https://ubisoft-laforge.github.io/world/hybridrdf](https://ubisoft-laforge.github.io/world/hybridrdf) |

## 核心贡献
1. **混合 BRDF 模型**: 结合 GGX 型微表面模型和神经网络，充分利用两种表示的优点
2. **神经网络校正**: 神经组件校正微表面组件近似的外观，允许比现有神经模型更小的网络
3. **重要性采样**: 保留重要性采样方案，同时保持艺术家友好编辑性
4. **内存效率**: 在相同内存成本下，比 SOTA 神经模型更好地近似测量数据

## 技术方案
**混合架构**:
- **微表面组件 (GGX)**: 提供忠实且有用的近似，保持 PBR 管线兼容性
- **神经组件**: 校正微表面模型无法捕获的微妙外观效果（衍射、彩虹色、多层材质等）
- **共享潜在代码**: 每个材质一个紧凑的微表面参数集 (kd, η, α) 和跨单一神经网络的低维潜在代码 z

**网络设计**: 紧凑神经网络，内存占用与纯微表面模型相当，但能捕获复杂光学现象

## 公式
```math
f_r(\omega_i, \omega_o) = f_{microfacet}(\omega_i, \omega_o; \theta) + f_{neural}(\omega_i, \omega_o; z)
```
其中 θ = (kd, η, α) 是微表面参数，z 是材质潜在代码

## 实验结论
- 相同内存成本下，比 SOTA 神经 BRDF 模型更好地近似测量数据
- 评估开销相对于微表面模型仅少量增加
- 支持重要性采样（Importance Sampling）
- 适合离线渲染和实时渲染

## 局限性
- 仍需要预计算潜在代码
- 对极端材质可能需要更大网络

## 可行性分析
- 实现难度：中（需训练神经网络 + 集成到渲染管线）
- 性能预期：实时渲染可行，接近传统微表面模型开销
- 适用场景：游戏、电影预可视化、需要精确材质的实时应用

## 相关工作
- Disney Principled BRDF
- NeuMIP
- BRDF measurements (MERL, ISPR)

## 笔记
**🥩 重要论文**: 这篇 Ubisoft La Forge 的论文是实时渲染 BRDF 的重要进展。混合方法巧妙结合微表面模型的效率和神经网络的精度，特别适合处理彩虹色、衍射等传统 PBR 难以准确表达的材质。推荐传递给 @墨鱼丸 进行算法评估。
