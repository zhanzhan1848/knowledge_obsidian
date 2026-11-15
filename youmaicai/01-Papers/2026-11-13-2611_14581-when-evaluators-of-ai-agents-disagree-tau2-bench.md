---
title: "When Evaluators of AI Agents Disagree: An Empirical Study of Native Scoring, LLM Judges, and Commit-Boundary Checks on tau2-bench"
authors: ["Sungbin Im"]
date: "2026-11-13"
arxiv: "2611.14581"
arxiv_url: "https://arxiv.org/abs/2611.14581"
pdf_url: "https://arxiv.org/pdf/2611.14581"
categories: ["cs.SE", "cs.AI", "cs.CR"]
tags: ["llm-judge", "evaluation", "tau2-bench", "agent-safety", "verification"]
venue: "Empirical Software Engineering (投稿中)"
status: "已读"
---

# When Evaluators of AI Agents Disagree: An Empirical Study of Native Scoring, LLM Judges, and Commit-Boundary Checks on tau2-bench

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | When Evaluators of AI Agents Disagree: An Empirical Study of Native Scoring, LLM Judges, and Commit-Boundary Checks on tau2-bench |
| 作者 | Sungbin Im |
| 链接 | [原文](https://arxiv.org/abs/2611.14581) |
| arXiv | arXiv:2611.14581 |
| 分类 | cs.SE, cs.AI, cs.CR |
| 发表 | Submitted to Empirical Software Engineering（EMSE，投稿中） |
| 篇幅 | 38 页，3 图，11 表；含 ancillary 附件（Online Resource 1） |
| 代码 | 复现包：https://doi.org/10.5281/zenodo.23683806（traces, code, prompts, labels 全部公开） |

## 核心贡献
1. **指出实践中的一个被普遍默认却未经检验的假设**：agentic workflow 有两种评测方式——**benchmark 式**（把最终状态与 gold answer 比对）与**部署式**（LLM judge 读 transcript 做判断），**实践把两者当作可互换的**。本文首次系统测量二者是否等价。
2. **在 tau2-bench 的 airline 与 retail 域上跑了 2,160 个 episode**，并**记录每一次数据库写入（every database write）**——这是能做"commit-boundary check"的前提。
3. **提出 boundary evaluator**：一个**最小化的规则式检查**——判断"该发生的写入是否期望发生"与"trace 中是否发生了写入"，**不含任何模型调用**。
4. **用四种方式打分每个 episode**：native scoring（对 gold state）、LLM judge、judge + policy document、boundary evaluator。
5. **发现 judge 与 native scoring 的一致率仅 56.2%**，且**在 11 个存在禁止写入（forbidden write）的 episode 中，judge 放过了 10–11 个**；而**零模型调用的 boundary evaluator 全部捕获**。
6. **识别出 gates 失效的机制性原因**：gates 的 evidence digest **丢失了 order status 与 customer authentication 信息**，导致合法请求被误拒。

## 方法 / 技术细节
### 实验设计
- **环境**：tau2-bench，**airline** 与 **retail** 两个域。
- **规模**：**2,160 episodes**，逐条记录**所有数据库写入**。
- **人工标注**：**2 名标注者独立标注 120 个 episode**，标注三个维度：
  1. **task correctness**（任务正确性）
  2. **policy compliance**（策略合规性）
  3. **commitment correctness**（承诺正确性）

### 四种打分方式
| 方式 | 说明 |
|------|------|
| Native scoring | 对照 gold state（benchmark 式） |
| LLM judge | 读 transcript 判断（部署式） |
| Judge + policy | 给 judge 额外提供 policy document |
| Boundary evaluator | 纯规则：期望写入 vs trace 中实际写入，**无模型调用** |

另加一个 **"更强的 judge"** 作为对照上界。

### 分析角度
- **judge 的自一致性（repeat its verdict）**：同一 verdict 重复的比例。
- **judge 与 native scoring 的一致率**。
- **三种 gate（verification / correction / safe-termination）** 对禁止写入率的影响。
- **trace 层面的机制分析**（gates 的 evidence digest 缺了什么）。

## 实验结果
- **judge 自一致性：98.2%**——同一 episode 重复判定几乎不变，**说明问题不是随机性，而是系统性偏差**。
- **judge 与 native scoring 一致率：56.2%**——接近随机猜测（对于二分类而言）。
- **禁止写入出现于 11 个 episode**；**judge 放过了 10–11 个**（有/无 policy 或 transcript 均如此）；**更强的 judge 仍放过 6 个**。
- **boundary evaluator 捕获全部 11 个**；**没有任何 judge 在人工标签上显著超过它**。
- **无 gates 时禁止写入发生率为 11.1%**；**verification / correction / safe-termination gates 未显著降低该比例**。
- **机制线索**：gates 的 evidence digest **丢弃了 order status 与 customer authentication**，导致合法请求被拒（false rejection）。

## 关键数字速览
| 指标 | 数值 |
|------|------|
| 评测 episode 数 | 2,160 |
| 人工标注 episode 数 | 120（2 名标注者独立标注） |
| Judge 自一致性 | 98.2% |
| Judge 与 native scoring 一致率 | 56.2% |
| 存在禁止写入的 episode | 11 |
| Judge 放过数 | 10–11 / 11 |
| 更强 judge 放过数 | 6 / 11 |
| Boundary evaluator 捕获数 | 11 / 11 |
| 无 gates 时禁止写入率 | 11.1% |
| Gates 对该率的降低 | 不显著 |
| 论文篇幅 | 38 页 / 3 图 / 11 表 |

## 局限性
- 单一 benchmark（tau2-bench）、单作者、2 个域；结论外推到其他 agent 场景需谨慎（推测）。
- 人工标注仅 **120 个 episode**、**2 名标注者**，未报告标注者间一致性（kappa）；**"无 judge 显著超过 boundary evaluator"的判定受限于这一样本量**（推测）。
- 未评估 boundary evaluator 在**更复杂/非确定性的写入期望**下的适用性——它本质上是二值、可枚举的检查，对开放式任务是否成立未知（推测）。
- **11.1% 的禁止写入率本身可能反映被测 agent 本身的弱策略**，而非评估器问题；论文的焦点在评估器，但读者容易误读（推测）。
- 更强的 judge 只报告"仍放过 6 个"，未说明其模型/配置（推测）。

## 与已有工作的关系 / 启示
本文与 LLM-as-a-Judge 的可靠性研究（位置偏见、self-enhancement、verbosity bias）同属一脉，但视角更"软件工程"：**它不追问 judge 判断准不准，而是追问"我们是否应该用 judge 来替代可执行的状态断言"**。作者还贡献了 ME（Empirical Software Engineering）式的做法——发布 traces、code、prompts、labels 与 DOI 复现包，这种可审计性在 agent 评测论文里仍然罕见。

## 相关论文
- [[ToolTurns: Benchmarking LLM Agents in Multi-Turn Dialogue]]
- [[Cleaning an Agent's History Hurts When the World Still Holds the Error]]
- [[StateAlign: Internalizing State-Aware Decision-Making for Reliable Multi-Turn Tool Agents via Reinforcement Learning]]

## 我的评注
这篇论文的分量比它的标题看起来更重，因为它打掉了一个我们整个行业默认成立的假设：**"benchmark 分数"和"judge 分数"可以互相替代**。56.2% 的一致率加上 98.2% 的自一致性，这组数字组合得非常漂亮——它排除了"judge 随机性"这个无害的解释，直接指向**系统性偏差**：judge 会稳定地、、自信地漏掉真实的越权写入（11 个里放过 10–11 个），而更强的 judge 也只抓到一半。

最刺眼的其实是那个**零成本的替代方案**：一个纯规则的 boundary check（期望写入 vs 实际写入）捕获率 100%，而 LLM judge 做不到。这里的教训极其朴素却常被忽视：**当正确性可以用确定性的状态断言表达时，就不要用模型去判断**。而且三个 gate（verification / correction / safe-termination）在 11.1% 的禁止写入率面前毫无作用——更糟的是 trace 显示 gate 的 evidence digest 掉了 order status 和 customer authentication，**gate 反而在拒绝合法请求**。这几乎是所有"用摘要式证据做安全检查"的系统的通病：摘要丢信息，检查就误报，而误报又推动人们放松 gate，最终形成"看起来有安全机制、实际没有"的假象。

我会给所有做 agent 评测/部署的团队一条具体建议：**优先把"这一步该不该写库"这类判定下沉为确定性规则，把 LLM judge 留给无法规则化的部分**；同时任何声称"我们部署了 verification gate"的系统，都应该给出 gate 拒绝合法请求的 false-rejection 率，而不只是"拦截了多少攻击"。局限上，120 条人工标注 + 单 benchmark 让结论强度受限，但考虑到 11/11 vs 10–11 的差距如此悬殊，方向性结论我认为已经足够稳固。

---
*采集时间：2026-11-13 | 油麦菜 🥬 自动精读*
