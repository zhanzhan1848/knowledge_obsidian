---
title: Blue Noise as a Lattice Gibbs Ensemble
authors: Zhuoran Yi et al.
date: 2026-08-13
source: arXiv cs.GR
url: https://arxiv.org/abs/2608.13446
pdf: https://arxiv.org/pdf/2608.13446
tags: [rendering, sampling, blue noise, Monte Carlo, path tracing, 2026]
status: unread
---

# Blue Noise as a Lattice Gibbs Ensemble

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Blue Noise as a Lattice Gibbs Ensemble |
| 作者 | Zhuoran Yi et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2608.13446) |
| PDF | [下载](https://arxiv.org/pdf/2608.13446) |

## 核心贡献
1. **Gibbs 分布公式**: 将蓝噪声生成表述为二元格点占据上的 Gibbs 分布采样，带有成对排斥相互作用
2. **Coupling Towards The Past 采样器**: 反向追踪马尔可夫链，固定深度截断，有界成本和依赖区域
3. **无通信平铺生成**: 单 tile 生成在足够光晕下，位精确匹配任意更大域上生成的相同区域
4. **自适应点画演示**: 14K 自适应点画，现有方法需要与输出成比例的内存

## 技术方案
**Gibbs 分布**:
```math
p(x) \propto \exp(-E(x))
```
其中能量 E 是成对相互作用之和，允许丢弃远程相互作用同时保持有界分布变化

**采样方法**: 
- 从目标状态反向追踪马尔可夫链（Coupling Towards The Past）
- 在固定深度截断轨迹
- 有界成本，有界依赖区域

**参数**:
- 密度 (density)
- 排斥强度 (repulsion strength)
- 相互作用尺度 (interaction scale)
- 核硬度 (kernel hardness)

## 实验结论
-  ensemble 重现标准蓝噪声谱，参数连续变化
- 采样器匹配预测的工作量和内存
- 平铺输出位精确匹配全域生成
- 支持多类别扩展

## 局限性
- 仅适用于二元占据（单类）
- 多类扩展需要进一步研究

## 可行性分析
- 实现难度：高（马尔可夫链理论 + 并行实现）
- 性能预期：适合 GPU 并行化
- 适用场景：蒙特卡洛渲染采样、抖序生成、点画

## 相关工作
- Blue noise sampling (单点/多点)
- Poisson disk sampling
- Lloyd relaxation

## 笔记
这篇论文将蓝噪声采样与统计力学联系起来，提供了严格的理论框架。Coupling Towards The Past 方法是核心技术亮点，值得深入研究。
