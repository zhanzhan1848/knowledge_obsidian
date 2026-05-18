# 2026-05-18 Daily Summary

## 今日论文发现

| 编号 | 论文 | 领域 | 关键发现 |
|------|------|------|----------|
| 1 | SDOF: State-Constrained Multi-Agent Dispatch | Multi-Agent, RLHF | 状态机约束的多智能体编排，7B Intent Router 80.9% vs GPT-4o 48.9% |
| 2 | TeamTR: Trust-Region Fine-Tuning for Multi-Agent | Multi-Agent, Fine-tuning | 顺序微调累积偏移问题，信任域方法 +7.1% 提升 |
| 3 | Quantization Undoes Alignment: Bias in Compressed LLMs | Quantization, Alignment | 3-bit 量化导致 6-21% 项目产生新偏见，perplexity 无法检测 |
| 4 | SkillSmith: Compiling Agent Skills | Agent, Efficiency | 技能边界优先编译，token 使用 -57.44%，2.02x 提速 |
| 5 | Fair Outputs, Biased Internals | Alignment, Interpretability | 公平输出掩盖可利用内部偏见，跨层激活 steering 可反转决策 |
| 6 | OP-Mix: On-Policy Data Mixing | Data Mixing, Continual Learning | 统一数据混合算法，预训练 +6.3% perplexity，持续学习节省 66-95% 计算 |
| 7 | AgentStop: Early Termination for Local Agents | Local Agent, Energy | 本地智能体节能 15-20%，<5% 性能损失 |
| 8 | ToM in Human-AI Interaction | Theory of Mind, Evaluation | 静态 ToM 基准改进不转化为动态交互收益 |
| 9 | NOVA: Knowledge Discovery Limits | Theory, AI Limits | AI 知识发现的fundamental limits，污染陷阱与扩展定律 |
| 10 | CAX-Agent: MAPDL Automation | Agent, Engineering | Agent Harness for 工程仿真，model_only 恢复策略最优 |

## 主题分布
- **Multi-Agent Systems**: 3 篇 (SDOF, TeamTR, CAX-Agent)
- **Alignment & Safety**: 2 篇 (Quantization, Fair Outputs)
- **Agent Efficiency**: 2 篇 (SkillSmith, AgentStop)
- **Evaluation & Theory**: 2 篇 (ToM, NOVA)
- **Training**: 1 篇 (OP-Mix)

## 关键趋势
1. 多智能体系统从研究走向实用（安全约束、协作微调）
2. 量化压缩的隐藏风险浮现（公平性问题）
3. 智能体效率优化成为焦点（编译技术、早期终止）
4. 静态评估无法反映真实交互能力