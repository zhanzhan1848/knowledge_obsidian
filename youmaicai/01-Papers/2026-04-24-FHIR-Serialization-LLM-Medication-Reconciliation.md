---
type: paper
created: 2026-04-24
updated: 2026-04-24
tags: [llm, clinical, fhhir, serialization, medicine, instruction-tuning]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2604.21076
---

# Serialisation Strategy Matters: How FHIR Data Format Affects LLM Medication Reconciliation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Serialisation Strategy Matters: How FHIR Data Format Affects LLM Medication Reconciliation |
| **作者** | Sanjoy Pator |
| **发表** | arXiv cs.CL 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.21076) |
| **arXiv** | arXiv:2604.21076 |
| **代码** | 开源可复现 |
| **领域** | cs.CL, cs.AI |

---

## 核心贡献

> 首次系统比较四种 FHIR 序列化策略，发现序列化格式对 8B 以下模型影响巨大（Clinical Narrative 优于 JSON 19 F1 分），70B 以上反之

1. **首次系统比较**：Raw JSON / Markdown Table / Clinical Narrative / Chronological Timeline 四种策略
2. **模型规模依赖性**：≤8B 用 Clinical Narrative，≥70B 用 Raw JSON
3. **主导失败模式**：遗漏为主（precision > recall），小模型在 7-10 种活跃药物后 plateau

---

## 技术方案

### 四种序列化策略

| 策略 | 说明 | 最优模型规模 |
|------|------|------------|
| Raw JSON | 原始 FHIR JSON | 70B+ |
| Markdown Table | 表格化呈现 | ≤8B |
| Clinical Narrative | 临床叙述文本 | ≤8B（最优） |
| Chronological Timeline | 时间线排列 | ≤8B |

### 实验设置

- **模型**: Phi-3.5-mini, Mistral-7B, BioMistral-7B, Llama-3.1-8B, Llama-3.3-70B
- **数据**: 200 合成患者，4000 次推理
- **任务**: 药物协调

### 关键发现

- Clinical Narrative 优于 Raw JSON 达 19 F1 分（Mistral-7B）
- 70B+ 模型：Raw JSON 最佳（F1=0.9956）
- 所有 20 种组合：precision > recall，遗漏是主导失败模式
- 小模型 plateau 在 ~7-10 种活跃药物
- BioMistral-7B（无指令微调）零可用输出

### 实践建议

| 模型规模 | 推荐格式 |
|----------|----------|
| ≤8B | Clinical Narrative |
| 70B+ | Raw JSON |

---

## 局限性

- 仅合成患者数据
- 仅药物协调任务
- 单一领域

---

## 相关工作

- [[Clinical NLP]]
- [[LLM Instruction Tuning]]
- [[Data Serialization]]

---

## 实现建议

- **实现难度**: 低
- **适用场景**: 临床 LLM 部署、FHIR 数据处理
- **核心洞察**: 序列化格式选择是临床 LLM 的关键调优维度
