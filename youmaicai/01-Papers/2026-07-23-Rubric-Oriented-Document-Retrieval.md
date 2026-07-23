---
type: paper
created: 2026-07-23
updated: 2026-07-23
tags: [LLM, RAG, retrieval, document-ranking, benchmark, generation-quality]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2607.19747
---

# Beyond Relevance-Centric Retrieval: Rubric-Oriented Document Set Selection and Ranking

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Beyond Relevance-Centric Retrieval: Rubric-Oriented Document Set Selection and Ranking |
| **作者** | Kailin Jiang, Lei Liu, Jian Xi 等（Tencent） |
| **发表** | arXiv 2026-07-22 |
| **链接** | [原文](https://arxiv.org/abs/2607.19747) |
| **DOI** | 10.48550/arXiv.2607.19747 |
| **代码** | https://rubric4setwise.github.io/ |

---

## 核心贡献

> 指出当前文档检索评估体系的根本缺陷——独立评分+ nDCG 聚合忽略文档间交互，提出 Rubric-Oriented 评估-诊断-优化完整框架

1. **文档集评估新范式**：SetwiseEvalKit，三层九维文档集评估基准，覆盖短文本和长文本场景，约 28K 高质量评估 rubric
2. **系统性评估 12 个 reranker**：最优方法覆盖度不超过 45%，跨文档协调维度普遍较弱
3. **Rubric4Setwise**：无需训练，将 rubric 评估标准转换为文档集选择信号，用更少文档和搜索轮次实现最优下游生成性能

---

## 技术方案

### 问题背景

现有评估系统只评估单文档相关性（独立评分 + nDCG 聚合），忽略：
- **冗余性**（Redundancy）：文档内容重复
- **冲突性**（Conflict）：文档观点矛盾
- **互补性**（Complementarity）：文档间信息互补

### SetwiseEvalKit

| 层级 | 维度 | 说明 |
|------|------|------|
| 单文档层 | 相关性、完整性 | 传统指标 |
| 文档对层 | 冗余、冲突、互补 | 文档间交互 |
| 文档集层 | 覆盖度、多样性、排序质量 | 整体效果 |

- **规模**: ~28K 高质量评估 rubric
- **场景**: 短文本 + 长文本

### Rubric4Setwise

无需训练的 rubric-to-signal 转换方法，将评估 rubric 转化为文档集选择信号，实现：
- 更少文档达到最优生成质量
- 更少搜索轮次
- 唯一在两类场景均保持 SOTA 的方法

---

## 实验结论

- 最优 reranker 覆盖度 ≤ 45%
- 跨文档协调维度普遍弱
- Rubric4Setwise 在下游生成任务中以更少文档实现 SOTA

---

## 局限性

- 依赖高质量 rubric 构建
- 需针对长文本场景专门设计

---

## 实现建议

- **实现难度**: 中（benchmark 构建复杂）
- **预期性能**: RAG 场景下生成质量提升显著
- **适用场景**: RAG 系统、文档问答、多文档摘要
