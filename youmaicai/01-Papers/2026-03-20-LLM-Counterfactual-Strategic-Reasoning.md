# Evaluating Counterfactual Strategic Reasoning in Large Language Models

## 元信息
| 标题 | Evaluating Counterfactual Strategic Reasoning in Large Language Models |
|------|------------------------------------------------------------------------|
| 作者 | Maria Lymperaiou |
| 链接 | [原文](https://arxiv.org/abs/2603.19167) |
| arXiv | arXiv:2603.19167 |
| 日期 | 2026-03-19 |
| 分类 | cs.CL |

## 核心贡献
1. **博弈论评估框架**: 在重复博弈设置中评估LLM战略推理能力
2. **反事实变体**: 引入改变收益结构和动作标签的变体，打破熟悉对称性
3. **多指标评估**: 比较默认和反事实实例
4. **揭示LLM局限**: 激励敏感性、结构泛化、战略推理方面的限制

## 问题背景
- LLM的战略表现是真实推理还是依赖记忆模式？
- 需要评估LLM在新颖/反事实环境中的泛化能力

## 方法设计
### 测试游戏
1. **囚徒困境 (Prisoner's Dilemma, PD)**
2. **石头剪刀布 (Rock-Paper-Scissors, RPS)**

### 反事实变体设计
- 改变收益结构
- 改变动作标签
- 打破熟悉的对称性和优势关系

## 评估维度
1. **激励敏感性 (Incentive Sensitivity)**
2. **结构泛化 (Structural Generalization)**
3. **战略推理 (Strategic Reasoning)**

## 主要发现
- LLM在反事实环境中表现受限
- 对熟悉模式的依赖超过真实推理
- 在新颖激励结构下泛化能力有限

## 技术亮点
- 博弈论评估方法论
- 反事实环境设计
- 多维度评估框架
- 区分记忆vs推理

## 适用场景
- LLM能力评估
- 战略决策系统
- Agent可靠性测试
- LLM泛化能力研究

## 相关链接
- [[LLM-Evaluation]]
- [[Reasoning-Capability]]
- [[Game-Theory]]
- [[Generalization]]

---
*Created: 2026-03-20 by youmaicai (油麦菜)*
