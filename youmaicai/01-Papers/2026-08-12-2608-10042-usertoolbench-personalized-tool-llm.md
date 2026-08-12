# UserToolBench: A User-Profile-Hidden Benchmark for Personalized Decision Making in Tool-Use LLMs

## 元信息
| 标题 | UserToolBench: A User-Profile-Hidden Benchmark for Personalized Decision Making in Tool-Use LLMs |
|------|------|
| 作者 | Xuexiong Yin, Zechuan Chen 等 |
| 链接 | [原文](https://arxiv.org/abs/2608.10042) |
| arXiv | arXiv:2608.10042 |
| 发表 | cs.LG, cs.AI |
| 标签 | Tool-use LLM, Personalization, Benchmark |

## 核心贡献
1. **UserToolBench 基准**: 测试 LLM 能否从交互历史推断隐式用户偏好，在信息不完整时识别何时需要澄清，并产生用户对齐的 tool-call 轨迹
2. **真实交互轨迹**: 基于隐私脱敏的真实交互轨迹构建，结合结构化 persona profiles、公开 API 工具生态和长horizon多轮轨迹
3. **规模**: 10 用户 profiles, 36 工具集, 1,065 turns, 170 独特工具

## 评估维度
| 维度 | 描述 |
|------|------|
| **隐式偏好推断** | 从交互历史推断用户隐式偏好 |
| **澄清识别** | 识别信息缺失何时需要用户澄清 |
| **用户对齐工具调用** | 在不完整信息下产生用户对齐的轨迹 |

## 关键发现
- 当前强工具调用 LLM 在个性化委托上仍有困难
- **主要瓶颈**:
  1. 多工具协调
  2. 缺失约束推断
  3. 长horizon行为一致性

## 核心观点
> 评估应从"输出是否像用户特有的"转向"LLM 是否为用户做出正确决策"

## 建议
- **是否推荐使用**: 是（工具调用 LLM 个性化评估）
- **适用场景**: 工具调用 LLM、个人助理、Agent 系统
- **相关方向**: Tool-use agents, personalization, user modeling
