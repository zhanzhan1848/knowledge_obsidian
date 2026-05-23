---
title: "BodyReLux: Temporally Consistent Full-Body Video Relighting"
authors: Ma Li et al.
date: 2026-05-20
tags: [图形, 重新打光, 人体视频, Diffusion, SIGGRAPH 2026]
source: arXiv cs.GR (Siggraph 2026 Journal Track)
url: https://arxiv.org/abs/2605.21766
doi: https://doi.org/10.1145/3811352
---

## 核心方法

提出 **BodyReLux**：基于主题特定视频扩散的全身体视频重新打光框架，实现时间一致性。

关键创新：
1. 结合传统静态 OLAT（One-Light-at-a-Time）捕获和动态性能捕获（两种平滑变化照明序列快速交错，高于人类闪烁融合阈值）
2. 从预训练 text-to-video 模型微调，充分利用生成先验
3. 将每个光源表示为 token 的新照明条件方法
4. 使用 masked attention 对照明序列条件化，支持动态照明控制

## 相关领域
- 计算机视觉 & 图形
- SIGGRAPH 2026 Journal Track

## 相关笔记
[[图形-重新打光]]