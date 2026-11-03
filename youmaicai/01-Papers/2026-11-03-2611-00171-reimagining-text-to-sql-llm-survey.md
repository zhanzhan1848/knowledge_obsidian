# Reimagining Text-to-SQL: A Survey of Large Language Model Architectures and Strategies

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | Reimagining Text-to-SQL: A Survey of Large Language Model Architectures and Strategies |
| 作者 | Shikhar Dave, Bhaskarjit Sarmah, Stefano Pasquali |
| 链接 | [原文](https://arxiv.org/abs/2611.00171) |
| arXiv | arXiv:2611.00171 |
| 类别 | cs.AI |
| 发表时间 | 2026-10-30 |
| 会议 | arXiv preprint |
| 评分 | 7 |

## 核心贡献
1. **统一分类体系**：提出包含五种范式的 Text-to-SQL 综述框架——in-context learning、监督微调与参数高效微调（PEFT）、agentic 与工具增强编排、检索增强生成（RAG）、强化学习（RL）。
2. **多维刻画方法**：用三个正交维度描述每个方法——模型粒度（单体 monolithic vs. 模块化 modular）、监督层级（零样本 / 微调 / 强化）、推理风格（直接解码 vs. 分解式多步推理）。
3. **系统梳理评测与挑战**：分析评测指标、数据集，并讨论领域泛化、效率、真实部署等开放挑战；还专门考察语义层（semantic layer）在生产系统中的作用。
4. **覆盖 100+ 论文**：聚焦 2022–2026 年间发表的文献与技术资源。

## 问题背景
Text-to-SQL 系统将自然语言问题翻译为可执行的 SQL 查询，使关系型数据的访问民主化。早期方法依赖手工规则与模板匹配，随后神经方法引入编码器-解码器架构、schema linking 与约束解码来应对日益复杂的查询。大语言模型的出现（如 ReFoRCE、Agentar-Scale-SQL、Snowflake 的 Arctic-Text2SQL-R1、模块化的 XiYan-SQL 框架）大幅推进了该领域，在 Spider、Spider 2.0、BIRD 等挑战性基准上把执行准确率推向新的 SOTA。综述的空白在于：这些路线彼此分散，缺少统一的分类与横比视角。

## 方法
本工作是一篇**综述（survey）**，而非提出新模型或新算法。

**综述范围与时间窗**：跨越 2022–2026 年，收录 100+ 篇论文与技术资源。

**核心分类法（五种范式）**：
1. **In-context learning**：不更新权重，仅通过上下文示例引导。
2. **监督微调与参数高效微调**：SFT 与 PEFT（如 LoRA 类方法）。
3. **Agentic 与工具增强编排**：把任务拆成多个专长 agent，agent 间通信并动态分配子任务。
4. **检索增强生成（RAG）**：检索 schema/文档作为生成条件。
5. **强化学习（RL）**：以执行结果等信号做优化。

**模块化框架的子问题分解**：综述将模块化 pipeline 明确拆为四个子问题——
- schema 检索（schema retrieval）
- 基于 sketch 的生成（sketch-based generation）
- 修复（repair）
- 排序（ranking）

**三维刻画**：
- 模型粒度：单体 vs. 模块化；
- 监督层级：zero-shot / fine-tuned / reinforcement-based；
- 推理风格：直接解码 vs. 分解式多步推理。

**额外议题**：
- 评测指标与数据集的系统分析；
- 开放挑战：领域泛化（domain generalization）、效率、真实世界部署；
- **语义层**在生产系统中的角色；
- **负责任 AI**：随着 LLM 越来越多地直接访问敏感数据库，综述讨论了相应的安全实践。

摘要未给出该综述具体的表格数值、分类计数分布或图表编号。

## 实验结果
本工作为文献综述，不含自建实验。摘要中提及的**被综述系统的执行准确率**达到 SOTA 水平，代表性系统为 ReFoRCE、Agentar-Scale-SQL、Arctic-Text2SQL-R1、XiYan-SQL，代表性基准为 **Spider、Spider 2.0、BIRD**。

摘要未给出具体准确率数值或排名。

## 关键洞察
1. **范式演进是"分解"驱动的**：从规则 → 神经 → LLM 的主线，不只是模型变大，而是任务分解粒度变细（模块化四阶段 pipeline 与多 agent 协同）。分类法把这一趋势形式化为「单体 vs. 模块化」与「直接解码 vs. 多步推理」两条轴。
2. **监督层级是独立于模型粒度的轴**：同一系统可以既是模块化又是零样本或 RL 驱动，说明三个维度是正交的设计空间而非演进阶段——这为组合式系统设计提供了组合框架。
3. **生产落地的真正瓶颈往往在 LLM 之外**：综述把「语义层」与「敏感数据库访问的负责任 AI」单列，暗示瓶颈已从模型能力转向工程与治理层面。

## 局限性
- 综述性工作，无可复现的实验验证；分类法的主观切分存在争议可能。
- 摘要未说明其分类的量化分布与文献纳入的检索协议（数据库、关键词、纳入/排除标准均未提及）。
- 聚焦 2022–2026 的 LLM 驱动工作，早期神经/规则方法的讨论较为简略。
- BIRD、Spider 2.0 等基准上的具体进展缺乏数值对比，无法判断各范式的实际边际收益。
- 摘要未讨论多语言 Text-to-SQL、SQL 方言迁移、方言特性等常见子问题（无法据此断言论文未涉及，仅摘要未提及）。

## 适用场景
- 为 Text-to-SQL / NL2SQL 系统选型做技术选型参考（可直接对照五范式与三维度定位候选方案）。
- 设计模块化 NL2SQL pipeline（schema 检索 → sketch 生成 → 修复 → 排序）时的架构参考。
- 了解该领域的开放挑战与评测基准现状，用于研究立项或综述写作。
- 涉及 LLM 直连敏感数据库的产品，需要语义层与负责任 AI 设计建议时。

## 相关工作
- [[Text-to-SQL]] / [[NL2SQL]]
- [[Spider]] · [[Spider 2.0]] · [[BIRD]] 基准
- [[Schema Linking]] · [[Constrained Decoding]]
- [[Retrieval Augmented Generation]]
- [[Agentic RAG]] · [[Multi-Agent Systems]]
- [[Parameter-Efficient Fine-Tuning]]（LoRA）
- [[Reinforcement Learning from Human Feedback]]
- [[ReFoRCE]] · [[XiYan-SQL]] · [[Arctic-Text2SQL-R1]]

---
#LLM #Research #Text-to-SQL #Survey #arXiv-2611
