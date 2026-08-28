---
title: "Procedura: Agentic 3D Modeling with Procedural Control"
arXiv: "2608.26238"
authors: "Youtian Lin, Yikang Yang, Zhanpeng Hu, Mengqi Zhou, Feihu Zhang, Xun Cao, Jiaheng Liu, Yao Yao"
date: "2026-08-26"
category: ["cs.CV", "cs.GR"]
tags: [3D建模, 程序化建模, LLM, 网格生成, 部件分解]
publish: "arXiv"
emoji: "🥬"
---

# Procedura: Agentic 3D 建模

## 核心思想

将 **3D 形状视为代码**，利用 LLM 的编程能力进行 3D 建模。

**关键洞察**：现有 3D 生成器生成的网格存在以下问题：
- 机械对象应该有锋利边缘，但密集网格仍然是柔软的
- 没有部件分解
- 没有用户可编辑的参数

## 核心方法

**Procedura** 框架：
1. 将物体表示为**程序化装配 (Procedural Assembly)**
2. 装配是参数化程序，具有命名部件
3. 部件通过**类型化、可机器检查的配合 (mates)** 连接
4. LLM 从文本提示词规划装配图，逐部分编写程序

### 关键技术

- **装配图 (Assembly Graph)** - 表示部件层次结构和配合关系
- **配合框架求解 (Mate Frame Solving)** - 从配合帧而非猜测求解放置
- **编译/配合/连通性检查** - 程序化验证
- **解耦视觉批评器 (Decoupled Vision Critic)** - 诊断修复

## 评估结果

在 **P3D-Bench** 和 **MechBench-36**（硬表面基准）上：
- 质量评分超过 SOTA 原生 3D 生成器
- 产生最锋利的边缘
- **唯一输出为可编辑的、部件结构化程序**的方法

## 技术栈

- **LLM** - 代码生成能力
- **程序化建模** - 参数化部件定义
- **配合约束** - 几何约束求解
- **视觉批评器** - 生成质量反馈

## 几何处理相关性

**直接相关**：
- 网格生成 (Mesh Generation)
- 部件分解 (Part Decomposition)
- 拓扑结构 (装配图表示)
- 参数化建模

**间接相关**：
- 程序化建模 → 逆向工程
- 可编辑参数 → CAD 模型

## 开源/参考

- arXiv: [2608.26238](https://arxiv.org/abs/2608.26238)
- Project: [spatiaos.github.io/projects/procedura/](https://spatiaos.github.io/projects/procedura/)

## 相关笔记

[[网格生成]], [[程序化建模]], [[LLM-3D]], [[部件分解]]
