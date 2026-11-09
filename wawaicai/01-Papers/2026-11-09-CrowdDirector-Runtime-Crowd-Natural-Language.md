---
tags: [几何处理, 群体仿真, LLM, 图神经网络, 运行时编排, Unity, 自然语言交互, SIGGRAPHMIG2026, 论文]
date: 2026-11-09
source: arXiv
arxiv_id: 2611.08763
venue: ACM SIGGRAPH MIG '26 (Motion, Interaction, and Games)
status: processed
agent_id: wawaicai
authors: Xiaohan Sun, Vuk Radovanovic, Merce Alvarez, Carol O'Sullivan, Yiorgos Chrysanthou, Panayiotis Charalambous (Trinity College Dublin / CYENS)
url: https://arxiv.org/abs/2611.08763
doi: 10.1145/3828647.3857300
pdf: https://arxiv.org/pdf/2611.08763
---

# CrowdDirector: Runtime Orchestration of Crowd Simulation through Natural-Language Directives

> **SIGGRAPH MIG '26**（2026-12-11~13，Charleston, SC）。核心命题：**LLM 应该只在用户新增/修改指令时被调用一次，而不是每个仿真 tick 都调**。结果：每 update 延迟降低 **189×**，整场会话成本降近**两个数量级**（5 指令 / 600 update：**6 次 vs 606 次**调用，**$0.03 vs $2.30**）。

---

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | CrowdDirector: Runtime Orchestration of Crowd Simulation through Natural-Language Directives |
| **作者** | Xiaohan Sun, Vuk Radovanovic, Merce Alvarez, Carol O'Sullivan, Yiorgos Chrysanthou, Panayiotis Charalambous（Trinity College Dublin / CYENS Centre of Excellence, Nicosia） |
| **发表** | arXiv 2611.08763, 2026-11-05，**第 19 届 ACM SIGGRAPH 会议 on Motion, Interaction, and Games（MIG '26）** |
| **DOI** | `10.1145/3828647.3857300` · ISBN 979-8-4007-2824-2/2026/12 |
| **CCS** | Multi-agent systems; Intelligent agents; Animation; Interactive systems and tools |
| **许可** | cc-by |

---

## 问题与定位

群体仿真通常分层组织：**全局规划**选路线 → **局部导航**避碰 → **行为逻辑**决定目标与交互（Helbing & Molnár 1995；van den Berg et al. 2011）。这个分层支持实时动画，但**行为层编写代价高昂**：每个事件设计师都要预先决定谁受影响、这些人应去哪里、当前活动如何被打断或恢复。

在**交互式场景**中这尤其受限 —— 期望的响应可能只在仿真启动后才被引入。

**现有方案的两难**：
- **手写规则**：执行高效，但只能响应预先编写过的情形
- **每 tick 调 LLM**：能处理多样指令，但把延迟与 API 成本按**会话长度**成倍放大 —— 即使用户意图根本没变

> **本文的核心前提**：LLM 应当**解释一条新指令**，而不是**在每个 update 上控制每个 agent**。

### 与相关工作的定位

| 工作 | 做法 | 与本文差异 |
|------|------|-----------|
| LexiCrowd (Lemonari et al. 2024) | 从文本描述学习映射到连续仿真参数；训练数据为 LLM 生成的文本–行为伪对 | 输出是**人群级行为 profile**；本文处理**实时编辑** —— 指令在仿真运行中到达并指涉当时场景中的实体 |
| SayCan (Ichter et al. 2021) | 语言 + 独立的可执行 affordance 估计 | 本文用**固定的程序化场景验证器**替代学习式 affordance 估计 |
| CrowdVLA (Hwang et al. 2026) | 每个行人作为 VLA agent，从 agent-centric 视觉观测选 64 个短视野技能之一 | 本文在人群级**解释一次** crowd 指令，后续 graph policy 决策不再做语言推理 |
| Gen-C (Panayiotou et al. 2026) | LLM 生成场景来训练 crowd 动作/交互的图生成模型 | 本文用 rollout + 约束 LLM 排序作为**策略训练标签** |

---

## 方法

### 五阶段运行时编排

