# Don't Guess, Ask Wisely: Benchmarking and Training Proactive Elicitation in Open-Domain LLM Conversations

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | Don't Guess, Ask Wisely: Benchmarking and Training Proactive Elicitation in Open-Domain LLM Conversations |
| 作者 | Rongyu Zhang, Mutian Bao, Jinjian Zhang, Yuetian Du, He Xu, Wei Zhou, Xiaojun Zhu, Ming Kong, Jie Liu, Linjian Mo, Qiang Zhu |
| 链接 | [原文](https://arxiv.org/abs/2611.01878) |
| arXiv | arXiv:2611.01878 |
| 类别 | cs.CL |
| 发表时间 | 2026-11-01 |
| 会议 | EMNLP 2026 oral（26 pages, 6 figures） |
| 评分 | 9 |

## 核心贡献
1. **能力定义与大规模实证**：提出并量化 **proactive elicitation（主动澄清）**——当用户问题信息不足时，模型应先提针对性问题再作答；在**七个 LLM（8B 规模到 frontier 规模）**的真实用户-助手查询评测中，发现**不足 11%** 的欠明确查询会触发追问。
2. **VagueBench 基准**：为每个 seed query 标注**结构化的 intent 与 detail 单元（units）**，再通过**受控移除语言线索**将其降解为 **intent-vague** 与 **fully-vague** 两个变体，从而得到**已知的隐藏信息集合**，可同时评测"何时该问"与"该问什么"。
3. **DialogGRPO**：一种**离线强化学习**方法，把多轮澄清组织为**对话状态有向无环图（dialogue-state DAG）**；每个节点处的候选问题获得**稠密的 turn-level 奖励**，结合**即时信息增益**与经**组内相对比较（group-relative comparison）**计算的**前瞻价值（lookahead value）**，实现细粒度 credit assignment，**无需运行时仿真**。
4. **效果**：在超过 **88%** 的模糊查询上成功 eliciting 缺失信息，在恢复效率与答案覆盖上均有大幅提升，**在完整查询上不过度提问（without over-asking）**，优于 prompting 与 test-time-scaling 基线，并**零样本泛化**到 MultiWOZ 2.4 与 AmbigQA。

## 问题背景
真实用户查询经常是欠明确的（underspecified）——缺少关键槽位或意图细节，而 LLM 的默认行为是**猜测并直接作答**，把不确定性隐藏在一个自信的回答里。理想行为是先问再答，但当前模型普遍做不到：论文在**七个模型（从 8B 到前沿模型）**上评测，**不足 11%** 的欠明确查询触发了追问。原因之一是缺少可监督的资源：现有 benchmark 通常只标注最终答案的正确性，不标注"哪些信息是隐藏的"，因此既无法评估"何时该问"，也无法为"该问什么"提供奖励信号。此外，多轮澄清需要信用分配：问错问题浪费轮次，但标准 RL 依赖环境交互采样，成本极高。

## 方法
**VagueBench 构造流程**

1. **结构化标注**：每个 seed query 被标注为**结构化单元**：
   - *intent units*（意图单元）：用户真正想做的事；
   - *detail units*（细节单元）：完成该意图所需的具体参数/约束。
2. **受控退化（controlled degradation）**：通过**受控移除语言线索**（controlled removal of linguistic cues）生成两个变体：
   - **intent-vague**：抹去意图指向的线索（用户自己也没说清要什么）；
   - **fully-vague**：同时抹去意图与细节线索。
3. **已知隐藏信息集**：退化过程是可控且可追溯的，因此**每个变体的隐藏信息集合是已知的**——这使得 benchmark 能同时度量：
   - *when to ask*（何时该问）：给定变体缺失的信息，是否发起了追问；
   - *what to ask*（该问什么）：追问的内容是否命中缺失单元。

**DialogGRPO（离线 RL）**

- **状态图建模**：把多轮 elicitation 组织为**对话状态有向无环图（DAG）**。节点 = 对话状态；边 = 在该状态下提出的一个候选问题及其导致的回答后继状态。
- **稠密 turn-level 奖励**：在每个节点的候选问题上分配奖励，奖励由两部分组成：
  - **即时信息增益（immediate information gain）**：该问题直接揭示了多少缺失单元；
  - **前瞻价值（lookahead value）**：该问题对后续路径的贡献，经**组内相对比较（group-relative comparison）**计算（对同一状态的候选问题做组内归一化）。
- **细粒度 credit assignment**：通过组内相对比较，无需环境仿真即可对单个候选问题的价值做精细区分。
- **离线（offline）**：奖励与图结构在训练期离线构造，**不依赖运行时模拟**（no runtime simulation）——这是相对在线多轮 RL 的主要成本优势。

**伪代码式流程（据摘要重述）**
```
离线构建 VagueBench:
  seed query → 标注 {intent units, detail units}
    → 受控移除语言线索 → intent-vague / fully-vague 变体
    → 记录 known hidden information set

DialogGRPO 训练:
  由 elicitation 对话构建对话状态 DAG（节点=状态，边=候选问题）
  对每个节点的候选问题 q:
     r_turn(q) = 信息增益(q) + α · lookahead(q)
     lookahead(q) = 组内相对比较归一化的后续价值
  用该稠密 turn-level 奖励做离线 RL 优化策略
```

## 实验结果

| 项目 | 数值 / 结论 |
|------|------------|
| 七个 LLM（8B–frontier）在真实用户-助手查询上的追问触发率 | **不足 11%** 的欠明确查询触发追问 |
| DialogGRPO 的 elicitation 覆盖率 | 在**超过 88%** 的模糊查询上 elicits 缺失信息 |
| 相对基线 | 优于 **prompting** 与 **test-time-scaling** 基线；在**恢复效率（recovery efficiency）**与**答案覆盖（answer coverage）**上均有大幅提升 |
| 过提问（over-asking） | 在完整（complete）查询上**不过度提问** |
| 零样本泛化 | 泛化到 **MultiWOZ 2.4** 与 **AmbigQA** |

- 摘要未给出各模型逐一的追问率、七个模型的具体名称与规模、奖励公式的完整形式、α 权重、DAG 最大深度（摘要未给出具体数值，除 11% 与 88% 外）。

## 关键洞察
1. **"先问"的缺失是能力缺口而非知识缺口**：连 frontier 模型都只有 <11% 的追问率，说明当前 post-training 的主流范式（模仿完整答案）从未把**决定信息不足**当作一个显式决策目标来训练；这是一个可以低成本修补的、由 RL 目标函数缺失造成的行为盲区。
2. **基准的关键设计是"已知隐藏信息"**：通过结构化单元 + 受控线索移除来生成模糊变体，使得"该问什么"变成可自动判定的对错，而不必依赖 LLM-judge。这也让 VagueBench 同时是**评测集**和**训练信号源**。
3. **离线 DAG + 组内相对比较 = 把多轮对话 RL 的成本压到可承受**：多轮 credit assignment 传统上靠 on-policy 环境 rollout，而澄清任务的环境本身就是"模型自己"。DialogGRPO 用对话状态 DAG 预先枚举路径、把奖励离线化，从而同时获得稠密 turn-level 信号与零运行时仿真的效率，这是本方法最有迁移价值的工程设计。

## 局限性
- 摘要未披露七个模型的身份、评测 query 的规模与来源分布（"真实用户-助手查询"来源未说明）、信息单元标注的一致性指标。
- 综述"不足 11%"是一个跨模型聚合口径，掩盖了模型间差异；亦未给出上界或不同规模的分层曲线。
- 摘要中"**大幅提升**（substantial gains）"在恢复效率与答案覆盖上未量化，无法判断收益大小。
- VagueBench 的退化方式（受控移除语言线索）可能产生与真实欠明确查询不同的**伪模糊**模式（例如因线索风格单一而被误删），影响外部效度。
- DialogGRPO 的离线 DAG 需要离线构造对话状态空间，长对话下的状态爆炸与分支覆盖问题未讨论。
- 未覆盖"用户明确拒绝回答"或"多轮后仍无法确定意图"等真实场景下的行为。

## 适用场景
- 开放域对话助手的主动澄清策略设计与评估（客服、搜索、助手产品）
- 槽位填充/对话状态跟踪系统的升级：从"填完槽位即作答"到"缺什么问什么"
- 需要构建多轮追问训练数据的团队：VagueBench 的"结构化单元 + 受控退化"是可直接复用的合成范式
- 评估 LLM 是否会**过度提问**（在信息已充分时保持沉默）——这是可用性的另一面，本文明确纳入评测
- 迁移到 MultiWOZ / AmbigQA 一类已有歧义消解基准的零样本泛化验证

## 相关工作
[[Proactive Elicitation]] [[Clarification Question Generation]] [[Multi-turn Dialogue]] [[Dialogue State Tracking]] [[GRPO]] [[Group Relative Policy Optimization]] [[Offline Reinforcement Learning]] [[Sparse Reward]] [[Information Gain]] [[Ambiguity Resolution]] [[MultiWOZ]] [[AmbigQA]]

---
#LLM #Research #Dialogue #Clarification #Reinforcement-Learning #arXiv-2611
