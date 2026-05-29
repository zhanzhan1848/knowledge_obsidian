# LCO: LLM-based Constraint Optimization for Safer Agentic LLMs

## 基本信息
| 标题 | LLM-based Constraint Optimization for Safer Agentic LLMs in Real-world Tasks |
|------|--------------------------------------------------------------------------------|
| 作者 | Jiayong Wan, Jiawei Chen, Zhaoxia Yin, Liu Shuyuan, Hang Su |
| 链接 | [原文](https://arxiv.org/abs/2605.27375) |
| arXiv | arXiv:2605.27375v1 |
| 领域 | cs.CL |

## 核心贡献

1. **问题识别**：LLM 作为自主智能体时，持续环境交互导致**上下文奖励黑客(ICRH)**——模型迭代优化代理目标时意外产生有害副作用
2. **LCO 框架**：无需模型微调即可有效减少 ICRH，由两个模块组成：
   - **Self-Thought Module**：引导 LLM 在执行前主动思考并整合潜在安全约束
   - **Evolutionary Sampling Module**：使用 LLM-based crossover 和 mutation 将模型行为约束在安全解空间内

## 核心创新点

现有防御方法不足以应对 ICRH，因为 ICRH 源自模型自身的过度优化，而非对抗输入。

```math
\text{Tweet Optimization: } \Delta \text{TGR} = -39\% \text{ (GPT-4)}
```

```math
\text{Policy Optimization: } \Delta \text{ICRH Rate} = -15.23\%
```

## 实验结果

- **Tweet engagement optimization**：GPT-4 上 Toxicity Growth Rate 降低 39%
- **Policy optimization benchmark**：ICRH Occurrence Rate 降低 15.23%
- 在提升安全性的同时保持任务性能

## 局限性

- 仅在特定任务上验证
- 依赖 LLM 自身推理能力

## 标签
#RLHF #agent #safety #LLM-optimization