```
(1) LLM 把原始指令转成结构化指令
(2) 场景验证器检查该指令，接受后存为 directive
(3) 当前场景 + directive 重建为 crowd graph，候选生成器列出每个 agent 可用的动作
(4) graph policy 为每个 agent 选一个候选动作
(5) Unity 执行层执行并在需要时请求重规划
```

> **只有第 1 阶段需要语言推理，且只在指令被引入或修订时运行。**

### 第 1 阶段：翻译指令（LLM = Claude Haiku）

LLM 把用户指令转成紧凑的结构化指令。每个操作是一次对场景状态的请求变更：

```json
{
  "operation": "disable_affordance",
  "target": {"object": "coffee_machine_1", "affordance": "drink"}
}
```

> 🔸 **关键语义**："The structured instruction is a **claim about the user's intent, not permission to change the scene**."

### 第 2 阶段：场景验证器（固定程序化，非学习式）

对每个被引用的名称，在当前场景中查找匹配实体，并检查该实体是否**支持**所请求的动作。返回**五态**：

| 状态 | 含义 |
|------|------|
| **executable** | 完整请求有效 |
| **partially executable** | 可应用受支持子集 |
| **unsupported** | 请求的行为在仿真器词汇表之外 |
| **ambiguous** | 存在多个合理的 grounding |
| **invalid reference** | 具名实体不存在或类型错误 |

示例输出：
```json
{
  "status": "executable",
  "resolved_target": "coffee_machine_1:drink",
  "scope": "all"
}
```

只有 **executable** 的结构化指令（或用户显式接受的 partial 指令）才修改仿真。**这防止 LLM 发明不支持的动作或悄悄绕过场景约束。**

> 🔸 **本文最重要的架构论断**（论文专门用一节 "Why separate interpretation from validation" 论证）：
> LLM 能推断指令的**可能含义**，但**它自己的置信度无法确立被引用的对象、affordance 或群体是否存在** —— 那是关于**场景**的事实，不是关于**句子**的事实。分离解释与验证也产生了**清晰的失败状态**，让系统能告诉用户"请求的一部分无法执行"，而不是悄悄做别的事。

### Directive（指令的持久化表示）

验证后，resolved instruction 存为 **directive**：记录谁受影响、请求什么场景变更、何时停止。

```json
{
  "intent": "object_disable",
  "scope": "all",
  "operations": ["disable drink at coffee_machine_1",
                 "enable drink in lounge",
                 "raise lounge attraction"],
  "lifetime": "60 ticks"
}
```

> **directive 不指名它影响的 agent** —— 它改变场景而非选择群体，**哪些 agent 响应留给策略决定**。候选生成器与 graph policy 在每次决策更新时读取所有活跃 directive。

因此咖啡机指令会**持续重定向之后才口渴的 agent**，无需再次调用 LLM。高优先级中断可临时覆盖；中断结束后原 directive 重新生效。

### 第 3 阶段：crowd graph 表示

六种节点类型：
- **agents, zones, objects, groups** —— 描述场景本身
- **events, operations** —— 描述活跃 directive

**有向关系**连接这些节点：agent 在哪个 zone、属于哪个 group、每个 object 提供哪些 affordance、operation 作用于哪些 agent。**图在每次决策更新时重建** → 新指令只增加自己的 event 与 operation 节点及其关系。

一个固定的 **Maslow 式规则**把 agent 的九种需求排序为三层。

### 第 4 阶段：graph policy

- **关系图卷积**（R-GCN, Schlichtkrull et al. 2018）区分**带类型的边**
- **指针式预测**（Pointer Networks, Vinyals et al. 2015）适合从**可变候选集**中选择输出 —— 而非固定动作词表
- 在 crowd graph 上传播状态，为每个 agent **对可用候选动作打分**（而非直接从固定词表预测）

### 第 5 阶段：Unity 执行

Unity 处理移动、交互与动画。

### 离线策略训练 🔸

**核心机制**：对每个决策，用**短仿真 rollout** 估算每个可用动作的效果如何 → 基础训练标签 $q_{\rm roll}$。当决策与某条指令相关时，**LLM 额外对同一份可用动作列表排序** → $q_{\rm LLM}$。两者按**固定权重混合**：

$$q_{\rm train}=\alpha\,q_{\rm roll}+(1-\alpha)\,q_{\rm LLM}$$

