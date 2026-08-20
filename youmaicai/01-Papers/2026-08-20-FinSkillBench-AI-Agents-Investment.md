# FinSkillBench: Evaluating AI Agents and Domain Skills for Investment Management

## 元信息
| 标题 | FinSkillBench: Evaluating AI Agents and Domain Skills for Investment Management |
|---|---|
| 作者 | Zhuang Qiang Bok et al. |
| 链接 | [原文](https://arxiv.org/abs/2608.18099) |
| arXiv | arXiv:2608.18099 |

## 核心贡献
1. 提出 **FinSkillBench**，首个评估语言模型智能体在投资管理领域**使用领域技能**能力的基准
2. 覆盖三大领域：**组合构建、风险管理、基本面分析**，12 个子任务，2603 个任务剧集
3. 对比三种条件：**无技能、精选技能包、自生成技能**

## 关键发现

### 精选技能稳定提升性能
- 无技能 → 有技能：平均分数 0.366 → 0.528
- 最大收益：组合构建和风险管理

### 自生成技能几乎无效
- 尽管计算成本更高，但收益极小
- 说明"让智能体自己写技能"策略在专业领域行不通

### 独立验证
- 使用独立智能体框架（Hermes Agent，8 模型，5280 剧集）复现了方向性模式

## 核心洞察
在投资管理智能体中，**访问可靠的程序性技能可能和选择模型本身一样重要**

## 数据集设计
- 每剧集提供：时间点输入、隐藏真值、任务特定评估器
- 三种技能条件对比，设计严谨

---
*关键词：LLM Agent，领域技能评估，投资管理，组合优化，Prompt Engineering，多智能体系统*
*领域：cs.AI, q-fin.PM*
