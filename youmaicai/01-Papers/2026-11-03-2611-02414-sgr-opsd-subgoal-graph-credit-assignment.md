# SGR-OPSD: Learning from Subgoal Plans with Graph-Regularized Credit Assignment for Agentic Reinforcement Learning

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | SGR-OPSD: Learning from Subgoal Plans with Graph-Regularized Credit Assignment for Agentic Reinforcement Learning |
| 作者 | Shu Liu, Yang Chong, WenShi Chen, Man Lan |
| 链接 | [原文](https://arxiv.org/abs/2611.02414) |
| arXiv | arXiv:2611.02414 |
| 类别 | cs.AI |
| 发表时间 | 2026-11-02 |
| 会议 | arXiv preprint（16 pages, 4 figures） |
| 评分 | 8 |

## 核心贡献
1. **SGR-OPSD 框架**：提出 **Subgoal-Guided Graph-Regularized OPSD**，结合**子目标监督**与**来自交互的证据**来做**turn-level 信用分配**（turn 级信用分配）。
2. **子目标计划 → 优势权重**：用 **LLM 生成的子目标计划**提供**稠密的 action-level 指导**，并通过一个**带约束的、KL 正则化的目标（constrained, KL-regularized objective）**将其转换为**优势权重（advantage weights）**。
3. **Subgoal Progress Graph（子目标进展图）**：为把信用锚定在**已观测的结果**上，构造一张图，通过**采样转移频率（sampled transition frequencies）估计经验回报（empirical returns）**；该图将**经验动作回报与状态均值（state average）对比**，导出的**偏好（preferences）**用于**校准教师的信用权重（calibrate the teacher's credit weights）**。
4. **实证效果**：在 **ALFWorld、WebShop、Search-QA** 上、跨**两个模型规模（Qwen2.5-3B 与 7B）**，一致优于 **GRPO** 与**强自蒸馏（strong self-distillation）基线**；相对 GRPO 成功率最高提升 **7.4 个百分点**；**Qwen2.5-7B 在 ALFWorld 上达到 85.8%**。
5. **消融确认**：消融实验确认**子目标指导**与**基于图的权重校准**两者都是性能增益的关键来源。

## 问题背景
**OPSD（On-Policy Self-Distillation / 基于特权信息的自蒸馏）** 通过**特权信息反馈（privileged information feedback）**为 agentic RL 提供稠密监督，缓解稀疏奖励下"只有最后一个动作有信号"的问题。但 OPSD 依赖的特权信息存在两个缺陷：其一，**缺少显式的任务进展规划（explicit task-progression planning）**——教师信号只是"这一步比那一步更像模型会做的"，没有"任务正朝哪个子目标推进"的语义；其二，**教师-学生 log-probability 间隙反映的是模型偏好的变化，而非真实的任务进展**——即数值上的差异被误当作进度信号。论文的切入点是：用**子目标计划**补上"规划"维度，再用**交互统计**把信用从"偏好"拉回"实际结果"。

## 方法
**问题设定**
- 多轮 agent 任务中的 **turn-level 信用分配**：需要为对话/轨迹中每个 turn（动作）赋予一个可信的信用权重。
- 监督来源：**特权信息**（教师信号）+ **交互观测**（实际转移结果）。

**组件一：子目标监督（Subgoal Supervision）**
- 由 **LLM 生成子目标计划（subgoal plans）**，为每个动作提供**稠密的 action-level 指导**。
- 把子目标计划转化为**优势权重**：通过**带约束的（constrained）、KL 正则化的（KL-regularized）目标**完成转换。
  - KL 正则项的作用：约束权重分配不要偏离原策略太远（防止教师信号把策略推离稳定区域）。
  - 约束项的作用：把权重限制在合法的取值范围/归一化形式内，避免个别动作获得支配性权重。
- 这一步修复的正是"OPSD 的 log-prob gap ≠ 任务进展"：子目标计划**显式编码了进展的语义**，使其成为教师信号的先验。

**组件二：Subgoal Progress Graph（子目标进展图）**
- 目的：**把信用锚定在已观测的结果上**（ground credit in observed outcomes），防止纯教师信号漂移。
- 构造：从采样轨迹中统计**转移频率（transition frequencies）**，据此**估计经验回报（empirical returns）**。
- 图的核心比较：**经验动作回报 vs. 状态均值（state average）**
  - 经验动作回报 = 在该状态下采取该动作的经验收益；
  - 状态均值 = 该状态下的平均收益（基线）；
  - 两者之差刻画了"**这个动作在该状态下是否优于该状态的平均行为**"，即一条**偏好（preference）**信号。
- **校准（calibration）**：用图中导出的偏好去**校准教师给出的信用权重**——教师说"这一步很重要"的地方，若交互证据显示该动作并不优于状态平均，则下调权重；反之亦然。
- 由此形成**双向约束**：子目标提供语义先验，交互图提供实证校正。

**算法步骤（据摘要重述）**
```
1. LLM 生成子目标计划 → 得到每个动作的子目标对齐指导
2. 构造 KL 正则 + 约束的优势权重转换目标 → 得到教师信用权重 w_teacher
3. 从采样 rollout 统计转移频率 → 建立 Subgoal Progress Graph
4. 图中计算经验动作回报与状态均值之差 → 得到偏好信号
5. 用偏好信号校准 w_teacher → 得到最终 turn-level 信用权重
6. 用校准后的权重做 agentic RL 训练（与 GRPO 对比）
```

**设计决策**
- 保留 OPSD 的特权信息通道，但**为其补上显式规划语义**与**实证校正**——这是"Subgoal-Guided"与"Graph-Regularized"两个修饰词的由来。
- 校准环节把**图上的统计偏好**作为教师权重的"正则化信号"，而非独立目标，从而避免两个目标互相冲突。

## 实验结果

| 基准 | 模型规模 | 结果 |
|------|---------|------|
| ALFWorld | Qwen2.5-7B | **85.8%** 成功率 |
| ALFWorld / WebShop / Search-QA | Qwen2.5-3B 与 7B | 一致优于 **GRPO** 与**强自蒸馏基线** |
| 相对 GRPO 的最大提升 | — | **+7.4 个百分点**（up to 7.4 pp） |

- **消融实验**：确认**子目标指导**与**基于图的权重校准**均为性能增益的关键（key）因素。
- 摘要未给出各基准的逐项绝对成功率、基线具体名称（"strong self-distillation baselines"未点名）、超参、训练步数与算力（摘要未给出具体数值，除 85.8% 与 7.4 pp 外）。

## 关键洞察
1. **"偏好差异"被误当作"进展"的诊断非常准确**：log-prob gap 衡量的是模型分布的移动，而任务进展是外部世界的状态变化。二者在教师蒸馏里被混为一谈，导致信用分配朝"变得自信"而非"变得有效"。SGR-OPSD 用一条由**交互统计**驱动的图把二者解耦，是对 OPSD 路线的一个根本性修正而非调参。
2. **图结构是天然的信用归一化器**：用"状态均值"作基线、经验回报作增量，相当于在图上做**优势估计**，但基线不来自价值网络（OPSD 类方法常无 critic），而来自采样频率——这绕开了 value function 训练不稳定的经典难题。
3. **两个来源各司其职的设计值得借鉴**：LLM 子目标计划擅长"语义上应该做哪一步"（先验、方向性），交互图擅长"这一步是否真的有效"（实证、校正性）。用图去**校准**教师，而不是用图去**替代**教师，保留了两者互补的信息。
4. **85.8% on ALFWorld with 7B** 表明该方法在需要长链条的任务上已接近饱和区间，这通常意味着下一阶段的区分点会转移到更难的 Web 导航或多工具任务上。

## 局限性
- 摘要**未给出**：除 85.8% 与 7.4 pp 外的具体数值、基线名称、各基准的成功率全貌、采样预算、RL 超参。
- **依赖 LLM 生成子目标计划**：引入额外的前向推理开销与教师质量依赖；若子目标计划错误，校准环节只能部分纠正（毕竟图反映的是"这个动作在统计上好不好"，未必能识别"计划方向本身错了"）。
- 图的构造依赖**足够多的采样轨迹**以稳定估计转移频率与经验回报——在交互昂贵或成功轨迹稀少的环境里统计噪声可能很大；论文未讨论这一条件。
- "经验回报"的定义（是否为终局奖励的折扣回传）在摘要中未形式化；与真正折扣回报的差异会影响基线的正确性。
- 仅评测 **Qwen2.5-3B/7B** 两个规模与三个基准（含一个 Search-QA 检索任务），对其他模型家族、视觉 agent、多智能体场景的推广性未验证。
- 与 GRPO 的比较是否控制了额外推理成本（子目标生成）未说明——公平性存疑。
- 消融结论为定性（"key"），未给出各组件的单独贡献量。

## 适用场景
- 多轮 agent 任务的稠密监督构造（ALFWorld / WebShop / Search-QA 类交互环境）
- 需要**turn-level 信用分配**但缺乏可靠 critic / value function 的 agentic RL
- 有 LLM 规划能力可用、但缺少可靠环境反馈的弱监督场景（用图做实证校正）
- 教师-学生自蒸馏路线的改造（保留特权信息通道，替换其权重来源）
- 与子目标分解、层级 RL（hierarchy）方法结合：本文的子目标计划可自然扩展为层级策略

## 相关工作
[[OPSD]] [[On-Policy Self-Distillation]] [[GRPO]] [[Subgoal Planning]] [[Credit Assignment]] [[Privileged Information]] [[Advantage Estimation]] [[Graph Regularization]] [[Agentic Reinforcement Learning]] [[Qwen2.5]]

---
#LLM #Research #Agentic-RL #Credit-Assignment #Subgoal #arXiv-2611
