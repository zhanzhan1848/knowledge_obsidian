# Understanding Annotator Safety Policy with Interpretability

## 元信息
| 标题 | Understanding Annotator Safety Policy with Interpretability |
|------|------|
| 作者 | Alex Oesterling, Donghao Ren, Yannick Assogba, Dominik Moritz, Sunnie S. Y. Kim, Leon Gatys, Fred Hohman |
| 链接 | [原文](https://arxiv.org/abs/2605.05329) |
| arXiv | arXiv:2605.05329 |
| DOI | 10.1145/3805689.3806472 |
| 领域 | AI Safety, Interpretability, Annotation |

## 核心贡献

1. **Annotator Policy Models (APMs)**: 可解释模型，从标注行为中学习标注者的内部安全策略，无需额外标注负担
2. **Disagreement 根源分解**: 区分三类来源：操作失败（误操作）、策略歧义（政策措辞模糊）、价值多元主义（不同安全观）
3. **两大应用**:
   - 发现策略歧义：揭示标注者如何不同地解读安全指令
   - 发现价值多元主义：揭示不同人口统计群体的系统性安全优先级差异

## 方法

- APMs 从标注行为（而非自我报告推理）中学习标注者安全策略
- 验证 APMs 准确建模标注者安全策略（>80% accuracy）
- 忠实地预测反事实编辑下的响应
- 在受控设置中恢复已知策略差异

## 局限

- 依赖标注行为数据的质量和数量
- 可解释性模型本身可能引入偏差

## 关键词
`Safety Policy` `Annotator Disagreement` `Interpretability` `AI Safety` `Value Pluralism`

## 日期
2026-05-08