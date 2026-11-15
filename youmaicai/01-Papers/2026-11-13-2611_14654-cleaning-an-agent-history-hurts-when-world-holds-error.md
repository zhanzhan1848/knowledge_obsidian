---
title: "Cleaning an Agent's History Hurts When the World Still Holds the Error"
authors: ["Egor Pakhomov", "Anurag Koul", "Hongjun Liu", "Bo Pang", "Shafiq Joty", "Erik Nijkamp"]
date: "2026-11-13"
arxiv: "2611.14654"
arxiv_url: "https://arxiv.org/abs/2611.14654"
pdf_url: "https://arxiv.org/pdf/2611.14654"
categories: ["cs.AI", "cs.CL", "cs.LG"]
tags: ["llm-agent", "tool-use", "memory-management", "error-recovery", "evaluation"]
venue: ""
status: "已读"
---

# Cleaning an Agent's History Hurts When the World Still Holds the Error

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Cleaning an Agent's History Hurts When the World Still Holds the Error |
| 作者 | Egor Pakhomov, Anurag Koul, Hongjun Liu, Bo Pang, Shafiq Joty, Erik Nijkamp |
| 链接 | [原文](https://arxiv.org/abs/2611.14654) |
| arXiv | arXiv:2611.14654 |
| 分类 | cs.AI, cs.CL, cs.LG |
| 发表 | 未标注会议（comment 提及 23 pages, 6 figures; code and data in ancillary files） |
| 篇幅 | 23 页，6 图 |
| 代码 | code and data in ancillary files（随论文附带） |

## 核心贡献
1. **提出"历史编辑 vs. 世界状态"的解耦视角**：以往工作把"清理历史"与"修正世界"绑定在一起（展示一个被修正的步骤，就等于宣告它已完成）。本文指出这是两类不同的干预，必须分离研究。
2. **给出受控实验范式**：把 agent 在任务中途"冻结"，保留其精确的世界状态，然后分别只改历史或只改世界，让一个 receiver 模型继续执行，从而分离出每种编辑的独立效应。
3. **证明"清理历史"可能有害**：当世界仍然保留着那个错误时，一份"看起来干净"的历史会让 agent 比完全不做编辑更糟（比 "no edit at all" 更差）。
4. **揭示关键混淆变量**：仅仅"正确值是否出现在上下文里"无法预测其效果——呈现方式（旁注 vs. 已完成动作）以及世界状态（效果是否真的落地）才是决定性因素。

## 方法 / 技术细节
### 核心操作化设计
把 agent 在任务中途冻结，固定其**精确世界状态**，然后做两类单变量干预：
- **编辑历史**（history edit）：改写模型看到的轨迹/上下文；
- **编辑世界**（world edit）：改变外部环境的实际状态。

之后由一个 receiver 模型接手继续任务，测量"剩余目标的完成份额"（share of remaining targets the receiver gets right）与整体恢复率（recovery）。

### 实验一：AgentCE-Bench（历史编辑，世界固定）
在 agent 已经写入一个**错误值**之后，固定世界状态，只加入正确的值，采用两种自然的编辑方式：
1. **Truthful note beside the preserved error**（在保留的错误旁边加一条真实的备注）；
2. **The agent's own completed action**（把"该动作已完成"这件事写成 agent 自己的已完成动作）。

另设 matched neutral note（长度/形式匹配的、中性提示）作为对照基线。

### 实验二：AppWorld（回执 vs. 效果，2×2 操纵）
在一次数据库写入之后，分别操纵两个二值因素：
- 回执声称成功 vs. 声称失败；
- 写入效果在世界中**实际存在** vs. **缺失**。

这一 2×2 设计可以分离"信息（receipt）的信号价值"与"世界的真实状态"。

### 分析方法
对两个 receiver 模型的结果做 pooled 分析，并报告分 receiver 的一致性检验（在 8 个 receiver 中的 6 个为正，显著性 97.5%；7 个为正，显著性 95%）。

## 实验结果
### AgentCE-Bench
- 加入 truthful note 后，recovery（receiver 答对的剩余目标份额）从**匹配的对照中性提示下的 51%** 提升到 **66%**（+15 个百分点）。
- 加入"agent 自己的已完成动作"反而**低于未编辑历史**：从 **50% 降到 44%**（−6 个百分点）。
- 结论：正确值"是否出现"本身不能预测效果——两个编辑都注入了同样的正确内容，效果方向却相反。

### AppWorld
- **成功回执 + 效果缺失**：整任务成功率从 **45% 降到 28%**（−17 个百分点）。
- **成功回执 + 效果存在**：整任务成功率从 **38% 升到 49%**（+11 个百分点）。
- 两种条件下回执效应的差距 pooled 后为 **27 个百分点**。
- 一致性：8 个 receiver 中 6 个方向为正（97.5% 显著），7 个为正（95% 显著）。

## 关键数字速览
| 指标 | 数值 |
|------|------|
| AgentCE-Bench：truthful note 相对 matched neutral note 的 recovery | 51% → 66% |
| AgentCE-Bench：completed action 相对未编辑历史 | 50% → 44% |
| AppWorld：成功回执 + 效果缺失 | 45% → 28% |
| AppWorld：成功回执 + 效果存在 | 38% → 49% |
| 回执效应 pooled 差距 | 27 个百分点 |
| receiver 一致性 | 8 个中 6 个为正（97.5%）、7 个为正（95%） |
| 论文篇幅 | 23 页 / 6 图 |

## 局限性
- 摘要未披露评测所用模型、receiver 数量细节（仅提及"two receivers"用于 pooled 分析）与具体 benchmark 规模。
- 结论基于**冻结—编辑—继续**的合成式流程，与真实长时间运行、跨会话的 agent 部署场景之间的差距尚未验证（推测）。
- 仅研究了两类具体编辑（旁注 / 已完成动作），其他形式的 history repair（压缩、摘要、交接给更强模型）未覆盖（推测）。
- 主要测量"恢复率"与"整任务成功率"两个下游指标，未直接刻画 receiver 的置信度或世界模型一致性（推测）。

## 与已有工作的关系 / 启示
本文把"context engineering / history compaction"这一当下热点从"信息是否正确"的维度推进到"信息与外部世界状态是否一致"的维度，实质上把 agent memory 问题重新表述为**部分可观测世界下的 belief-state 校准问题**。它与错误恢复、self-correction、tool hallucination 抑制等文献形成直接呼应，也对当下大量"重写上下文以修复 agent"的工程实践提出了明确警告。

## 相关论文
- [[ToolTurns: Benchmarking LLM Agents in Multi-Turn Dialogue]]
- [[StateAlign: Internalizing State-Aware Decision-Making for Reliable Multi-Turn Tool Agents via Reinforcement Learning]]
- [[DISCERN: Preserve at Write, Resolve at Read for Persistent LLM-Agent Memory]]

## 我的评注
最有价值的一点是把"编辑历史"和"编辑世界"这两个人们默认耦合的动作解耦成一个干净的受控因子实验——这类消融在 agent 文献里长期缺失，因为大多数论文只关心"修好了没有"，从不问"修的时候世界是否还在错"。而"正确的值出现"却导致效果从 +15 到 −6 的翻转，这个反直觉结果足以让人重新审视当前大量以"注入正确的中间状态"为核心的 context-repair 流水线：它们很可能只是在 agent 的信念层面制造了一个与物理事实矛盾的漂亮叙事，从而诱导模型做出过度自信、且不可执行的行动。实践中我建议任何做历史压缩/摘要的团队立刻做一个"摘要后世界一致性"检查：被摘要声称已完成的动作，必须由一次可验证的状态查询来背书，否则应当显式标注为"未确认"。本文的局限在于编辑空间较窄、结论主要建立在合成式冻结流程上，但把"世界状态一致性"确立为历史编辑的验收标准这一点，无论如何都已经是 agent memory 设计的一个硬性基线。

---
*采集时间：2026-11-13 | 油麦菜 🥬 自动精读*
