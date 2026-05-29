---
title: F-RNG Feed-Forward Relightable Neural Gaussians
authors: Jiahui Fan
date: 2026-05-28
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.25975
pdf: https://arxiv.org/pdf/2605.25975
tags: [rendering, neural-rendering, gaussian-splatting, relighting, 2026]
status: unread
---

# F-RNG: Feed-Forward Relightable Neural Gaussians

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | F-RNG: Feed-Forward Relightable Neural Gaussians |
| 作者 | Jiahui Fan |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2605.25975) |
| PDF | [下载](https://arxiv.org/pdf/2605.25975) |

## 核心贡献
1. 前馈框架直接从稀疏视图生成可重光照的 3DGS 资产
2. 基于大重建模型 (LRM) 提取可重光照表示
3. 利用内在分解模型 (IDM) 先验进行可重光照外观蒸馏

## 技术方案
### 三项贡献
1. **统一 Transformer**: 处理 diverse scenarios，4-9x 更低误差
2. **可扩展潜在空间**: 任意分辨率网格压缩为固定大小潜在 tokens
3. **无穿透数据集**: ~493.4k 帧，含 CCD 模块

### 方法细节
- 潜在插值细粒度几何合成：增强 LRM 几何表示
- 先验引导可重光照外观蒸馏：提取可重光照神经表示
- 通用神经渲染器：灵活高保真重光照

## 性能对比
- 重光照速度：比 LRM 快 ~25x
- 质量提升：~+2.0 dB

## 可行性分析
- 实现难度：高
- 性能预期：25x 加速，质量提升
- 适用场景：稀疏视图重光照、实时渲染

## 相关工作
- [[3D Gaussian Splatting]]
- [[Neural Rendering]]
- [[Relighting]]

## 笔记
神经渲染与 Gaussian Splatting 结合的可重光照研究，对渲染管线有参考价值。