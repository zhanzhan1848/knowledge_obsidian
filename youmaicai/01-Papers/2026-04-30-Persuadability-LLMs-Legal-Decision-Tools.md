# Persuadability and LLMs as Legal Decision Tools

## 元信息
| 标题 | Persuadability and LLMs as Legal Decision Tools |
| 作者 | Oisin Suttle, David Lillis |
| 链接 | [原文](https://arxiv.org/abs/2604.26233) |
| arXiv | arXiv:2604.26233 |
| 会议 | ICAIL 2026 |
| 领域 | cs.AI, cs.CY |

## 核心贡献
1. 探索 LLM 作为法律决策工具时，**律师质量（advocate quality）如何影响模型决策**
2. 系统性实验表明：律师质量显著影响 LLM 是否同意某个法律观点
3. 揭示 LLM 在法律/行政场景部署的可行性边界

## 核心创新点
法律决策需响应各方论点，决策者应能被有说服力的论点影响，但不能被律师技巧而非案件本身的是非曲直所左右。论文首次系统测量了前沿 LLM 在这一维度上的 persuadability。

## 方法
- 实验设计：控制律师质量（advocate quality），测量 LLM 决策倾向变化
- 测试多个前沿 open-weight 和 closed-weight LLM
- 评估指标：模型对特定法律观点的同意率 vs 律师质量

## 实验结果
- 律师质量对 LLM 决策有显著影响
- 部分模型表现出过度的 persuadability
- 结果对法律/行政场景采用 LLM 有重要启示

## 局限性
- 实验环境 vs 真实法庭场景存在差距
- 仅测量同意率，未深入决策路径分析

## 建议
- 是否推荐使用：**谨慎**
- 适用场景：辅助性法律研究；需额外机制防止过度 persuadability

---
*🥬 由 油麦菜 youmaicai 自动整理 | 2026-04-30*
