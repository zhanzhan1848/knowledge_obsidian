---
tags: [渲染, PBR, BRDF, 实时渲染, 神经渲染, EGSR2026]
date: [[2026-08-10]]
status: 待深入分析
---

# A Hybrid Neural-Microfacet BRDF Model for Real-Time Rendering

## 元信息

| 属性 | 内容 |
|------|------|
| **标题** | A Hybrid Neural-Microfacet BRDF Model for Real-Time Rendering |
| **作者** | Louis De Oliveira, Anastasia Karpova, Georges Nader, Antoine Houdard, Pierre Mezieres, Damien Rioux-Lavoie, Romain Pacanowski |
| **链接** | [arXiv](https://arxiv.org/abs/2608.09604) |
| **项目页** | [ubisoft-laforge.github.io/world/hybridrdf](https://ubisoft-laforge.github.io/world/hybridrdf) |
| **发表** | Eurographics Symposium on Rendering (EGSR) 2026 |
| **日期** | 2026-08-10 |
| **arXiv ID** | 2608.09604v1 |

## 核心贡献

1. **混合模型架构**: 结合GGX型微面元模型和神经网络，保留两者的优点
2. **小型神经网络**: 神经组件仅用于校正微面元BRDF的近似误差，网络规模小
3. **艺术家可编辑性**: 保持传统微面元模型的可编辑性
4. **重要性采样**: 支持重要性采样方案，兼容离线和实时渲染

## 技术方案

### 问题背景

微面元BRDF模型是实时渲染管线的基础，但存在以下局限：
- 难以复现复杂光-表面交互产生的微妙外观效果
- 专业物理模型（如衍射、彩虹色、多层）失去通用性
- 神经模型虽然准确，但网络过大，不适合实时渲染

### 解决方案

```
BRDF(p, ωo, ωi) = f_microfacet(p, ωo, ωi) + f_neural(p, ωo, ωi)
```

- `f_microfacet`: GGX型微面元模型，提供基础近似
- `f_neural`: 小型神经网络，校正微面元模型的误差

### 关键特性

1. **内存效率**: 在相同内存成本下，比SOTA神经模型更好地近似测量数据
2. **低计算开销**: 相比微面元模型，仅增加少量评估开销
3. **通用性**: 可处理各种光学现象

## 实验结论

- 在MERL 100K等标准BRDF数据集上验证
- 与State-of-the-art神经BRDF模型对比，质量更好
- 实时渲染性能满足游戏级别需求

## 局限性

- 依赖测量数据或模拟数据进行训练
- 神经网络训练需要一定计算资源

## 相关笔记

- [[2026-08-05_SIGGRAPH2026-Advances-RealTime-Rendering]] - SIGGRAPH 2026实时渲染进展
- [[2026-08-05_Compact-SVBRDF-Gaussian-Texture-Compression]] - SVBRDF压缩技术

## 链接

- PDF: https://arxiv.org/pdf/2608.09604
- Project: https://ubisoft-laforge.github.io/world/hybridrdf
