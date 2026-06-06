# LLM 结构化提取的敏感性分析

## 元信息
| 标题 | Measuring the sensitivity of LLM-based structured extraction to prompt, model, and schema choices in clinical discharge summaries |
|------|------|
| 作者 | Martin Murin |
| 链接 | [原文](https://arxiv.org/abs/2606.05970) |
| arXiv | arXiv:2606.05970 |
| 领域 | cs.CL, cs.AI, cs.LG |
| 发表 | 2026-06-04 |

## 核心贡献

1. **无需人工标注 ground truth 测量敏感性**：通过固定提取任务、一次变化一个选择来测量敏感性
2. **跨 prompt 一致性测量**：使用 Cohen's kappa 在 ICD 分层子集上测量跨 prompt 一致性
3. **模型 vs prompt 效应分析**：隔离模型选择和 schema 选择的影响

## 核心设置

- **Schema**: 17 个临床文档标志（三值 yes/no/not_documented）+ 47 个主要入院原因标签
- **Prompt变体**: 3 种表达 schema 的 prompt
- **模型**: 2 种模型规模
- **数据**: MIMIC-IV v3.1 出院摘要

## 核心发现

### 三值标志
- 两个模型达到相同的 pooled跨 prompt 一致性（中位数 kappa 0.69 和 0.68）
- 较大模型在某些字段提高一致性，在其他字段降低一致性——是重新分配而非效应缺失

### Schema 效应
将 schema collapse 为二值消解了大多数跨 prompt 分歧，将其定位在 absence-versus-silence 维度而非 presence 维度。

### 多分类入院分类
- 改变模型：在近一半笔记上重新分配 dominant tag
- 改变 prompt 措辞：在约 1/8 上重新分配
- 较大模型在 residual catch-all categories 上放置更少 mass（44% → 26%）

## 关键结论

1. **Schema 强加的分歧源**集中在 absence-versus-silence 轴上
2. **模型主导**多分类分类上的 prompt 措辞
3. 可重复性审计的方法论

## URL
- 原文: https://arxiv.org/abs/2606.05970