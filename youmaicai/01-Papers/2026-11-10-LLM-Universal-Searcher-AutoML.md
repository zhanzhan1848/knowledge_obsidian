---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, AutoML, NAS, Neural Architecture Search, Reinforcement Learning]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.12791
arxiv: 2611.12791
---

# Large Language Models as a Universal Searcher for Open-World Automated Machine Learning

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Large Language Models as a Universal Searcher for Open-World Automated Machine Learning |
| **作者** | Yuxuan Hu, Jihao Liu, Weikang Shi, Xijie Huang, Linda Wei, Mingjie Zhan 等 (CUHK MMLab) |
| **发表** | arXiv preprint（投稿 IEEE；前身版本发表于 EMNLP 2025） |
| **链接** | [原文](https://arxiv.org/abs/2611.12791) |
| **arXiv** | arXiv:2611.12791 |
| **分类** | cs.CL |
| **代码** | 未提供 |

---

## 核心贡献

> 用一套统一的数值编码（NCode）把「架构 + 超参 + 数据配比」全部变成离散序列，让 LLM 搜索器首次能零样本地跨任务、跨模态、跨搜索空间做联合优化。

1. **统一表示 NCode**：提出通用数值编码方案，把异构的模型架构、训练超参、数据采样权重映射为统一的离散数值序列（基于 DAG 的稠密连接 + 编码本），使问题退化为统一排序任务。
2. **轨迹策展 + 目标重构**：基于 NAS-Bench-301 提出随机边剪枝的架构采样策略以生成多样化优化轨迹；并把「直接生成 NCode」重构为「条件候选排序」，显著降低学习难度（去掉该机制时 ImageNet16-120 精度从 46.51% 崩到 42.53%）。
3. **大规模可扩展性 + 可解释性**：在十亿参数级 Diffusion Transformer 上联合优化仅需 896 GPU-days 达到 GenEval 0.91；用 GRPO 注入 Chain-of-Thought，使搜索器的策略从「早期多样性探索」演化到「后期锚点利用」可被解读。

---

## 技术方案

### 核心思想
传统 AutoML（DARTS、OptFormer 等）要么绑定单一搜索空间，要么把架构搜索、超参优化、数据配比割裂优化，无法捕捉三者间的非线性协同，且训练数据获取成本极高。本文提出把 AutoML 抽象为**开放世界离散优化问题**：首先设计 NCode 编码方案，将三种本质上异构的设计选择统一为离散数值序列——模型实例被建模为稠密连接的 DAG，操作、超参与数据权重各自拥有编码本，每一位对应一个具体的设计决策。随后把优化目标从「生成 NCode」重构为「在候选池中排序」，因为直接生成需要模型同时学会搜索空间的语法与搜索策略，而条件排序只需学习判别哪些候选更优，学习负担大幅降低。训练数据来自 NAS-Bench-301 的 CIFAR-10 架构性能数据，通过随机边剪枝构造局部搜索空间以生成丰富的优化轨迹。推理时零样本迁移到未见过的领域/任务/模态。论文还用 GRPO 在轨迹上注入可解释的 Chain-of-Thought，把 2500 步搜索推理过程用 Gemini-2.5-Pro 归纳为六类策略（位置锚定、组合协同、邻域变异、全局成分分布、层级序列推进、操作异质性），并观察到 NAS-Bench-201 上从「邻域变异」逐步转向「位置锚定」，而 GenEval 上转向「组合协同」。

### 关键公式
```math
\text{NCode}: \quad \text{Architecture} \oplus \text{Operation} \oplus \text{Hyperparameter} \oplus \text{DataRatio} \;\longrightarrow\; \text{Discrete Numerical Sequence}

\min_{\theta}\;\mathcal{L}_{\mathrm{GRPO}}(\theta)
= \mathbb{E}\Big[\frac{1}{G}\sum_{i=1}^{G}\frac{1}{|v_i|}\sum_{t=1}^{|v_i|}
\big(\min\big(\rho_t A_i,\ \mathrm{clip}(\rho_t, 1-\epsilon, 1+\epsilon)A_i\big)\big)\Big]

\text{排名目标}: \quad \text{score}(\hat{c}) = f_{\mathrm{LLM}}(\text{candidate pool}, q) \quad\text{而非}\quad \text{生成} \; \mathrm{NCode}(\hat{c})
```

### 关键组件
- **NCode 统一编码**：把架构（拓扑 + 操作）、超参（学习率、优化器等）、数据配比编码为统一离散序列，是跨搜索空间泛化的基础。
- **剪枝式轨迹策展**：在 NAS-Bench-301 的稠密 DAG 上做随机边剪枝，生成多样化、局部化的架构搜索空间，缓解 AutoML 训练数据昂贵问题。
- **目标重构（排序化）**：把离散序列生成改写为条件排序，是泛化性能的关键（去掉后性能灾难性下降）。
- **CoT 可解释搜索器**：基于 Qwen3-8B，用 GRPO 在优化轨迹上自发学会用自然语言解释优化理由，无需人工标注。
- **零样本推理管线**：候选池由目标搜索空间采样得到，LLM 对候选打分排序后迭代收敛。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| NAS-Bench-201 ImageNet16-120 测试精度 | 46.51%（超过 DiNAS 45.41%、LLMatic 45.87%、GENIUS 44.96%，接近 CoLLM-NAS 46.79%） |
| GenEval（十亿参数 DiT 联合优化） | **0.91**（SOTA），比 OptFormer 高 0.07；参数量 1.3B、50B tokens 训练 |
| 训练成本 | 896 GPU-days |
| 图像分割 CVC-612 | S_α = 92.6、E_φ = 94.3（较最强基线 Conv-LoRA 分别 +2.5 / +2.0 pt） |
| 说话人验证（跨模态） | 平均 EER 9.21、minDCF 0.715，超越手工调优的 ERes2NetV2 |
| 消融：去掉目标重构 | ImageNet16-120 从 46.51% 降至 42.53% |
| 消融：去掉剪枝式采样 | 三个数据集（CIFAR-10/100、ImageNet16-120）全面退化 |
| 与 Qwen-Image 对比 | 1.3B/50B tokens 超过 20B 参数模型 0.04；超过 BAGEL（7B/5T tokens）0.03 |

---

## 局限性

- 训练轨迹仍只来自单一域的视觉任务（NAS-Bench-301 / CIFAR-10），向完全未见的模态（如文本任务、符号任务）泛化尚未充分验证。
- 候选池采样方式本身依赖任务先验，对搜索空间极不规则或候选极难枚举的场景可扩展性存疑。
- CoT 解释是事后归因（由 Gemini-2.5-Pro 打标签），不构成因果性的可解释性证明。
- 十亿参数 DiT 联合优化仍需 896 GPU-days，对资源受限团队门槛不低。
- 代码与模型未公开，复现成本高。

---

## 建议

- **是否推荐使用**：是（作为方法论参考与 AutoML 设计思路）
- **适用场景**：需要跨任务/跨模态联合优化架构+超参+数据配比的研究团队；关注 AutoML 可解释性与 LLM-as-searcher 范式的研究者。
- **值得复现**：是（NCode 编码 + 排序化目标这两个组件是低成本高回报的通用配方，建议在小规模搜索空间上复现）

---

**相关论文**：[[DARTS]], [[OptFormer]], [[CoLLM-NAS]], [[EMNLP2025-LLM-NAS]]
**主题标签**：#LLM #NLP #AutoML #NAS #Reinforcement-Learning
