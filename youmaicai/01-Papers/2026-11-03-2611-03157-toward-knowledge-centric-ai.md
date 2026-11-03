# Toward Knowledge-Centric AI: Discovering, Internalizing, and Using Explicit Knowledge Across Agents and Generations

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | Toward Knowledge-Centric AI: Discovering, Internalizing, and Using Explicit Knowledge Across Agents and Generations |
| 作者 | 摘要未列出完整作者列表 |
| 链接 | [原文](https://arxiv.org/abs/2611.03157) |
| arXiv | arXiv:2611.03157 |
| 类别 | cs.AI, cs.CL |
| 发表时间 | 2026-11-03 |
| 会议 | arXiv preprint |
| 评分 | 8/10 |

## 核心贡献
1. **提出"知识中心"（knowledge-centric）AI 架构**：围绕一个**显式的、持续演化的知识层**构建，该层独立于任何单一 agent
2. **识别出三环闭环中的真正瓶颈**：发现（discovery）与使用（use）因 LLM agent 快速进步，但**内化（internalization）仍是瓶颈**
3. **把内化重新定义为持久对象**：主张内化应成为训练与维护的**持久对象**，核心是**保条件概念化**（condition-preserving conceptualization）与演绎/归纳/溯因推理

## 问题背景
知识是理解跨人、跨世代累积的方式 —— 持久的记录，超越其生产者，且可被他人**检查、组合、教授、纠正**。

但当前 AI agent 的现实是：
- agent 由**多个独立用户和组织**构建与运行
- 每个 agent **数月内**就会被升级、替换或退役
- agent 学到的东西**困在**三个地方：
  - 模型参数里（瞬态）
  - 上下文窗口里（瞬态）
  - 系统特定的记忆存储里 —— 只是被**追加与检索**，而不是被**处理**

## 方法

### 知识中心的三环闭环
```text
┌──────────────────────────────────────────────────────┐
│  显式知识层（独立于任何单一 agent，持续演化）        │
└──────────────────────────────────────────────────────┘
   ▲                │                    │
   │ 发现            │ 内化               │ 使用
   │ discovery       │ internalization    │ use
   │                ▼                    ▼
 agent 从环境与轨迹  将碎片化、异质的记录  各系统各世代的
 中发现知识    →   与经验转为可组合、   agent 使用结果并
                    可修订的理解    →   返回新的成果供修订
```

### 三环的进展不均衡
| 环节 | 进展 | 说明 |
|------|------|------|
| **发现（discovery）** | 快速 | LLM agent 已能自主探索环境 |
| **使用（use）** | 快速 | agent 已在跨系统使用检索结果 |
| **内化（internalization）** | **瓶颈** | 知识仍停留在参数/上下文/检索层 |

### 内化的核心主张
- **保条件概念化（condition-preserving conceptualization）**：概念化过程必须保留事件的成立条件 —— 否则抽象会丢失可证伪性
- **三类推理并用**：演绎（deductive）、归纳（inductive）、溯因（abductive）
- 内化是**持久对象**，而非一次性的训练步骤 —— 需要持续的维护

## 实验结果
这是一篇**立场 / 议程型论文**（position paper），摘要中未给出实验数据。

核心论断：
- agent 生命周期（数月）与知识生命周期（跨世代）**严重不匹配**，这是当前架构的根本缺陷
- 显式知识层的价值在于：知识**不随 agent 退役而消失**，且**可被多方检查与修订**

## 关键洞察
1. **"记忆 ≠ 知识"** —— 这是本文最锋利的区分。当前"agent memory"系统（把记录存起来、检索出来、拼进 prompt）是**检索系统**，不是**知识系统**。知识要求**被处理**：被抽象、被条件化、被修订、被组合。
2. **agent 的快速换代正在制造知识债务** —— 每个 agent 数月即退役，而知识本应跨世代累积。参数里的知识随退役消失，这是**架构级的知识流失**，而非工程疏漏。
3. **内化被长期忽视的原因是可理解的但不可接受的** —— 发现和使用都有清晰的即时收益（"agent 做到了 X"），而内化的收益体现在**跨世代、跨系统**的时间尺度上。这类收益在现有评测周期里无法被度量，因此被系统性地优先排序掉。
4. **保条件概念化对 LLM 时代尤其关键** —— 上下文窗口变长让"堆更多记录"变得可行，但记录越多不等于理解越深。保留成立条件是**抽象不失真**的前提。
5. **与近期趋势的呼应**：昨日的 COT 抽取（RECAST 发现主流模型 CoT token 数为 0）、[[2026-11-02-2610.41604-real-computation-or-merely-naming-a-pre-registered-mechanism-audit-of-25]] 的"模块名≠模块计算"，都指向同一判断：**系统中存着东西 ≠ 东西在起作用**。知识中心 AI 的"内化"正是这条原则的架构级版本。

## 局限性
- 立场论文，无实证验证
- "独立于任何单一 agent 的知识层"在**权限、激励、归属**上如何组织（谁维护？谁有权修订？修订如何审计？）是未解的硬问题
- 保条件概念化在实践中如何判定"条件被保留"，缺少可操作定义
- 与"参数化知识"路线的成本对比未量化

## 适用场景
- 长期演进的多 agent 系统的架构设计
- 知识库 / 记忆系统的产品定位（是检索层还是知识层）
- 研究议程规划：把"内化"作为独立研究方向

## 相关工作
- [[Agent Memory]] — Agent 记忆系统
- [[Knowledge-Centric AI]] — 知识中心 AI
- [[RAG]] — 检索增强生成
- [[Concept Learning]] — 概念学习
- [[Abductive Reasoning]] — 溯因推理
- [[Mechanism Audit]] — "存在 ≠ 起作用"（11-02 日相关）

---
#LLM #Research #Knowledge-Management #Agent-Memory #Position-Paper #arXiv-2611
