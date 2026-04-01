# Human-Like Lifelong Memory: 神经科学启发的 LLM 记忆架构

## 元信息
| 标题 | Human-Like Lifelong Memory: A Neuroscience-Grounded Architecture for Infinite Interaction |
|------|------|
| 作者 | Diego Cesar Lerma Torres |
| 链接 | [原文](https://arxiv.org/abs/2603.29023) |
| arXiv | arXiv:2603.29023 [cs.CL] |
| 会议 | MemAgents Workshop, ICLR 2026 |
| 领域 | LLM记忆 · 架构设计 |

## 核心创新点
LLM 缺乏持久、结构化的长期记忆。扩展 context window 并不能解决此问题——最新证据表明，仅靠 context 长度就会使推理退化高达 85%。

提出基于神经科学理论的记忆框架：**互补学习系统理论 (Complementary Learning Systems)**、**认知行为治疗信念层次**、**双过程认知**、**模糊痕迹理论**。

## 三大设计原则

### 1. 记忆具有 valence（效价），不仅是内容
- 预计算的**情绪-关联摘要（valence vectors）**，组织在贝叶斯认知模型启发的信念层次中
- 在 deliberation 之前实现即时定向

### 2. 检索默认 System 1，系统 2 升级
- **自动扩散激活**和被动 priming 作为默认
- 仅在需要时进行**有意检索**
- **分级认知状态（graded epistemic states）** 从结构上解决 hallucination

### 3. 编码是主动的、存在的、反馈依赖的
- **丘脑网关 (thalamic gateway)** 标记并路由信息到各存储区
- Executive 通过**好奇心驱动探究 (curiosity-driven investigation)** 而非被动暴露形成 gists

## 七大功能属性
论文定义了任何实现必须满足的七个功能属性：
1. 持久性（Persistent）
2. 选择性检索（Selective retrieval）
3. 情感效价编码（Affective valence encoding）
4. 层级组织（Hierarchical organization）
5. 系统1/2 双模式（Dual-mode System 1/2）
6. 主动编码（Active encoding）
7. 经验成本递减（Cheaper with experience）

## 核心洞察
> 随着时间推移，系统趋向 System 1 处理——临床专业知识的计算类比——产生的交互随经验变得更便宜，而非更贵。

这与当前 LLM 的 context 累积成本模型（随 token 数增加而线性甚至超线性增长）形成鲜明对比。

## 与现有方法对比
| 方法 | 问题 |
|------|------|
| 扩展 Context Window | context 长度增加导致推理退化 85% |
| RAG | 检索质量不稳定，hallucination 仍然存在 |
| 本文框架 | valence-tagged 记忆 + 双系统检索 + 主动编码 |

## 标签
#LLM架构 #记忆系统 #神经科学 #长程交互 #推理
