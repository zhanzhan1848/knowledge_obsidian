---
tags: [几何, 几何验证, 教育动画, Manim]
date: 2026-07-21
venue: arXiv (cs.GR/cs.AI)
---

# SGA: Plug&Play Geometric Verification for Educational Video Synthesis

## 核心方法

Symbolic Geometric Agent (SGA) 是一个即插即用模块，用于代码-centric动画管道，对 LLM 生成的代码进行拦截和几何验证。

### 工作流程

1. **部分执行**：对 LLM 生成的代码进行部分执行，提取符号场景图
2. **几何冲突检测**：应用目标优化策略检测空间冲突
3. **针对性优化**：在检测到冲突时进行针对性优化

### 关键技术点

1. **Manim Visual Quality Score (MVQS)**：引入确定性无渲染代理评估空间完整性

2. **场景图提取**：通过部分执行获取符号场景图，而非仅依赖文本分析

3. **几何遮挡处理**：解决现有框架强调教学内容和视觉可读性而忽视几何遮挡的问题

## 实验结果

- 在 MMMC-Code 基准测试上
- 峰值 MVQS 达 73.11（Code2Video + GPT-5.1）
- 相比原始基线相对提升 **16.1%**
- 在 8 种配置中 7 种提升 MVQS

## 开源实现

- arXiv: https://arxiv.org/abs/2607.18116
- 发表于 2026-07-20（24小时内）

## 相关笔记

## 可行性分析

⚠️ **谨慎评估**

- 主要应用于教育动画领域，非几何处理核心
- 几何验证方法值得借鉴
- 依赖 LLM 和 Manim 库
