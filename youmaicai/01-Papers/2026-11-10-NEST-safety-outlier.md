---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, AI-Safety, alignment, fine-tuning-robustness]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.10971
arxiv: 2611.10971
---

# When Safety Becomes An Outlier: Understanding the Retention of LLM Safety Behaviors

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | When Safety Becomes An Outlier: Understanding the Retention of LLM Safety Behaviors |
| **作者** | Binchi Zhang, Hadi Abdullah, Yiwei Cai, Jundong Li |
| **发表** | NeurIPS 2026（Accepted） |
| **链接** | [原文](https://arxiv.org/abs/2611.10971) |
| **arXiv** | arXiv:2611.10971 |
| **分类** | cs.CL |
| **代码** | 未提供（论文注明实验基于 Visa Research） |

---

## 核心贡献

> 提出「公式化拒答字符串构成输出分布中的离群模式（outlier mode）」这一假设，并据此提出 NEST 框架——用自然、上下文相关且落在模型原有分布内的安全目标来提升安全行为在持续微调中的保持能力。

1. 诊断性证据：安全对齐模型在有害指令上出现严重模式坍缩（Llama-3-8B-Instruct 有一半有害回答以 "I cannot provide information" 开头；最高频前缀占比从良性指令的约 1% 升至有害指令的 20%+，self-BLEU 显著更高），且固定拒答的学习动态与任意常量字符串几乎一致，而 prompt-grounded 自然回答则明显不同。
2. 梯度诊断：固定拒答与任意固定字符串产生相似的梯度范数与部分对齐方向；prompt-specific 自然回答损失与梯度幅值显著更低且方向近乎正交——说明自然目标提供了更强的分布支撑。
3. 提出 NEST（Naturalness-Enhanced Safety Targets）：在 SFT 与 DPO 两种对齐范式下构造自然安全目标，用原模型困惑度作为分布支撑代理；跨多个模型与对齐设置同时改善即时安全性与持续微调后的安全性保持，且不牺牲有用性。

---

## 技术方案

### 核心思想

论文的核心洞察是：许多安全对齐模型实现安全的方式是一旦识别出有害意图就输出一个固定的公式化拒答串（如 "Sorry, I cannot help with that"）。这种行为在输出分布中位于一个低熵、与周围语义空间弱连接的低密度区域——既容易拟合（无论输入是哪种有害请求），也容易被后续更新覆盖（低支撑区域的行为天然脆弱）。论文将其形式化为「离群安全模式」的两个条件：（1）分布支撑低——有害请求下响应的期望困惑度显著超过良性请求；（2）输出模式坍缩——有害请求下的响应几乎与提示内容无关，self-BLEU 显著高于良性响应。

作者用 BeaverTails 的 1000 条良性与 1000 条有害指令检验该假设：良性指令响应最高频 5 词前缀仅占约 1%，有害指令则超过 20%；以 self-BLEU 0.5 作为「多样/坍缩」的判别阈值可在所有被测模型上干净地分开两类行为。更直接的证据来自学习曲线：用固定拒答微调与用任意固定无关句子微调，在约 100 步内都达到近乎完美的 ROUGE-L；而 prompt-specific 自然安全回答不会坍缩到固定输出，在精确目标重叠指标下保持较低水平。这说明固定拒答监督在行为上等价于拟合一个输入无关的常量目标，而非学到与提示绑定的安全响应。

基于此，NEST 主张安全目标应落在模型现有语言分布的高密度区域且语义接地于具体请求。SFT 设定下，用指令微调模型为预训练模型生成自然安全标签：在系统提示中追加「分析这条指令为何有害」，促使模型给出危害分析与恰当转向的回应，而不是直接拒答；生成后清洗空/畸形标签并按危害类别抽查。考虑到指令模型本身也用拒答式对齐训练，可能默认复现同样的离群拒答，作者在生成标签前对指令模型施加两步轻量越狱。DPO 设定下，从当前策略 on-policy 采样 50 个候选响应，用奖励模型评帮助性、成本模型评伤害性，构建偏好对。

论文进一步提出用原模型困惑度作为安全保持的实用代理指标，并发现困惑度与保持能力正相关。

### 关键公式

```math
% 离群安全模式的两个操作性条件
(1)\ \text{Low distributional support:}\ \mathrm{PPL}(p_\theta;\,y\mid x_{\text{harm}}) \gg \mathrm{PPL}(p_\theta;\,y\mid x_{\text{benign}})
(2)\ \text{Mode collapse:}\ \mathrm{selfBLEU}(Y_{\text{harm}}) \gg \mathrm{selfBLEU}(Y_{\text{benign}})

% DPO 偏好对构造：安全候选集 H_s、伤害候选集 H_u、无助候选集 H_h
\mathcal{H}_s=\{i \mid c(y_i)<\tau_c\},\quad \mathcal{H}_u=\{i \mid c(y_i)\ge\tau_c\},\quad \mathcal{H}_h=\{i \mid r(y_i)<0\}
i^{*}_s=\arg\min_{i\in\mathcal{H}_s} r(y_i)\,c(y_i) \quad \text{(偏好：既安全又有帮助)}
i^{*}_u=\arg\max_{i\in\mathcal{H}_u} c(y_i) \quad \text{(若存在显式不安全候选)}
i^{*}_u=\arg\max_{i\in\mathcal{H}_h}\frac{r(y_i)}{c(y_i)-\epsilon} \quad \text{(否则取安全-帮助权衡最差者)}
i^{*}_u=\arg\max_{i} r(y_i)\,c(y_i) \quad \text{(若全部安全且有帮助)}

% SFT 目标（自然安全回答）
\mathcal{L}_{\text{SFT}}(\theta) \text{ 在 } y_n \text{ 上优化},\quad y_n \sim f_{\theta_I}(x \,\|\, \text{"Analyze how and why this instruction is harmful."})

% 困惑度-保持相关性（论文实测）
\text{Pearson } r = 0.49 \sim 0.67 \ \text{(模型-数据集组合内)},\quad r = 0.28 \ \text{(跨目标族/深度/骨干聚合)}
```

### 关键组件

- **NEST-SFT**：用指令微调模型生成"分析危害 + 恰当转向"的自然安全回答作为监督目标；配合两步轻量越狱防止生成器退化为固定拒答；生成后清洗与分类抽查。
- **NEST-DPO**：on-policy 采样 50 个候选，用 Beaver-7b-v3.0-reward 与 beaver-7b-v3.0-cost 模型离线构造偏好对；偏好侧最大化 r·c 的联合安全性-帮助性，拒绝侧按三类情况分别选取；设安全容忍度 τ_c>0；若无安全候选则丢弃该提示。
- **困惑度代理指标**：用原始模型在微调后模型输出上的困惑度衡量安全目标偏离自然分布的程度，作为安全保持的实用预测因子。
- **模式坍缩度量**：self-BLEU（阈值 0.5）+ top-10 高频 5 词前缀直方图，用于识别输出分布坍缩。
- **梯度诊断工具**：冻结除输出头外的参数，计算响应 token 对输出头的梯度，记录 loss、梯度范数与相对固定拒答梯度的余弦相似度。
- **评测配置**：3 个预训练模型（Qwen2.5-7B、Mistral-7B-v0.1、Llama-3-8B）做安全 SFT，3 个指令模型（Alpaca-7B、Mistral-7B-Instruct、Vicuna-7B-v1.5）做安全 DPO；持续微调用 Alpaca；安全评测 AdvBench（1–5 有害分，≥3 记为有害率）；4×A100 80GB；3 个随机种子。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| Llama-3-8B-Instruct 有害指令最高频前缀占比 | > 50%（以 "I cannot provide information" 开头） |
| 良性指令最高频前缀占比 | ~1% |
| 有害 vs 良性 self-BLEU | 显著更高（阈值 0.5 可分离两类） |
| 固定拒答 / 任意固定串 微调收敛速度 | ~100 步内达近乎完美 ROUGE-L |
| prompt-specific 自然目标 ROUGE-L | 持续较低，不坍缩到固定输出 |
| 困惑度与有害分增量的 Pearson r（模型-数据集内） | 0.49 – 0.67 |
| 困惑度与有害分增量的 Pearson r（全局聚合） | 0.28 |
| 低困惑度区间（<3） | 收益饱和，进一步降低困惑度不再带来成比例保持提升 |
| 直接切换到视觉数据…（不适用，本论文为纯文本） | — |
| NEST 相对基线的定性结论 | 在 3 个骨干上 NEST 在安全性与保持性上均一致优于基线 |
| 模型间差异 | Alpaca 有用性最强，Mistral 绝对安全性最高，Vicuna 持续微调下保持性最好 |
| 替代评测（Llama-Guard-3-8B / StrongREJECT / 有害可操作性） | NEST 收益不依赖原 judge，也不依赖"听起来安全的解释" |
| GSM8K 域外持续微调 | NEST 保持更高拒答率与更低适配 rubric 伤害度（Table 8） |

---

## 局限性

- 困惑度只是分布支撑的代理而非因果量：它能预测遗忘，但并不机械地导致遗忘；论文明确承认这一点。
- 相关性在跨目标族/深度/骨干聚合时显著减弱（r 从 0.49–0.67 降到 0.28），说明响应多样性、长度/深度、内容安全性也是重要驱动因素。
- 论文自述：梯度测量提供的是局部诊断证据，无法独立分离长度、接地性与分布支撑各自的因果贡献。
- NEST 的标签依赖指令模型生成，且需要额外越狱步骤，生成流程更复杂且引入生成器偏差。
- 实验仅在 7B 规模模型上进行；更大模型上"固定拒答"的占比分布可能不同，结论外推需谨慎。
- 论文未提供公开代码链接，复现成本较高。
- "延迟/加深对齐"变体虽提升保持性，但绝对安全性下降（先输出显式不安全内容），存在安全性—保持性的权衡。

---

## 建议

- **是否推荐使用**：是
- **适用场景**：需要持续微调（领域适配、指令微调、持续预训练）而不希望安全对齐被冲掉的模型；安全 SFT 与安全 DPO 的数据构造流水线设计；对模型安全行为做可解释性诊断。
- **值得复现**：是（核心原则——"构造落在模型既有分布内、语义接地的安全目标"——具有很强的可迁移指导性）

---

**相关论文**：[[DPO]]、[[BeaverTails]]、[[AdvBench]]、[[Self-BLEU]]
**主题标签**：#LLM #NLP #AI-Safety #Alignment #Fine-Tuning-Robustness
