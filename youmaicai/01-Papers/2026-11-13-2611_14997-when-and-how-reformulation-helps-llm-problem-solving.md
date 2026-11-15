---
title: "Same Task, Different Statement: When and How Reformulation Helps LLM Problem Solving"
authors: ["Wentao Zhang", "Xiaoyu Zhang", "Chengwei Liu", "Yutao Hu", "Tao Zhang", "Junsheng Wu", "Hongping Gan", "Yang Liu"]
date: "2026-11-13"
arxiv: "2611.14997"
arxiv_url: "https://arxiv.org/abs/2611.14997"
pdf_url: "https://arxiv.org/pdf/2611.14997"
categories: ["cs.AI"]
tags: ["prompting", "reformulation", "problem-solving", "chain-of-thought", "reasoning"]
venue: ""
status: "已读"
---

# Same Task, Different Statement: When and How Reformulation Helps LLM Problem Solving

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Same Task, Different Statement: When and How Reformulation Helps LLM Problem Solving |
| 作者 | Wentao Zhang, Xiaoyu Zhang, Chengwei Liu, Yutao Hu, Tao Zhang, Junsheng Wu, Hongping Gan, Yang Liu |
| 链接 | [原文](https://arxiv.org/abs/2611.14997) |
| arXiv | arXiv:2611.14997 |
| 分类 | cs.AI |
| 发表 | 摘要未披露（comment 为空） |
| 篇幅 | 摘要未披露 |
| 代码 | 摘要未披露 |

## 核心贡献
1. 系统研究"**重述题目（restating / reformulating the problem statement）**"这一人类解题习惯是否对 LLM 同样有效，并给出条件化答案。
2. 提出并区分**三类重写**：**Decomposition**（显化隐藏子目标）、**Typed Reformulation**（把任务投射到更合适的求解框架）、**Concept Reduction**（剥离表层细节、暴露任务结构）。
3. 给出关键的负面结论：**没有任何一种重写能对所有问题都有帮助，错误的重写反而会伤害准确率**；但效果遵循清晰模式，且可学习出一个可迁移的**固定规则**。

## 方法 / 技术细节

### 三类重写的定义与约束
合法的重写必须**保持含义、约束与正确答案不变**（keep the meaning, the constraints, and the correct answer unchanged）。

| 重写类型 | 机制 |
|------|------|
| **Decomposition** | 把隐藏的子目标显式化 |
| **Typed Reformulation** | 将任务转铸（cast）到更合适的**求解框架（solving frame）**中 |
| **Concept Reduction** | 移除表层细节，暴露任务结构 |

### 评测设置
- **8 个 benchmark**，覆盖 **math、logic、code** 三类。
- **8 个模型**。
- 所有实验在**相同的 chain-of-thought solving prompt** 下进行（控制求解提示变量，只变题目表述）。

### 评测的两个层次
1. **Oracle**：事后（after the fact）挑选最佳重写，作为效果上界；
2. **Learned fixed rule**：从一组问题上学到的固定规则，用于考察**迁移（transfer）**能力——在规则决定"要重写"的问题上得分，以及在规则决定"不重写/盲目重写"的问题上的损失。

## 实验结果
- **Oracle 上界**：平均准确率提升 **+27.6%**。
- **无普适性**：没有单一重写能对所有问题都有帮助；**不匹配的重写会损害表现**。
- **Learned fixed rule**：
  - 在其选择重写的问题上获得 **+11.0%** 的增益；
  - 而**盲目重写（blind rewriting）在规模相当的问题集上损失 5.6%**。
- **可迁移性**：从一组问题上学到的简单固定规则，可将部分增益**迁移到新问题**。
- 核心结论：**重写不是通用的解题手段；真正的问题是"何时、如何"重写**。

## 关键数字速览
| 指标 | 数值 |
|------|------|
| Benchmark 数 | 8（math / logic / code） |
| 模型数 | 8 |
| Oracle 重写平均准确率增益 | +27.6% |
| 学得规则在"选择重写"的问题上的增益 | +11.0% |
| 盲目重写在规模相当问题集上的损失 | −5.6% |

## 局限性
- 重写由模型生成还是人工构造、是否受限于改写模型自身能力，摘要未说明（推测）。
- 8 个模型 × 8 个 benchmark 的规模有限，跨任务族（更长的 agentic 任务、多轮任务）结论未验证（推测）。
- **Oracle 上界（+27.6%）与可实现增益（+11.0%）之间的巨大差距**说明当前"判断何时重写"的机制还很弱，这既是局限也是最重要的开放问题。
- "盲目重写损失 5.6%"的实验设定（如何定义"规模相当的问题集"）需要正文核对（推测）。
- 摘要未给出逐 benchmark、逐重写类型的分解结果（推测）。

## 与已有工作的关系 / 启示
本文与 prompt engineering、自我反思（self-reflection）、以及"改写问题"类工作（如 restated question prompting、problem reframing）直接相关，但它的独特贡献是**把"何时改写"本身当作一个可学习、可迁移的决策问题**，并给出了"盲目改写的期望值为负"这一硬约束。

## 相关论文
- [[Prompting Strategies for Reasoning]]
- [[Self-Reflection in LLM Agents]]
- [[Chain-of-Thought Prompting]]

## 我的评注
这篇论文的价值在于**它的负面结论比正面结论更值钱**。+27.6% 的 oracle 上界是一个漂亮的数字，但真正 usable 的只有 +11.0%，而且这个收益的前提是模型**先判断该不该改写**；一旦放弃判断（blind rewriting），期望收益直接变成 **−5.6%**。这个对比精确地刻画了当前 agent/prompt 系统的真实处境：**"让模型先想想怎么问"是一个高方差策略，其方差来自判断器的误判，而判断器目前远不够可靠**——这与"self-reflection 不一定有帮助"的那条研究脉络一致，只是本文把它落到了"改写题面"这个更具体的操作上。三类重写的划分（Decomposition / Typed Reformulation / Concept Reduction）也提供了一个有用的诊断坐标：它隐含的假设是"错误的重写 = 用错了求解框架"，那么**一个自然的下一步就是让路由器直接预测"哪个 frame"，而不是"改不改"**——但摘要中 oracle（事后选最佳）远高于学得规则的事实说明，这一步的难点在判断而非生成。实践建议很明确：除非你有可靠的改写路由器，否则在 pipeline 里插入改写步骤是一个负期望的操作，尤其在下游已经包含反思/重试机制时，改写带来的边际收益容易被重复计算。

---
*采集时间：2026-11-13 | 油麦菜 🥬 自动精读*
