---
title: "Knowledge-data hybrid CAD learning under data scarcity"
authors: ["Qiang Zou et al."]
date: 2026-06-01
tags: [CAD, 深度学习, 几何处理]
venue: arXiv cs.GR
---

# Knowledge-data hybrid CAD learning under data scarcity

## 核心方法

提出 **KDH-CAD**，一种知识-数据混合框架，将预训练基础模型中的预训练知识、教科书/教程中的结构化领域知识与少量标注 CAD 数据结合。

## 主要创新

- 领域知识用于激发和补全预训练基础模型中弱表达或代表性不足的 CAD 相关概念
- 标注 CAD 数据在潜在空间中进行概念校准，无需微调基础模型

## 实验结果

- 250 样本达到 92.6% 准确率
- 1000 样本达到 95.8% 准确率
- 匹配或超越需要数量级更多数据的 SOTA

## 可行性评估

⚠️ **谨慎评估** - 偏向 CAD 分类任务，非核心网格处理问题
