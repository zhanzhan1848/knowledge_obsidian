# Can Large Language Models Extend Their Agentic Capabilities to Goal Pursuit in Open-Ended Multi-Turn Interaction?

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | Can Large Language Models Extend Their Agentic Capabilities to Goal Pursuit in Open-Ended Multi-Turn Interaction? |
| 作者 | Mingyu Chen, Jingkai Lin, Xiaofen Xing, Liankai Huang, Ruiqi Xiong, Xiangmin Xu |
| 链接 | [原文](https://arxiv.org/abs/2611.01552) |
| arXiv | arXiv:2611.01552 |
| 类别 | cs.CL |
| 发表时间 | 2026-11-01 |
| 会议 | arXiv preprint（18 pages, 9 figures, 20 tables, including appendices） |
| 评分 | 8 |

## 核心贡献
1. **Tool-Mediated Interaction (TMI)**：一种**训练无关（training-free）**协议，把对话行为表示为 **tool calls**，把对方回复表示为 **tool results**，保持持续的 reasoning–action–observation 循环，并保留 reasoning 与交互历史。
2. **系统回答"agentic 能力能否迁移到开放式多轮对话"**：检验多步工具使用中发展出的 agentic 能力是否可迁移到由模型原生工具接口组织的对话。
3. **跨四类目标场景的大规模实证**：social interaction、emotional support、persuasion、price negotiation，两个模型，**15,678 个主实验 episode**。
4. **额外发现**：TMI 在提升目标达成的**同时**显著降低推理 token 消耗（42.0–81.5%），并降低跨轮措辞重复。

## 问题背景
开放式对话中的目标追求（goal pursuit）要求 agent 依据交互反馈在连续多轮中调整行动。核心问题是：为多步工具使用（multi-step tool use）开发的 agentic 能力，能否迁移到通过模型原生工具接口组织的对话？以及这种组织方式如何改变交互行为。

## 方法
**TMI 协议设计（training-free）**

```text
TMI loop:
  assistant turn → tool_call(action)          # assistant 的对话行为 = tool call
  counterpart response → tool_result(response)  # 对方回复 = tool result
  keep: reasoning history + interaction history
  → continuous reasoning–action–observation loop
```

- **对话动作 = tool call**：模型在对话中要"说什么/做什么"，被封装成工具调用；
- **对方回复 = tool result**：对话伙伴的应答作为工具返回结果；
- **保留 reasoning 与交互历史**：不丢弃模型的推理链与历史上下文，维持长程一致性；
- 关键点：**不训练任何东西**，仅改变交互的组织方式。

**评测矩阵**
- 任务域：**social interaction、emotional support、persuasion、price negotiation**（4 类）；
- 模型：**2 个**（另有一个 Qwen 做 ablation）；
- 数据规模：**15,678 个主实验 episode**；
- 基线：**conversational baselines with and without thinking**（普通对话基线，带/不带 thinking 模式）。

**Ablation**：Qwen ablation 比较 TMI 与"保留 reasoning 的普通对话"（ordinary conversation with retained reasoning）在四个主指标上的差异。

**行为分析**：将指标提升关联到任务特定的行为模式——包括 **initial proposals（初始提议）**与**responses to interaction feedback（对交互反馈的响应）**。

**额外测量**：
- mean reasoning tokens per decision（每次决策的平均推理 token）；
- mean cross-turn phrase reuse（跨轮措辞复用率）。

摘要未给出两个具体模型的名称、四个场景的评测指标定义（如"donation amounts"、"negotiation margins"如何计算）、评分者协议与统计显著性。

## 实验结果
**1）目标达成（两个模型上均成立）**
TMI 相对 conversational baselines（带 thinking 与不带 thinking 两种）全面改善：

| 指标 | 结论 |
|------|------|
| social goal attainment | 改善 |
| emotional-support preference | 改善 |
| donation amounts | 改善 |
| buyer negotiation margins | 改善 |

**2）Qwen ablation**
- TMI 在**全部四个主结果**上优于"保留 reasoning 的普通对话"。

**3）效率（reasoning token）**

| 对比基线 | mean reasoning tokens per decision 降幅 |
|---|---|
| thinking baseline | **42.0% – 81.5%** |

**4）行为指标**
- 在**全部 8 个 model-environment 组合**上，mean cross-turn phrase reuse 均下降。

摘要未给出各场景的具体数值（百分比、金额、偏好比例）与显著性检验结果。

## 关键洞察
1. **交互的"组织形式"本身就是能力杠杆**：不训练、不改模型，仅把对话动作重述为 tool call、把回复重述为 tool result，就能系统性改善四类目标达成——说明 agentic 能力的一部分不是"模型会不会"，而是"接口给了它什么结构"。
2. **效率与效果同向**：推理 token 降低 42–81.5%，而目标达成反而提升——tool-call 化把"在文本里犹豫措辞"替换成了"调用一个明确动作"，省掉的是内省噪声而非有效推理。
3. **跨轮措辞复用下降是反套话的信号**：8/8 组合中都下降，意味着 TMI 让模型持续响应反馈而非重复已有话术，与价格谈判/说服等需要适应性的任务高度契合。
4. **agentic 能力可跨域迁移但需正确接口**：工具使用训练出的"动作—观察—调整"模式可以搬到社会性目标追求中，说明底层是可迁移的策略结构，而非特定任务的表面技巧。

## 局限性
- 完全 training-free，但也意味着**没有针对对话目标做过任何专门训练**——结论只说明"组织形式的效应"，不说明上限。
- 仅 2 个模型（+1 个 Qwen ablation），模型规模与族系未披露，泛化性存疑。
- 评测为**模拟/合成对手**的多轮对话，非真实人类；真实社会互动中的噪声、敌意、情绪会更难。
- 关键指标（donation amount、negotiation margin、preference）为构造性结果，可能受对手策略与评分器设计影响；摘要未给出显著性。
- "跨轮措辞复用下降"既是效率提升也可能是内容贫乏（说得更少更少样）；摘要未同时报告内容质量/多样性指标以排除这一混淆。
- TMI 依赖模型原生 tool-calling 接口，对无该能力的模型需额外脚手架，适用面受限。
- 单轮 reasoning token 降幅区间很宽（42.0–81.5%），暗示不同场景/模型差异大，但摘要未拆解。

## 适用场景
- 多轮目标导向对话系统的**接口层改造**：在不改模型的前提下提升谈判、说服、情感支持效果。
- 需要控制推理成本的多轮 agent（token 降幅达 81.5%）。
- 社交/情感/议价类 LLM 应用的效果瓶颈诊断（若普通对话效果差，先查交互组织方式而非换模型）。
- 研究"agentic 接口设计 vs 交互协议设计"影响的学术参考。

## 相关工作
- [[Tool Use]] · [[Function Calling]]
- [[Multi-Turn Dialogue]] · [[Open-Ended Dialogue]]
- [[Chain-of-Thought]] · [[Reasoning Tokens]]
- [[Emotional Support]] · [[Persuasion]] · [[Negotiation]]
- [[Goal Pursuit]] · [[Agentic Capabilities]]
- [[Self-Reflection]]

---
#LLM #Research #Multi-Turn-Dialogue #Tool-Use #Agent #arXiv-2611
