---
type: paper
created: 2026-11-09
updated: 2026-11-09
tags: [paper, rendering, 实时模拟, 人群模拟, GNN, LLM, 指针网络, 场景验证, Unity, 2026-11]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.08763
---

# CrowdDirector: Runtime Orchestration of Crowd Simulation through Natural-Language Directives

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | CrowdDirector: Runtime Orchestration of Crowd Simulation through Natural-Language Directives |
| **作者** | Xiaohan Sun, Vuk Radovanovic, Merce Alvarez, Carol O'Sullivan, Yiorgos Chrysanthou, Panayiotis Charalambous |
| **发表** | arXiv preprint (2026-11-09) |
| **链接** | [arXiv 2611.08763](https://arxiv.org/abs/2611.08763) |
| **代码** | 未公开 |

---

## 核心贡献

> **手写规则高效但僵化；每个 tick 都问 LLM 则延迟、成本、非法动作三者全占。** CrowdDirector 走中间路线：**只在用户新增/修改指令时调用 LLM**，其余全部本地推理。

1. **LLM 只在指令变更时介入**：LLM 把自然语言翻译成结构化指令 → **场景验证器**检查引用实体与动作在当前 Unity 场景中是否存在 → 通过的指令存为 **directive** 并持续生效。
2. **图神经网络作为运行时策略**：每个仿真 tick 用 GNN 依据「当前场景状态 + 生效指令」为每个 agent 选择动作与目标；Unity 负责移动、交互、动画执行。
3. **离线混合训练标签**：仿真 rollout 与受约束的 LLM 排序对**同一候选集**打分并取平均 → 训练 GNN，同时保证「blend 不会引入不可用动作」。

---

## 技术方案

### 核心思想

**「语言用于意图变更，计算用于持续运行」** —— 这是本文最可迁移的架构判断。

### 五阶段运行时流水线

```
(1) LLM 解释指令        → 结构化指令（仅当新增/修改指令时触发）
(2) 场景验证器检查      → 存为 directive（event + operation 节点）
(3) 构建人群图 + 候选生成 → 每 agent 至多 64 个候选动作
(4) 图策略（GNN）选择    → 每 agent 一个候选动作
(5) Unity 执行层        → 执行动作，必要时请求重规划
```

> **只有第 (1) 阶段需要语言推理。**

### 阶段 1–2：结构化指令与场景验证

**LLM**（Claude Haiku）把原始指令转为紧凑的结构化指令：

```json
{ "operation": "disable_affordance",
  "target": { "object": "coffee_machine_1", "affordance": "drink" } }
```

> **关键定位：「结构化指令是对用户意图的主张，不是修改场景的许可。」**

**场景验证器**把每个被引用实体在当前场景中解析，并检查该实体是否支持所请求的动作，返回**五态裁决**：

| 状态 | 含义 |
|---|---|
| `executable` | 完整请求有效 |
| `partially executable` | 可施加受支持的子集 |
| `unsupported` | 请求行为在模拟器词汇表之外 |
| `ambiguous` | 存在多个可能的 grounding |
| `invalid reference` | 命名实体不存在或类型错误 |

```json
{ "status": "executable",
  "resolved_target": "coffee_machine_1:drink",
  "scope": "all" }
```

> **只有 `executable` 的指令（或用户显式接受的部分指令）才能修改模拟。**
> 这条边界防止 LLM 发明不支持的动作，或静默绕过场景约束。
> **它把 LLM 容易混淆的两个问题分开**：用户「看起来想要什么」 vs 模拟器「实际能执行什么」。

**Directive** 不是结构化指令的副本，而是把请求**重述为一组场景补丁**；一个操作可能展开为多个补丁。

### 阶段 3：人群图与候选生成

**六种节点类型**：`agents`、`zones`、`objects`、`groups`（描述场景本身）+ `events`、`operations`（描述生效指令）。
**有向关系**记录：agent 在哪个 zone、属于哪个 group、每个 object 提供哪些 affordance、某个 operation 适用于哪些 agent。

> **每次决策更新都重建整张图**，因此新指令只增加自己的 event/operation 节点及相关关系边。

**Maslow 式需求分层（固定规则，非学习）**：把 agent 的 9 种需求排成三层，从基本生理到社交与自我实现；**紧急的低层需求优先于高层需求**。需求随时间增长，在 agent 执行相关动作时下降。

**候选生成器**：为每 agent 列出**至多 64 个**当前可执行的动作，每个动作记录其目标以及「到达与使用的难易度」（距离、是否还有余量等）。

| 动作 | 目标 | 示例 |
|---|---|---|
| walk | zone | walk to the lounge |
| leave | exit | leave by the fire exit |
| drink | object | drink at the water cooler |
| rest | object | rest on the sofa |
| work | object | work at a desk |
| observe | object | look at the whiteboard |
| idle | agent | wait in place |

> **结构性不可能在推理前就被剔除**（如目标类型不提供该 affordance）；运行时可能变化的条件（机器被禁用等）则交由策略处理。

### 阶段 4：图策略（三层关系型 GNN）

- **64 维隐表示**；每类型编码器先把 6 种节点投影到共享空间
- **关系特定的消息传递**在连接的实体间传播信息；**层数 = 信息可穿过的最大路径长度**
- **三层**允许 agent 沿三边路径接收指令信息：`event → operation → target → agent`
- **策略中无文本编码器** —— 自然语言在推理前已被转成已解析的操作与显式图状态

**指针网络式打分**（Vinyals et al. 2015）：输出是**从输入列表中选择**，因此每个 agent、每次更新的候选数量都可不同（不像固定类别数的分类器）。

$$s_{a,o}=f_{\theta}\!\left(h_{a},\,h_{\tau(o)},\,h_{a}\odot h_{\tau(o)},\,x_{a,o}\right)$$

其中 $h_a$ 为 agent 编码状态、$h_{\tau(o)}$ 为目标编码、$x_{a,o}$ 为候选特征向量（**34 维**）、$f_\theta$ 为 MLP。
→ 拼接成 **226 维**向量；**掩码 softmax** 在候选动作上产生最终分布。

### 阶段 5：离线训练标签

$$\ q_{\mathrm{train}}=\begin{cases}(q_{\mathrm{roll}}+q_{\mathrm{LLM}})/2, & \text{有效 LLM 排序}\\ q_{\mathrm{roll}}, & \text{否则}\end{cases}$$

> **「因为两个分布覆盖同一候选集，blend 不可能引入不可用动作。」** —— 这是混合标签设计的关键安全性论据。

### 关键技术

| 技术 | 说明 |
|------|------|
| **指令-验证分离** | LLM 表达意图，验证器裁定可执行性；两者互不越权 |
| 五态验证裁决 | 可区分「不支持」「歧义」「无效引用」，而非二值判断 |
| Directive 持久化 | 一次指令持续生效，无需每帧重述 |
| 指针网络式候选打分 | 候选集长度可变，天然适配 per-agent 异构候选 |
| **无文本编码器** | 语言推理全部前置，运行时零 LLM |
| 关系型 GNN | 指令信息经 event→operation→target→agent 传播 |
| 候选数上限 64 | 显式控制推理开销上界 |
| 结构性不可能前置剔除 | 把「不可能」交给数据，把「可能变化」交给策略 |
| 混合 rollout+LLM 标签 | 覆盖同一候选集 → 不引入不可用动作 |

---

## 公式

```math
// 图策略打分（指针网络式）
s_{a,o}=f_{\theta}\!\left(h_{a},\,h_{\tau(o)},\,h_{a}\odot h_{\tau(o)},\,x_{a,o}\right)
//   h_a: agent 编码; h_{tau(o)}: 目标编码; x_{a,o}: 34 维候选特征
//   拼接后 226 维 → MLP → masked softmax over candidates

// 离线混合训练标签
q_{train}=\begin{cases}(q_{roll}+q_{LLM})/2, & \text{valid LLM ranking}\\ q_{roll}, & \text{otherwise}\end{cases}

// 运行时 API 调用数（E3）
A_{CD}=1+N,\qquad A_{LLM}=1+N+T
//   N = 用户指令数, T = 决策更新数
//   例：5 条指令 / 600 次更新 → 6 次 vs 606 次

// 指令到图结构的映射
event \rightarrow operation \rightarrow target \rightarrow agent
```

---

## 实验结论

### E1：指令能否被执行？（可行性判定与人类判断的一致性）

| 可行性评估者 | 与参与者 Q1 多数判断的一致性 ↑ | 95% CI |
|---|---|---|
| **场景验证器** | **0.83** | [0.61, 1.00] |
| LLM 自我评估 | 0.47 | [0.21, 0.72] |

> **场景验证器的可行性判定比 LLM 自身的判断更接近人类。** → 验证器必须独立于生成器。

### E2：agent 是否正确响应？（行为基准）

| 方法 | 运行时语言使用 | Q2 Jaccard ↑ | Q3 ↑ | 可接受率 ↑ | 禁止率 ↓ |
|---|---|---|---|---|---|
| **CrowdDirector** | 每条新指令 | 0.595 | 0.611 | 0.479 | **0.211** |
| 手写规则 | 无 | 0.300 | 0.233 | 0.312 | 0.368 |
| 每 tick LLM 控制 | 每 tick | **0.683** | **0.667** | **0.566** | 0.217 |

> Q2 = 受影响 agent 的 Jaccard 重叠（漏掉受影响 agent 与动到无关 agent 都被惩罚）；Q3 = 与参与者偏好候选匹配的比例。
> **CrowdDirector 显著优于手写规则，且在「禁止率」上与每 tick LLM 几乎持平（0.211 vs 0.217）** —— 这正是「只在指令变更时用 LLM」的价值所在。

### 组件消融（Panel B，保持数据/候选/掩码/标签/优化不变）

| 变体 | Q2 Jaccard ↑ | Q3 ↑ | 可接受率 ↑ | 禁止率 ↓ | 受影响召回 ↑ | 受影响 F1 ↑ |
|---|---|---|---|---|---|---|
| **CrowdDirector** | **0.595** | **0.611** | **0.479** | 0.211 | **0.844** | **0.760** |
| w/o directive-target 编码 | 0.595 | **0.278** | 0.367 | 0.172 | 0.799 | 0.729 |
| w/o 消息传递 | 0.578 | 0.400 | 0.482 | **0.344** | 0.803 | 0.741 |

> **去掉 directive-target 编码 → Q3 从 0.611 崩到 0.278（腰斩）**，但 Q2 不变 → 该编码负责「**选对响应**」而非「选对人」。
> **去掉消息传递 → 禁止率从 0.211 升到 0.344（恶化 63%）** → 消息传递负责「**不做不该做的事**」。

### E3：运行时成本与扩展性

| 方法 | 每指令调用 | 每更新调用 | 每会话调用 | 延迟/更新 ↓ | 成本/更新 | 成本/会话 ↓ |
|---|---|---|---|---|---|---|
| **CrowdDirector** | 1 | **0** | **6** | **20.5 ms** | **$0** | **$0.03** |
| 全群 LLM | 1 | 1 | 606 | 3,880 ms | $0.0038 | $2.30 |

> **延迟降低 189×（3,880 ms → 20.5 ms），会话成本降低 77×（$2.30 → $0.03）。**
> 关键是 $T$（会话长度）远大于 $N$（用户说话次数）。

### 训练语料

| 划分 | 用途 | 世界数 | 决策数 | LLM 混合 |
|---|---|---|---|---|
| full/train | train | 1,280 | 40,283 | 35,115 |
| full/validation | selection | 258 | 8,340 | 7,369 |
| full/composition | held out | 268 | 8,406 | 8,306 |
| ext/train | train | 584 | 9,483 | 4,624 |
| ext/composition | held out | 102 | 1,685 | 616 |
| new-event/train | train | 284 | 5,409 | 5,409 |
| **总计** | | **2,776** | **73,606** | **61,439** |

---

## 局限性

- 依赖 **Unity** 作为执行层与场景模型（可移植性受限）
- 场景验证器的五态裁决**依赖模拟器提供 affordance 词汇表**；词汇表外的一切都是 `unsupported`
- 候选上限 64 是硬约束 → 动作空间大时可能截断
- Maslow 需求分层是**固定规则**，不随训练学习
- 行为基准仅覆盖有限场景与指令类型；E1 的置信区间较宽（[0.61, 1.00]）
- 每 tick LLM 控制的**质量上限仍高于 CrowdDirector**（Q2 0.683 vs 0.595、Q3 0.667 vs 0.611）→ 架构是**折中**而非全面超越

---

## 相关工作

- [[2026-11-09_NanoVDB-Dynamic-GPU-Sparse-Grids-Voxel-Sequential]]
- [[2026-11-09_Self-Penetration-Repair-Skinned-Characters]]
- [[2026-11-09_Geometric-Texture-Segmentation-Meshes]]
- 概念：[[人群模拟]], [[图神经网络]], [[大语言模型编排]], [[指针网络]]

---

## 实现建议

- **实现难度**: **中**（GNN 训练需 Unity + 生成场景，验证器需定义 affordance 词汇表）
- **预期性能**: **20.5 ms/更新**（20 agent 世界）、**零 LLM 运行时成本**；相比每 tick LLM **延迟 189×、成本 77×**
- **适用场景**:
  - **实时渲染管线的运行时编排**：场景复杂、意图用自然语言描述
  - 人群/agent 仿真、VR 交互场景的可编程控制
  - 任何「**语言稀疏触发、计算持续运行**」的系统
- **落地路径（可迁移的架构判断）**:
  1. **「生成器与验证器分离」**——本文最有价值的工程结论。LLM 不应自我批准自己的输出（E1：0.47 vs 0.83）
  2. **「指令持久化 + 本地策略」**——把语言推理的调用次数从 $O(T)$ 降到 $O(N)$
  3. **「指针网络式候选打分」**——候选集长度可变时，比固定类别分类器更自然
  4. **「结构性不可能前置剔除、运行时条件交给策略」**——划分推理与搜索的职责边界
  5. **消融揭示的两种能力分工**：**编码负责「选对响应」，消息传递负责「不做不该做的事」**——这个区分对自研 GNN 策略有直接指导意义

---

## 原始链接

- arXiv: https://arxiv.org/abs/2611.08763
- HTML 全文: https://arxiv.org/html/2611.08763
