---
type: paper
created: 2026-04-24
updated: 2026-04-24
tags: [multimodal-llm, reasoning, traffic, cot, rag]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2604.20878
---

# AITP: Traffic Accident Responsibility Allocation via Multimodal Large Language Models

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | AITP: Traffic Accident Responsibility Allocation via Multimodal Large Language Models |
| **作者** | Zijin Zhou, Songan Zhang |
| **发表** | CVPR 2026 Findings |
| **链接** | [原文](https://arxiv.org/abs/2604.20878) |
| **arXiv** | arXiv:2604.20878 |
| **领域** | cs.CL, cs.CV, cs.LG |

---

## 核心贡献

> 提出 AITP——多模态 LLM 进行交通事故责任推理，通过 MCoT 机制和 RAG 整合法律知识

1. **MCoT (Multimodal Chain-of-Thought)**：多模态思维链推理机制
2. **RAG 整合法律知识**：检索增强生成融入交通法规
3. **DecaTARA 基准**：10 个关联交通推理任务，67,941 标注视频，195,821 QA 对

---

## 技术方案

### 任务定义

交通事故责任分配 (TARA) 比检测/理解更挑战性：
- 需要多步推理
- 基于交通法规
- 结合视频证据

### DecaTARA 基准

- 10 个关联交通事故推理任务
- 67,941 标注视频
- 195,821 问答对

### 实验结果

- TARA、SOTAD、TAU 任务均达 SOTA
- 建立推理驱动多模态交通分析新范式

---

## 局限性

- 仅限交通领域
- 需要视频输入
- 法律体系依赖性

---

## 相关工作

- [[Multimodal LLM]]
- [[Chain-of-Thought]]
- [[RAG]]

---

## 实现建议

- **适用场景**: 自动驾驶、法律推理、多模态推理
- **核心思想可迁移**: MCoT + 领域 RAG
