# BALAR: A Bayesian Agentic Loop for Active Reasoning

## 元信息
| 标题 | BALAR: A Bayesian Agentic Loop for Active Reasoning |
|------|------|
| 作者 | Aymen Echarghaoui 等 |
| 链接 | [原文](https://arxiv.org/abs/2605.05386) |
| arXiv | arXiv:2605.05386 |
| 领域 | LLM Agent, Active Reasoning, Multi-Turn Dialogue |

## 核心贡献

1. **BALAR**: 任务无关的 outer-loop 算法，无需微调，使 LLM 智能体能与用户进行结构化多轮交互
2. **Structured Belief over Latent States**: 维护潜在状态的概率化信念
3. **Expected Mutual Information Maximization**: 选择澄清性问题，最大化预期互信息
4. **Dynamic State Representation Expansion**: 当当前状态表示不足时动态扩展

## 方法

- **信念维护**: 对话历史 → 潜在状态 belief
- **问题选择**: 最大化 expected mutual information → 选择最能减少不确定性的问题
- **状态扩展**: 当 belief 无法支撑任务时，动态扩展状态表示维度

## 实验结果

| Benchmark | 提升 |
|-----------|------|
| AR-Bench-DC (侦探案件) | +14.6% accuracy |
| AR-Bench-SP (思维谜题) | +38.5% accuracy |
| iCraft-MD (临床诊断) | +30.5% accuracy |

显著超越所有 baseline，无须微调。

## 局限

- 需要多次交互轮次，开销较大
- 状态空间表示设计可能影响扩展性

## 关键词
`Bayesian Reasoning` `Active Learning` `LLM Agent` `Multi-Turn Dialogue` `Mutual Information`

## 日期
2026-05-08