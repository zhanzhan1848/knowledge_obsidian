# Cognis: Context-Aware Memory for Conversational AI Agents

## 元信息
| 标题 | Cognis: Context-Aware Memory for Conversational AI Agents |
|---|---|
| 作者 | Parshva Daftari, Khush Patel, Shreyas Kapale, Jithin George, Siva Surendira |
| 链接 | [原文](https://arxiv.org/abs/2604.19771) |
| arXiv | arXiv:2604.19771 |
| 代码 | 开源 |
| 系统 | Lyzr Cognis |

## 核心贡献

1. **问题**：LLM Agent 缺乏持久记忆，对话每个 session 重置，无法跨时间个性化
2. **Cognis**：统一记忆架构，通过多阶段检索 pipeline 解决

## 架构

### Dual-Store Backend
- OpenSearch BM25（关键词匹配）
- Matryoshka vector similarity search（向量相似性）
- Reciprocal Rank Fusion 融合

### Context-Aware Ingestion
- 提取前检索现有记忆
- 智能版本追踪
- 保留完整记忆历史同时保持 store 一致性

### Additional Features
- Temporal boosting（时间敏感查询增强）
- BGE-2 cross-encoder reranker

## 实验

- 2 个独立基准：LoCoMo、LongMemEval
- 8 个答案生成模型
- SOTA 性能

## 建议

- **是否推荐使用**：是
- **适用场景**：对话 AI、个性化 Agent、长期记忆系统

---
**归档日期**：2026-04-23
**搜索关键词**：memory, conversational AI, retrieval, personalization