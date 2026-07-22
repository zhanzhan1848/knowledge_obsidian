---
type: paper
created: 2026-07-22
updated: 2026-07-22
tags: [llm, agent, evaluation, function-calling, agent-calling]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2607.18245
---

# SAAG: Structured Agent Assessment and Grounding

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | SAAG: Structured Agent Assessment and Grounding |
| **作者** | Ritvik Garimella, Vedant Khandelwal, Anvi Kohli, Amit Sheth |
| **发表** | KnowFM @ ACL 2026 (Workshop) |
| **链接** | [原文](https://arxiv.org/abs/2607.18245) |
| **DOI** | 10.48550/arXiv.2607.18245 |
| **代码** | - |

---

## 核心贡献

> 提出 **SAAG**，三阶段级联诊断框架分解 agent-calling 评估：registry conformance → structural completeness → argument grounding，各阶段产生可解释诊断并支持迭代 self-repair。

1. **三阶段诊断**：registry conformance → structural completeness → argument grounding
2. **迭代 self-repair**：阶段信号引导定向修正，不泄露 ground-truth
3. 在 Glaive function-calling 数据集上验证（5/10/15 agents，sub-4B 模型）
4. 结构化反馈持续提升 argument 精度，减少 value hallucination

---

## 技术方案

### 核心思想

Exact-match 评估掩盖了不同的失效模式：
- 选对函数但幻觉参数值
- 满足 schema 但选错 agent

SAAG 将评估分解为三个级联阶段：

| 阶段 | 诊断内容 |
|------|------|
| Registry Conformance | 是否选了正确的函数 |
| Structural Completeness | 是否满足 schema |
| Argument Grounding | 参数值是否有据可查 |

---

## 实验结论

- **数据集**: Glaive function-calling（5/10/15 agents）
- **模型**: 三个 sub-4B 本地模型
- **结果**: 结构化反馈改善 argument precision，减少 value hallucination；端到端 F1 增益 modest 且 model-dependent

---

## 局限性

- 端到端 F1 增益有限
- 主要在 sub-4B 模型验证
- Self-repair 迭代成本未评估

---

## 实现建议

- **实现难度**: 中（三阶段分类器）
- **预期性能**: 诊断能力提升，实际任务性能有限增益
- **适用场景**: Agent function-calling 调试与改进
