---
title: Wave Tracing: Generalizing The Path Integral To Wave Optics
authors: Steinberg et al. (NVIDIA)
date: 2026
source: Computer Graphics Forum (Eurographics) 2026 🏆 Best Paper Honorable Mention
url: https://research.nvidia.com/labs/rtr/publication/steinberg2026pathintegral/
tags: [rendering, wave-optics, path-integral, diffraction, Eurographics2026]
status: unread
---

# Wave Tracing: Generalizing The Path Integral To Wave Optics

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Wave Tracing: Generalizing The Path Integral To Wave Optics |
| 作者 | Steinberg et al. (NVIDIA) |
| 来源 | Computer Graphics Forum (Eurographics) 2026 🏆 Best Paper Honorable Mention |
| 年份 | 2026 |
| 链接 | [原文](https://research.nvidia.com/labs/rtr/publication/steinberg2026pathintegral/) |

## 核心贡献
1. **双线性路径积分推广**: 将经典光传输的路径积分形式推广到波动光学，建模路径间的波动干涉
2. **弱局部路径积分**: 基于 region-to-region 传输，使用椭圆锥采样，可在双线性设置下采样单个路径并准确建模波动效应
3. **完整波动追踪系统**: 集成椭圆锥的实用系统，应用于渲染和长波辐射传播与衍射仿真

## 技术方案
- 分析经典路径积分能复现哪些波动光学现象
- 揭示 shooting-bouncing rays 和 UTD-based diffraction 方法的内在联系与挑战
- 椭圆锥传输提供一种可推导多种实用传输算法的路径积分形式

## 公式
```math
\text{bilinear path integral: } K(x,y) = \int\int e^{iS(x,y)} D[x]D[y]
```

## 实验结论
- 在复杂环境中实现精确波动效应模拟
- 长波辐射传播与衍射的高效仿真

## 可行性分析
- 实现难度：高（理论复杂，需新采样方法）
- 性能预期：准确模拟波动光学现象
- 适用场景：光学系统仿真、衍射渲染、科学可视化

## 相关工作
- [[Path Tracing]] [[Diffraction]] [[UTD]] [[Wave Optics]]

## 笔记
Eurographics 2026 Best Paper Honorable Mention。理论意义重大，将路径积分推广到波动光学领域。