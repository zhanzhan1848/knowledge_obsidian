---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, MLLM Evaluation, Visual Hallucination, Interactive Evaluation]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2607.14499
arxiv: 2607.14499
---

# Contextualized Evaluation of Vision Language Models through Dynamic, Multi-turn Interactions

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Contextualized Evaluation of Vision Language Models through Dynamic, Multi-turn Interactions |
| **作者** | 未提供（详见原文） |
| **发表** | NeurIPS 2026（Accepted） |
| **链接** | [原文](https://arxiv.org/abs/2607.14499) |
| **arXiv** | arXiv:2607.14499 |
| **分类** | cs.AI |
| **代码** | http://github.com/williamium3000/cedi |

---

## 核心贡献

> 把 MLLM 评测重构为「被测模型 — 考官 — 评分器」三方交互：考官基于场景图做半结构化多轮访谈，评分器用场景图编辑距离打分——发现交互式评测能暴露远超静态评测的视觉幻觉，且更贴近真实使用。

1. **CEDI 三方交互框架**：被测模型（evaluatee）、自动化考官（examiner）、评分器（grader）三方协同，考官依据任务图结构做多轮半结构化对话。
2. **图结构状态空间导航**：以场景图 $G=(V,E,\mathcal{A})$ 为状态空间做遍历式访谈，每轮锚定具体节点与其局部结构，配合场景/目标驱动的上下文建模，覆盖率随上下文采样数增长。
3. **场景图评分器**：把多轮转录解析成预测场景图，用图编辑距离（GED）与 SG Δ Con 度量幻觉与覆盖。
4. **实证发现**：交互式评测比静态评测暴露显著更多幻觉、更广视觉覆盖；幻觉随长上下文通过对话历史自我强化累积；模型在需要「前提拒绝」或「拒答」时最脆弱。

---

## 技术方案

### 核心思想
现有 MLLM 基准是「受控、静态」的，而真实应用是「动态、交互、情境化」的。CEDI 借鉴人类评估中的**半结构化面试**：考官可根据被测模型的回答动态调整提问类型与难度，从而更忠实地 elicit 能力证据。考官由一个 MLLM（如 GPT-4o）与图结构工作流共同驱动：给定图像 $I$ 及其场景图，构造一个第一人称用户场景 $s$ 与目标 $g$（要求跨多个节点/边推理，而非单物体识别），并选取与场景相关的节点子集 $V_s$ 形成上下文子图 $G_s=(V_s,E_s,\mathcal{A}_s)$。多轮访谈被建模为对 $G_s$ 的遍历：第 $t$ 轮随机选目标节点 $v_t\in V_s$（或保持 $v_t=v_{t-1}$ 发追问），围绕其属性与入射关系生成问题，保证每轮可对照场景图验证。考官在四类问题间选择（追问、澄清请求、对抗性探针、以及其他），类型选择条件化于对话历史以避免重复。评分器则用 LLM 解析器把转录抽成语义三元组（物体实例、属性、谓词）聚合为预测场景图 $\hat{G}$，用 WordNet 物理实体类过滤非物理名词以提高实例级精度，再以 GED 度量分歧——GED 中「插入」惩罚漏掉的视觉内容，「删除」惩罚幻觉出的实体/关系，因此同时刻画幻觉与覆盖。

### 关键公式
```math
\textbf{场景图:}\quad G=(V,E,\mathcal{A}),\quad
V=\{v_1,\dots,v_{|V|}\ (\text{物体实例}),\quad
E\subseteq V\times\mathcal{R}\times V\ (\text{有向类型化关系}),\quad
\mathcal{A}\ (\text{属性映射})

\textbf{上下文子图:}\quad G_s=(V_s,E_s,\mathcal{A}_s),\quad V_s\subseteq V

\textbf{GED（幻觉 + 覆盖统一度量）:}\quad
\mathrm{GED}(\hat{G},G^\star)=
\min_{\Pi(\hat{G},G^\star)\in\Pi}\sum_{e\in\Pi} c(e),
\qquad
\Pi(\hat{G},G^\star)=\{\text{合法编辑路径}\}
\\[-4pt]
\text{插入}\ \Rightarrow\ \text{惩罚漏掉的视觉元素};\qquad
\text{删除}\ \Rightarrow\ \text{惩罚幻觉的实体/关系}

\textbf{SG }\Delta\textbf{ Con 结构距离:}\quad
d_{\mathrm{SG}}(\hat{G},G^\star)=\big\|\hat{S}_{\hat{G}}-S_{G^\star}\big\|_F
\quad(S=\text{快速信念传播得到的节点亲和度矩阵})
```

### 关键组件
- **场景图状态空间**：视觉内容的结构化表示，既驱动提问生成又支撑评分。
- **上下文建模**：把图像嵌入第一人称场景 + 目标，模拟真实「情境化使用」。
- **遍历式多轮访谈**：锚定节点、追问保持节点不变、目标持续、依赖历史——三项性质保证问题可验证、目的明确、上下文连续。
- **四类问题策略**：追问、澄清、对抗性探针等，可测试模型在确认压力、歧义、误导前提、对抗干扰下的鲁棒性。
- **覆盖率策略**：覆盖率由考官通过采样多个不同上下文子图来提升，而非由评分器强制要求长描述。
- **SG-based grader**：GED 捕捉幻觉与覆盖；其幻觉分量与人工标注幻觉数的 Pearson 相关达 $\rho=0.22$–0.33（稳定为正），而 MMHal 在 −0.02–0.33 间波动、CHAIR I 在四个模型中有三个转负。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 评测集 | 人工标注 Visual Genome（100 张图）；Synthetic Visual Genome（SVG，源自 VG/COCO/ADE20K 三个来源） |
| Coverage 提升（对每个被测模型） | **+3 ~ +19 pp**（相对 caption / prompt-only 基线） |
| VALOR 幻觉率提升 | **+5 ~ +23 pp** |
| 场景图 GED | **1.2 ~ 2.9×** 高于基线 |
| CHAIR I 提升（对 caption 基线） | **+8 ~ +18 pp** |
| GED 幻觉分量 vs 人工标注幻觉数 | Pearson $\rho = 0.22$–0.33（四个被测模型上稳定为正） |
| 对比 MMHal | $\rho$ 在 −0.02 ~ 0.33 间波动 |
| 对比 CHAIR I | 在四个模型中有三个 $\rho$ 转负 |
| 行为学发现 | 长上下文下幻觉更多；跨轮自我强化先前未获支持的断言；需要前提拒绝/拒答的问题上最脆弱 |

---

## 局限性

- 需要一个强 MLLM（如 GPT-4o）担任考官与解析器，评测成本高且引入考官自身的偏差。
- 与人工标注的相关性 $\rho=0.22$–0.33 虽稳定为正，但绝对值偏低，说明场景图评分器仍有较大改进空间。
- 主线实验聚焦视觉幻觉，框架宣称可推广到其他任务但缺少实证。
- 多轮交互的对话长度、场景生成质量等关键超参对结果的影响未系统消融。
- 依赖场景图标注（VG 等），对无密集标注的真实图像不适用。

---

## 建议

- **是否推荐使用**：是（评测理念有启发性，代码已开源）
- **适用场景**：设计交互式/情境化的 MLLM 评测协议；诊断模型在多轮、追问、对抗场景下的幻觉行为。
- **值得复现**：是（SVG 数据集与评测流程可复现，但需评估 API 成本）

---

**相关论文**：[[POPE]], [[CHAIR]], [[MMHal]], [[Visual-Hallucination]], [[Scene-Graphs]]
**主题标签**：#LLM #NLP #MLLM-Evaluation #Visual-Hallucination #Interactive-Evaluation
