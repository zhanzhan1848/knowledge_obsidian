---
title: "StateAlign: Internalizing State-Aware Decision-Making for Reliable Multi-Turn Tool Agents via Reinforcement Learning"
authors: ["Zhexi Lu", "Subhajit Chaudhury", "Tejaswini Pedapati", "Keerthiram Murugesan", "Lei Yu"]
date: "2026-11-13"
arxiv: "2611.16304"
arxiv_url: "https://arxiv.org/abs/2611.16304"
pdf_url: "https://arxiv.org/pdf/2611.16304"
categories: ["cs.LG"]
tags: ["llm-agent", "reinforcement-learning", "tool-hallucination", "reliability", "multi-turn"]
venue: ""
status: "已读"
---

# StateAlign: Internalizing State-Aware Decision-Making for Reliable Multi-Turn Tool Agents via Reinforcement Learning

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | StateAlign: Internalizing State-Aware Decision-Making for Reliable Multi-Turn Tool Agents via Reinforcement Learning |
| 作者 | Zhexi Lu, Subhajit Chaudhury, Tejaswini Pedapati, Keerthiram Murugesan, Lei Yu |
| 链接 | [原文](https://arxiv.org/abs/2611.16304) |
| arXiv | arXiv:2611.16304 |
| 分类 | cs.LG |
| 发表 | 未标注会议（comment 字段为空） |
| 篇幅 | 未标注（comment 字段为空） |
| 代码 | 未提及 |

## 核心贡献
1. **揭示 RL 训练中的"性能–幻觉"错配**：RL 提升了 tool-use 任务表现，但**task performance 的提升可以伴随 tool hallucination 的增加**——可靠性并未随之改善。
2. **提出核心主张：可靠的工具使用要求决策跟随当前任务状态（current task state）**，即"可用信息、工具能力、任务进度"。
3. **诊断具体失败模式**：agent 常常**在应该提问、应该检索、应该拒绝不可行请求时却直接执行**，**即使其推理（reasoning）中已经识别出信息缺失**——即"知道该问，却仍然动手"。
4. **提出 StateAlign**：**任务状态构造（task-state construction）** + **状态对比式强化学习（state-contrastive RL）**。
5. **在 3 个模型家族、5 个 base model 上验证可靠性提升**，并在 3 个 Qwen3 规模上降低 tool hallucination。

## 方法 / 技术细节
### Task-State Construction（状态构造）
构造覆盖 **5 种任务条件（five task conditions）**的样本，并**将状态与"不同的动作需求"配对（pair states with different action requirements）**——即构造"状态 A 要求执行、状态 B 要求提问/拒答"这样的对照样本。

### State-Contrastive RL（状态对比式 RL）
两个信号并行：
1. **Outcome reward**：指导任务完成；
2. **Token-level contrast**：**对同一份生成的 reasoning 和 action，在配对状态下做对比**（compare the same generated reasoning and actions under paired states），训练出**与当前状态相匹配的输出**。

这是本文最关键的技术设计：它把"知道该做什么"变成一个**可被 token 级梯度区分**的对比学习问题——同一个思维链在"信息充分"状态下应输出工具调用，在"信息缺失"状态下应输出澄清提问。

### 评测
- **BFCL v4 multi-turn**（多轮）、**ToolSandbox**、**When2Call**（何时该调用工具/该问）。
- 幻觉评测：**SimpleToolHalluBench**（no-tool hallucination 率）。
- 覆盖 **5 个 base model、3 个模型家族**。
- 消融：不同 reward 设计下，state construction 对性能与可靠性的贡献。

## 实验结果
### 任务性能
- 在 **BFCL v4 multi-turn、ToolSandbox、When2Call** 三个基准上均有提升。
- **Qwen3-8B 上 BFCL v4 multi-turn 准确率：45.5% → 55.2%**（+9.7 个百分点）。

### 可靠性 / 幻觉
- **Qwen3-8B 上 SimpleToolHalluBench 的 no-tool hallucination：从仅用 outcome-only 训练时的 62.2% 降到 56.1%**（−6.1 个百分点）。
- 完整方法在 **3 个 Qwen3 规模**上都降低了 tool hallucination。

### 消融与行为分析
- 消融显示**状态构造本身**在不同 reward 设计下都能提升性能与可靠性。
- 行为分析显示：决策更一致（more consistent decisions）、多调用执行更完整（more complete multi-call execution）、工具错误后恢复更强（stronger recovery after tool errors）。

## 关键数字速览
| 指标 | 数值 |
|------|------|
| BFCL v4 multi-turn 准确率（Qwen3-8B） | 45.5% → 55.2%（+9.7） |
| SimpleToolHalluBench no-tool hallucination（Qwen3-8B） | 62.2% → 56.1%（−6.1） |
| 任务条件数 | 5 |
| 评测基准 | BFCL v4 multi-turn, ToolSandbox, When2Call, SimpleToolHalluBench |
| 覆盖模型 | 5 个 base model / 3 个家族 / 3 个 Qwen3 规模 |
| 幻觉评测指标 | no-tool hallucination rate |

## 局限性
- 摘要未披露：5 个模型的具体名称、其余模型上的逐项数值、state-contrastive 的具体算法形式（是否为 GRPO 变体）、训练成本。
- 幻觉下降幅度（62.2%→56.1%）虽然显著，但**绝对水平仍超过一半**，问题远未解决（推测）。
- 依赖"任务状态"的可构造性——在真实开放环境中如何可靠地定义/抽取 task state 是未解的（推测）。
- token-level contrast 要求能生成"配对状态下的同一 reasoning"，这在实践中需要状态置换/改写技术，可能引入额外噪声（推测）。

## 与已有工作的关系 / 启示
StateAlign 把 agent RL 的目标函数从"最大化任务成功率"重新校准为"最大化**状态依赖的决策正确性**"。它与 tool hallucination 抑制、calibrated refusal、"know what you don't know" 这一脉研究形成互补，也与 ToolTurns 揭示的多轮落差、[[Cleaning an Agent's History Hurts...]] 揭示的"世界状态一致性"问题在动机上一致：**agent 的失败常常不是能力不足，而是行动与当前状态不匹配**。

## 相关论文
- [[ToolTurns: Benchmarking LLM Agents in Multi-Turn Dialogue]]
- [[JudgeMix: Judge-Guided Mixed-Rollout Data Synthesis for LLM Agents]]
- [[Cleaning an Agent's History Hurts When the World Still Holds the Error]]

## 我的评注
最有意思的诊断是那句"**即使 reasoning 已经识别出信息缺失，agent 仍然去执行**"——这精准点出了当前 agent 失败的一个被普遍低估的类型：**不是不知道，而是知道了却不改行为**。过去的主流解法（加 SFT 示范"该问就问"）之所以脆弱，是因为它训的是"推理链的措辞"，而 StateAlign 训的是"**同一推理链在不同状态下导出不同动作**"——用 token 级对比把状态→动作的映射关系直接写进参数。这在方法论上比 outcome reward 精确得多，因为 outcome reward 要跨越整条轨迹才能区分"该问"和"该做"，信号极稀疏。

45.5%→55.2% 的 BFCL 提升与 62.2%→56.1% 的幻觉下降方向一致，说明它没有走"牺牲可靠性换性能"的捷径，这是难得的自洽结果。不过我要泼一点冷水：**56.1% 的 no-tool hallucination 依然过半**，也就是说在最简单的"该用工具时不调用"这一维上，一半以上的错误仍在；再加上整套方法依赖"可构造的 task state"，而真实 agent 的状态往往是隐式的、不可枚举的——这决定了它在企业部署中的天花板更多取决于状态抽取的工程质量而非 RL 配方本身。我会建议把本文和 [[Cleaning an Agent's History Hurts...]] 一起读：两者共同指向同一个结论——**agent 的下一步行动必须与世界的真实状态对齐，而不只是与上下文里的叙述对齐**。

---
*采集时间：2026-11-13 | 油麦菜 🥬 自动精读*
