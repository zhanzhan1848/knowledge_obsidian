---
title: "Leaderboard Hacking: Preference-Based Model Evaluations are Vulnerable to Manipulation"
authors: ["Eve Fleisig", "Joachim Baumann", "Dylan Hadfield-Menell", "Dirk Hovy"]
date: "2026-11-13"
arxiv: "2611.14769"
arxiv_url: "https://arxiv.org/abs/2611.14769"
pdf_url: "https://arxiv.org/pdf/2611.14769"
categories: ["cs.AI"]
tags: ["evaluation", "leaderboard", "bradley-terry", "security", "manipulation"]
venue: ""
status: "已读"
---

# Leaderboard Hacking: Preference-Based Model Evaluations are Vulnerable to Manipulation

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Leaderboard Hacking: Preference-Based Model Evaluations are Vulnerable to Manipulation |
| 作者 | Eve Fleisig, Joachim Baumann, Dylan Hadfield-Menell, Dirk Hovy |
| 链接 | [原文](https://arxiv.org/abs/2611.14769) |
| arXiv | arXiv:2611.14769 |
| 分类 | cs.AI |
| 发表 | — |
| 篇幅 | — |
| 代码 | — |

## 核心贡献
1. **揭示 Arena 式排行榜的系统性可操纵性**：基于 Bradley-Terry 模型的成对偏好排名（LM Arena 及其各类模仿品）允许三类策略性行为——**策略性投票**（strategic voting，包括给无关模型投票）、**策略性提示**（strategic prompting，挑选对自己模型有利的 prompt）、**策略性提名**（strategic nomination，插入无关模型稀释排名）。
2. **证明这是 Bradley-Terry 偏好评估的结构性缺陷，而非实现 bug**：论文明确指出，这些问题对**任何**允许开放提示、投票或模型提交的偏好式评估都成立——不是 Arena 的特例。
3. **在公开排行榜数据上实证复现并归因**：分析导致脆弱性的具体条件，并针对每种攻击给出相应的防护方案。

## 方法 / 技术细节

### 三类攻击机制

- **策略性投票（Strategic Voting）**
  单个投票者可以提交那些「会提升目标模型排名」的投票，包括投给与目标模型**完全无关**的模型。由于 Bradley-Terry 聚合是基于相对两两比较的胜率拟合，这类「填充票」会改变所有受影响模型的隐含评分尺度。

- **策略性提示（Strategic Prompting）**
  提交者自行选择送入比较的 prompt。允许自由提示就意味着提交者可以只提交那些**自己模型表现更好**的提示，而放弃那些自己不利的提示——本质上是提示空间上的选择性采样（cherry-picking），但被包装成了「合法的用户行为」。

- **策略性提名（Strategic Nomination）**
  通过插入大量与目标无关的模型进入比较池，稀释目标模型的相对位置，使基于比较图的排名发生系统性偏移。

### 为什么会失效：Bradley-Terry 的隐含假设

Bradley-Terry 模型假定每个投票者代表一个**独立且无偏**的偏好样本。当上述三个自由度（投给谁、问什么、何时加入）被开放给参与方时，BT 聚合的统计假设即被破坏——排名不再估计「真实质量」，而估计「参与者的操纵策略之和」。论文的关键结论正是：**这不是可以通过修补投票流程解决的实现问题，而是 BT 这一偏好聚合范式在开放式环境下的固有脆弱性。**

## 实验结果
- 在**公开排行榜的真实数据**上复现全部三类攻击的效果。
- **单一攻击**可使模型排名提升最多 **15–20 名**。
- **三类攻击叠加**，模型排名最多可被提升 **45 名**。
- 该效应**对几乎所有被测模型都成立**——不是个别模型的特例。

## 关键数字速览
| 指标 | 数值 |
|------|------|
| 单类攻击最大排名提升 | 15–20 名 |
| 三类攻击叠加最大排名提升 | 45 名 |
| 攻击覆盖面 | 几乎所有被测模型 |
| 验证数据 | 公开排行榜真实数据 |

## 局限性
- 摘要未披露具体实验细节（使用的排行榜平台、参与方模拟方式、显著性检验）。
- 论文侧重**结构性问题**，防护方案的完备性需看正文实验。
- 攻击在真实恶意参与者持续对抗下能走多远，与一次性操纵不可直接等同。

## 与已有工作的关系 / 启示
把「排行榜被污染」从**运维/作弊检测问题**上升为**评估方法论问题**：只要偏好排名允许开放输入（提示、投票、提名），BT 聚合就存在被策略性利用的孔洞。这与 [[2611_14581]] 中「评估者选择决定结论」的结论互相印证——**你用什么方式聚合偏好，就决定了你能测到什么**。

## 相关论文
- [[2611_14581]]（When Evaluators of AI Agents Disagree — 评估程序本身是结果的一部分）
- [[2611_15925]]（ShadowBench — 知识评测中的词汇锚定）
- [[2603_28590]]（MonitorBench — 思维链可监控性）

## 我的评注
这篇论文的价值不在于「发现有人作弊」——那显然不新鲜——而在于把攻击面**归因到 BT 聚合的结构假设本身**，并证明任何「允许开放提示 + 投票 + 提交」的偏好式排行榜都在射程内。这意味着现有的排行榜分数应当被当作**上界估计而非质量估计**来使用，且排名相近的两个模型在榜单上的差距几乎没有统计意义。对从业者的直接含义是：不要用公开 Arena 排名做选型决策，除非该平台实施了提示白名单、投票速率限制与提交者身份门槛。论文顺带提示了一件事——**任何基于人类偏好的度量，一旦面向对抗性环境开放，都会退化为对操纵成本的测量**。

---
*采集时间：2026-11-13 | 油麦菜 🥬 自动精读*
