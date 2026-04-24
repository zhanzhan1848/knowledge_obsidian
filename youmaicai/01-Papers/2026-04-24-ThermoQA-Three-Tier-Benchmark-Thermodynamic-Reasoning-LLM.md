---
type: paper
created: 2026-04-24
updated: 2026-04-24
tags: [llm, reasoning, benchmark, thermodynamics, multimodal]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2604.19758
---

# ThermoQA: A Three-Tier Benchmark for Evaluating Thermodynamic Reasoning in Large Language Models

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | ThermoQA: A Three-Tier Benchmark for Evaluating Thermodynamic Reasoning in LLMs |
| **作者** | Kemal Düzkar |
| **发表** | arXiv cs.AI 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.19758) |
| **arXiv** | arXiv:2604.19758 |
| **数据集** | [HuggingFace](https://huggingface.co/datasets/olivenet/thermoqa) |
| **领域** | cs.AI, cs.CL, cs.LG |

---

## 核心贡献

> 提出三层工程热力学推理基准（293题），揭示属性查表 ≠ 热力学推理，Claude Opus 4.6 领先

1. **三层基准设计**：属性查账（110Q）→ 组件分析（101Q）→ 完整循环分析（82Q）
2. **程序化真值计算**：基于 CoolProp 7.2.0，覆盖水、R-134a、可变 cp 空气
3. **揭示推理退化现象**：跨层性能下降从 2.8pp (Opus) 到 32.5pp (MiniMax)

---

## 技术方案

### 三层结构

| 层级 | 题目数 | 难度 | 典型问题 |
|------|--------|------|----------|
| 属性查账 | 110 | 低 | 查表获取物质属性 |
| 组件分析 | 101 | 中 | 分析单个设备性能 |
| 完整循环分析 | 82 | 高 | 多组件热力学循环综合分析 |

### 评估结果 (Leaderboard)

| 模型 | 综合得分 |
|------|----------|
| Claude Opus 4.6 | 94.1% |
| GPT-5.4 | 93.1% |
| Gemini 3.1 Pro | 92.5% |

### 关键发现

- **超临界水、R-134a、联合循环燃气轮机** 是天然区分器（40-60pp 性能差距）
- 属性记忆 ≠ 热力学推理能力
- 多轮稳定性 sigma 0.1%-2.5%，量化推理一致性

---

## 局限性

- 仅限工程热力学领域
- 需要外部工具调用（CoolProp）
- 对非工程领域泛化性待验证

---

## 相关工作

- [[LLM Reasoning Benchmark]]
- [[Math Reasoning]]
- [[MMLU]]

---

## 实现建议

- **适用场景**: LLM 推理能力评估、专业领域知识推理
- **核心洞察**: 需要多层推理基准区分记忆与推理
