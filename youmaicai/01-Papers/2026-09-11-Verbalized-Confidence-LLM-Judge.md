# 🥬 LLM 论文分析：Verbalized Confidence for LLM-as-a-Judge

## 基本信息
- **标题**: Rethinking Verbalized Confidence for LLM-as-a-Judge: A Compatibility Shift on Post-2025 Proprietary Models
- **作者**: Yu-Chung Hsiao
- **发表**: arXiv:2609.10996 | cs.CL
- **链接**: [原文](https://arxiv.org/abs/2609.10996) | [PDF](https://arxiv.org/pdf/2609.10996) | [HTML](https://arxiv.org/html/2609.10996v1)

## 核心贡献

1. **Compatibility Shift 发现**: 后 2025 闭源模型中，verbalized confidence 优于 log-probabilities，成为更稳健的 soft-scoring 机制
2. **Overconfidence Advisory**: 引入过度自信 Advisory 机制
3. **Self-Debate**: 引入自辩论机制提升校准、分数分布扩散和对任务主观性的鲁棒性
4. **Generation Effect**: 后 2025 模型可以自然地吸收这两种改进，而 pre-2025 模型会付出可测量的代价

## 背景与动机

**传统观点**: Verbalized confidence 被视为过度自信、粗粒度、易受整数聚集影响，是 log-probabilities 的较弱替代品。

**新发现**: 在顶级后 2025 闭源模型上，情况发生了根本性转变。

## 实验设置

**数据集**: SummEval, AggreFact, HelpSteer2 (最多 18 个 LLMs)

**基线对比**:
- Log-probabilities (G-Eval)
- Verbalized confidence (baseline)
- Verbalized confidence + overconfidence advisory + self-debate (proposed)

## 实验结果

| 方法 | 校准 | 分数分布扩散 | 主观性鲁棒性 |
|------|------|--------------|--------------|
| Log-prob G-Eval | 基线 | 基线 | 基线 |
| Verbalized (baseline) | ✅ 提升 | ✅ 提升 | ✅ 提升 |
| Verbalized + Advisory + Debate | ✅✅ 最佳 | ✅✅ 最佳 | ✅✅ 最佳 |

**关键结论**:
- 在 post-2025 模型上，verbalized confidence 是更优的 soft-scoring 信号
- 改进在 accuracy-only 报告下不可见（需 soft scoring 才能发现）
- 建议 LLM-as-a-Judge 广泛采用 soft scoring

## 局限性

- 主要验证 GPT-family 顶级发布，跨模型泛化待验证
- Self-debate 引入额外推理开销

## 建议
- **是否推荐使用**: ⭐⭐⭐⭐ (发现重要的评估范式转变)
- **适用场景**: LLM 评估、模型对比、主观任务评分
- **实践建议**: 对 post-2025 模型优先使用 verbalized confidence + soft scoring

---

## 🏷️ Tags
#LLM-as-a-Judge #Evaluation #Verbalized-Confidence #Calibration #Soft-Scoring