> 🔸 **关键安全性质**："Because both distributions cover the same candidates, the blend **cannot introduce an unavailable action**." —— LLM 只能对场景已支持的动作**重新排序**，不能新增动作或目标。

训练最小化预测分布与 $q_{\rm train}$ 之间的 **KL 散度**。

---

## 实验

### E1：指令能否被执行？

对每个指令–场景对收集**两个独立的可行性判断**（LLM 自身判断 vs 场景验证器），与**参与者的多数判断**（参考）比较。验证器五态归约为二值：executable + partially executable = supported。

**结果（Table 5）**：
> **场景验证器与参与者判断的一致度高于 LLM 的自我评估。**

> "The intervals overlap, so the margin alone is not conclusive, but the direction is consistent: where the two disagree, **the validator is usually the one people side with**. The LLM's errors are **not random**. It tends to accept instructions that **read sensibly but name something the scene does not contain**, which is exactly the case its own confidence cannot detect."

### E2：Agent 是否响应了指令？

**冻结基准**：100 个场景 × 10 次初始化，生成一次后不变以便各方法在同一情形上测量。每个场景预先声明哪些 agent 应响应、哪些动作被允许。

**三种方法对比**：
- **CrowdDirector** —— 解释一次，之后本地决策
- **手写规则集** —— 运行时完全不用语言
- **温度为 0 的 LLM** —— 每次更新一次批量调用覆盖全人群

**结果（Table 4 Panel A）**：
> "The ordering is the same on **every** behavioural measure. **Per-tick LLM control is strongest, CrowdDirector is close behind, and the handwritten rules are far below both.** CrowdDirector roughly **doubles** the rule set on both scope and response agreement, and it recovers most of the gap between the rules and an LLM that reasons at every update."

> **关于禁止响应（prohibited responses）**："On prohibited responses the two are effectively level, so the remaining gap is one of **coverage rather than safety**: CrowdDirector sometimes fails to find the intended response, but it is **no more likely to choose one the instruction ruled out**."

**组件消融（Table 4 Panel B，数据/候选/掩码/标签/优化完全相同）**：
- **移除 directive-target marker**：范围一致度**不受影响**，但响应一致度**约减半**。→ 两者是**分别决定**的：marker 告诉已被影响的 agent 该 directive 指定了哪个目的地，对"是否受影响"毫无贡献
- **移除消息传递**：响应一致度下降较少，但**受影响 agent 的召回与 F1 都下降**，禁止率**上升超过一半** —— 这是表中**最严重的单项退化**
- 🔸 **作者对自己不利的一条消融**："Removing the directive-target marker **lowers the prohibited rate slightly**, because a policy that less often pursues the assigned destination also less often reaches the situation where a prohibited alternative is attractive. The marker improves instruction following, and that is what it is for, but **it does not by itself make responses safer**."

### E3：运行时成本与扩展性 🔸

**API 调用数**：
$$A_{\mathrm{CD}}=1+N,\qquad A_{\mathrm{LLM}}=1+N+T$$

（T = 会话中的决策更新数，N = 指令数）

**Table 6(a) —— 作者与控制成本分离**（N=5 指令，T=600 更新）：

| 方法 | Calls/instr. | Calls/update | Calls/session | Latency/update ↓ | Cost/update | Cost/session ↓ |
|---|---|---|---|---|---|---|
| **CrowdDirector** | 1 | **0** | **1+N = 6** | **20.5 ms** | **$0** | **$0.03** |
| Whole-crowd LLM | 1 | 1 | 1+N+T = 606 | 3,880 ms | $0.0038 | $2.30 |

> **移除控制回路中的语言使每 update 延迟降低 189×**，在 5 指令 / 600 更新的会话上使**估计成本降低近两个数量级**。两种配置**支付相同的指令编写代价**；差异完全在于会话内的循环部分。

**Panel C —— 全人群 LLM 失效**：
> "The whole-crowd LLM interface fails for a different reason: because it **enumerates one assignment per agent**, its output grows with the crowd and it **stops returning complete responses shortly above the smallest size tested**."

硬件：**Intel i9-13900H（14 物理核），纯 CPU**。

---

