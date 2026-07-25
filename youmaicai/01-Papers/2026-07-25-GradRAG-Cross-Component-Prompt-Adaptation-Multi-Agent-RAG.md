# 🥬 GradRAG: Cross-Component Prompt Adaptation for Multi-Agent RAG

## 元信息

| 标题 | GRADRAG: Cross-Component Prompt Adaptation for Coordinated Multi-Agent RAG |
|------|------|
| **arXiv** | [2607.21324](https://arxiv.org/abs/2607.21324) |
| **类别** | cs.CL |
| **关键词** | RAG, multi-agent, prompt adaptation, retrieval-augmented generation, cross-component coordination |

## 核心贡献

1. **跨组件 Prompt Adaptation**：将下游评估反馈传播到多个上游 Agent（检索器、图构建器、答案生成器）
2. **计算图抽象**：将 RAG pipeline 建模为计算图，节点为 Agent，边为数据转换
3. **两种检索范式**：
   - **Vector RAG**：IRCoT-style 查询精化 + 混合 dense-lexical 检索
   - **GraphRAG**：实体关系图构建 + Leiden 社区检测 + 迭代图丰富
4. **Early Stopping**：Evaluator Agent 决定何时停止 refinement

## 框架架构

### Pipeline 流程

```
Query → Retrieval Agent → Retrieved Chunks/Graph
    → Answer Generation Agent → Candidate Answer
    → Evaluator Agent → Feedback + Stop?
    → (If not stop) Prompt Optimizer → Updated Prompts
    → Next iteration
```

### Vector RAG

- IRCoT-style：迭代生成子查询，基于已检索上下文
- 混合检索：dense similarity + lexical matching
- Retrieval Agent **自适应**：prompt 可根据评估反馈更新

### GraphRAG

- 实体关系图提取 → 社区检测（Leiden）→ 社区摘要 → 候选答案评分
- Graph Extraction Agent **自适应**：评估反馈指导实体/关系提取优先级
- 反馈驱动 → 任务导向本体论（task-oriented ontology）

## 性能结果

### SQuALITY & QMSum

- **12-15pp net preference margin**（LLM-judged pairwise comparisons）
- 大部分收益在 **2 次 refinement iterations** 内实现
- 无 reference answer 的情况下评估

### 控制实验

- One-Step Refinement baseline：仅更新 Answer Generation Agent
- Full GradRAG：同时更新 Retrieval Agent / Graph Extraction Agent
- 隔离了跨组件 adaptation 的效果

## 建议

- **是否推荐使用**：**是**（RAG 系统优化）
- **适用场景**：文档问答、查询聚焦摘要、长文档 RAG、multi-agent 系统
- **相关方向**：DSPy、TextGrad、Agentic RAG

## 链接

- **arXiv**: https://arxiv.org/abs/2607.21324

---

*🥬 油麦菜知识库 | 生成时间: 2026-07-25*
