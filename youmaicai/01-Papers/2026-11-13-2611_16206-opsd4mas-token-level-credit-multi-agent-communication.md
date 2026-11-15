---
title: "Turning Multi-Agent Communication into Token-Level Credit with On Policy Self Distillation"
authors: ["Zixu Wang", "Yu Zhao", "Xing Zheng", "Bingbing Xu", "Tian Xueyun", "JiaTang Luo", "Weiqiang Wang", "Bowen Song", "Huawei Shen", "Xueqi Cheng"]
date: "2026-11-13"
arxiv: "2611.16206"
arxiv_url: "https://arxiv.org/abs/2611.16206"
pdf_url: "https://arxiv.org/pdf/2611.16206"
categories: ["cs.AI"]
tags: ["multi-agent", "reinforcement-learning", "self-distillation", "token-level-credit", "llm-agent"]
venue: ""
status: "已读"
---

# Turning Multi-Agent Communication into Token-Level Credit with On Policy Self Distillation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Turning Multi-Agent Communication into Token-Level Credit with On Policy Self Distillation |
| 作者 | Zixu Wang, Yu Zhao, Xing Zheng, Bingbing Xu, Tian Xueyun, JiaTang Luo, Weiqiang Wang, Bowen Song, Huawei Shen, Xueqi Cheng |
| 链接 | [原文](https://arxiv.org/abs/2611.16206) |
| arXiv | arXiv:2611.16206 |
| 分类 | cs.AI |
| 发表 | 未标注会议（comment 提及 14pages, 4 figures） |
| 篇幅 | 14 页，4 图 |
| 代码 | https://github.com/Camel-Prince/OPSD4MAS |

## 核心贡献
1. **指出多 agent 通信 RL 的两个被忽视之处**：现有方法要么**完全忽略通信知识（overlook communication knowledge）**，要么把它**压缩成标量奖励（compress it into scalar rewards）**；前者浪费了最丰富的监督信号，后者得到的 credit 过于粗糙，无法告诉每个 agent **哪些决策该强化、哪些该修正**。
2. **提出 OPSD4MAS**：用 **On Policy Self Distillation (OPSD)** 把**未来的通信内容**转化为**细粒度的 token 级信用（fine-grained token-level credit）**。
3. **两级过滤机制**：外部模型抽取事实并评估其轨迹关系做**粗粒度过滤**，随后对目标 token 做**细粒度 leave-one-out 过滤**，衡量其对 **agent-wise outcome advantage** 的影响。
4. **fact-conditioned policy** 提供 token 级 credit，并与 **GRPO** 通过**线性退火的联合目标（linearly annealed joint objective）**结合。
5. **数学推理任务上 pass@4 相对 GRPO 最高提升 20.00 个百分点**。

## 方法 / 技术细节
### 核心机制：把通信当作信用来源
传统做法：多 agent 系统产出对话 → 整体 reward → 标量 advantage → 广播给所有 agent/token。
本文做法：把**通信内容本身**（agent 说了什么、这些陈述在整个轨迹中处于什么位置）提炼成**事实（facts）**，再用这些事实反推**哪些目标 token 对最终结果有贡献**，从而生成 **token 级的信用信号**。

### 两阶段过滤
1. **粗粒度过滤（coarse-grained）**：一个**外部模型**从通信中**抽取事实**，并**评估这些事实与轨迹的关系**（trajectory relations），用于筛掉不相关/无用的通信内容。
2. **细粒度过滤（fine-grained leave-one-out）**：对目标 token 做 **leave-one-out** 影响分析——移除/替换某个 token 后，**agent-wise outcome advantage** 如何变化？以此量化每个 token 的信用贡献。

### 训练目标
- **fact-conditioned policy** 输出的 token 级 credit；
- 与 **GRPO** 组合，采用**线性退火（linearly annealed）**的联合目标，即训练早期更依赖事实信用，后期逐渐交回 outcome reward（推测的调度细节，摘要仅说明是线性退火）。

### 诊断实验
- **frozen-history injection diagnostics**：冻结历史后注入事实，用于验证**事实的效用（fact utility）**。

## 实验结果
- **数学推理任务 pass@4 相对 GRPO 最高提升 20.00 个百分点**。
- **消融**支持**完整过滤流程（complete filtering）**的必要性——去掉任一过滤级都会退化。
- **frozen-history 注入诊断**支持事实（fact）确实携带有效效用信号。
- 总体结论：应把 **agent 级 outcome 指导**与**通信衍生的 token 级信用**结合起来。

## 关键数字速览
| 指标 | 数值 |
|------|------|
| 数学任务 pass@4 相对 GRPO 提升 | 最高 +20.00 个百分点 |
| 过滤级数 | 2（粗粒度事实关系 + 细粒度 LOO token 影响） |
| 信用粒度 | token-level（目标 token × agent-wise advantage） |
| 基础算法 | GRPO + 线性退火联合目标 |
| 论文篇幅 | 14 页 / 4 图 |
| 代码 | github.com/Camel-Prince/OPSD4MAS |

## 局限性
- 摘要未披露：任务名称、模型规模、基线方法列表、pass@4 的绝对数值、消融的具体降幅。
- 依赖一个**外部模型**做事实抽取与轨迹关系评估——引入额外成本与额外错误源（推测）。
- **leave-one-out** 在 token 级别的计算开销可能随序列长度平方增长，长上下文下代价未知（推测）。
- 仅在**数学推理**（单 agent 精度指标为 pass@4）上验证，跨领域迁移性未证实（推测）。
- 与 GRPO 的联合目标里"线性退火"两端的权重取值未披露（推测）。

## 与已有工作的关系 / 启示
本文把 multi-agent RL 中"通信"从**信道**重新定义为**监督信号源**——这是一个概念上很漂亮的转换。传统上通信被视为 agent 之间交换信息的通道，其内容最终只通过 outcome reward 间接获得信用；OPSD4MAS 则直接把通信内容本身结构化为 token 级信用，与 [[Outcome-Mass Alignment]] 那类"把隐式记账显式化"的工作遥相呼应——两者都在说同一件事：**RL 管线里被丢弃的信息结构，比我们以为的要多。**

## 相关论文
- [[Outcome-Mass Alignment: Controlling Length-Dependent Trajectory Influence in Multi-Turn LLM Agent Reinforcement Learning]]
- [[JudgeMix: Judge-Guided Mixed-Rollout Data Synthesis for LLM Agents]]
- [[daVinci-Prover: Agent-Native Mid-Training for Formal Theorem Proving]]

## 我的评注
+20.00 pass@4 在数学推理上是个相当大的提升，说明**通信内容确实是当前 multi-agent RL 中被严重浪费的监督信号**——过去大家把通信当作"额外的上下文"，实际它是一份免费的、逐步的、带因果结构的思维链记录；把它蒸馏成 token 级 credit，等于把 multi-agent 的"讨论过程"变成了对单步决策的细粒度奖励。这个视角迁移到任何 agent 系统（多 agent 协作、tool 轨迹、规划过程）都很直接。

但我要标记两点风险：其一，**外部模型抽事实**这一步是整条链路的单点故障——事实抽取有偏，后面的 LOO 分析就会在错误的信用分配上做精细优化，属于"garbage in, precision garbage out"；摘要里的 frozen-history injection 诊断正是在补这个洞，但只验证了"事实有用"，没验证"事实抽得准"。其二，**leave-one-out 的计算复杂度**是这类方法的经典软肋，短序列上无感，长上下文 agent 上可能直接不可行——论文只做了数学推理这种短序列任务，我不认为结论能直接外推。

方法论上值得学习的是它与 GRPO 的组合方式：**不是替换目标函数，而是加一个可退火的辅助信用通道**，这比动辄重写 RL 目标的做法要稳健得多。

---
*采集时间：2026-11-13 | 油麦菜 🥬 自动精读*
