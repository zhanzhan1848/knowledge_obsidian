---
title: "Enhancing 3D Point Cloud Reasoning via Chain-of-Thought"
authors: Qile Xu et al.
date: 2026-05-21
tags: [几何, 点云, Reasoning, Chain-of-Thought, Multimodal]
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.22013
---

## 核心方法

提出**以数据为中心的框架**为 3D 点云理解构建大规模 CoT（Chain-of-Thought）监督信号。两阶段 pipeline：
1. **阶段一**：通过视觉-语言模型的质检和参考引导精炼，优化点-文本指令数据
2. **阶段二**：通过 Human-in-the-Loop Prompt Optimization (HiLPO) 综合高质量推理路径

构建了 **PoCoTI** 数据集：55K 样本，包含显式推理路径的 CoT 增强点-文本指令跟随数据集。在 PoCoTI 上微调 PointLLM 得到 **PointLLM-R**。

## 关键创新

- 3D 领域首个 CoT 推理框架
- VLM 质量评估 + 参考引导精炼
- HiLPO 合成推理路径
- 可泛化到真实扫描点云和多轮对话

## 复杂度分析
- 数据集规模：55K 样本
- 模型：基于 PointLLM 微调

## 开源实现
- PoCoTI 数据集
- PointLLM-R 模型

## 相关笔记
[[几何-点云处理]]
[[深度学习-3D]]