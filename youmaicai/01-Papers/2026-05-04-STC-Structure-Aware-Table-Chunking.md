# STC: Structure-Aware Chunking for Tabular Data in Retrieval-Augmented Generation

## 基本信息
| 项目 | 内容 |
|------|------|
| 作者 | Pooja Guttal, Varun Magotra, et al. |
| 发表 | arXiv (2026-05-04) |
| 链接 | [原文](https://arxiv.org/abs/2605.00318) |
| arXiv | arXiv:2605.00318 |

## 核心贡献

### 问题
- 表格文档（CSV、Excel）在企业数据管道中广泛使用
- 现有 chunking 策略主要针对非结构化文本设计，未考虑表格结构

### 方法：STC (Structure-aware Tabular Chunking)
1. **Row-level units**：构建层级 Row Tree 表示，每行编码为 key-value block
2. **Token-constrained splitting**：对齐结构边界进行分割
3. **Overlap-free greedy merging**：产生 dense、non-overlapping chunks

## 实验结果 (MAUD dataset)
- Chunk count 减少：**40% vs standard recursive**，**56% vs key-value based baselines**
- Token 利用率提升，处理效率提高
- Retrieval 基准：
  - MRR: 0.3576 → **0.5945** (hybrid)
  - Recall@1 (BM25): 0.366 → **0.754**

## 建议
- **是否推荐使用**：是（表格数据 RAG）
- **适用场景**：企业数据管道、RAG tabular data、document processing

---

## 摘要

Tabular documents such as CSV and Excel files are widely used in enterprise data pipelines, yet existing chunking strategies for retrieval-augmented generation (RAG) are primarily designed for unstructured text and do not account for tabular structure. We propose a structure-aware tabular chunking (STC) framework that operates on row-level units by constructing a hierarchical Row Tree representation, where each row is encoded as a key-value block.

## 关键词
- `#RAG` `#tabular data` `#chunking` `#information retrieval`