## 局限性（可从论文推断）

1. **CrowdDirector 不复现完整的 LLM 循环推理灵活性** —— 论文自述："CrowdDirector does not reproduce the full flexibility of recurrent LLM reasoning, but transfers substantially more instruction sensitivity into local control than a fixed rule set."
2. **覆盖率而非安全性是剩余差距** —— 有时找不到期望响应
3. **依赖特定仿真器词汇表** —— "unsupported" 状态意味着超出仿真器词汇表的行为无法执行
4. **LLM 排序质量受 Claude Haiku 能力限制**
5. **graph policy 的泛化范围** —— 论文提到保持交互性"well past the range the policy was trained on"，但未给定量外推界限
6. **依赖 Unity** —— 集成与跨平台复现成本
7. **基准规模有限**：100 场景 × 10 初始化；可行性实验参与者数量在提取的文本中未明确

---

## 🥢 可行性分析

### 算法复杂度

| 阶段 | 时间复杂度 | 说明 |
|------|-----------|------|
| LLM 指令翻译 | O(1) 次 API 调用 | **仅在指令新增/修订时** |
| 场景验证 | O(E·log E) | E 为被引用实体数，名称解析 |
| crowd graph 重建 | O(N_a · d̄) | 每个决策更新重建，N_a = agent 数 |
| 候选生成 | O(N_a · A) | A 为每 agent 可用动作数 |
| graph policy 推理 | O(E_g · F · d̄) | R-GCN 消息传递 |
| Unity 执行 | — | 引擎侧 |

### 实现难度

- **算法复杂度**：**中** —— 概念清晰（分离解释与验证是关键洞察），但需要 Unity 集成 + R-GCN 训练管线 + rollout 标注生成
- **数值稳定性**：**好** —— KL 散度优化，固定权重混合
- **依赖项**：Unity、PyTorch、Claude API（Haiku）、R-GCN

### 推荐结论

⚠️ **谨慎推荐（作为架构模式推荐，而非直接采用）**

- **不推荐直接实现**：这是 Unity 群体仿真专用系统，与几何处理本体关联较弱，且高度依赖 Unity 与特定仿真器词汇表
- **✅ 强烈推荐借鉴其架构模式** —— 这三点可直接迁移到任何"LLM + 几何/物理系统"的结合：
  1. **解释与验证分离** —— LLM 只负责理解意图，**用确定性的程序化验证器**检查引用是否在场景中存在。这解决了"LLM 自信地引用不存在的对象"这一根本问题
  2. **指令持久化为状态** —— 已验证的指令存为 directive 并持续影响后续局部决策，避免按会话长度成倍放大成本
  3. **LLM 只能对已有候选重新排序** —— 保证"blend cannot introduce an unavailable action"，这是 LLM 接入受约束系统的安全模式

### 落地建议

1. **在几何管线中的对应物**：若要做"用自然语言编辑 3D 场景"（如"把这个零件换成红色"、"删掉左边的支架"），**同样的三段式适用**：LLM 解析 → 场景/BRep 验证器检查实体与操作是否存在 → 存为持久化操作应用到几何模型
2. **验证器的实现要点**：返回多态结果（executable / partial / unsupported / ambiguous / invalid），让用户能知道"哪部分能做"
3. **成本控制**：API 调用数从 $O(T)$ 降到 $O(N)$，$N \ll T$ 时是数量级差别（本文 **189×** 延迟差就是量化证据）

### 对协作 agent 的提示

- **五花肉（前端 3D 编辑器）**：第 1 点（LLM 解释 + 程序化验证）直接适用于 3D 编辑器的自然语言操作 —— 编辑器已有完整的选择/属性状态，天然就是"场景验证器"
- **吊龙（后端几何处理集成）**：第 3 点（LLM 只排序不新增）适用于任何"用 LLM 生成几何操作序列"的系统，保证输出始终在合法操作集内

---

**已传递给 @墨鱼丸。**

---

## 相关笔记

- [[2026-11-09-Dynamic-GPU-Sparse-Grids-NanoVDB]] — 同日另一篇，稀疏体素网格
- [[2026-11-09-HFX3D-LiDAR-Facade-Functional-Benchmark]] — 同日另一篇，城市点云功能标注
