---
title: Blue Noise as a Lattice Gibbs Ensemble
authors: Thomas L. F. da Silva, Wojciech Jarosz, Fabrice Neyret, Ferran Rodríguez
date: 2026-08-14
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.13446
pdf: https://arxiv.org/pdf/2608.13446
tags: [rendering, sampling, blue-noise, gibbs, paper, 2026]
status: unread
---

# Blue Noise as a Lattice Gibbs Ensemble

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Blue Noise as a Lattice Gibbs Ensemble |
| 作者 | Thomas L. F. da Silva, Wojciech Jarosz, Fabrice Neyret, Ferran Rodríguez |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.13446) |
| PDF | [下载](https://arxiv.org/pdf/2608.13446) |

## 核心贡献
1. 将蓝噪声采样形式化为二元格点occupancy上的Gibbs分布采样问题，具有成对排斥相互作用
2. 提出基于"Coupling Towards The Past"的Markov链追踪方法，通过固定深度截断实现有界计算成本
3. 实现bit-identical的tiled蓝噪声生成，单tile独立生成与任意大域上生成完全一致
4. 演示自适应stippling (14K分辨率) 和多类别扩展

## 技术方案
将蓝噪声生成建模为带成对排斥相互作用的Gibbs-Markov随机场：
- 分布参数：密度、排斥强度、相互作用尺度、核函数硬度
- 能量函数对所有点对求和，远距离相互作用可丢弃（有界误差）
- 为有界Markov链，度数有限

采样算法：
- 从目标状态向后追踪Markov链 (Coupling Towards The Past)
- 在固定深度截断trace，有界计算成本
- 每个sample依赖的区域有界
- Tile在足够halo下独立生成，结果bit-identical

**核心创新**：将统计建模与可扩展生成统一到一个框架中，内存由tile大小决定而非输出大小。

## 公式
```math
p(x) = \frac{1}{Z} \exp\left(-\beta \sum_{i<j} V(r_{ij})\right)
```
其中 $V$ 是排斥势能，$\beta$ 控制密度，$r_{ij}$ 是点对距离。

## 实验结论
- 采样器匹配预测的工作量和内存消耗
- Tiled输出验证与全域生成bit-identical
- 自适应stippling在14K分辨率下成功，现有方法需要与输出成比例的内存
- 可在参数连续变化时重现标准蓝噪声频谱

## 局限性
- 仅适用于二元occupancy（单类采样）
- 多类别扩展需进一步研究
- 固定深度的误差界需要验证

## 可行性分析
- 实现难度：**中**
- 性能预期：内存效率高，适合大规模采样
- 适用场景：渲染采样、抖动、半色调、stippling

## 相关工作
- [[蓝噪声采样]]
- [[渲染采样技术]]

## 笔记
这是将优化/传输方法与过程化/tile方法统一的重要工作，对渲染采样有直接应用价值。
