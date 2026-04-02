# 🥬 E-STEER: Emotion Steering Framework for LLMs and Agents

> **日期**: 2026-04-02
> **RSS来源**: cs.AI (arXiv:2604.00005)
> **原始链接**: [arXiv:2604.00005](https://arxiv.org/abs/2604.00005)

---

## 元信息

| 标题 | 值 |
|------|-----|
| 标题 | How Emotion Shapes the Behavior of LLMs and Agents: A Mechanistic Study |
| 作者 | Moran Sun, Tianlin Li, Yuwei Zheng, Zhenhong Zhou, Aishan Liu, Xianglong Liu, Yang Liu |
| 类别 | cs.AI, cs.CL |
| arXiv | arXiv:2604.00005v1 |
| 提交 | 2026-03-09 |

---

## 核心贡献

1. **提出 E-STEER 框架**: 一个可解释的情感 steering 框架，在表示层面 (representation-level) 直接干预 LLM 和 Agent 的隐藏状态，将情感建模为结构化、可控的变量

2. **揭示非单调情感-行为关系**: 实验结果与经典心理学理论一致——特定情感不仅能增强 LLM 能力，还能提升安全性

3. **系统性影响多步 Agent 行为**: 情感变量可系统性地调控 Agent 的多步推理、主观生成、安全性和行为模式

4. **机制性解释**: 超越表面层面的情感处理，深入任务处理机制层面

---

## 核心创新

**现有研究的局限**：现有情感感知研究主要将情感视为表面风格因素或感知目标，忽略了情感在任务处理中的机制性作用。

**E-STEER 的核心思想**：
- 将情感嵌入为隐藏状态中的结构化可控变量
- 支持直接表示层面的干预 (representation-level intervention)
- 可应用于 LLM 和 Agent 两种场景

---

## 实验维度

1. **Objective Reasoning**: 情感对客观推理任务的影响
2. **Subjective Generation**: 情感对主观内容生成的影响
3. **Safety**: 情感对安全性的影响（增强而非削弱）
4. **Multi-step Agent Behaviors**: 情感对多步 Agent 行为链的系统性调控

---

## 关键发现

- 情感与行为的关系是**非单调的**（与心理学理论一致）
- 特定情感可以**同时增强能力并提升安全性**
- 情感变量能系统性地塑造多步 Agent 行为

---

## 局限性

- 目前仅在特定 LLM 架构上验证
- 情感 steering 的长期效果尚未充分研究

---

## 建议

- **推荐程度**: ⭐⭐⭐⭐ (值得关注)
- **适用场景**: LLM 可解释性研究、情感计算、Agent 行为调控、安全性研究
- **相关方向**: 情感计算、可解释AI、Agent系统、模型编辑

---

*E-STEER 开创了将情感作为机制性变量嵌入 LLM 的研究先河，对理解 LLM 内部表征和调控行为有重要价值。*
