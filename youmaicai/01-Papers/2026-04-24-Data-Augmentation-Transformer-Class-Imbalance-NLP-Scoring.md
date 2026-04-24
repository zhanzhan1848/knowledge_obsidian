---
type: paper
created: 2026-04-24
updated: 2026-04-24
tags: [nlp, transformer, fine-tuning, data-augmentation, gpt-4]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2604.19754
---

# Exploring Data Augmentation and Resampling Strategies for Transformer-Based Models to Address Class Imbalance in AI Scoring of Scientific Explanations

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Exploring Data Augmentation for Transformer-Based Models to Address Class Imbalance |
| **作者** | Prudence Djagba, Kevin Haudek, Clare G. C. Franovic, Leonora Kaldaras |
| **发表** | NARST 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.19754) |
| **arXiv** | arXiv:2604.19754 |
| **代码** | - |
| **领域** | cs.AI, cs.LG |

---

## 核心贡献

> 针对科学解释自动评分中的类别不平衡问题，系统对比三种数据增强策略（GPT-4 生成、EASE 词级、ALP 短语级），验证目标增强可显著改善类别不平衡

1. **类别不平衡问题**：高级推理类别的评分数据严重不平衡
2. **三种增强策略对比**：GPT-4 生成、EASE 词级提取、ALP 短语级提取
3. **ALP 达成完美精确率和召回率**：在最严重不平衡类别（5,6,7,9）上

---

## 技术方案

### 任务背景

自动评分学生科学解释提供即时准确反馈的潜力，但类别不平衡问题（特别是高级推理类别）仍是挑战。

### 数据集

- 1,466 条高中生物理评估响应
- 11 个二元编码分析类别
- 基于 NGSS 对齐的学习进阶

### 三种增强策略

| 策略 | 方法 | 效果 |
|------|------|------|
| GPT-4 生成 | 生成合成响应 | 同时提升精确率和召回率 |
| EASE | 词级提取和过滤 | 全面提升人类评分对齐度 |
| ALP | 基于概率上下文的语法短语级提取 | 最严重不平衡类别达到完美 F1 |

### 实验结果

- **ALP**: 在类别 5,6,7,9 达到完美精确率/召回率/F1
- **EASE**: 全面提升类别 1-11 的人类评分对齐度
- **对比 SMOTE**: 避免过拟合，保留新手数据

---

## 局限性

- 依赖特定领域的评分标准
- ALP 方法需要语法标注
- 增强数据质量需人工验证

---

## 相关工作

- [[SciBERT]]
- [[Data Augmentation for NLP]]
- [[Class Imbalance in Text Classification]]

---

## 实现建议

- **实现难度**: 低-中
- **适用场景**: 教育 NLP、自动评分系统
- **核心洞察**: 短语级增强比词级更有效
