---
type: paper
created: 2026-05-23
updated: 2026-05-23
tags: [llm-safety, ood-detection, alignment, monitoring]
status: processed
domain: LLM Safety & Alignment
agent: youmaicai
source: https://arxiv.org/abs/2605.21602
---

# Benchmarking and Improving Monitors for Out-Of-Distribution Alignment Failure in LLMs

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Benchmarking and Improving Monitors for Out-Of-Distribution Alignment Failure in LLMs |
| **作者** | Dylan Feng, Pragya Srivastava, Cassidy Laidlaw |
| **发表** | arXiv 2026 (cs.AI) |
| **链接** | [原文](https://arxiv.org/abs/2605.21602) |
| **DOI** | 10.48550/arXiv.2605.21602 |
| **代码** | - |

---

## 核心贡献

> 研究 LLM 监控 pipeline 能否检测 OOD 对齐失败，提出 MOOD 基准测试，发现护栏模型结合 OOD 检测器可显著提升召回率。

1. **MOOD 基准**：提出 Misalignment Out Of Distribution (MOOD) 基准，用于评估 LLM 监控 pipeline 检测 OOD 对齐失败的能力
2. **护栏模型局限性**：发现安全分类器（guard models）在分布外泛化能力不足，单独使用时召回率仅 39%
3. **OOD 检测增强**：结合 Mahalanobis 距离和困惑度 OOD 检测器，召回率提升至 45%
4. **Scaling Law**：发现护栏+OOD 检测器组合存在正 scaling 趋势，20x 参数量的护栏模型效果不如加入 OOD 检测

---

## 技术方案

### 核心思想

许多 LLM 安全和对齐失败发生在 out-of-distribution (OOD) 场景：模型遇到训练时未见的异常 prompt 或 response patterns。传统护栏模型在分布内表现良好但难以泛化到 OOD。

### 关键技术

| 技术 | 说明 |
|------|------|
| MOOD 基准 | 包含 restricted training set + 7 个 diverse alignment failure test sets |
| Guard Model | Safety classifier，用于检测有害内容 |
| Mahalanobis Distance | OOD 检测器，基于特征空间的马氏距离 |
| Perplexity-based OOD | 基于困惑度的分布外检测 |
| Scaling Analysis | 模型规模对监控性能的影响分析 |

---

## 实验结论

- **数据集**: MOOD benchmark (7 个 diverse test sets)
- **基线**: 纯 Guard Model (recall 39%)
- **结果**: Guard + Mahalanobis + Perplexity OOD → Recall 45%
- **Scaling**: 20x 参数的护栏 < 加入 OOD 检测的小模型

---

## 局限性

- OOD 检测本身也存在泛化问题
- 真实场景的 OOD 边界难以定义
- 召回率仍有提升空间

---

## 实现建议

- **实现难度**: 中等（需要训练自己的 monitors）
- **预期性能**: Recall 从 39% 提升到 45%
- **适用场景**: LLM 安全监控、产品化部署前的 safety evaluation