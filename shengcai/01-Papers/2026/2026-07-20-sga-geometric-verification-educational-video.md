---
title: SGA: Plug&Play Geometric Verification for Educational Video Synthesis
authors: Jhon Edinson Lopez Duran et al.
date: 2026-07-20
status: 已读
source: arXiv (cs.GR, cs.AI, cs.CV)
url: https://arxiv.org/abs/2607.18116
tags: [渲染, 教育视频, LLM, Manim, 几何验证, 2026]
---

# SGA: Plug&Play Geometric Verification for Educational Video Synthesis

## 摘要

**核心问题**: 现有 LLM 生成教学动画的框架强调教学内容而忽视几何遮挡，导致空间正确性和视觉可读性问题。

**解决方案**: Symbolic Geometric Agent (SGA) - 一个即插即用模块，拦截 LLM 生成的代码，执行部分执行以提取符号场景图，并在检测到空间冲突时应用定向细化。

**创新点**: 提出 Manim Visual Quality Score (MVQS)，一种确定性的、无需渲染的空间完整性代理指标。

## 核心贡献

### 1. Symbolic Geometric Agent (SGA)

**工作流程**:
1. 拦截 LLM 生成的代码
2. 执行部分执行提取符号场景图
3. 检测空间冲突
4. 应用定向细化

**关键特性**:
- 即插即用模块
- 适用于代码为中心的动画管道
- 使用 Manim 库

### 2. Manim Visual Quality Score (MVQS)

**创新性**: 确定性的、无需渲染的空间完整性代理

**实验结果**:
- 峰值 MVQS: 73.11 (Code2Video + GPT-5.1)
- 相对基线提升 16.1%
- 8 个 backbone × pipeline 配置中 7 个改善

## 技术背景

### Manim
Manim 是一个用于创建数学动画的程序库，常用于 3Blue1Brown 风格的视频。

### 解决的问题
- Stochastic coordinate hallucinations（随机坐标幻觉）
- 缺乏对最终画布状态的 grounding
- 确定性几何正确性

## 实验设置

**基准**: MMMC-Code benchmark

**测试配置**:
- 4 个 LLM backbones
- 2 个 agentic pipelines
- Code2Video + GPT-5.1 达到最佳性能

## 元信息

| 项目 | 详情 |
|------|------|
| 作者 | Jhon Edinson Lopez Duran et al. |
| 领域 | cs.AI, cs.CV, cs.GR, cs.MA, cs.MM |
| 日期 | 2026-07-20 |
| 页数 | 3,352 KB (PDF) |

## 可行性评估

| 维度 | 评分 |
|------|------|
| 创新性 | ⭐⭐⭐ |
| 实用性 | ⭐⭐⭐⭐ |
| 难度 | 低 |
| 与渲染相关 | 中等（使用 Manim 渲染） |

## 备注

本文虽属于 cs.GR，但偏向 AI/LLM 辅助内容生成，非核心渲染算法研究。对基于 Manim 的自动化动画生成有参考价值。

## 相关链接

- [arXiv:2607.18116](https://arxiv.org/abs/2607.18116)
- [PDF](https://arxiv.org/pdf/2607.18116)
