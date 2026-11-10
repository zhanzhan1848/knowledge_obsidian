---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, NLI, in-context-learning, prompting, benchmarking]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.09936
arxiv: 2611.09936
---

# How Many Examples, and Which Ones? A Study of In-Context Learning for Natural Language Inference

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | How Many Examples, and Which Ones? A Study of In-Context Learning for Natural Language Inference |
| **作者** | Georgos Dikaios, Isidoros Perikos, Ioannis Hatzilygeroudis |
| **发表** | arXiv preprint（Hellenic Open University / University of Patras / CTI） |
| **链接** | [原文](https://arxiv.org/abs/2611.09936) |
| **arXiv** | arXiv:2611.09936 |
| **分类** | cs.CL, cs.AI |
| **代码** | 未提供 |

---

## 核心贡献

> 系统评测 5 个开源小规模指令微调 LLM 在 NLI 上的零样本与少样本表现，发现简单直接的提示已足够，且少样本中示例的"标签"比示例的"数量"更重要——entailment 引导的示例效果最好。

1. 在 MNLI、QNLI、SciTail 三个数据集上对 Llama 3.2-3B、Llama 3.1-8B、Mistral-7B、Gemma 2-9B、Phi 4 Mini 五个 decoder-only 指令微调模型做 10 个随机种子的零样本与少样本评测，同时报告 Accuracy、macro-F1 与 MCC（论文强调不能只报 Accuracy）。
2. 核心发现一：LLM 在简单直接的提示下即表现优异，挑战了"NLI 任务需要复杂提示工程"的成见；该简单提示持续追平或超过 ICS 与 MCQ 式等更复杂方法。
3. 核心发现二：单样本提示中示例标签的选择显著影响性能，多数模型上 entailment 引导的示例最好；同时发现 few-shot 中用少量代表性示例即可达到与更多示例相当甚至更优的效果。

---

## 技术方案

### 核心思想

NLI 判断假设句是否由前提句逻辑推出，分 entailment / contradiction / neutral 三类，是问答、摘要、事实核查、对话等任务的通用建模框架，也是评估推理能力的重要基准。此前研究主要聚焦 encoder-only（BERT、RoBERTa、DeBERTa）与 encoder-decoder 架构，decoder-only LLM 在 NLI 上被研究得相对较少；而近年 LLM 报告多聚焦 MMLU 等通用推理基准，NLI 专项数据（尤其是需要科学理解的 SciTail）上的表现报告稀缺。

论文的立场是"简单性假说"：LLM 规模提升后，复杂提示流水线的诱惑增加，但复杂提示会引入噪声、增加计算开销、可能让模型偏离核心任务；反过来，简单直接、零附加结构的提示让模型专注于任务本身。论文因此用最小化的提示设计（对 QNLI 把 "premise" 换成 "question"、"hypothesis" 换成 "sentence"）来检验该假说。

评测设计上，论文注意到底层两处容易出错的地方：一是标签映射（MNLI 从 {0,1,2} 映射到 {Entailment, Contradiction, Neutral}；QNLI 从 {0,1} 映射到 {Entailment, Not Entailment}；SciTail 保留 "entails"/"neutral"），并注意到 MNLI 与 QNLI 完全平衡而 SciTail 有 63.3% 标签为 Neutral；二是评测指标——论文主张除 Accuracy 外必须报告 macro F1 与 MCC，因为类别不平衡下 Accuracy 会掩盖失败。

少样本示例数的设置随数据集标签空间调整：QNLI 与 SciTail 从每类 1 例开始，再到每类 1 例共 2 例（QNLI）、2 例（SciTail），其余按每个种子 {3, 5, 8, 10, 15}；MNLI 从每类 1 例开始再到 3 例（每类 1 例），其余同样按 {3, 5, 8, 10, 15}。

分析上，论文用总变差距离（TVD）度量模型预测类别分布与真实分布的差异，用 Wilcoxon 检验（QNLI、SciTail）与 Friedman 卡方检验（MNLI）比较单样本不同标签条件，并显式排除 Phi-4 在 MNLI 上因预测坍缩到单一类别而出现的极端性能下降这一异常情形。

### 关键公式

```math
% 标签映射
Y_{\text{MNLI}} \in \{\text{Entailment},\ \text{Contradiction},\ \text{Neutral}\}
Y_{\text{QNLI}} \in \{\text{Entailment},\ \text{Not Entailment}\}
Y_{\text{SciTail}} \in \{\text{Entails},\ \text{Neutral}\}

% 总变差距离（预测分布 vs 真实分布）
\mathrm{TVD} = \frac{1}{2}\sum_{c}\left|P_{\text{model}}(c) - P_{\text{true}}(c)\right|
% 用作零样本基线，与单样本各标签条件对比

% 评测指标
\mathrm{Accuracy} = \frac{\#\text{正确预测}}{\#\text{样本}},\qquad
\mathrm{F1}_{\text{macro}} = \frac{1}{|C|}\sum_{c}\frac{2P_cR_c}{P_c+R_c},\qquad
\mathrm{MCC} = \frac{\chi_{XY}N - \sum_k a_k b_k}{\sqrt{(N^2-\sum_k a_k^2)(N^2-\sum_k b_k^2)}}
```

### 关键组件

- **5 个受测模型**：Mistral-7B-Instruct-v0.3、Gemma-2-9B-Instruct、Llama-3.1-8B-Instruct、Llama-3.2-3B-Instruct、Phi-4-Mini。
- **3 个数据集**：MNLI（通用）、QNLI（Wikipedia 来源的问答）、SciTail（科学考试题，需科学理解）。
- **简单直接提示**：仅做必要的字段替换，无 CoT、无角色扮演、无格式约束。
- **少样本配置**：每类均衡采样；示例数集合 {3, 5, 8, 10, 15}（MNLI 另含每类 1 例的 3 例配置）。
- **10 个随机种子**：所有结果为 10 seed 平均，附 95% CI。
- **统计分析**：Wilcoxon 检验（QNLI、SciTail）、Friedman 卡方检验（MNLI）；TVD 分布偏移分析；Table 6 报告每个模型每个数据集的最佳提示配置。
- **对比方法**：ICS（in-context selection）与 MCQ-based prompting 等更复杂方法。
- **异常处理**：显式排除 Phi-4 在 MNLI 单样本条件下的预测坍缩情形。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| QNLI — Gemma 2 | Accuracy 0.8959±0.0017 / F1 0.8959±0.0017 / MCC 0.7921±0.0033（最佳） |
| MNLI — Gemma 2 | Accuracy 0.8086±0.0048 / F1 0.8089±0.0046 / MCC 0.7172±0.0062（最佳） |
| MNLI — Phi 4 | Accuracy 0.8074±0.0047 / F1 0.8059±0.0047 / MCC 0.7137±0.0065 |
| QNLI — Mistral | Accuracy 0.8411±0.0079 / F1 0.8406±0.0083 / MCC 0.687±0.013 |
| QNLI — Llama 3.1 | Accuracy 0.8231±0.0097 / F1 0.822±0.010 / MCC 0.653±0.016 |
| QNLI — Phi 4 | Accuracy 0.8197±0.0075 / F1 0.8189±0.0077 / MCC 0.647±0.014 |
| QNLI — Llama 3.2 | Accuracy 0.737±0.019 / F1 0.731±0.022 / MCC 0.495±0.027 |
| MNLI — Mistral | Accuracy 0.722±0.012 / F1 0.718±0.011 / MCC 0.587±0.017 |
| MNLI — Llama 3.1 | Accuracy 0.689±0.014 / F1 0.686±0.014 / MCC 0.547±0.018 |
| MNCNLI — Llama 3.2 | Accuracy 0.504±0.031 / F1 0.454±0.040 / MCC 0.290±0.035（最弱） |
| SciTail — Llama 3.1 | Accuracy 0.8712±0.0094 / F1 0.865±0.010 / MCC 0.735±0.016（最佳） |
| SciTail — Gemma 2 | Accuracy 0.864±0.010 / F1 0.8618±0.0097 / MCC 0.737±0.014 |
| SciTail — Mistral / Phi 4 | F1 0.728 / 0.745；MCC 0.526 / 0.5575 |
| SciTail — Llama 3.2 | Accuracy 0.614±0.041 / F1 0.566±0.054 / MCC 0.209±0.047 |
| 单样本标签效应 | 除 Mistral 外，entailment 引导的示例在多数模型上最佳 |
| 示例数效应 | 少量代表性示例可达到与更多示例相当或更优；效果依模型与数据集而异 |
| 与复杂提示方法对比 | 简单提示持续追平或超过 ICS 与 MCQ 式提示 |
| 标签分布 | MNLI 与 QNLI 完全平衡；SciTail 63.3% 为 Neutral |

---

## 局限性

- 仅评测 5 个小规模（3B–9B）开源指令微调模型，未覆盖前沿大模型或 encoder/encoder-decoder 强基线（BERT/RoBERTa/DeBERTa）的直接对比数值。
- 结论对模型与数据集高度依赖：Llama 3.1 在 SciTail 上强而在 MNLI 上明显弱于 Gemma 2/Phi 4；Llama 3.2 全线最弱。
- Llama 家族性能不稳定（论文明确指出），使小样本结论的方差较大。
- 示例数上界只到 15，且每类均衡采样，与真实场景中"从池中检索最相关示例"的做法不同。
- 提示极简意味着未探索中间强度（few-shot + 轻 CoT）的配置空间，"简单优于复杂"是就本文对比的这几种复杂方法而言。
- 未评估提示在下游分类任务改写中的实际收益（论文提到这是 NLI 的重要用途之一但未实测）。

---

## 建议

- **是否推荐使用**：是
- **适用场景**：需要为 LLM 选择 NLI 提示策略的工程实践；少样本示例设计的经验参考；decoder-only LLM 在 NLI 类基准上的基线复核。
- **值得复现**：是（低成本、结论清晰，且"示例标签比示例数量更重要"这一发现对少样本设计有直接指导价值）

---

**相关论文**：[[MNLI]]、[[QNLI]]、[[SciTail]]、[[In-Context Learning]]、[[DeBERTa]]
**主题标签**：#LLM #NLP #NLI #In-Context-Learning #Prompting #Benchmarking
