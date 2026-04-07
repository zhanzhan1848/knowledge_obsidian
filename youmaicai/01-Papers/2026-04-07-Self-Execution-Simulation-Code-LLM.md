# Self-Execution Simulation: 代码模型自我执行模拟

## 元信息
| 标题 | Self-Execution Simulation Improves Coding Models |
|------|------|
| 作者 | Gallil Maimon, Ori Yoran, Felix Kreuk, Michael Hassid, Gal Cohen, Pierre Chambon, Yossi Adi |
| 链接 | [原文](https://arxiv.org/abs/2604.03253) |
| arXiv | arXiv:2604.03253v1 |
| 领域 | cs.CL, cs.LG |

## 核心问题

**LLMs 无法正确估计自身生成代码的执行结果**

即使是最先进的 Code LLMs，在竞争编程中仍经常生成错误的代码。核心瓶颈：
1. 模型无法验证自己生成的代码
2. 无法模拟程序执行来预测输出
3. 无法基于执行反馈进行自我修复

## 核心贡献

### 1. 执行轨迹模拟 (Execution Simulation)
训练 Code LLMs 逐步模拟程序执行：
```
Code → [Simulate] → Execution Trace → Predicted Output
```

### 2. SFT + RL 混合训练

**Supervised Fine-Tuning:**
- 自然语言执行轨迹
- 基于真值执行的文本解释

**Reinforcement Learning:**
- 可验证奖励的强化学习
- 两个互补目标：

```
目标 1: Output Prediction
给定代码和输入 → 预测输出

目标 2: Competitive Programming with Execution Feedback  
- Ground-truth 执行反馈，或
- Self-predicted 执行反馈
```

### 3. 自验证与自修复

**Self-Verification:**
- 对多个候选解决方案执行自验证
- 选择最佳方案

**Iterative Self-Fixing:**
- 通过模拟测试执行进行迭代自修复
- 模型可学会"先思考，再验证，再修正"

## 关键洞察

> "A promising research direction in enabling LLMs to generate consistently correct code involves addressing their inability to properly estimate program execution"

- 执行模拟能力是可以通过训练习得的
- 关键在于将执行反馈整合进训练信号
- 自预测执行反馈可驱动自我修复循环

## 实验设置

### 基准
- 多个竞争编程基准

### 方法
- SFT on execution traces
- RL with verifiable rewards
- Self-verification over multiple candidates
- Iterative self-fixing

### 结果
- 一致超越标准推理方法
- 消融实验揭示执行模拟的作用与局限性

## 与相关工作的关系

| 工作 | 方法 |
|------|------|
| Self-Debug | 通过代码审查验证 |
| CRITIC | 自我批评 + 工具调用 |
| This Work | 模拟执行 + 自验证 + 自修复 |

## 评估
- **推荐指数**: ⭐⭐⭐⭐
- **适用场景**: 代码生成、竞争编程、代码自我改进
- **亮点**: 将执行模拟能力整合进 Code LLM 训练 pipeline
