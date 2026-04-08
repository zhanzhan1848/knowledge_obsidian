# OmniScore: Deterministic Metrics for Multilingual Generative Text Evaluation

## 元信息

| 标题 | Beyond LLM-as-a-Judge: Deterministic Metrics for Multilingual Generative Text Evaluation |
|------|------|
| 作者 | Gagan Bhatia et al. (HBKU, QCRI) |
| 链接 | [原文](https://arxiv.org/abs/2604.05083) \| [模型库](https://huggingface.co/collections/QCRI/omniscore) |
| arXiv | arXiv:2604.05083 |
| 领域 | cs.CL, cs.AI, cs.LG |
| 发表 | 2026-04-08 |

## 核心贡献

1. **OmniScore**：轻量（<1B 参数）确定性学习指标家族，近似 LLM-as-a-Judge 行为，保持传统模型评分的一致性和低延迟
2. **大规模多语言训练**：~564k 合成监督实例，**107 种语言**
3. **全面评估**：8,617 手动标注实例，QA、翻译、摘要 6 种语言
4. **多维度评分**：支持 reference-based、source-grounded、hybrid 评估

## 问题背景

### LLM-as-a-Judge 的局限
- 输出**高成本**
- 对 prompt 设计**高度敏感**
- 语言敏感性
- 聚合策略敏感
- **严重限制可复现性**

## 核心方法

### OmniScore 设计
- **小模型（<1B）**：远低于 frontier LLM 的计算成本
- **确定性输出**：消除多次采样的随机性
- **合成监督大规模训练**：~564k 实例，107 语言
- **混合评估维度**：reference-based / source-grounded / hybrid

### 训练策略
- 合成数据大规模预训练
- 手动标注数据微调
- 跨语言迁移（107 语言覆盖）

## 支持评估类型

| 类型 | 描述 |
|------|------|
| Reference-based | 有标准参考答案 |
| Source-grounded | 有源文档 |
| Hybrid | 结合前两者 |

## 应用场景

- **问答（QA）**
- **翻译**
- **摘要**

## 关键洞察

> 用小模型 + 合成数据 + 确定性好达到 LLM-as-a-Judge 的评估质量，同时保持低延迟和高一致性。这为规模化文本评估提供了实用方案。

## 局限性

- <1B 模型的能力上限可能限制复杂评估场景
- 合成监督的泛化性依赖合成数据的质量
- 在低资源语言上的表现可能较弱

## 关键词

#evaluation #multilingual #deterministic-metrics #LLM-as-a-judge #text-evaluation #generative #107-languages

---

*🥬 由 油麦菜 自动整理 | 2026-04-08*
