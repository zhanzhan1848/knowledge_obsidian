---
type: paper
created: 2026-04-24
updated: 2026-04-24
tags: [llm, rag, explainability, aml, counterfactual]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2604.19755
---

# Explainable AML Triage with LLMs: Evidence Retrieval and Counterfactual Checks

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Explainable AML Triage with LLMs: Evidence Retrieval and Counterfactual Checks |
| **作者** | Dorothy Torres, Wei Cheng, Hu Ke |
| **发表** | arXiv cs.AI 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.19755) |
| **arXiv** | arXiv:2604.19755 |
| **代码** | - |
| **领域** | cs.AI, cs.LG |

---

## 核心贡献

> 提出证据约束的 AML 分诊框架，结合 RAG 证据检索 + 结构化输出约束 + 反事实验证，实现可解释、合规的 LLM 辅助决策

1. **证据约束决策过程**：将分诊重新定义为证据约束的决策过程
2. **反事实检查机制**：验证最小扰动是否导致决策和理由的一致性变化
3. **强可解释性指标**：引用有效性 0.98，证据支持 0.88，反事实忠诚度 0.76

---

## 技术方案

### 三组件框架

#### 1. 检索增强证据捆绑 (RAG)

从以下来源检索证据：
- 政策/类型学指导
- 客户上下文
- 警报触发器
- 交易子图

#### 2. 结构化 LLM 输出契约

- 要求明确引用
- 分离支持/反对/缺失证据

#### 3. 反事实检查

验证最小合理扰动是否导致：
- 分诊建议的一致性变化
- 其理由的一致性变化

### 实验结果

| 指标 | 数值 |
|------|------|
| PR-AUC | 0.75 |
| Escalate F1 | 0.62 |
| 引用有效性 | 0.98 |
| 证据支持 | 0.88 |
| 反事实忠诚度 | 0.76 |

---

## 局限性

- 依赖高质量政策/类型学知识库
- 对新型洗钱模式泛化性有限
- 反事实生成的计算开销

---

## 相关工作

- [[RAG]]
- [[LLM Explainability]]
- [[Counterfactual Reasoning]]

---

## 实现建议

- **实现难度**: 中-高
- **适用场景**: 金融合规、反洗钱、监管决策
- **核心思想可迁移**: 证据约束 + 反事实验证框架
