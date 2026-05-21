---
title: "Compositional Synthesis and Editing of 3D Shapes via Part-Aware Control"
citation: "arXiv:2605.19350"
date: 2026-05-19
tags: [3D形状合成, 编辑, 部件感知, 扩散Transformer, 部分级编辑]
---

# CompoSE: 通过部件感知控制的组合式 3D 形状合成与编辑

## 问题背景

创建和编辑高质量 3D 内容是计算机图形学的核心挑战。

## 方法：CompoSE

**Compositional Synthesis and Editing** - 给定一组粗几何基元（如边界框）表示排列在特定空间配置中的不同对象部件，合成支持局部粒度（即组合）编辑的部件分离 3D 对象。

### 核心洞察

使用**扩散 Transformer 架构**，交替处理：
- 每个部件的局部信息
- 跨部件聚合全局上下文信息

### 新型条件技术

确保强 adherence 用户输入，从粗布局指导中学习推断部件语义和对称性，无需部件级文本提示。

## 编辑能力

- **上下文感知替换**: 用同类其他对象替换
- **添加**: 添加新部件
- **删除**: 删除现有部件
- **保风格调整大小**: 保持风格的调整大小操作

## 实验验证

在引导合成方面显著优于现有方法，通过客观指标和 LLM 基评估衡量。

## 标签

#3D合成 #部件编辑 #扩散Transformer #几何处理 #组合编辑