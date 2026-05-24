---
title: "Enhancing 3D Point Cloud Reasoning via Chain-of-Thought"
authors: []
date: 2026-05-21
venue: arXiv cs.CV (交叉发布到 cs.GR)
tags: [几何, 点云, 多模态, Chain-of-Thought, 推理]
---

# Enhancing 3D Point Cloud Reasoning via Chain-of-Thought

## 核心方法

提出 **PoCoTI**，一个 CoT 增强的点-文本指令跟随数据集，包含 55K 样本。

### 技术要点

1. **两阶段 Pipeline**:
   - 阶段 1: 通过视觉-语言模型质量评估和参考引导细化，精炼点-文本指令数据
   - 阶段 2: 通过 Human-in-the-Loop Prompt Optimization (HiLPO) 综合高质量推理路径
2. **微调 PointLLM**: 生成 PointLLM-R，具推理能力的 3D 多模态语言模型

### 应用

- 生成式 3D 分类
- 描述生成
- 泛化到真实扫描点云和多轮对话

## 推荐结论

✅ **推荐实现** - 点云理解和推理对几何处理有重要价值

## 相关技术

- [[Point Cloud]], [[3D Understanding]], [[Multimodal LLMs]], [[Chain-of-Thought]]