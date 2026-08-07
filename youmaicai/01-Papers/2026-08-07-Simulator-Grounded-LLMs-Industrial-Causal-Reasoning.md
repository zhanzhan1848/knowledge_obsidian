# Simulator-Grounded Large Language Models for Industrial Causal Reasoning

## 基本信息
| 标题 | Simulator-Grounded Large Language Models for Industrial Causal Reasoning: Tool-Use, Structured Injection, and Plant-Portable Retrieval for Wastewater Treatment Decision Support |
|------|-----|
| 作者 | Gary Simethy, Daniel Ortiz Arroyo, Petar Durdevic |
| 链接 | [原文](https://arxiv.org/abs/2608.05151) |
| arXiv | arXiv:2608.05151 |
| 领域 | cs.CL, cs.AI |
| 日期 | 2026-08-07 |

## 核心贡献

1. **三种 LLM 接地方法对比**: 首次在同一模拟器上比较 live tool-use、static parameter injection、learned retrieval 三种方法
2. **Decoupled Recall-Reasoning (DRR)**: 可迁移的 110M 参数 retriever，单厂训练 ~17 秒，跨厂迁移达 88%
3. **Counterfactual 因果问答 Benchmark**: 60 题 counterfactual benchmark，首次系统评估干预后查询

## 背景问题

污水处理操作员需要回答因果问题，如：
- "Why is N2O rising?"
- "What happens if I cut aeration by 20%?"

需要基于工厂变量交互和效应传播速度的答案，而非通用预训练文本。

## 三种方法对比

### Method 1: Live Simulator Oracle
- 使用实时连接的可解释 wastewater simulator (CCSS-IX)
- 冻结 Qwen2.5-32B-Instruct + 实时工具调用
- **Causal benchmark: 99.5%**

### Method 2: Structured Parameter Injection
- 静态参数表注入
- **Causal benchmark: 79%**
- **问题**: 无法跨厂迁移（静态表无法适应新工厂）

### Method 3: Decoupled Recall-Reasoning (DRR) Retriever ⭐
- 110M 参数 retriever
- 单厂训练 ~17 秒
- **Causal benchmark: 75.8%**
- **跨厂迁移: 88%**（生物学上不同的工厂）

## 实验结果

### Causal Benchmark (198 题)
| 方法 | 准确率 |
|------|--------|
| Live Simulator Oracle | 99.5% |
| Structured Parameter Injection | 79% |
| DRR Retriever | 75.8% |
| Strongest RAG Baseline | 48% |

### Counterfactual Benchmark (60 题)
- 只有 DRR 能处理干预后查询
- DRR vs Method 2: **+16.3 pp** (95% CI [+7.1, +26.4])
- DRR 在 timescale 和 operating-regime 类别达 **100%**

### AI2 Reasoning Challenge (ARC)
- DRR + OpenBookQA: **79%**
- vs unconstrained Llama-3.1-8B: 76%
- vs full-injection: 74%
- +3 pp 域外复制，论证结果非特定于废水处理

## 关键洞察

1. **部署阶梯**: 99.5% / 79% / 75.8% 形成从高保真到实用的部署选择
2. **可迁移性**: DRR 的 plant-portable 特性是其核心优势
3. **Counterfactual 能力**: 只有 DRR 能处理"What happens after an intervention"类型问题
4. **泛化能力**: ARC 实验证明域外有效性

## 建议
- **推荐使用**: 是（工业应用价值高）
- **适用场景**: 工业过程控制、决策支持系统、因果推理
- **创新程度**: 高 - 首次单一模拟器比较三种 grounding 方法
