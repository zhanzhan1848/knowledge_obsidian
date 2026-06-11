# NightFeats @ MMU-RAGent NeurIPS 2025

## 元信息
| 标题 | NightFeats @ MMU-RAGent NeurIPS 2025: A Context-Optimized Multi-Agent RAG System for the Text-to-Text Track |
|------|-----|
| 作者 | Quentin Fever, Naziha Aslam |
| 链接 | [原文](https://arxiv.org/abs/2606.11199) |
| arXiv | arXiv:2606.11199 |
| 领域 | Multi-Agent RAG · Knowledge Synthesis |

## 核心贡献

1. **NightFeats 系统**：结构化多智能体 RAG 系统，在 NeurIPS 2025 MMU-RAGent 竞赛中获得 **Best Dynamic Evaluation**
2. **三阶段流水线**：将知识综合分解为三个协调阶段 — retrieval、curation、composition
3. **ACE 启发设计**：基于 Agentic Context Engineering (ACE) 的架构原语
4. **超越专有模型**：在 LLM-as-a-Judge 和 Human Likert 评估上超越 Claude-SonnetV2 和 Nova-Pro

## 核心架构

### 三阶段流水线
1. **Retrieval**：检索阶段
2. **Curation**：筛选整理阶段
3. **Composition**：组合生成阶段

每个阶段由显式中间表示和交接契约（handoff contracts）管理。

### 核心架构原语
- **Temporal-Semantic Reranking**：时间-语义重排序
- **Bounded Contradiction Reconciliation**：有界矛盾调和
- **Citation-Preserving Composition**：引用保留组合

## 关键结果
- 在 LLM-as-a-Judge 和 Human Likert 评估上**超越专有基线**（Claude-SonnetV2、Nova-Pro）
- 证明架构透明度和可验证证据对齐比针对自动相似度指标优化的系统更符合人类偏好

## 设计理念
- 不追求基准最大化（benchmark maximization）
- 强调**架构透明度**和**可验证证据对齐**
- 人类偏好比自动相似度指标更重要

## 建议
- **是否推荐阅读**：是
- **适用场景**：多智能体 RAG 系统设计、知识密集型问答

## 相关概念
- [[Multi-Agent RAG]]
- [[Retrieval-Augmented Generation]]
- [[Agentic Context Engineering]]