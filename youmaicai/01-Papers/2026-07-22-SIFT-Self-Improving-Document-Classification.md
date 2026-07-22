---
type: paper
created: 2026-07-22
updated: 2026-07-22
tags: [llm, document-classification, self-training, sparse-encoder, SPLADE]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2607.18358
---

# SIFT: Self-Improving, Frozen-gate Training for Dynamic Document Classification

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A Classifier That Teaches Itself: Self-Improving, Frozen-gate Training (SIFT) for Dynamic Document Classification |
| **作者** | Bogdan Raduta, Horia Velicu, Alexandru Preda, Serban Chiricescu |
| **发表** | arXiv cs.CL (2026) |
| **链接** | [原文](https://arxiv.org/abs/2607.18358) |
| **DOI** | 10.48550/arXiv.2607.18358 |
| **代码** | - |

---

## 核心贡献

> 提出 **SIFT**，自改进动态文档分类服务。低成本 CPU 管道（SPLADE + LightGBM）处理，高置信度直接输出，低置信度escalate 到 LLM judge，LLM verdicts 回写标注语料持续训练。

1. **Self-feeding Corpus Loop**：昂贵模型教便宜模型，escalation rate 随时间下降
2. **Two-part Promote Gate**：critical-label F1 regression check + frozen golden regression set，防止回归
3. 边际标注成本趋向零
4. 新文档类型 onboarding 仅需声明式 bundle

---

## 技术方案

### 核心思想

企业文档分类的核心瓶颈不是模型架构，而是标注成本和模型自我更新恐惧。SIFT 通过 LLM judge 教 SPLADE + LightGBM 的 pipeline，实现自动标注和质量控制。

### 架构

| 组件 | 说明 |
|------|------|
| SPLADE Sparse Encoder | CPU 高效的稀疏编码器 |
| LightGBM Head | 轻量级分类头 |
| LLM Judge | 仅处理低置信度样本 |
| Promote Gate | F1 regression check + frozen golden set |

---

## 实验结论

- **部署**: 多领域生产环境
- **经济性**: 边际标注成本趋向零
- **安全性**: promote gate 防止 silent regression

---

## 局限性

- 需要 LLM judge（成本不为零）
- Promote gate 设计复杂

---

## 实现建议

- **实现难度**: 中（需要 pipeline + 质量门控）
- **预期性能**: 持续提升，边际成本下降
- **适用场景**: 企业文档分类、动态知识库
