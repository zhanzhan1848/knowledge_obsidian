# ViLegalNLI: Natural Language Inference for Vietnamese Legal Texts

## 基本信息
| 项目 | 内容 |
|------|------|
| 作者 | Nhung Thi-Hong Duong, Mai Ngoc Ho, Tin Van Huynh, Kiet Van Nguyen |
| 发表 | arXiv (2026-04-30) |
| 链接 | [原文](https://arxiv.org/abs/2605.00116) |
| arXiv | arXiv:2605.00116 |

## 核心贡献
1. **ViLegalNLI**: 首个大规模越南语法律领域 NLI 数据集
2. **42,012** premise-hypothesis 对，来自官方成文法条文
3. 二分类标注（Entailment / Non-entailment）
4. 半自动数据生成框架：LLM-controlled hypothesis generation + 质量验证

## 数据集构建方法
- 半自动框架
- LLM 用于 controlled hypothesis generation
- 系统性质量验证流程
- Artifact 缓解策略
- 跨模型验证确保法律一致性

## 覆盖范围
- 多个法律领域
- 真实法律推理场景
- 结构化逻辑、条件条款、领域特定术语

## 实验结果
- Few-shot LLM 配置始终表现最佳
- 性能受 hypothesis length、lexical overlap、reasoning complexity 影响
- 跨领域泛化困难

## 局限性
- Cross-domain generalization 仍是挑战

## 建议
- **是否推荐使用**：是
- **适用场景**：越南法律 NLI、法律推理、 statutory text understanding

---

## 摘要

In this article, we introduce ViLegalNLI, the first large-scale Vietnamese Natural Language Inference (NLI) dataset specifically constructed for the legal domain. The dataset consists of 42,012 premise-hypothesis pairs derived from official statutory documents and annotated with binary inference labels (Entailment and Non-entailment). It covers multiple legal domains and reflects realistic legal reasoning scenarios characterized by structured logic, conditional clauses, and domain-specific terminology.

## 关键词
- `#Vietnamese NLP` `#legal NLI` `#NLI dataset` `#legal reasoning` `#multilingual`