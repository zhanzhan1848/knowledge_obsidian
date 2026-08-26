# The Limits of Automatic Evaluation of Creativity in Large Language Models

## 元信息
| 标题 | 值 |
|------|-----|
| 论文 | The Limits of Automatic Evaluation of Creativity in Large Language Models |
| 作者 | Alessandro Tutone, Giorgio Franceschelli, Mirco Musolesi |
| 链接 | [原文](https://arxiv.org/abs/2608.23705) |
| arXiv | arXiv:2608.23705 [cs.CL] |
| 发表 | 2026-08-24 |

## 核心贡献

1. **研究问题**: 当前自动评估方法能否可靠地捕捉人类对创造力的判断？

2. **方法**:
   - 收集人类对 WritingPrompts 数据集中人类和 AI 生成短篇故事的评估，涵盖 **11 个创造力维度**
   - 将人类判断与自动客观指标和 LLM-as-a-Judge 评估进行比较

3. **关键发现**:

   ### 发现 1: LLM-as-a-Judge 对 AI 生成故事有系统性偏好
   - 始终偏好 AI 生成故事的文体特征，而非人类作者文本的不可预测性等特质

   ### 发现 2: 广泛使用的自动指标与人类判断几乎零相关
   - 在人类和 AI 生成的故事上均如此
   - 表明这些指标无法捕捉创造力的重要维度

4. **核心结论**:
   > 当前自动评估方法存在根本性局限性——将多维的、主观的创造力简化为计算指标是困难的

## 评估维度 (11 dimensions of creativity)

论文涵盖了 11 个不同维度的创造力评估，提供了比单一评分更细致的分析框架。

## 建议

- **是否推荐**: ⭐⭐⭐⭐
- **适用场景**: LLM 评估研究；创意生成系统；LLM-as-a-Judge 方法论研究
- **必读理由**: 揭示 LLM-as-a-Judge 系统性偏见的重要论文；对创意评估实践有重要警示意义
