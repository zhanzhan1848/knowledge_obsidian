---
title: "Composable Synthesis and Editing of 3D Shapes via Part-Aware Control"
authors: ""
date: 2026-05-20
tags: [几何, 3D形状合成, 部件感知, Diffusion Transformer, 编辑]
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.19350
---

## 核心方法

提出 **CompoSE**：一种通过部件感知控制进行 3D 形状组合合成与编辑的新方法。

输入：粗粒几何基元集合（如边界框）代表不同部件的空间排列
输出：部件分离的 3D 物体，支持局部粒度的部件级编辑

核心洞察：使用 **Diffusion Transformer 架构**，交替处理各部件（局部）和跨部件聚合上下文信息（全局），并通过新 conditioning 技术确保强对齐用户输入。

方法从用户粗粒度布局引导中学习推断部件语义和对称性，无需部件级文本提示。

## 关键创新

- Diffusion Transformer 架构
- 局部/全局交替处理
- 无需文本的部件级编辑
- 上下文感知替换和新增

## 开源实现
- 待查

## 相关笔记
[[几何-形状合成]]