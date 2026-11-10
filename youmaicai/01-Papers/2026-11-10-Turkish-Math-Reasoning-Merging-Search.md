---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, Turkish, Mathematical Reasoning, Model Merging, Tree Search]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.10800
arxiv: 2611.10800
---

# Enhancing Mathematical Reasoning in Turkish Large Language Models with Search-Based Inference and Model Merging

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Enhancing Mathematical Reasoning in Turkish Large Language Models with Search-Based Inference and Model Merging |
| **作者** | Ahmed Zeer, Osama SHBIB, Muzaffer Kaan Yuce, Himmet Toprak Kesgin, Mehmet Fatih Amasyali（Yildiz Technical University） |
| **发表** | arXiv preprint |
| **链接** | [原文](https://arxiv.org/abs/2611.10800) |
| **arXiv** | arXiv:2611.10800 |
| **分类** | cs.CL, cs.AI |
| **代码** | 未提供 |

---

## 核心贡献

> 低资源语言（土耳其语）的数学推理增强：LoRA 微调 + 权重空间线性合并 + 搜索式推理三者组合，发现「数据质量优于规模」「简单线性合并优于复杂合并启发式」。

1. **数据质量 > 数据规模**：用 MetaMath、NuminaMath、TigerLab-MathInst 的土耳其语翻译版做 LoRA 微调，发现大规模 MetaMath 反而不如 Mix-30k 混合数据集。
2. **线性合并最优**：Linear 权重平均带来最大增益（GSM8K 达 0.63），Ties 增益有限（0.57–0.58），Breadcrumbs 与 Slerp 反而退化；作者用「同一预训练骨干下的线性模式连通性」解释。
3. **搜索式推理 + RJE 流水线**：MCTS 与 Tree of Thoughts (ToT-BFS/DFS) 提升 0–100 的 LLM-judge 平均分；BFS 2×2 是「效率甜点」（judge 分 92），但 ToT 16×16 DFS 延迟增加达 500×。

---

## 技术方案

### 核心思想
土耳其语等低资源语言因数据稀缺而落后，作者试图用算法手段（推理期搜索 + 权重合并）而非大规模预训练来弥合差距。基座为 Turkish-Llama-8B-DPO-v0.1（Cosmos-DPO，OpenLLMTurkishLeaderboard 上的最佳土耳其语模型之一）。三条技术线：(1) 用 DeepL 等专有模型把 MetaMath / NuminaMath / TigerLab-MathInst 翻译成土耳其语，每数据集取 50k 样本，另建随机混合的 Mix 数据集，用 LoRA 微调；评测用 lm-eval-harness。(2) 权重合并：把微调模型与原始模型（或不同微调版本）合并，比较 Linear（权重平均）、Ties（按置信阈值剪枝冲突符号参数）、Breadcrumbs（追踪梯度更新）、Slerp（球面线性插值）四种技术。(3) 搜索推理：实现 ToT 的 BFS/DFS 与 MCTS（UCB 探索权重 1.41、每节点最多 2 子节点），并提出 RJE（Reward–Judge–Enhance）流水线让模型自评、自奖励、自增强。评测上区分两套口径：Table 1/2 用 harness 准确率，Fig. 3–5 用 gpt-4o-mini 作为 judge 在 0–100 尺度上按正确性/逻辑一致性/推理质量打分的均值（作者明确说明两者不可直接比较）。

### 关键公式
```math
\textbf{Linear 合并:}\quad
\bm{W}_{\mathrm{merged}} = \sum_{i=1}^{n}\lambda_i \bm{W}_i,\qquad \sum_i \lambda_i = 1

\textbf{TIES 合并:}\quad
\bm{W}_{\mathrm{merged}} = \left(\sum_i \lambda_i \cdot \mathrm{Trim}\left(\bm{W}_i,\tau\right)\right),
\qquad \tau = \text{top-}k\text{ 置信阈值}

\textbf{Slerp:}\quad
\bm{W} = \frac{\sin((1-t)\Omega)}{\sin\Omega}\,\bm{W}_1 + \frac{\sin(t\Omega)}{\sin\Omega}\,\bm{W}_2

\textbf{ToT-BFS / MCTS 搜索:}\quad
\text{score}(node) = \mathrm{Judge}(node);\quad
\text{MCTS: } \mathrm{UCB} = \frac{Q(s)}{N(s)} + 1.41\sqrt{\frac{\ln N}{N(s)}}
```

### 关键组件
- **翻译 + LoRA 微调管线**：MetaMath / NuminaMath / TigerLab 的土耳其语版本，Mix 混合数据集缓解单一推理风格过拟合。
- **四类权重合并**：Linear / Ties / Breadcrumbs / Slerp 的系统性对比。
- **Evolve–Linear 迭代精化**：把合并结果重复 24 步迭代自精化，得 0.62。
- **ToT-BFS / ToT-DFS / MCTS 搜索实现**：含 BFS/DFS 伪代码与 MCTS 的 UCB 配置。
- **RJE 流水线**：Reward→Judge→Enhance 的模块化自反思训练（实验中未带来显著提升）。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| GSM8K（Linear 合并，最佳：DPO + Metamath-300K） | **0.63** |
| GSM8K（Evolve–Linear，24 步） | 0.62 |
| GSM8K（TIES 合并） | 0.57–0.58 |
| GSM8K（Breadcrumbs / Slerp） | 未带来提升（退化） |
| LoRA 微调单独效果 | 所有配置均**未超过**基线（合并后才反超） |
| 搜索推理（LLM-judge 0–100 均分） | MCTS 与 ToT 均优于 zero-/few-shot 基线 |
| ToT-BFS 2×2（效率甜点） | Cosmos-DPO judge 分 **92**，Qwen2.5-7B 85 |
| 推理延迟（A100 80GB，100 题） | Zero-shot ≈24s；ToT 16×16 DFS >12,000s（**约 500×**） |
| 评测 | lm-eval-harness（准确率）+ gpt-4o-mini judge（0–100 分） |

---

## 局限性

- 训练语料为机器翻译（DeepL）产物，噪声与翻译腔无法避免，直接影响上限。
- 规模有限：单数据集 50k 样本、8B 基座，无法验证更大规模下的结论。
- 搜索推理成本极高（500× 延迟），实验只能在小子集上做。
- RJE 流水线未产生显著提升，作者如实报告。
- 两套评测口径（harness 准确率 vs judge 均分）不可直接比较，因此「搜索 vs 合并」的优劣无法直接排序。
- 未涉及土耳其语数学题的独立人工评估或母语者验证。

---

## 建议

- **是否推荐使用**：部分（方法可借鉴，但需注意其结论的规模/翻译依赖性）
- **适用场景**：低资源语言的推理能力增强研究；模型合并技术的效果对比参考；推理期搜索的效率-收益权衡分析。
- **值得复现**：是（Linear 合并 vs Ties/Slerp 的对比结论在低成本下即可验证）

---

**相关论文**：[[LoRA]], [[Model-Merging-TIES]], [[Tree-of-Thoughts]], [[MCTS]], [[MetaMath]], [[NuminaMath]]
**主题标签**：#LLM #NLP #Turkish #Math-Reasoning #Model-Merging
