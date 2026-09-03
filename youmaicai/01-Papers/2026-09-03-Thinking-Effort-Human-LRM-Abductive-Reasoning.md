# Thinking Effort Aligns Between Humans and Reasoning Models in Abductive Reasoning

## 元信息
| 标题 | Thinking effort aligns between humans and reasoning models in abductive reasoning |
|------|------|
| 作者 | Henry Arthur et al. |
| 链接 | [原文](https://arxiv.org/abs/2609.01867) |
| arXiv | arXiv:2609.01867 |
| 会议 | EMNLP 2026 Findings |

## 核心贡献
1. 研究大语言模型（LRM，large reasoning models）和人类在归纳推理(abductive reasoning)中的行为一致性
2. LRM 通过 RL from verifiable rewards 优化，区别于标准 LLM；归纳推理的难度无法从形式结构推断，不存在模型可利用的"捷径"来模拟努力
3. 发现 LRM 和人类推理努力的一致性进一步证据；模型和人类倾向于犯相似的错误
4. 解码方法允许多条推理路径时，增加人类和 LRM 之间推理成本的一致性

## 模型架构 / 方法
- 对比人类反应时间和模型推理轨迹
- 关注归纳推理：不同于演绎推理，其难度无法从形式结构推断
- 测试多种 LRM 模型

## 实验结果
- LRM 和人类在推理努力上存在进一步的对齐证据
- 多路径探索的解码方法提升了 3 个测试模型的一致性
- 模型和人类倾向于犯相似错误

## 局限性
- 样本和任务范围有限
- LRM 训练数据可能包含类似人类生成的推理轨迹

## 关键词
#reasoning-model #human-alignment #abductive-reasoning #cognitive-modeling
