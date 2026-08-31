# Retrieving Relations, Detecting Fallacies: A RAG Approach to Political Debate Analysis

## 元信息
| 标题 | Retrieving Relations, Detecting Fallacies: A RAG Approach to Political Debate Analysis |
|------|------|
| 作者 | Deborah Dore, Greta Damo, Elena Cabrio, Serena Villata |
| 链接 | [原文](https://arxiv.org/abs/2608.27471) |
| arXiv | arXiv:2608.27471 |
| 领域 | cs.AI, cs.CL |

## 核心贡献
1. 提出**论证关系引导的检索增强方法**用于谬误检测与分类
2. 利用支持/攻击等论证关系动态引导相关文档的提取
3. 在 ElecDeb60to20 基准上实现宏观 F1 最高 **0.864**（检测）和 **0.725**（分类）

## 问题背景
- 谬误检测需要超出表面文本的上下文知识
- 需要世界知识和论证 discourse 内各论点间的关系
- 先前工作将 discourse 结构编码为静态分类器特征，限制了灵活性

## 方法: 论证关系引导的 RAG
```
输入: 政治辩论文本
       ↓
提取论证关系 (支持/攻击)
       ↓
关系引导的文档检索 ← 动态 steer
       ↓
LLM-based 谬误检测与分类
```

- **检索知识库**: 15GB 政治相关文档集合
- **评测配置**: 42 种检索配置 × 14 种模型

## 实验结果
| 任务 | 基线 (无检索) | 本文方法 |
|------|-------------|---------|
| 谬误检测 (macro-F1) | - | **0.864** |
| 谬误分类 (macro-F1) | - | **0.725** |

## 关键发现
- 外部知识的整合显著提升谬误检测和分类
- 论证关系引导的检索优于纯关键词检索
- 支持/攻击关系提供了结构化引导信号

## 建议
- **是否推荐使用**: 是
- **适用场景**: 论证挖掘、政治内容分析、虚假信息检测

---
*关键词*: RAG, 谬误检测, 论证推理, 政治文本分析, NLP
*研究领域*: cs.AI, cs.CL
