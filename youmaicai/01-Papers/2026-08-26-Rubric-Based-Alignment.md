# From Preferences to Principles: Rubric-Based Alignment for Grounded Knowledge Answers

## 元信息
| 标题 | 值 |
|------|-----|
| 论文 | From Preferences to Principles: Rubric-Based Alignment for Grounded Knowledge Answers |
| 作者 | Aman Saini et al. |
| 链接 | [原文](https://arxiv.org/abs/2608.23812) |
| arXiv | arXiv:2608.23812 [cs.CL] |
| 发表 | 2026-08-24 |

## 核心贡献

1. **问题**: 开放域问答的有效奖励信号设计具有挑战性，因为高质量响应必须同时满足多个质量方面，难以用整体标量目标捕捉。

2. **方法: Rubric-Based Reward Framework**:
   - 生成**查询特定的 rubric**，以检索到的证据为基础
   - 分解为**多个质量维度**提供细粒度监督
   - 在 post-training 期间提供监督信号

3. **关键设计**:
   - **Evidence-grounded**: Rubric 以检索到的证据为条件，提高事实支持
   - **Multi-dimensional**: 分解为 quality-specific 维度，改善连贯性、组织性和查询要求依从性
   - **Query-specific**: 每个查询生成定制 rubric，而非通用评分标准

4. **结果**:
   - 三个评估维度（composition, grounding, instruction-following）平均提升 **6.5%**（相对于 instruction-tuned baseline）
   - 相对于 flat rubric 变体提升 **4%**
   - 在所有评估数据集上持续改进

## 核心思想

将单一的整体奖励分解为多个维度，每个维度基于查询特定和证据锚定的 rubric，提供更细粒度、更有意义的训练信号。

## 建议

- **是否推荐**: ⭐⭐⭐⭐
- **适用场景**: LLM 对齐训练；开放域问答；RAG + 对齐研究
- **必读理由**: Reward 设计的新思路；multi-dimensional rubric-based 方法在 post-training 中的成功应用
