# RAG vs Fine-tuning for Domain Adaptation: Additive Manufacturing

## 元信息
| 标题 | Domain Adaptation of Large Language Models for Polymer-Composite Additive Manufacturing Using Retrieval-Augmented Generation and Fine-Tuning |
|------|-----|
| 作者 | Saiful Islam Sagor, Tania Haghighi, Minhaj Nur Alam, Erina Baynojir Joyee |
| 链接 | [原文](https://arxiv.org/abs/2605.12516) |
| arXiv | arXiv:2605.12516 |
| 类别 | cs.CL, cs.AI |

## 核心贡献
1. **研究问题**：通用 LLM 在专业工程领域（增材制造 AM）表现不佳，如何有效适配？
2. **对比方法**：基于 LLaMA-3-8B 评估三种配置：预训练基线、RAG 系统、微调模型
3. **核心发现**：RAG 持续优于基线，而 naive 微调反而降低性能
4. **数据集**：200 个专家设计的 AM 问题，由机械工程专家评估

## 关键数据
| 配置 | 准确率提升 | 整体偏好 | 相关性提升 |
|------|----------|----------|----------|
| **RAG** | 75.5% | 85.2% | 90.8% |
| **微调** | 5.6% | - | 32.5% |

## 核心洞察
- RAG > 微调：检索增强方法比直接在非结构化技术数据上微调更有效
- 增材制造知识分布在异构来源：学术文献、制造商文档、技术标准、程序指南
- 通用 LLM 虽然语言能力强，但难以检索和情境化领域特定信息

## 来源
🥬 LLM/NLP | 2026-05-14 | cs.CL