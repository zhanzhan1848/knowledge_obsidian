# A Tri-Agent Framework for Evaluating and Aligning Question Clarification Capabilities of LLMs

## 元信息
| 标题 | A Tri-Agent Framework for Evaluating and Aligning Question Clarification Capabilities of Large Language Models |
|------|------|
| 作者 | Yikai Zhao et al. |
| 链接 | [原文](https://arxiv.org/abs/2609.02054) |
| arXiv | arXiv:2609.02054 |

## 核心贡献
1. LLM 越来越多部署在交互系统中，理解用户意图至关重要；但评估模糊问题澄清能力缺乏系统性框架
2. 提出 **Tri-Agent 框架**：
   - **QCA (Question Clarifying Agent)**：被评估系统，识别歧义并提出澄清问题
   - **RA (Respondent Agent)**：模拟人类回复，可能包含无关或挑战性回复
   - **EA (Evaluator Agent)**：LLM-as-judge，基于综合指标评估对话质量

## 模型架构 / 方法
- 指标评估：歧义处理、问题质量、对话效率、语言适当性、最终意图对齐
- 供应链领域合成数据生成示例

## 实验结果
- EA 与人类判断的验证
- 为对话式 LLM 应用的澄清能力提供结构化评估方法

## 局限性
- 仅测试供应链领域
- EA 的评估仍依赖 LLM 本身

## 关键词
#question-clarification #LLM-evaluation #multi-agent #dialogue
