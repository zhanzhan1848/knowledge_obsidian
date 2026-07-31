# GLM-RAG: Graph Language Models for Graph-Based RAG

## 元信息
| 标题 | Graph Language Models for Graph-Based Retrieval-Augmented Generation |
|------|------|
| 作者 | Maya Arseven 等 |
| 链接 | [原文](https://arxiv.org/abs/2607.28397) |
| arXiv | arXiv:2607.28397 [cs.AI] |
| 发表 | 2026-07-30 |

## 核心贡献
1. **引入 GLM-based retriever**：结合图推理和语言模型语义能力
2. **跨域迁移能力**：微调 GLM retriever 在未见领域泛化更好
3. **SOTA on 多跳 benchmarks**：在两个多跳 QA 数据集上达到最优

## 方法对比

| Retriever 类型 | 优势 | 劣势 |
|----------------|------|------|
| **GLM-based** | 跨域迁移好，多跳推理强 | 需要微调，计算成本高 |
| **GNN-based** | 图覆盖率高，训练高效 | 语义理解弱 |
| **Vector-search** | 单跳任务优秀 | 多跳推理差 |

### GLM 优势
- 融合图结构建模 + 语言模型语义理解
- 参数和子图覆盖增大时，表现有前景的 scaling 趋势

## 实验

### 多跳 RAG
- HotPotQA, 2WikiMultihopQA, MuSiQue
- GLM retriever 在域外泛化显著优于 GNN 和向量搜索

### 单跳 RAG
- 向量搜索 baseline 表现更好

## 标签
#RAG #knowledge-graph #graph-language-model #multi-hop-QA #retrieval
