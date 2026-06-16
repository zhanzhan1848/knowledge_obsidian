# A Definition of Good Explanations and the Challenges Explaining LLM Outputs

## 元信息
| 标题 | A Definition of Good Explanations and the Challenges Explaining LLM Outputs |
|------|-----|
| 作者 | Louis Mahon, Elliot Ford, Callum Hackett |
| 链接 | [原文](https://arxiv.org/abs/2606.14838) |
| arXiv | arXiv:2606.14838 |
| 领域 | cs.AI |

## 核心贡献
1. 提出了**好的解释的定义**：基于反事实解释，但同时考虑 interlocutor（对话者）对每个可提供解释的事实的先验信念
2. 探索了该定义对 AI 可解释性的影响
3. 特别指出为什么 LLM 输出难以产生好的解释

## 核心哲学问题
### 好的解释是什么？
长期哲学争论 → 反事实解释提供了一定框架：
- 反事实解释："如果 X 不发生，Y 就不会发生"
- 但这还不够： interlocutor 的先验信念也很关键

### 对 LLM 的挑战
LLM 输出难以产生好解释的原因：
1. **缺乏对 interlocutor 信念的建模**：LLM 无法知道用户的先验知识
2. **分布式知识表示**：LLM 的知识不是结构化存储，无法精确提取特定解释
3. **反事实生成的困难**：LLM 擅长描述实际发生的事，但反事实推理较弱
4. **解释与模型行为的关系**：LLM 生成的解释可能与实际决策过程无关（post-hoc rationalization）

## 方法
### 定义好的解释
一个好的解释应该：
1. 满足反事实条件（counterfactual condition）
2. 考虑 interlocutor 对解释中每个事实的先验信念
3. 在正确性、完整性和可理解性之间取得平衡

## 局限性分析
| LLM 挑战 | 原因 |
|----------|------|
| 解释缺乏特异性 | 无法针对 interlocutor 的具体知识水平定制 |
| 解释可能事后合理化 | 解释 ≠ 实际决策过程 |
| 难以提供精确反事实 | 知识分布式存储，非结构化 |

## 关键词
`Explainability` `LLM` `Counterfactual Explanations` `Interpretability` `Philosophy of Explanation`
