---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, agents, safety, formal-verification, temporal-logic]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2609.18128
arxiv: 2609.18128
---

# Symbolic Temporal Supervision of LLM Agents Using Contracts

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Symbolic Temporal Supervision of LLM Agents Using Contracts |
| **作者** | Yifeng Xiao, Johnna Liu, Pierluigi Nuzzo |
| **发表** | arXiv preprint（UC Berkeley + Sponsio Labs） |
| **链接** | [原文](https://arxiv.org/abs/2609.18128) |
| **arXiv** | arXiv:2609.18128 |
| **分类** | cs.AI, cs.LO |
| **代码** | 未提供 |

---

## 核心贡献

> 用**有限轨迹上的线性时序逻辑（LTL_f）假设-保证契约**来监督 LLM agent，把工具调用轨迹形式化为可判定谓词上的迹，编译成确定性有限自动机（DFA），一个检查器同时承担"在线门控动作"与"离线评估已记录轨迹"两种角色。

1. 首次为 LLM agent 提供统一的形式化规格层：**assume-guarantee 契约**，显式区分"环境假设"与"agent 保证"，从而能区分"假设失败"与"保证违反"。
2. 每个契约编译为 DFA（可含算术 LTL，ALTL，用于数值比较类谓词），实现在线动作拦截与离线轨迹评分两种监督模式，且判定是**确定性、可复现**的，不依赖任何模型。
3. **契约库（contract library）**独立于 agent 模型维护，作为可复用知识库，同一任务域内可跨不同 agent 复用（模型无关，天然可移植）。
4. 在四个基准上验证：相对 LLM-judge、分类器与 guardrail 基线保持竞争力，在线模式的单次调用延迟低**若干数量级**。

---

## 技术方案

### 核心思想
工具增强的 LLM agent 会执行具有不可逆后果的动作（危险命令执行、间接 prompt injection、指标作弊、跨 agent 身份混淆）。现有方案要么用 LLM judge / 学习式检测器离线评分轨迹（判定不确定、不可复现），要么用事件触发规则、I/O 检查、风险估计做运行时干预——两者规格不统一。ContrAgent 的做法是：把 agent 与工具接口之间的所有事件（agent 发起的 tool call、模型输出、工具返回、模型输入）抽象为一个 trace，其原子谓词取自一个固定的**交互谓词（interaction predicate）**词汇表，分为结构谓词（对 tool call / 结果 / 模型输入输出 / 上下文 / 权限 / 计数器的确定性布尔测试）与数值谓词（形如 $x \leq c$ 的比较、字符串模式匹配）。契约被定义为三元组（假设谓词集、保证谓词集、ALTL 公式），语义上要求 trace 满足 $\mathcal{A} \Rightarrow \mathcal{G}$。有限迹上的 LTL 公式被编译为 DFA，DFA 既可作为在线 monitor 在动作执行前检查（违规则拒绝并回滚候选调用，从监控轨迹中移除），也可作为离线求值器评估已记录轨迹。契约库还提供一致性/兼容性检查与冲突分析，可从自然语言需求或政策文档自动翻译出 ALTL 公式。

### 关键公式
```math
\text{Contract} := \big(\mathcal{A},\ \mathcal{G},\ \varphi\big),
\qquad \varphi \text{ is an ALTL formula over interaction predicates}

\text{Session satisfies contract} \iff \ \mathrm{trace}(\text{session}) \models \mathcal{A}\Rightarrow\mathcal{G}

\varphi \in \mathrm{ALTL}_{f} \ \subseteq\ \mathrm{LTL}_{f},
\qquad \mathrm{ALTL}_{f} = \mathrm{LTL}_{f}\ \text{modulo linear arithmetic}
```

### 关键组件
- **Interaction predicates（表 1）**：固定词汇表，含结构性布尔判定与数值比较，作为契约的原子命题。
- **ALTL（算术 LTL）**：LTL over finite traces 模线性算术，用于表达"退款金额 ≤ $42"这类带数值界的时序要求。
- **契约编译（Contract compilation）**：ALTL 公式 → DFA，一个契约一个 checker，可在线执行也可离线执行。
- **运行时 contract valuation**：由所有契约的 valuation 通过 join（合取）与 meet（析取）组合，判断环境是否对至少一个契约有效、agent 是否违反至少一个契约。
- **契约库（Contract library）**：可复用知识库，含自然语言→谓词→ALTL 的作者工具、一致性检查与冲突分析。
- **在线门控与离线评估双模式**：同一 checker 复用；在线模式在 call 执行前求值，违规调用被拒绝并向 agent 返回可操作的纠正反馈（如"应先请求审批"）。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 基准总数 | 4：SOPBench（在线 SOP 执行）、AgentDojo（离线 prompt-injection 阻断）、R-Judge（离线安全风险检测）、τ²-bench（离线流程合规 + 任务成功） |
| SOPBench 覆盖 | 7 个客服域（bank、DMV、healthcare、hotel、library、university、online market），每域 40 任务，模型 gemini-2.5-flash |
| 指标 | success（目标完成 %）与 safety（正确阻断 %），按 SOP 约束数 1–2 / 3–4 / 5–6 / 7–9 / 10+ 分档 |
| 在线延迟 | 相对基线**低若干数量级**（单次调用） |
| 判定特性 | 确定性、可复现，不依赖被监督模型的输出 |
| 模型无关性验证 | 在 gemini-2.5-flash-lite 上，未防护基线保持 27%；prompt 方式的平均 safety 从 94% 崩塌（同一契约库下 ContrAgent 仍可拦截） |
| 跨模型鲁棒性 | AgentDojo 上对 22 个 LLM 的间接 prompt-injection 攻击成功率做对比（log 尺度），覆盖 gemini / claude / gpt / llama / command-r / meta 等系列 |
| τ²-bench | 在 Retail / Airline / Telecom 三域、四个模型（o4-mini、GPT-4.1、GPT-4.1-mini、Claude 3.7）上评估流程可靠性（k=4 联合任务成功率） |
| 残余失败分析 | 论文指出残余 gap 来自 agent 自身（收到阻断消息后不重试、或做了基准的 outcome-based 打分无法区分的"许可内的错误改动"），而非执行层 |

---

## 局限性

- 契约库需要人工或半自动编写（虽有自然语言→ALTL 翻译工具），规格覆盖度依赖作者投入。
- 谓词词汇表是固定的：agent 使用工具词汇表之外的接口时，契约无法表达相应要求。
- 仅是"守门员"而非"生成器"：能判定违规但不能保证 agent 完成任务，SOPBench 的 success 仍受 agent 自身能力制约。
- 论文未提供开源代码（本次抓取的 arXiv 页面与 PDF 中未标注仓库地址）。
- 对抗性绕过（agent 主动伪装以规避谓词）未做深入评估。

---

## 建议

- **是否推荐使用**：是
- **适用场景**：需要**确定性、可审计、可复现**的 agent 行为约束的场景；跨 agent 复用的策略知识库；prompt injection 与危险动作的在线拦截；合规审计与轨迹回放评分。
- **值得复现**：是（尤其对 LTL_f/DFA 编译与 contract valuation 组合逻辑的实现，以及与 LLM-judge 基线的确定性-延迟权衡分析）

---

**相关论文**：[[AgentDojo]], [[LLM-Judge-Reliability]], [[Temporal-Logic-Agent-Safety]]
**主题标签**：#LLM #NLP #Agents #Formal-Verification #Safety
