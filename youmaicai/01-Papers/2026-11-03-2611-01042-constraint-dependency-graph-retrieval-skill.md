# Constraint Dependency Graph Retrieval for Compliance Detection on Long SKILL Documents

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | Constraint Dependency Graph Retrieval for Compliance Detection on Long SKILL Documents |
| 作者 | Shuaitao Zhao, Feng Ni, Lichao Ma, Yuchen Wei, Shuaike Li, Jiaye Lin, Fei Han, Yang Wei, Lu Pan |
| 链接 | [原文](https://arxiv.org/abs/2611.01042) |
| arXiv | arXiv:2611.01042 |
| 类别 | cs.AI |
| 发表时间 | 2026-10-31 |
| 会议 | arXiv preprint |
| 评分 | 8 |

## 核心贡献
1. **SkillCDG 框架**：将每份 SKILL 文档（标准操作规程 SOP）重构为**约束依赖图（Constraint Dependency Graph, CDG）**，把规则检索从**相似度匹配**改为**闭包选择（closure-based selection）**，适配部署时的上下文预算。
2. **图的构建方式**：每条原子规则被**锚定到其源文本片段（source text span）**作为图节点；**强制前置依赖关系（mandatory prerequisite relations）是唯一的边类型**——这种极简的图结构保证了闭包在语义上"条件完备"。
3. **检索 + 判定的联合优化**：检索阶段用**组相对策略优化（group-relative policy optimization）**训练，配合由"输出格式有效性 + 下游裁决正确性"组成的**可验证奖励**，并以**闭包非空（closure non-emptiness）作为有效性门控**；同时用**选择性在线策略蒸馏（selective on-policy distillation）**把教师监督集中在**高熵推理 token** 上，并**始终包含裁决（verdict）与终止（termination）token**，以提升裁决准确率。
4. **实验验证**：在 **3 个企业数据集**与 **2 个公开基准**上，SkillCDG 在**准确率与 F1** 上均优于**全文基线**与**基于检索的基线**。

## 问题背景
LLM agent 需要依据企业文档（本文称之为 SKILL 文档，实为标准操作规程 SOP）来执行业务操作，这些文档规定"操作放行前需要验证哪些条件、需要执行哪些动作"。问题在于：长且**交叉引用密集**的 SKILL 文档会超出小型部署审计器的上下文预算。此时**基于相似度的检索会引入无关规则，同时遗漏强制前置条件**；而且两阶段审计策略中，**检索阶段拿不到任何可训练信号**（监督只落在最终判定上）。因此需要一个既满足预算约束、又保证"前提条件不遗漏"的检索机制，并且要能对检索器本身进行端到端训练。

## 方法

### 1. 约束依赖图（Constraint Dependency Graph）
- **节点**：一条原子规则 ↔ 一个源文本片段（anchor 到原文 span，便于溯源与审计）。
- **边**：**唯一一种边类型——强制前置依赖（mandatory prerequisite relation）**。
- **种子激活**：由策略生成的**检索关键词**激活**种子规则**（seed rules）。
- **闭包扩展**：对种子规则求**依赖闭包（dependency closure）**，得到在给定上下文预算下的**紧凑且条件完备（conditionally complete）**的规则上下文。

### 2. 联合优化方案
检索与判定通过共享的图结构联合优化，包含两个训练机制：

**(a) 组相对策略优化（GRPO）**
- 作用于**检索阶段**（这是关键：此前检索阶段无可训练信号）。
- 奖励为**可验证奖励**，由两部分组合：
  - **输出格式有效性**（output-format validity）
  - **下游裁决正确性**（downstream verdict correctness）
- **闭包非空（closure non-emptiness）作为有效性门控（validity gate）**：只有生成非空闭包的样本才被计入有效奖励/训练。

**(b) 选择性在线策略蒸馏（selective on-policy distillation）**
- 教师监督只施加于**高熵推理 token**（high-entropy reasoning tokens），即模型自身不确定的推理位置。
- **裁决 token 与终止 token 始终被包含**在蒸馏监督中，以保证裁决准确率与稳定的停止行为。

## 实验结果

| 设置 | 结果 |
|------|------|
| 评测数据集 | **3 个企业数据集** + **2 个公开基准** |
| 对比基线 | 全文（full-document）基线、基于检索（retrieval-based）基线 |
| 指标 | 准确率（accuracy）、F1 |
| 结果 | SkillCDG 在准确率与 F1 上**均优于两类基线** |

摘要未给出具体数值、三个企业数据集与两个公开基准的名称，也未给出基线系统的具体名称。

## 关键洞察
1. **"省略强制前置条件"比"引入无关规则"更致命**：相似度检索天然偏向语义相似但会丢依赖链，而合规判定中漏掉一个前置条件就直接导致违规通过。闭包选择把"完整性"变成结构性保证，而非事后启发式修补。
2. **只保留一种边类型是一种刻意的简洁性设计**：不做依赖类型分类，就避免了依赖语义误标注带来的错误传播，且闭包天然给出条件完备的最小规则集，适配上下文预算。
3. **把检索纳入可训练回路是架构性收益**：GRPO + 可验证奖励（格式 + 下游裁决正确性）让检索器第一次拿到梯度信号；闭包非空门控则防止策略学到"输出空闭包以规避错误"这一退化解。
4. **蒸馏监督的选择性投放**：只在高熵 token 上蒸馏可把教师预算集中在决策点，而保留裁决/终止 token 的强制监督则是为"答案可靠性"单独兜底——这是精度与效率的分离设计。

## 局限性
- 摘要未披露具体数值改进幅度，也未列出数据集与基线名称，可复现性信息不足。
- 依赖 SKILL 文档具有**清晰显式的强制前置关系**这一强假设；依赖若隐含在自然语言推理中（而非显式标注/结构化），图构建将不可行。
- 图的构建与维护需要文档本身具备结构化程度；对非 SOP 类文档的泛化性未验证。
- GRPO 训练需要可验证的下游裁决奖励，依赖企业数据中真实裁决标签的可得性。
- 未说明规则数量极大时的闭包计算开销与图构建的预处理成本。
- arXiv preprint，未经同行评审。

## 适用场景
- 企业 SOP / 合规审计型 LLM agent，尤其是**上下文预算受限的小模型部署**。
- 需要**可追溯**判定依据的场景（图节点锚定源文本 span）。
- 存在明确"前置条件→动作"依赖链的流程：金融风控、医疗分诊、运维变更审批、工业操作放行。
- 需要端到端训练检索器而非仅做 prompt-level 检索的团队。

## 相关工作
- [[Retrieval-Augmented Generation]] — RAG 与上下文预算约束
- [[GraphRAG]] — 以图结构组织检索
- [[Constraint Satisfaction]] — 约束求解与依赖闭包思想
- [[Group Relative Policy Optimization]] — GRPO 强化优化
- [[On-Policy Distillation]] — 在线策略蒸馏与高熵 token 监督
- [[Chain-of-Thought]] — 推理 token 与裁决 token 的区分
- [[Compliance Detection]] — 合规性判定
- [[LLM Agents]] — 智能体执行 SOP

---
#LLM #Research #Compliance #Graph-Retrieval #GRPO #Distillation #arXiv-2611
