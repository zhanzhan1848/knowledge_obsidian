---
title: Power-Constrained Tone Mapping for Augmented Reality
authors: Weikai Lin
date: 2026-07-21
source: arXiv cs.GR (Accepted to TVCG 2026)
url: https://arxiv.org/abs/2607.19509
pdf: https://arxiv.org/pdf/2607.19509
tags: [rendering, tone-mapping, augmented-reality, perceptual-quality, power-optimization]
status: unread
---

# Power-Constrained Tone Mapping for Augmented Reality

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Power-Constrained Tone Mapping for Augmented Reality |
| 作者 | Weikai Lin |
| 来源 | arXiv cs.GR (TVCG 2026) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2607.19509) |
| PDF | [下载](https://arxiv.org/pdf/2607.19509) |

## 核心贡献
1. 将显示功耗优化问题建模为功率约束色调映射问题
2. 提出基于人类视觉的 learning-based 框架，在给定功率预算下最大化感知质量
3. 引入**优化友好的 TMO (Tone Mapping Operator) 参数化**和**渐进优化策略**
4. 将迭代优化蒸馏为轻量级前馈神经网络，支持实时部署

## 技术方案

### 研究背景
日常可穿戴 AR 眼镜必须满足严格的功率限制，显示是优化的关键目标。

### 核心方法
1. **功率约束色调映射**：
   - 将显示功耗作为约束条件
   - 在功率预算内最大化感知质量

2. **视觉驱动的学习框架**：
   - 基于人类视觉系统建模
   - 感知质量评估指标

3. **优化友好的 TMO 参数化**：
   - 连续可微的参数空间
   - 支持梯度下降优化

4. **渐进优化策略**：
   - 有效探索 "quality-vs-power" 权衡空间

5. **前馈神经网络蒸馏**：
   - 将迭代优化结果蒸馏到轻量网络
   - 支持实时 AR 应用

## 实验结论
- 主观实验表明：在相同功率预算下，比之前工作获得更好的感知质量
- 项目页面：https://horizon-lab.org/lowpowar/

## 可行性分析
- 实现难度：中（神经网络训练）
- 性能预期：实时（已蒸馏为轻量网络）
- 适用场景：AR 眼镜、移动 AR 应用、功耗敏感设备

## 相关工作
- [[Tone Mapping]]
- [[Augmented Reality]]
- [[Perceptual Quality]]
- [[Display Power Optimization]]

## 笔记
**推荐度**：⭐⭐⭐⭐

这是一篇将渲染技术与实际硬件约束结合的好论文。色调映射是实时渲染的重要组成部分，功率约束这个角度很有实际意义。渐进优化和蒸馏的思路也值得借鉴。如果团队有 AR 相关项目，这篇论文值得参考。
