# From Local Skills to Long-Horizon Web Tasks: Progressive Skill Exploration for LLM Web Agents

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | From Local Skills to Long-Horizon Web Tasks: Progressive Skill Exploration for LLM Web Agents |
| 作者 | Xueyang Feng, Xiaohe Bo, Xu Chen, Quanyu Dai, Feng Wen |
| 链接 | [原文](https://arxiv.org/abs/2611.03116) |
| arXiv | arXiv:2611.03116 |
| 类别 | cs.AI |
| 发表时间 | 2026-11-02 |
| 会议 | NeurIPS 2026（31 pages, 9 figures） |
| 评分 | 9 |

## 核心贡献
1. **SCOPE 框架**：提出 Skill-Composed Progressive Exploration，一种"由短到长"（short-to-long）的长时域 Web Agent 学习框架，把复杂任务的探索分解为从局部技能到完整任务求解能力的渐进扩张过程。
2. **三阶段技能循环**：Skill Discovery（技能发现）→ Skill Orchestration（技能编排）→ Skill Expansion（技能扩张），逐轮在局部技能周围迭代探索，并把失败经验对齐当前技能链以引导新子技能探索。
3. **Agentic On-Policy Distillation**：将跨 rollout 逐步构建的完整任务技能链内化进策略参数。
4. **跨三基准的稳定增益**：在 WebArena、WebVoyager、WebShop 上相对各设置下最强基线取得 **3.9%–18.6%** 的相对提升。

## 问题背景
LLM 驱动的自主智能体正快速走向真实环境，Web 是最具代表性的交互场景之一。但用朴素探索（naive exploration）训练 Web Agent 极其困难：**成功轨迹极其稀少**，而**稀疏的终端奖励**使得失败轨迹几乎无法提供有用反馈——也就是说，agent 在探索时"大部分时间是白跑的"，学习信号被浪费。已有的长时域训练方法（不论是 RL 的稀疏奖励、还是 SFT 的示范学习）都缺少一种能**把失败转化为可复用信息**的机制。论文借鉴技能习得理论（skill acquisition theory），主张探索应当像技能栈一样由局部到整体逐层堆叠，而非从零起步直接冲完整任务。

## 方法
**总体框架：SCOPE（Skill-Composed Progressive Exploration）**

核心循环为"在局部技能周围反复探索"，每一轮 rollout 迭代执行三步：

1. **Skill Discovery（技能发现）**
   - 从**历史 rollout** 中抽取可复用的**局部技能（local skills）**与**失败经验（failure experiences）**。
   - 局部技能指已验证可完成的任务子片段能力；失败经验则是被记录、待后续复用的负向证据。

2. **Skill Orchestration（技能编排）**
   - 把已发现的技能**组合成高层技能链（high-level skill chains）**。
   - 技能链是任务的层级化分解产物：把多个局部技能按可组合顺序串成通向完整任务的路径。

3. **Skill Expansion（技能扩张）**
   - 利用与**当前技能链对齐的失败经验**来引导 agent 去探索**新的子技能（new subskills）**。
   - 关键机制：失败不是被丢弃，而是被"对齐"到当前技能链上——即定位失败发生在技能链的哪一段，从而定向扩展该段缺失的子技能。

**参数内化：Agentic On-Policy Distillation**
- 跨 rollout 渐进构建起来的**任务级完整技能链**最终被**内化进策略参数**（internalized into the policy parameters），而非仅停留在上下文/提示中。
- 通道为 **on-policy distillation**，属于 agentic on-policy 蒸馏：学生策略在自己产生的 on-policy 轨迹上学习（而非只做离线 SFT），使技能链固化为权重能力。

**设计动机（论文自述）**
- 直接受**技能习得理论**启发：技能应当从简单局部能力累积到复杂组合能力。
- 解决两个具体瓶颈：稀疏终端奖励导致失败轨迹无反馈；成功轨迹稀少导致端到端探索效率低。

**伪代码式流程（依据摘要重述）**
```
初始化：skill_store = ∅，fail_store = ∅
循环 rollout:
  1. Discovery:  从历史 rollout 抽取局部技能 → skill_store；抽取失败 → fail_store
  2. Orchestration: 用 skill_store 组装 skill_chain（高层技能链）
  3. Exploration:  以 skill_chain 为引导探索；用 fail_store 中与该链对齐的失败经验
                驱动对缺失 subskill 的定向探索
  4. 若完成完整任务：把完整技能链作为监督信号
  5. 蒸馏更新：agentic on-policy distillation 把技能链内化进策略参数
```

## 实验结果

| 基准 | 相对最强基线的相对提升 |
|------|--------------------------|
| WebArena | 提升落在 **3.9%–18.6%** 区间内（摘要给出区间，未逐基准拆分） |
| WebVoyager | 同上区间 |
| WebShop | 同上区间 |

- 总体：**在每个设置下相对最强基线取得 3.9% 至 18.6% 的相对增益**。
- 结论：SCOPE **持续改善探索动力学**（consistently improves exploration dynamics）。
- 摘要未给出各基准的绝对成功率、基线具体名称、所用基座模型或采样预算（摘要未给出具体数值，除 3.9%–18.6% 区间外）。

## 关键洞察
1. **把失败重新定位为"技能缺口索引"**：多数 RL Web Agent 的失败被当作负样本平均掉；SCOPE 的做法是把失败与技能链对齐，转成**定向的子技能扩展指令**。这在稀疏奖励环境里等价于一种隐式课程（curriculum）机制。
2. **探索复杂度应当是调度变量**：从局部技能起步意味着早期探索的假设空间小、成功率高，从而持续产生有用轨迹——这与"直接在完整长任务上做 best-of-N"在 token 预算上的效率差异是本质性的。
3. **技能链 + on-policy 蒸馏 = 上下文外化到权重内化**：单纯把技能写进 prompt 会随上下文增长而退化；把完成过的技能链通过 on-policy 蒸馏压回参数，则同时保留可复用性与推理成本优势。论文将"外化记忆"与"参数化能力"这两件事解耦处理，是其设计的核心张力。

## 局限性
- 摘要**未给出**绝对性能数字、基线名称列表、基座模型、任务子集规模，因此 3.9%–18.6% 的相对增益无法换算成绝对成功率差异。
- 技能发现与技能编排依赖 **LLM 抽取/编排**历史 rollout，本身引入额外推理开销与潜在的抽取误差；摘要未给出该开销的量化分析（收益-成本权衡未知）。
- 技能链的粒度与层级数、"局部技能"的定义边界均未在摘要中形式化；方法可复现性依赖全文（31 页 + 9 图）。
- 三个基准均为 Web 任务；对长时域具身/软件工程任务是否适用未验证。
- 失败经验与技能链的"对齐"方式在摘要中仅为定性描述，未说明其是启发式匹配还是学习式对齐。

## 适用场景
- Web Agent 的长时序训练与冷启动，尤其是缺少专家示范、成功率极低的任务域
- 需要构造**内生课程**的稀疏奖励 RL 场景（失败轨迹必须被利用而非丢弃）
- 工具/API 组合调用、多步表单填写、跨页面导航等可分解为局部技能的流程自动化
- 探索预算受限的在线学习系统：通过局部技能的早期高成功率换取远期的长任务成功率

## 相关工作
[[LLM Agents]] [[WebArena]] [[WebVoyager]] [[WebShop]] [[Sparse Reward]] [[Exploration-Exploitation]] [[Curriculum Learning]] [[On-Policy Distillation]] [[Skill Acquisition]] [[Reinforcement Learning from Verifiable Rewards]]

---
#LLM #Research #Web-Agent #Exploration #Reinforcement-Learning #arXiv-2611
