---
title: "daVinci-Prover: Agent-Native Mid-Training for Formal Theorem Proving"
authors: ["Wenhong Zhu", "Xuefeng Li", "Jiashuo Zhang", "Yu Chen", "Tiantian Mi", "Qipeng Guo", "Pengfei Liu"]
date: "2026-11-13"
arxiv: "2611.16433"
arxiv_url: "https://arxiv.org/abs/2611.16433"
pdf_url: "https://arxiv.org/pdf/2611.16433"
categories: ["cs.CL"]
tags: ["theorem-proving", "formal-reasoning", "mid-training", "agent-native", "lean"]
venue: ""
status: "已读"
---

# daVinci-Prover: Agent-Native Mid-Training for Formal Theorem Proving

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | daVinci-Prover: Agent-Native Mid-Training for Formal Theorem Proving |
| 作者 | Wenhong Zhu, Xuefeng Li, Jiashuo Zhang, Yu Chen, Tiantian Mi, Qipeng Guo, Pengfei Liu |
| 链接 | [原文](https://arxiv.org/abs/2611.16433) |
| arXiv | arXiv:2611.16433 |
| 分类 | cs.CL |
| 发表 | 未标注会议（comment 字段为空） |
| 篇幅 | 未标注（comment 字段为空） |
| 代码 | 未提及 |

## 核心贡献
1. **提出核心论点**：有效的 agentic prover 需要两样东西——
   - **强数学技能先验（strong mathematical skill priors）**来为定理证明提供基础；
   - **agentic trajectories（智能体轨迹）**来支撑长程（long-horizon）、交互式的证明构造。
2. **合成 agent-native 的 33.7B token 中训练（mid-training）语料**，内容覆盖**分解（decomposition）、搜索（search）、自验证（self-verification）、修订（revision）**，并配套 **verifier-grounded agentic trajectories（以验证器为锚的 agent 轨迹）**。
3. **提出 daVinci-Prover harness**：使模型能在**隔离工作区（isolated workspace）**中构造证明并与 **Lean verifier** 交互；用该 harness 收集**约 36K 条高质量 agent 轨迹**用于 SFT。
4. **验证 mid-training 配方**：相对**匹配的 Qwen3-8B SFT-only 基线**，在 **MiniF2F、FATE-M、ProofNet** 三个基准上取得**平均 +13.7 分**。
5. **迁移到 Qwen3.5 系列**同样取得强性能，并实现**接近饱和的 MiniF2F 表现（near-saturating MiniF2F performance），且带有 memory compaction（记忆压缩）**。

## 方法 / 技术细节
### 训练阶段设计
本文的核心是 **mid-training（中期训练）** 阶段——位于预训练之后、任务 SFT 之前/之中，目的是把"通用数学能力"与"agent 行为模式"在**同一个数据配方**里同时注入，避免二者割裂。

#### 语料构成（33.7B tokens）
| 能力成分 | 作用 |
|------|------|
| Decomposition（分解） | 把定理拆成可验证的子目标 |
| Search（搜索） | 在证明空间中做有方向的探索 |
| Self-verification（自验证） | 主动检查中间推理的有效性 |
| Revision（修订） | 失败后回退与重写 |
| Verifier-grounded agentic trajectories | 以 Lean verifier 反馈为锚的真实交互轨迹 |

### daVinci-Prover harness
- **隔离工作区（isolated workspace）**：证明构造与文件操作在受控环境中进行；
- **与 Lean verifier 交互**：验证结果直接回流给模型，构成 agent 的观察（observation）；
- 该 harness 同时是**数据生产工具**：产出 **约 36K 条高质量 agent 轨迹**用于后续 SFT。

### 评测
- **MiniF2F**（形式化数学竞赛题）、**FATE-M**、**ProofNet**；
- 对照：**匹配的 Qwen3-8B SFT-only baseline**（matched SFT-only baseline，隔离 mid-training 的贡献）；
- 额外迁移实验：**Qwen3.5 系列**；
- **Memory compaction** 作为一项能力，用于长程证明中的上下文压缩——在接近饱和的 MiniF2F 上尤关键。

## 实验结果
- 相对**匹配的 Qwen3-8B SFT-only 基线**，在 **MiniF2F / FATE-M / ProofNet** 上取得**平均 +13.7 分**的提升。
- 应用于 **Qwen3.5 系列**时，在多个定理证明基准上取得强性能。
- 在 Qwen3.5 系列上，**结合 memory compaction 实现接近饱和的 MiniF2F 表现**。
- 绝对分数、各基准逐项数值、模型规模细节未在摘要中披露。

## 关键数字速览
| 指标 | 数值 |
|------|------|
| Mid-training 语料规模 | 33.7B tokens |
| 收集的 agent 轨迹数 | ≈36K |
| 相对 SFT-only 基线的平均提升 | +13.7 分（MiniF2F / FATE-M / ProofNet） |
| 基线 | 匹配的 Qwen3-8B SFT-only |
| 迁移模型系列 | Qwen3.5 |
| MiniF2F 表现 | 接近饱和（配合 memory compaction） |
| 语料能力维度 | decomposition / search / self-verification / revision + verifier-grounded trajectories |

## 局限性
- 摘要未披露：具体基准绝对分数、模型规模、33.7B token 语料的来源与去重/质量控制方案、训练成本。
- 语料规模巨大（33.7B tokens），**复现门槛极高**——外部团队难以独立验证（推测）。
- **verifier-grounded 轨迹依赖 Lean**，方法向其他形式化系统（Coq/Isabelle）迁移需要重新合成（推测）。
- 接近饱和的 MiniF2F 可能意味着**该基准已失去区分度**，后续工作需要更难的基准（推测）。
- 未见与同期其他 prover 模型（如各类自搜索/工具增强 prover）的直接对比（摘要未列）。

## 与已有工作的关系 / 启示
本文接续了形式化定理证明近两年最重要的趋势转变：从"**一次生成一个证明**"转向"**与 Lean verifier 交互的 agent**"（AlphaProof、Kimina、Goedel-Prover 等脉络）。它的独特之处在于**在 mid-training 阶段就同时注入数学技能先验与 agent 行为**，而不是先做纯数学 mid-training 再做 agentic SFT——这个"合流"的设计主张比任何单项指标更有说服力。

## 相关论文
- [[RSI-PDEbench: A Benchmark for Self-Improving Agents in PDE Solving]]
- [[Turning Multi-Agent Communication into Token-Level Credit with On Policy Self Distillation]]
- [[JudgeMix: Judge-Guided Mixed-Rollout Data Synthesis for LLM Agents]]

## 我的评注
+13.7 分相对一个**匹配的** SFT-only 基线，这个对照设计是这篇论文最值得肯定的地方——很多 mid-training 论文会不小心拿 SFT 基线和"没有 SFT 的基线"比，从而把 SFT 的收益算到 mid-training 头上；作者明确用 matched baseline 隔离了变量，说明是懂行的人写的。

真正的洞见在"**agent-native**"这个词上：主流做法是先训数学、再训 agent 行为，作者主张这两者必须**在同一个语料配方里同时注入**，理由是 agent 的交互行为（分解、搜索、自检、修订）本身就是一种**数学思维模式**，拆开训练会导致 agent 行为与数学直觉脱节。这与 [[JudgeMix]] 那篇"训练数据要落在 target model 的状态分布上"的观点在精神上同源——都是关于**监督信号与 agent 实际行为形态的对齐**。33.7B tokens 的代价很高，但"36K 条 verifier-grounded 轨迹"这个量级说明真正起作用的是**那 36K 条轨迹**，而非 33.7B 的一般语料——我的猜测是，未来的复现可以大幅缩减通用语料规模，重点投入在 agent 轨迹的规模与多样性上。

另外 "**接近饱和的 MiniF2F**" 是个双刃信号：既是能力证明，也意味着这个社区的主战场评测即将失效。配合 memory compaction 才能达到饱和，说明长程证明的上下文管理已经和推理能力同等重要——这与 [[Cleaning an Agent's History Hurts...]] 的结论遥相呼应：**在长程 agent 任务里，"记得什么"和"想得对"同等致命。**

---
*采集时间：2026-11-13 | 油麦菜 🥬 自动精读*
