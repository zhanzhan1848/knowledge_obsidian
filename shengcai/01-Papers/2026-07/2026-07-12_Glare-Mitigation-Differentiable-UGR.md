---
title: Glare Mitigation using a Differentiable Unified Glare Rating
authors: Linas Beresna, et al.
date: 2026-07-06
source: Eurographics Symposium on Rendering (EGSR) 2026
url: https://arxiv.org/abs/2607.04796
pdf: https://arxiv.org/pdf/2607.04796
tags: [rendering, global-illumination, glare, differentiable, inverse-rendering, EGSR2026, 2026]
status: unread
---

# Glare Mitigation using a Differentiable Unified Glare Rating

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Glare Mitigation using a Differentiable Unified Glare Rating |
| 作者 | Linas Beresna, et al. |
| 来源 | Eurographics Symposium on Rendering (EGSR) 2026 |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2607.04796) |
| PDF | [下载](https://arxiv.org/pdf/2607.04796) |

## 核心贡献
1. 提出首个连续、完全可微分的UGR代理，用于建筑和汽车应用中的眩光缓解
2. 引入可微分光学散射通道，模拟人眼点扩展函数(PSF)来修复破碎的评估掩膜
3. 将离散UGR阶跃函数替换为可调sigmoid边界，实现从心理物理测量到物理场景参数的平滑梯度流

## 技术方案
核心方法：
- **问题**：传统CIE UGR依赖严格二元阈值，与基于梯度的逆渲染不兼容
- **解决方案**：
  1. 连续可微分的UGR代理
  2. 可微分光学散射通道（模拟人眼PSF）
  3. 可调sigmoid边界替代离散阶跃函数

三个辐射域的眩光优化：
1. 表面微几何粗糙化
2. 边界折射率(IOR)优化
3. 源侧发射器gobo掩蔽

## 实验结论
该框架在复杂全局光照环境中为优化视觉舒适度提供了稳健的基于物理的管线。

## 局限性
- 需要在低样本密度下解决Monte Carlo方差导致的优化不稳定
- sigmoid边界的可调参数可能需要针对不同场景进行调优

## 可行性分析
- 实现难度：中
- 性能预期：需要多次光线追踪评估以计算UGR
- 适用场景：建筑照明设计、汽车内饰设计、显示器眩光优化

## 相关工作
- [[Differentiable Rendering]]
- [[Inverse Rendering]]
- [[Global Illumination]]
- [[Physically-Based Rendering]]

## 笔记
**来源**：Eurographics Symposium on Rendering 2026 (Symposium Track)
**DOI**：10.2312/sr.20261013
