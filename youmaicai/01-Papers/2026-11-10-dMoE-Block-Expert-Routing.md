---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, diffusion-LM, MoE, efficient-inference]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2605.30876
arxiv: 2605.30876
---

# dMoE: dLLMs with Learnable Block Experts

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | dMoE: dLLMs with Learnable Block Experts |
| **作者** | （LLaDA2.0-mini / 扩散语言模型 MoE 方向作者） |
| **发表** | NeurIPS 2026 |
| **链接** | [原文](https://arxiv.org/abs/2605.30876) |
| **arXiv** | arXiv:2605.30876 |
| **分类** | cs.CL |
| **代码** | 论文中提供代码链接（this https URL） |

---

## 核心贡献

> 扩散语言模型（dLLM）的块级并行解码与 MoE 的 token 级专家路由存在错配，导致每次前向激活的独特专家数暴增、推理受内存瓶颈限制；dMoE 用块级专家分数引导路由，把独特专家数从 69.5 压到 16.6 而几乎不损失性能。

1. **识别并量化错配**：dLLM 的一次前向同时处理块内多个双向依赖 token，而常规 MoE 层对每个 token 独立路由，导致独特激活专家数大幅上升、推理 increasingly memory-bound。
2. **两个关键观察**：Observation A——token 级专家分数（router 权重）与"屏蔽该专家后重建损失的变化"呈正相关（Pearson 0.41，432 个 GSM8K 样本），说明它是专家重要性的有效指示；Observation B——专家集中度在去噪步与块之间差异巨大（独特专家数的变异系数 CV 15.93%–17.80%）。
3. **dMoE 路由**：先把 token 级专家分数聚合成块级专家分数 $S_{block}$，归一化后用 **top-p** 准则动态选出 coreset $\mathcal{C}$（不固定大小），再在 coreset 内执行原有的 token 级 Top-k 路由——即"先粗选专家池、再细选"的粗到细策略。
4. **可训练 + 自蒸馏**：训练时前向使用同一套路由流程（self-distillation），推理时保持一致；top-p 阈值 $p$ 可调，从而按应用需求在压缩率与质量间权衡。

---

## 技术方案

### 核心思想
dLLM（如 LLaDA）用 masked diffusion 实现并行生成，一次去噪步会同时更新块内多个被掩码位置。这与自回归 MoE 的假设冲突——MoE 层假设每个 token 独立选专家。当块内 $B$ 个 token 各选 $k$ 个专家时，独特专家数期望上远大于 $k$，而 MoE 层的显存占用与被激活专家参数量成正比，于是推理变成内存受限。dMoE 的做法是：不改变每个 token 选中的专家数（保持计算量不变），只压缩"块级独特专家池"。具体地，先照常做 token 级路由得到每个 token 在所有专家上的分数 $\mathbf{s}_i$，把块内所有 token 的分数（先做 TopKMask，只保留各自的 top-k 分数）相加得到块级分数；再把块级分数归一化，按累积概率阈值 $p$ 取 top-p 集合作为 coreset（分布集中时 coreset 自动变小，分布分散时自动变大）；最后把 token 级路由限制在该 coreset 内执行 Top-k。训练用 self-distillation 范式：数据由基座模型 LLaDA2.0-mini 自己生成（约 70 万样本，无外部精标数据），前向使用同一路由流程以保证训练-推理一致。

### 关键公式
```math
（1）Token 级专家分数与块级聚合：
\mathbf{s}_i = \operatorname{Router}(t_i) = [s_{E_1}, \dots, s_{E_{|\mathcal{E}|}}]
\hat{\mathbf{s}}_i = \operatorname{TopKMask}(\mathbf{s}_i, k)
S_{block} = \bigoplus_{i\in\mathcal{B}} \hat{\mathbf{s}}_i \quad（\bigoplus 为求和聚合）

（2）动态 coreset（top-p 准则，非固定大小）：
\tilde{S}_{block} = \operatorname{Normalize}(S_{block}),\qquad
\mathcal{C} = \operatorname{top\text{-}p}\big(\{\tilde S_{block}\}_{e=1}^{E},\, p\big)

（3）coreset 内的 token 级路由：
\mathbf{s}_i^{\mathcal{C}} = \operatorname{MaskOutside}(\mathbf{s}_i, \mathcal{C}),\qquad
R_i = \operatorname{TopK}(\mathbf{s}_i^{\mathcal{C}}, k)

（4）观察 A 的经验相关系数：
\operatorname{corr}(\text{token-level expert score},\ \Delta \text{reconstruction loss after masking}) = 0.41

（5）观察 B 的集中度波动：
\mathrm{CV} = \frac{\sigma}{\mu}\quad(\text{独特激活专家数})\quad = 15.93\% \sim 17.80\%
```

### 关键组件
- **Base model**：LLaDA2.0-mini（开源 MoE dLLM，共 19 个 MoE 层；官方每 token 选 8 个专家）。
- **块级路由算法（Algorithm 1）**：TopKMask → 累加 → Normalize → top-p coreset → MaskOutside → TopK。
- **Self-distillation 训练数据**：GSM8K 训练集、PRM12K、Numina-Math 子集、OpenThoughts 子集作 prompt，由基座模型自生成响应作监督（confidence 阈值 0.95、block size 32、最大 2048 token，未终止样本剔除），约 70 万样本。
- **训练配置**：masking ratio 从 [0.3, 0.8] 随机采样；全参数微调 2 epoch；global batch size 4；lr 2.0×10⁻⁶（cosine 调度）；block size 32；分别训练 $p^{train}=0.6$（默认）与 0.5 两个模型；4× H100。
- **基线**：Original、+Fine-Tuning（同样自蒸馏微调但不改路由）、Top-4（每 token 专家数 8→4）、DES-S（DES-Seq）、DES-V（DES-Vote）、TEAM。
- **评测基准**：MATH500、GSM8K、ARC-C、MMLU（用数学部分）、TruthfulQA（BLEU accuracy）、QASPER；推理设置 block size 32、最大 2048 token、confidence 阈值 0.95、开启 KV cache。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 四推理基准平均性能 | 83.95% → 83.575%（保留 99.55%） |
| 平均独特激活专家数 | 69.5 → 16.575（降低 76.15%，约 4.19×） |
| 相对基线的独特专家数额外降幅 | 55.11% – 61.14%（同等性能水平下） |
| 相对 "+Fine-Tuning" | 保留 98.50% 性能，专家数少 78.50%（证明压缩来自块级路由而非微调） |
| MATH500（p=0.6） | 71.2%（原模型 72.0%），专家数 70.0 → 16.3 |
| GSM8K（p=0.6） | 88.6%（原 90.8%），专家数 71.5 → 16.6 |
| ARC-C（p=0.6） | 87.1%（原 84.4%，反超），专家数 65.9 → 16.9 |
| MMLU（p=0.6） | 87.4%（原 88.6%），专家数 70.6 → 16.5 |
| 极端压缩（p=0.5） | 保留 97.77% 性能，专家数 13.6–13.9 |
| 对比 DES-S*/DES-V*（同等压缩 ~13） | DES 性能大幅退化（如 ARC-C 62.9%/49.1% vs dMoE 84.7%） |
| 通用基准：TruthfulQA | 62.2% → 69.9%（提升），专家数 61.2 → 15.4（−74.86%） |
| 通用基准：QASPER | 66.5% → 64.8%，专家数 61.3 → 15.4 |
| 内存占用 | 相比原模型降低 74.36% – 76.78%；相比基线降低 54.08% – 60.38% |
| 端到端延迟加速 | 1.36× – 2.04× |
| 延迟对比（同等准确率） | dMoE 1.36×–2.04× vs DES-S 1.22×–1.64× vs DES-V 1.27×–1.50× |
| MATH500 延迟（batch=1） | 572.4 ms → 355.1 ms |
| GSM8K 延迟（batch=1） | 265.1 ms → 129.7 ms |
| top-p 选择与 coreset 构建开销 | 平均仅占 MoE 延迟的 1.9% |
| Batch=4 | 加速 1.47×–1.83×，全 batch 独特专家数降低 66.05%–70.62% |
| Batch=8 | 加速 1.42×–1.84×，全 batch 独特专家数降低 57.19%–67.52% |
| 观察 A 相关系数 | Pearson 0.41 |
| 观察 B 的 CV | GSM8K 17.09%、MATH500 15.95%、ARC-C 15.93%、MMLU 17.80% |

---

## 局限性

- 只在单一模型（LLaDA2.0-mini）与单一 MoE 结构上验证，向其他 dLLM（不同专家数、路由机制、block size）与更大规模 MoE dLLM 的泛化未验证。
- 训练依赖 self-distillation（约 70 万自生成样本），需要与基座相同的推理配置（confidence 0.95、block 32、2048 token），生成成本高。
- 极端压缩下（p=0.4）性能明显下降（MATH500 67.0%、GSM8K 86.0%），说明存在质量-压缩权衡的下界；论文给出可调 p 作为折中手段但未给出自动选择策略。
- $p^{train}$ 与 $p^{test}$ 的耦合关系不平凡（交叉评估显示训练时 p 会影响各测试 p 下的表现），实际部署需额外校准。
- 加速收益高度依赖 batch size 与硬件；batch=1 的绝对延迟（129–355 ms）仍显著高于纯自回归解码，未解决 dLLM 的固有延迟劣势。
- 对齐到"每 token 专家数不变"意味着计算量不变，压缩只作用于显存与访存；模型权重本身未压缩。

---

## 建议

- **是否推荐使用**：是
- **适用场景**：部署 MoE 扩散语言模型（推理受内存瓶颈制约的场景）；研究 dLLM + MoE 的高效推理；需要把 dLLM 加速 1.4–2× 且几乎无损的工程团队。
- **值得复现**：是（算法改动小、无需外部精标数据、训练配置清晰；建议优先验证 top-p 阈值与 block size 的交互）

---

**相关论文**：[[2026-03-11-Hybrid-Sequence-Models]]
**主题标签**：#LLM #NLP #diffusion-LM #MoE #efficient-inference
