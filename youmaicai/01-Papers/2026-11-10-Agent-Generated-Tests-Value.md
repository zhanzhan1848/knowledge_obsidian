---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, Software Engineering Agents, SWE-bench, Testing]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2602.07900
arxiv: 2602.07900
---

# Rethinking the Value of Agent-Generated Tests for LLM-Based Software Engineering Agents

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Rethinking the Value of Agent-Generated Tests for LLM-Based Software Engineering Agents |
| **作者** | 未提供（详见原文） |
| **发表** | arXiv preprint |
| **链接** | [原文](https://arxiv.org/abs/2602.07900) |
| **arXiv** | arXiv:2602.07900 |
| **分类** | cs.SE, cs.AI |
| **代码** | 未提供（使用公开的 SWE-bench Bash Only 榜单轨迹数据） |

---

## 核心贡献

> 用 5,000 条 mini-SWE-agent 轨迹实证检验「Agent 写的测试到底有没有用」：结论是——测试写得多少与是否解决任务几乎无关，但显著影响资源消耗，且测试文件里 print 语句远多于断言。

1. **大规模行为刻画**：分析 6 个强 LLM 在 SWE-bench Verified 上产生的 5,000 条轨迹（3,000 条基线 + 2,000 条提示改写配对），系统刻画「是否、何时、如何」写测试。
2. **GPT-5.2 例外**：Claude Opus 4.5 在 83.6% 的任务中写了测试文件且解决率最高（74.4%）；GPT-5.2 只在 **2.4%** 的任务中写测试文件，解决率却达 71.8%（仅低 2.6 pt）。
3. **测试内容分析**：用 Python AST 规则分析五个模型写出的测试文件——展示运行时值的 print 语句数量**远超**检查条件的断言。
4. **提示消融**：鼓励/抑制写测试的提示让 Agent 在 36.8%–93.2% 的任务上照做；但各模型解决数差异仅 0–13/500，无统计显著性，而其中 3 个模型的 API 调用/token 消耗差异显著。

---

## 技术方案

### 核心思想
本文不做干预实验去「证明」agent 写测试有用，而是先做**描述性刻画 + 配对提示对比**，回答一个此前被默认却缺乏证据的问题：agent 临时写的测试与任务结果、资源消耗之间是什么关系。RQ1 刻画 6 个模型（Claude Opus 4.5、Gemini 3 Pro、GPT-5.2、Kimi K2 Thinking、MiniMax M2、DeepSeek v3.2 Reasoner）在 mini-SWE-agent 脚手架下、500 个 SWE-bench Verified 任务上的 3,000 条基线轨迹的测试行为；RQ2 对测试文件做 AST 规则分析（断言条件分类、print 暴露的运行时信息分类）；RQ3 对其中 4 个模型改写提示（鼓励/不鼓励写新测试文件），得到 2,000 组同任务同模型的基线—改写配对。测试文件的检测采用确定性管线：识别通过 heredoc、echo/printf 重定向、以及可恢复路径与内容的 Python write 写入完整文件的命令，保留文件名以 test 开头或以 _test.py / tests.py 结尾的 Python 文件，路径相对 /testbed 归一化且每任务只计一次；后续整文件写入会更新已存内容，RQ2 分析每个文件的最后一个版本。作者特别强调这些比较是描述性的，不估计「写测试 → 成功」的因果效应。

### 关键公式
```math
\textbf{测试频率指标:}\quad
\text{Mean \#test files}=\frac{1}{|\mathcal{T}^{+}|}\sum_{t\in\mathcal{T}^{+}} A_t,
\qquad
\mathcal{T}^{+}=\{t\in\mathcal{T}: A_t>0\},\quad A_t=\#\text{distinct test files in task }t

\textbf{报告口径:}\quad
\text{Resolved / Unresolved 分别统计（Tasks w/ test files: count \& \%）}

\textbf{提示响应率:}\quad
\text{Compliance}=\Pr(\text{agent starts/stops writing test files as requested})
\in [36.8\%,\ 93.2\%]
```

### 关键组件
- **mini-SWE-agent 脚手架**：轻量、测试行为完全由模型自主决定，默认提示仅含「测试边界情况确保修复稳健」。
- **确定性测试产物检测管线**：heredoc / 重定向 / Python write 三类写入方式 + 文件名约定 + 路径归一化。
- **AST 规则分析**：断言条件分类与 print 揭示的运行时信息分类。
- **配对提示设计**：基线提示 vs 鼓励/抑制写测试的改写提示，同任务配对以控制任务难度。
- **资源度量**：API 调用次数与 token 使用量，与解决数并列比较。
- **官方评测**：SWE-bench 官方 harness（sb-cli）判定 resolved/unresolved。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 轨迹总数 | 5,000（3,000 基线 + 2,000 配对）；6 个模型 × 500 个 SWE-bench Verified 任务 |
| Claude Opus 4.5 | 解决率 **74.4%**（榜单第一），在 **83.6%** 的任务中写了测试文件 |
| GPT-5.2 | 解决率 **71.8%**，仅在 **2.4%** 的任务中写测试文件（唯一例外） |
| 模型间写测试频率差异 | 极大（从 2.4% 到 83.6%） |
| 同模型内 resolved vs unresolved 的写测试频率差异 | 很小（远小于模型间差异） |
| 测试文件内容 | 打印运行时值的语句数量**显著多于**断言检查 |
| 提示遵从率 | 36.8%–93.2% 的任务上 Agent 照提示开始/停止写测试 |
| 解决数差异（每模型，500 任务中） | 0–13 个，**无统计显著差异** |
| 资源差异 | 3 个模型的 API 调用/token 使用差异显著 |
| 修订运行成本 | 约 USD 1,600（2,000 条轨迹） |

---

## 局限性

- 明确声明：resolved/unresolved 的对比是描述性的，**不估计写测试对成功的因果效应**；提示实验也只改变「写不写」这一行为，不必然改变模型能力。
- 只用 6 个模型、mini-SWE-agent 单一轻量脚手架、500 个任务，结论对更强脚手架或更多模型的外部效度未知。
- 测试文件检测基于文件名约定与写入命令识别，可能漏检或误检非约定命名的测试。
- AST 分析仅覆盖 Python，断言/print 的语义分类基于规则而非执行。
- 改写提示运行在特定时间窗（部分模型相隔三个月运行），存在模型版本漂移风险。
- 未检验测试的**质量**（如是否能真正复现 issue），只统计数量与内容类型。

---

## 建议

- **是否推荐使用**：是（作为评测方法论与负面结论的参考很有价值）
- **适用场景**：设计 SWE-agent 评测协议、评估 agent 的测试行为、以及给「agent 写测试」这一常见做法提供证据基础的读者。
- **值得复现**：是（数据与脚手架均公开，成本可控；结论对设计 agent 脚手架与预算策略有直接指导）

---

**相关论文**：[[SWE-bench]], [[mini-SWE-agent]], [[SWT-Bench]], [[Agentless]]
**主题标签**：#LLM #NLP #Software-Engineering-Agents #SWE-bench #Testing
