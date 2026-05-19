# 2605.16650 - SKG-Eval: Stateful Evaluation of Multi-Turn Dialogue via Incremental Semantic Knowledge Graphs

## 元信息

| 标题 | SKG-Eval: Stateful Evaluation of Multi-Turn Dialogue via Incremental Semantic Knowledge Graphs |
|------|------|
| 作者 | Avijit Shil, Suman Samui |
| 链接 | [原文](https://arxiv.org/abs/2605.16650) |
| arXiv | arXiv:2605.16650v1 |
| 领域 | cs.CL, cs.AI |
| 日期 | 2026-05-15 |

## 核心贡献

1. **问题**：现有自动评估器（LLM-as-a-judge、embedding-based）依赖平坦或单轮表示，难以检测长程矛盾、话题漂移、实体不一致
2. **方案**：SKG-Eval，将对话建模为增量演化的语义知识图谱（Semantic Knowledge Graph）
3. **三信号融合**：
   - Local relevance（局部相关性）
   - Historical consistency（历史一致性）
   - Logical coherence（逻辑一致性，通过几何矛盾引擎检测跨轮冲突）

## 核心方法

### SKG（Semantic Knowledge Graph）
- 对话中的实体、关系、承诺建模为图结构
- 通过结构化三元组提取增量更新图

### 三信号
1. **Local relevance**：测量与当前 prompt（和可选 reference）的对齐
2. **Historical consistency**：基于图和 embedding 信号，评估新引入信息如何连接历史上下文
3. **Logical coherence**：几何矛盾引擎检测跨轮冲突（无需 NLI 模型或 LLM judge）

### 评分
- 通过近因加权趋势分析自适应融合
- 生成长度不变 session score
- 产生显式矛盾证书和确定性分数（可复现、可审计）

## 关键洞察

- 结构化外部化状态追踪是 LLM 对话评估的可扩展替代方案
- 图结构可以捕获 flat representation 丢失的长程依赖
- 几何矛盾引擎避免了对 NLI 模型的依赖

## 局限性

- 实体链接和关系抽取的准确性影响 SKG 质量
- 在更开放域对话上的效果待验证

## 建议

- **是否推荐使用**：✅ 是
- **适用场景**：多轮对话系统评估、对话质量审计、长程一致性检测
- **关键词**：dialogue evaluation, knowledge graph, consistency, multi-turn