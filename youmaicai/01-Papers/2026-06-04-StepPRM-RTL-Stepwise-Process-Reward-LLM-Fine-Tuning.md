# StepPRM-RTL: Stepwise Process-Reward Guided LLM Fine-Tuning for Enhanced RTL Synthesis

## 元信息
| 标题 | StepPRM-RTL: Stepwise Process-Reward Guided LLM Fine-Tuning for Enhanced RTL Synthesis |
|------|------|
| 作者 | Prashanth Vijayaraghavan |
| 链接 | [原文](https://arxiv.org/abs/2606.04246) |
| arXiv | arXiv:2606.04246 |
| 代码 | - |
| 领域 | cs.AI, cs.AR, cs.CL |
| 发表 | 2026-06-02 |
| 会议 | DAC 2026 |

## 核心贡献
1. 提出 **StepPRM-RTL**：结合 stepwise trajectory modeling、Process Reward Modeling (PRM) 和 Retrieval-Augmented Fine-Tuning (RAFT)，提升 LLM 生成 RTL 代码的功能正确性和推理保真度
2. 从 canonical solutions 构建 stepwise reasoning trajectories，每步包含 rationale + 增量代码修改
3. **Process Reward Model (PRM)** 评估中间步骤，提供密集反馈引导 RAFT 微调中的强化风格更新
4. **Monte Carlo Tree Search (MCTS)** 探索替代推理路径，丰富训练数据集
5. 功能正确性和推理保真度指标提升超过 10%

## 核心挑战
RTL 代码生成面临的挑战：
- 长时域推理
- 多步依赖
- 严格正确性约束（Verilog/VHDL）

## 方法

### Stepwise Trajectory Modeling
```
[Step 1: rationale + incremental code change]
[Step 2: rationale + incremental code change]
...
[Final: complete RTL code]
```

### PRM + RAFT + MCTS
- PRM 提供每步的密集奖励信号
- RAFT 使用检索增强微调
- MCTS 探索多条推理路径

## 实验结果
- 在 benchmark Verilog 和 VHDL 数据集上，功能正确性提升超过 10%
- 推理保真度指标同样提升超过 10%
- Ablation studies 确认 PRM-guided rewards + stepwise trajectory exploration 是性能关键

## 相关标签
#LLM #fine-tuning #RTL #code-generation #PRM #MCTS #hardware-design #DAC2026