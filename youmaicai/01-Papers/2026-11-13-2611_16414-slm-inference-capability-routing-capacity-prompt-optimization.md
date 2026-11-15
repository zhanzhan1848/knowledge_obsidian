---
title: "Small Language Models for Inference-Capability Routing: Effects of Model Capacity and Prompt Optimization on Downstream Quality and Efficiency"
authors: ["Sailendra Kolluru", "Maheshkumar Duvvarapu"]
date: "2026-11-13"
arxiv: "2611.16414"
arxiv_url: "https://arxiv.org/abs/2611.16414"
pdf_url: "https://arxiv.org/pdf/2611.16414"
categories: ["cs.AI"]
tags: ["routing", "small-language-models", "efficiency", "prompt-optimization", "inference-cost"]
venue: ""
status: "已读"
---

# Small Language Models for Inference-Capability Routing: Effects of Model Capacity and Prompt Optimization on Downstream Quality and Efficiency

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Small Language Models for Inference-Capability Routing: Effects of Model Capacity and Prompt Optimization on Downstream Quality and Efficiency |
| 作者 | Sailendra Kolluru, Maheshkumar Duvvarapu |
| 链接 | [原文](https://arxiv.org/abs/2611.16414) |
| arXiv | arXiv:2611.16414 |
| 分类 | cs.AI |
| 发表 | 未标注会议（comment 提及 15 pages, 8 figures） |
| 篇幅 | 15 页，8 图 |
| 代码 | 未提及 |

## 核心贡献
1. **研究动机**：可选的推理（reasoning）、检索（RAG）、网页搜索（web search）、工具调用（tool use）能提升 LLM 回答质量，但**不加区分地开启它们会带来不必要的计算开销**。
2. **提出 prompt 驱动的小模型路由框架**：由 SLM 做出**四个相互独立的能力决策**，允许**每个 query 选择多个能力**（不是单选路由）。
3. **系统研究两个变量**：**router 容量（model capacity）** 与 **prompt 优化**，并追问一个关键问题——**分类指标的提升是否真的转化为下游效率收益**。
4. **得出"能力依赖（capability-dependent）"的核心结论**：不同能力对 router 容量和 prompt 设计的敏感度差异显著；**相似的分类 F1 并不意味着等价的下游行为**。

## 方法 / 技术细节
### 框架
- **Router**：Qwen2.5 系列小模型，容量从 **1.5B 到 14B**。
- **四个独立决策**：reasoning / calculator（计算器）/ RAG / web search。每个决策独立进行，因此一条 query 可同时启用多个能力。
- **Prompting 策略**：比较 **5 种 prompting 策略**。

### 下游评估
- 固定使用 **GPT-OSS-120B** 作为下游模型；
- **127 个问题**；
- 对每个能力分别采用**该能力专属的优化配置**（capability-specific optimized configurations）；
- 指标：分类 **F1**、下游 **BERTScore F1**、**token 消耗**、**延迟**。

### 关键测量细节（值得注意）
- **router 开销被单独测量，且在不同的推理环境中测量**，并明确指出**下游节省量不包含 router 开销**；router 开销**随 router 容量增加而上升**。

## 实验结果
### 分类层面
- **minimal prompting 下，增大 router 容量并不一致地改善分类性能**（并非单调）。
- **prompt 优化缩小了 reasoning 与 calculator 路由的容量差距**（小模型追平大模型）。
- **RAG 与 web search 从更大容量中获益更多**（容量差距仍较大）。
- **相似的分类 F1 ≠ 等价的下游行为**：false-positive 激活会带来**不必要的计算**，missed capability 则**降低答案质量**——两个方向的错误代价不对称。

### 下游层面（14B router，各能力优化配置）
- **BERTScore F1（均值）：0.8408**，而**全部能力全开时为 0.8418**——差 **0.001**，质量基本无损。
- **平均下游 token 消耗降低 68.7%：8,837 → 2,764 tokens**。
- **中位下游延迟降低 80.5%：9.79 秒 → 1.91 秒**。
- 上述节省**不含 router 开销**（router 开销在另一环境单独测量，且随容量上升）。

## 关键数字速览
| 指标 | 数值 |
|------|------|
| Router 模型 | Qwen2.5 1.5B–14B |
| 能力决策数 | 4（reasoning / calculator / RAG / web search） |
| Prompting 策略数 | 5 |
| 下游模型 | GPT-OSS-120B |
| 评测问题数 | 127 |
| 下游 BERTScore F1（14B router） | 0.8408（全开 0.8418） |
| 平均下游 token 降低 | 68.7%（8,837 → 2,764） |
| 中位下游延迟降低 | 80.5%（9.79s → 1.91s） |
| Router 开销 | 单独测量（不含在上述节省中），随容量上升 |

## 局限性
- 摘要未披露：5 种 prompting 策略的具体内容与各自 F1、各能力单独的 F1 与准确率、router 开销的具体数值与测量环境。
- **下游评估仅 127 个问题**，样本量偏小，BERTScore 0.8408 vs 0.8418 的差异是否在统计噪声内无法判定（推测）。
- **BERTScore 作为质量指标与实际正确性关联有限**，尤其对数学/事实类任务（推测）。
- **router 开销在"不同的推理环境"中测量**——这使得端到端净收益的陈述存在可比性缺口；且不同能力被"分别优化配置"评测，未测**同时启用多个能力时的干扰效应**（推测）。
- 仅基于 Qwen2.5 一个模型家族，router 结论泛化性未验证（推测）。

## 与已有工作的关系 / 启示
本文属于 **LLM routing / cascades** 文献的近期一支，特点是把"路由"从**模型选择**扩展到**能力选择**（选 reasoning 还是选 web search，而非选模型 A 还是模型 B），这在 agent 时代更贴近实际部署。它与 FrugalGPT、RouteLLM、以及各类 agent 成本优化工作形成对话，独特之处在于**同时把 prompt 优化当作容量替代品来研究**，并诚实地报告了 router 开销与下游节省不同环境测量的可比性问题。

## 相关论文
- [[ToolTurns: Benchmarking LLM Agents in Multi-Turn Dialogue]]
- [[StateAlign: Internalizing State-Aware Decision-Making for Reliable Multi-Turn Tool Agents via Reinforcement Learning]]
- [[Turning Multi-Agent Communication into Token-Level Credit with On Policy Self Distillation]]

## 我的评注
最实用的数字是 **68.7% token 节省 + 80.5% 延迟降低，而 BERTScore 只掉 0.001**——在必须开某个昂贵能力的前提下，**多开能力是纯浪费**这一结论对做 agent 成本优化的团队有直接价值。而且 14B router 就能做到，说明这不是"必须上大模型"的问题。

但我更看重的是那个**反直觉的容量结论**：minimal prompting 下，router 从 1.5B 加到 14B **并不一致地**提升分类性能。这意味着"把路由交给更大的 SLM"这个直觉是错的——路由器是一个**高度依赖 prompt 设计的分类器**，不是典型的"模型越大越强"的 scaling 任务。作者由此得出的实践结论（先看 error profile 和 routing overhead，再看分类 F1）非常正确，因为 false-positive 激活是纯浪费，而 missed capability 才伤质量，两个方向的代价完全不对称。

我要泼的冷水是**方法论可比性**：router 开销在"另一个推理环境"里单独测，意味着 8,837→2,764 这个数字**不是净收益**；真实净收益 = 68.7% 下游节省 − router 成本，而后者随容量上升。如果 14B router 的调用延迟很高，2,764 tokens 的下游节省未必赚。127 题 + BERTScore 这个组合也让我对 0.001 的质量差不敢妄言。总体而言这是一篇**方向对、结论克制、但需要更大规模复现**的工程研究。

---
*采集时间：2026-11-13 | 油麦菜 🥬 自动精读*
