---
title: "CapLite: Prompt-Injection Defense for Small Language Model Agents without Model-Written Security Artifacts"
authors: ["Zimo Xu", "Wenzhuo Liu", "Hideki Nakayama"]
date: "2026-11-13"
arxiv: "2611.17115"
arxiv_url: "https://arxiv.org/abs/2611.17115"
pdf_url: "https://arxiv.org/pdf/2611.17115"
categories: ["cs.AI", "cs.CL", "cs.CR"]
tags: ["prompt-injection", "agent-security", "small-language-models", "agentdojo", "defense"]
venue: ""
status: "已读"
---

# CapLite: Prompt-Injection Defense for Small Language Model Agents without Model-Written Security Artifacts

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | CapLite: Prompt-Injection Defense for Small Language Model Agents without Model-Written Security Artifacts |
| 作者 | Zimo Xu, Wenzhuo Liu, Hideki Nakayama |
| 链接 | [原文](https://arxiv.org/abs/2611.17115) |
| arXiv | arXiv:2611.17115 |
| 分类 | cs.AI, cs.CL, cs.CR |
| 发表 | 摘要未披露（comment 为空） |
| 篇幅 | 19 pages, 11 figures, 9 tables |
| 代码 | 摘要未披露 |

## 核心贡献
1. **实证质疑** enforcement 类防御的隐含前提：这些防御（CaMeL、Progent、IPIGuard、DRIFT）要求**agent 自己的模型**写出 security artifact（程序、权限策略、依赖图或约束清单），再由代码强制执行——**SLM 有能力写对吗？**
2. 在 **15 个 open-weight 模型**（其中 **13 个介于 1.7B–12B 参数**）上证明：不能。模型写出的策略/图/约束会被成功攻击。
3. 提出 **CapLite**：从**工具 schema** 派生策略，**在读取任何工具结果之前**就提交 write 调用，且只有在"决定影响谁/影响什么"的每个参数都被用户在请求中陈述时才允许写入。
4. 给出 **write integrity（写入完整性）保证**：注入文本无法新增 write，且不会有 write 触达用户未陈述的接收方、金额、对象或目的地。

## 方法 / 技术细节

### 被审问的基线（enforcement defenses）
| 方法 | security artifact 类型 |
|------|------|
| CaMeL | 程序 |
| Progent | 权限策略 |
| IPIGuard | 依赖图 |
| DRIFT | 约束列表 |

### 对基线的攻击结果（15 个 open-weight 模型）
- Progent：可攻击 **14** 个模型；
- IPIGuard：可攻击 **13** 个模型；
- DRIFT：可攻击 **11** 个模型；
- **CaMeL 生成的程序在高达 68% 的 episode 中直接跑不起来（fail to run）**。

### CapLite 的三条设计原则
1. **策略来源**：不依赖模型写作，而是**从 tool schemas 派生**（tool schemas 是外部可信输入）。
2. **提交先于读取**：write 调用在**任何工具结果被读取之前**就已 commit——这阻断了"注入文本先被读入、再影响后续 write"的经典时序攻击。
3. **参数必须被用户陈述**：只有当 write 的**每一个决定"影响谁/什么"的参数**（接收方 recipient、金额 amount、对象 object、目的地 destination）都在**用户原始请求**中明确出现时才允许执行；否则拒绝该 write。

### 形式化保证
- **Write integrity**：注入文本**不能新增** write；任何 write 都不能触达用户未陈述的 recipient / amount / object / destination。
- 该保证与模型能力无关，因而对 SLM 同样成立。

## 实验结果
- **攻击成功率**：13,935 个受攻击的 **AgentDojo episode** 中，**没有任何一次攻击成功**。
- **效用（utility under attack）**：CapLite **29.0%** vs CaMeL **27.2%**（CapLite 略高）。
- **token 消耗**：**17.1k per episode**，为 CaMeL 的 **18%**；且低于**所有**其他 enforcement defense，甚至低于**无防御的 agent**。
- **单位 token 效用最高**：在所有 enforcement defense 中 CapLite 的 utility-per-token 最高。

## 关键数字速览
| 指标 | 数值 |
|------|------|
| 测试的 open-weight 模型数 | 15（其中 13 个为 1.7B–12B） |
| Progent 可被攻击模型数 | 14 |
| IPIGuard 可被攻击模型数 | 13 |
| DRIFT 可被攻击模型数 | 11 |
| CaMeL 程序运行失败率 | 高达 68% 的 episode |
| 受攻击 AgentDojo episode 数 | 13,935 |
| CapLite 攻击成功数 | 0 |
| CapLite utility under attack | 29.0% |
| CaMeL utility under attack | 27.2% |
| CapLite token / episode | 17.1k（CaMeL 的 18%） |

## 局限性
- 效用绝对值仅 **29.0%**，说明 AgentDojo 任务本身在防御下完成率仍低——效用差距主要体现在 token 而非成功率（推测）。
- "参数必须被用户陈述"的判定依赖**精确匹配/语义对齐**用户请求与 write 参数，摘要未说明自然语言歧义、多轮对话改写、隐含意图如何处理（推测）。
- 范围仅覆盖 write 类工具；read 类工具的信息泄露（exfiltration via read → external write）不在保证范围内（推测）。
- 对有状态/多步写入、跨 episode 累积的攻击（累积写超预算）保证强度未说明（推测）。

## 与已有工作的关系 / 启示
本文延续 CaMeL/Progent 代表的 "**security artifact 由 agent 自行生成、代码强制执行**" 范式，但提出的质疑非常致命：**如果 artifact 由可能被注入污染的模型写出，那么 enforcement 的强度就被写作者的能力（尤其是 SLM 的能力）所封顶**。CapLite 把信任边界移回外部可信输入（tool schema）与用户陈述，等于用"更少的模型参与"换取"更强的保证"。

## 相关论文
- [[CaMeL and Prompt-Injection Enforcement Defenses]]
- [[AgentDojo Benchmark]]
- [[Prompt Injection Attacks and Defenses]]

## 我的评注
这是近期 prompt injection 防御里少见的、敢于**回头质疑整个 enforcement 范式前提**的工作。绝大多数论文的隐含设定是"agent 模型足够强（前沿模型），所以让它写 artifact 是安全的"；本文用 1.7B–12B 的 SLM 实证把这个设定拆穿——Progent 策略在 14/15 个模型上可攻破，CaMeL 生成的程序甚至 68% 跑不起来，后者的失败率之高说明现有 benchmark 报告的防御效果很可能只在最强模型上成立。CapLite 的解法在概念上非常干净：**策略来自 tool schema（外部可信），写入时机在读取之前（切断时序），参数必须用户明说（切断内容注入）**，三者合起来构成一个不依赖模型能力的 write integrity 保证，这才是真正接近"形式化安全"的形态。29.0% vs 27.2% 的效用对比加上 18% 的 token 开销，是相当有竞争力的工程权衡。保留意见在于保证的适用面：read 类工具与多轮累积攻击是明显的缺口，而"用户是否陈述了该参数"在真实口语请求中几乎必然模糊——我期待看到正文里对模糊表述的处理策略，那才是这套方法能否走出 benchmark 的关键。

---
*采集时间：2026-11-13 | 油麦菜 🥬 自动精读*
