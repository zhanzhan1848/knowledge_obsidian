---
title: Real-time Neural Six-way Lightmaps
authors: Tao Huang, et al.
date: 2026-04-04
source: arXiv cs.GR
url: https://arxiv.org/abs/2604.03748
pdf: https://arxiv.org/pdf/2604.03748
tags: [rendering, paper, 2026, ray-marching, lightmaps, neural-rendering, participating-media, real-time]
status: unread
---

# Real-time Neural Six-way Lightmaps

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Real-time Neural Six-way Lightmaps |
| 作者 | Tao Huang, et al. |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2604.03748) |
| PDF | [下载](https://arxiv.org/pdf/2604.03748) |

## 核心贡献
1. 提出神经六向光贴图 (Neural Six-way Lightmaps) 方法，在保持动态交互的同时实现烟等参与介质的真实感渲染
2. 使用光线步进 (ray marching) 生成引导图，模拟烟的散射和轮廓
3. 训练神经网络预测对应的六向光贴图，可直接集成到现有游戏引擎管线

## 技术方案

### 问题背景
参与介质 (Participating Media) 如烟、火、云是虚拟环境中常见且迷人的视觉效果。传统体积渲染方程计算代价高昂，难以在实时场景中实现。

六向光贴图技术已在游戏行业中广泛用于使用相机朝向广告牌和预计算光贴图渲染烟，但存在局限性：
- 仅限于预模拟动画序列
- 不支持相机运动

### 核心方法
1. **引导图生成**: 从相机视角使用 ray marching 生成引导图，大采样距离近似烟的散射和轮廓
2. **神经网络预测**: 给定引导图，训练神经网络预测对应的六向光贴图
3. **游戏引擎集成**: 预测的六向光贴图可直接用于现有游戏引擎渲染管线

### 支持的交互效果
- 烟与障碍物交互
- 相机运动
- 光照变化

## 实验结论
- 适用于游戏和 VR/AR 等实时应用
- 在保持视觉吸引力的同时支持实时用户交互
- 基准测试证明方法适合实时应用

## 局限性
- 需要预训练神经网络
- 效果取决于训练数据质量

## 可行性分析
- 实现难度：中
- 性能预期：支持实时交互
- 适用场景：游戏、VR/AR 中的烟/雾效果

## 相关工作
- [[2026-03-12-daily-search-report|六向光贴图基础技术]]
- 神经渲染相关研究

## 笔记
这篇论文是将神经渲染与传统游戏渲染技术结合的典型案例，展示了如何用深度学习加速体积渲染。
