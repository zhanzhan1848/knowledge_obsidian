---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, mathematical-reasoning, agent, self-correction, tool-use]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2607.29549
arxiv: 2607.29549
---

# AMTFV: Agentic Mathematical Tool-Flow Verification for LLM Self-Correction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | AMTFV: Agentic Mathematical Tool-Flow Verification for LLM Self-Correction |
| **作者** | Ruixi Zou, Yuxuan Tang, Jiayi Wen, Mengqi Wei 等（中国人民大学高瓴人工智能学院、华中师范大学） |
| **发表** | arXiv preprint（20 页，9 图） |
| **链接** | [原文](https://arxiv.org/abs/2607.29549) |
| **arXiv** | arXiv:2607.29549 |
| **分类** | cs.AI |
| **代码** | [github.com/TicusFFF/AMTFV](https://github.com/TicusFFF/AMTFV) |

---

## 核心贡献

> 提出 AMTFV 框架，引入"数学工具流（MTF）"中断–执行–恢复接口，把数学验证建模与具体代码执行彻底解耦，在 5 个高难数学数据集上平均比最强基线高最多 8.3 个百分点。

1. **MTF（Mathematical Tool Flow）接口**：验证代理只描述"数学对象 + 计算意图"，通过结构化 MTF 请求交给数学工具箱代理；后者解析请求、选择工具、生成可执行调用并交后端精确计算，再把结果回传给验证/修正模块。这是 interrupt–execute–resume 模式，可打断 LLM 推理并恢复。
2. **三代理协作的验证与修正模块**：验证代理 `A_ver` 构造验证工作流并给出裁决 `r_t`；答案修正代理 `A_ans` 依据验证工作流与执行记录生成反馈并改写答案；验证工作流修正代理 `A_flow` 在答案未变时修正验证流程本身。
3. **数学工具箱代理**：按计算任务选择 SymPy（符号计算/方程求解）、Fraction（精确有理数运算）等后端工具，生成可执行调用，保证精确计算被真正委派给专门工具而非依赖模型代码生成能力。
4. **跨模型族验证**：在 DeepSeek、GPT、Gemini 三家共 7 个模型配置、5 个高难数学数据集（170 题）上系统评测，并按验证复杂度分箱分析增益。

---

## 技术方案

### 核心思想

现有数学自我修正有两条路：一是自然语言反思/自检清单/重复采样，缺点是无外部反馈时无法可靠检测计算错误；二是直接生成验证程序（ProgCo、ProgCo-Py 一类），缺点是"过早耦合"——模型还没说清楚要验证什么，就必须同时处理循环边界、数值精度等实现细节，失败难以在"数学建模 / 约束抽象 / 程序边界"之间定位，且精确计算并未真正委派出去。AMTFV 的做法是插入一层中间表示 MTF：LLM 只需在"数学语义"层面表达需要算什么（如"对闭式表达式做符号化简并验证恒等式"），由独立的数学工具箱代理负责翻译成 SymPy/Fraction 等确定性调用。于是 LLM 专注于高层数学建模，工具负责精确执行，MTF 请求本身也可检查、可修改、可复用。工具返回的结果同时支撑三类动作：候选答案裁决（通过则直接返回）、答案修正（不通过则带着执行记录反馈重写）、以及验证工作流修正（若答案未变但检查不充分则改进流程本身）。

### 关键公式

```math
(V_t,r_t,R_t)=\mathcal{A}_{\mathrm{ver}}(q,y_t,a_t;V'_{t-1}),\qquad r_t\in\{0,1\}
\kappa_t^{\mathrm{ver}}=\mathcal{A}_{\mathrm{tool}}(\tau_t^{\mathrm{ver}};\mathbb{T}),\qquad
z_t^{\mathrm{ver}}=\operatorname{Run}(\kappa_t^{\mathrm{ver}})
(F_t,y'_t)=\mathcal{A}_{\mathrm{ans}}(q,y_t,V_t,R_t),\qquad
a'_t=\operatorname{Extract}(y'_t)
\kappa_t^{\mathrm{ans}}=\mathcal{A}_{\mathrm{tool}}(\tau_t^{\mathrm{ans}};\mathbb{T}),\qquad
z_t^{\mathrm{ans}}=\operatorname{Run}(\kappa_t^{\mathrm{ans}})
```

### 关键组件
- **Verification Agent（`A_ver`）**：构造验证工作流 `V_t`，在需要可靠执行处发出 MTF 请求，输出裁决 `r_t` 与执行记录 `R_t`。
- **Answer-Revision Agent（`A_ans`）**：当 `r_t=0` 时基于工作流与执行记录产出反馈 `F_t` 与修订响应，抽取新候选答案。
- **Verification-Workflow Revision Agent（`A_flow`）**：当答案修正后候选未变时，转而修正验证工作流本身（弥补 `V_t` 覆盖不足）。
- **Mathematical Tool Box Agent（`A_tool`）**：解析 MTF 请求 → 选工具 → 生成可执行调用 → 交后端执行；工具集 `𝕋` 含 SymPy、Fraction 等。
- **MTF 中间接口**：interrupt–execute–resume，保留清晰的数学语义，使验证意图可审查、可修订、可复用。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 数据集 | AIME 2024 (30)、AIME 2025 (30)、BRUMO 2025 (30)、HMMT Feb 2025 (30)、AMO Bench (50)，共 170 题 |
| 模型配置 | DeepSeek-Flash / Flash-Think / Pro；GPT-5.4-Mini / -Think；Gemini-2.5-Flash-Lite / -Think（共 7 种） |
| 相对最强基线提升 | 单模型配置下平均准确率最多 **+8.3 个百分点** |
| DeepSeek-Flash 主结果 | 从 Initial Score 44.1 提升，增益 **+17.x** 个百分点（曲线端点值） |
| 饱和数据集 | AMO 从 62 提升；在四个已饱和数据集上 AMTFV 保持准确率不下降 |
| 增益分布 | 在**中/高验证复杂度**样本上增益更大 |
| 迭代预算 | 主结果 max_turn = 3 |
| 对比基线 | 自反思类（reflex / Self-Refine / Self-Reflection / CheckList）、推理增强类（CoT-Tool）、验证增强类（ProgCo / ProgCo-Py） |
| 计算开销 | 逐题计算成本单独统计于 Table 6（170 题，DeepSeek-Flash 非思考模式） |

---

## 局限性

- 需要后端符号计算工具（SymPy 等）与可中断/恢复的 LLM 执行框架，工程实现门槛不低。
- 评测集仅 170 题、5 个数学基准，题量偏小，统计显著性有限。
- 依赖闭式数学表达式的正确性判定；对开放式答案或答案格式不唯一的题目（如 AMO）需要额外裁决逻辑。
- 三代理的多次调用显著增加延迟与 token 成本（论文给出成本表但未在主结果中充分权衡精度–成本）。
- 只验证了闭源 API 模型（DeepSeek/GPT/Gemini），未在开源权重模型上验证。

---

## 建议

- **是否推荐使用**：是
- **适用场景**：需要高精度数学/符号推理且允许工具调用的场景（竞赛题、符号推导验证、自动证明前置检查）；现有"直接写代码验证"方案难以定位失败原因、想引入结构化中间层的团队。
- **值得复现**：是（代码已公开）

---

**相关论文**：[[2026-11-10-FlashFusion-IoT-Query-Agent]] [[2026-11-10-SWEET-Spurious-Feature-Weight-Editing]]
**主题标签**：#LLM #NLP #MathReasoning #Agent #ToolUse #SelfCorrection
