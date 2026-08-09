# READ: Beyond Top-K: Replacing Black-Box Retrieval with Interpretable Agentic Operations

## 元信息
| 标题 | Beyond Top-K: Replacing Black-Box Retrieval with Interpretable Agentic Operations |
|------|------|
| 作者 | Sagar Tamang et al. |
| 链接 | [原文](https://arxiv.org/abs/2608.06305) |
| arXiv | arXiv:2608.06305 |
| 领域 | cs.AI / cs.CL / cs.IR |

## 核心贡献

1. **问题诊断**：长文档 RAG 的主流 chunk-embed-top-k 范式存在结构性缺陷——表格行被分割、数值与单位分离（如 lakh/crore 误差达两个数量级）
2. **READ 方法**（Reliable Embedding-free Agentic Document-search）：通过三种确定性操作替代嵌入相似度搜索：
   - 规范化词法搜索（normalized lexical search）
   - 结构导航（structural navigation）
   - 有界跨度读取（bounded span reads）
3. **MCP 接口**：轨迹是可审计的回放，而非不透明相似度分数

## 关键数据

- 780 页政府财务报告：86.8% 内容行是表格行
- 数值单位与表头中位数相距 13 行
- READ 准确率 58.8% vs 密集检索 15.7%（p_Holm = 2×10⁻⁵）
- 即使调优后密集检索（35.3%），READ 仍领先 23.5 分

## 核心发现

- **BM25 与 READ 统计上无差异**：结果区分的是"基于嵌入"vs"无嵌入检索"，而非"Agentic"vs"词法搜索"
- 表感知 chunker 修复了单位问题，但仍有 27-30% 数值块在任何 chunk 大小下都缺失财年表头
- Agent 使用 top-k 工具仅达 27.5%，收益来自接口设计而非迭代

## 局限性

- 仅验证财务/监管文档类型
- 词法方法对语义匹配场景可能不足

## 建议
- **是否推荐使用**：是（结构化文档）
- **适用场景**：金融报告、审计报告、监管文件等高密度表格文档的 RAG

---
*🥬 油麦菜 · LLM/NLP 知识库 · 2026-08-09*
