---
type: paper
created: 2026-07-22
updated: 2026-07-22
tags: [llm, agent, orchestration, dag, enterprise]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2607.18241
---

# BatchDAG: LLM-Planned Execution Graphs for Scalable Ad-Hoc Analysis Over Enterprise Data

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | BatchDAG: LLM-Planned Execution Graphs for Scalable Ad-Hoc Analysis Over Enterprise Data |
| **作者** | Anupreet Walia |
| **发表** | arXiv cs.AI (2026) |
| **链接** | [原文](https://arxiv.org/abs/2607.18241) |
| **DOI** | 10.48550/arXiv.2607.18241 |
| **代码** | - |

---

## 核心贡献

> LLM 生成有类型的 DAG 来编排企业数据分析操作，实现拓扑级并行和结构化 JSON 数据流，显著减少 LLM 调用次数并降低幻觉率。

1. 提出 **BatchDAG** 系统：LLM 生成操作的有类型 DAG（SQL 查询、语义搜索、内存变换等），由确定性引擎执行
2. 提出 **entity-aware batching**：按逻辑实体对行分组后再并行，LLM 调用减少最高 **47x**
3. 结构化 JSON 中间结果比纯文本减少 **27% 幻觉率**
4. 生产环境（Brevian.ai）：50,000+ 会议查询在 60 秒内完成，成本 $0.02-$0.24/次

---

## 技术方案

### 核心思想

将 LLM 定位为**编排层**而非执行层。LLM 生成 DAG，确定性引擎以拓扑波并行方式执行，输出结构化 JSON 而非自然语言 prose。

### 关键技术

| 技术 | 说明 |
|------|------|
| Typed DAG Generation | LLM 生成有类型的操作图，保证执行的确定性和可审计性 |
| Entity-Aware Batching | 按逻辑实体分组行，减少重复的 LLM 调用 |
| Topological-wave Parallelism | 拓扑级并行执行，最大化吞吐量 |
| Structured JSON Data Flow | 结构化 JSON 而非 prose，提升 provenance 和可靠性 |

---

## 实验结论

- **数据集**: 12 个 transcript-heavy 查询
- **基线**: Expert-designed pipeline, ReAct agent
- **结果**: 
  - 质量评分：BatchDAG (3.74/5) vs Expert (3.25/5) vs ReAct (3.09/5)
  - Provenance 证据率：77% vs 46-60%（基线）
  - Planner valid-DAG 率：98.8%
  - 幻觉减少：27%（JSON vs prose）
- **生产**: 50,000+ 会议查询 <60s，成本 $0.02-$0.24

---

## 局限性

- 非准确率优先的改进，而是通用编排层的替代
- 依赖 LLM 生成 valid DAG 的能力（98.8% 但非 100%）
- 生产环境数据未公开

---

## 实现建议

- **实现难度**: 高（需要 DAG 执行引擎、JSON schema 验证）
- **预期性能**: 质量相当专家 pipeline，显著优于 ReAct
- **适用场景**: 企业数据分析、多文档交叉查询、需要 provenance 的场景
