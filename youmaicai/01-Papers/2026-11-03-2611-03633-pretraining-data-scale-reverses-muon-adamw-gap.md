# Pretraining Data Scale Reverses the Muon-AdamW Fine-Tuning Gap

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | Pretraining Data Scale Reverses the Muon-AdamW Fine-Tuning Gap |
| 作者 | Catherine Li, Jingchu Gai, Andrej Risteski, Jacob Mitchell Springer, Aditi Raghunathan |
| 链接 | [原文](https://arxiv.org/abs/2611.03633) |
| arXiv | arXiv:2611.03633 |
| 类别 | cs.LG |
| 发表时间 | 2026-11-02 |
| 会议 | arXiv preprint |
| 评分 | 9 |

## 核心贡献
1. **发现一个反直觉的优化器反转现象**：Muon 近期作为预训练优化器备受关注（在最小化预训练 loss 上相对 AdamW 有加速），但本文发现**超过足够大的预训练数据预算后，AdamW 在微调后反而优于 Muon**。
2. **模型规模会提前反转点**：**模型越大，AdamW 反超 Muon 所需的 token-parameter ratio（令牌-参数比）越小**。
3. **提出 margin-to-spread ratio（裕度-散布比）作为解释工具**：把微调视为对预训练输出的**扰动（perturbation）**，该指标衡量「正确 logit 高出错误 logit 多少」相对于「错误 logit 散布得有多开」。
4. **优化器行为与微调趋势同构**：在语言模型中，**小数据预算下 Muon 的 margin-to-spread ratio 更大，大数据预算下 AdamW 更大**——与下游微调趋势镜像一致。
5. **线性联想记忆（linear associative memory）中的理论证明**：证明**一次更新后，梯度下降的 margin-to-spread ratio 随数据预算增长而超过 Muon 的**，且模拟显示该趋势在延长训练后依然保持。

## 问题背景
Muon（一种基于正交化的矩阵优化器）作为大模型预训练优化器快速走红，卖点是比 AdamW 更快地降低预训练 loss。但这一卖点通常在**预训练 loss 曲线上**度量，而实践中真正决定交付质量的是**下游微调后的表现**。两个优化器在预训练 loss 上的差异，是否会一致地传导到微调结果？此前并不清楚。更棘手的是：Muon 与 AdamW 的差异本质上是**对权重/输出的更新几何不同**，其下游效应可能依赖于训练数据规模与模型规模等上下文变量——即结论可能是**条件性**的。已有讨论大多以「Muon 更快即更好」的框架展开，缺少对**数据预算与模型规模**这两个关键轴的受控扫描。

## 方法
### 1. 实验框架
- 扫描维度：
  - **预训练数据预算**（token 数）；
  - **模型规模**；
  - **微调后下游表现**。
- 对比优化器：**Muon vs AdamW**。
- 关键观测指标：**token-parameter ratio**（$\text{tokens}/\text{params}$）作为数据预算的归一化坐标。

### 2. 关键量化关系（据摘要）

| 模型规模趋势 | 结论 |
|--------------|------|
| 模型增大 | AdamW 反超 Muon 的 token-parameter ratio **变小（progressively smaller）** |

$$\text{(AdamW overtakes Muon at smaller token-param ratio as model size grows)}$$

即存在一个**反转阈值** $r^*(s)$，随规模 $s$ 增大而下降：

$$r^*(s_2) < r^*(s_1), \quad s_2 > s_1$$

### 3. margin-to-spread ratio（核心解释量）

**动机**：把微调视为对预训练输出的**扰动**。

**定义**：正确 logit 相对错误 logit 的裕度，与错误 logit 散布宽度之比。设正确 logit 为 $z^+ = \max_{c \in \text{correct}} z_c$，错误 logit 集合 $\{z^-_j\}_{j=1}^{m}$，则

$$\text{MSR} = \frac{z^+ - \max_j z^-_j}{\text{spread}(\{z^-_j\})}$$

其中 $\text{spread}(\{z^-_j\})$ 刻画错误 logits 的离散程度（摘要未给出具体是标准差、极差还是其他散布度量）。

**语义**：
- **大 MSR** → 正确答案与错误答案之间的 logit 间隔相对于错误答案自身的分散度更大 → 模型的决策**对扰动更鲁棒**（微调不易翻转预测）。
- **小 MSR** → 正确答案并未显著领先，且错误答案彼此散布很开 → 微调时预测容易被推翻。

### 4. 优化器—MSR 对应关系

| 数据预算 | margin-to-spread ratio 更大的优化器 |
|----------|-----------------------------------|
| **小** | **Muon** |
| **大** | **AdamW** |

- 该趋势与下游微调表现趋势**镜像一致（mirroring the fine-tuning trend）**：
  - 小预算 → Muon 的 MSR 更大 → Muon 微调后更好；
  - 大预算 → AdamW 的 MSR 更大 → AdamW 微调后更好。
- 这是本文的**机制性解释**：预训练 loss 更低（Muon 的卖点）并不保证微调更稳，因为预训练 loss 与 margin-to-spread ratio 是不同的量。

### 5. 线性联想记忆（linear associative memory）中的理论证明

**设定**：以线性联想记忆为可完全分析的记忆模型，研究不同优化器在数据预算增长时的行为。

**定理（一次更新后）**：
$$\text{MSR}_{\text{GD}}^{(1)}(D) > \text{MSR}_{\text{Muon}}^{(1)}(D) \quad \text{as } D \text{ (data budget) grows}$$

即：**在一次更新之后，梯度下降（AdamW 所属族）的 margin-to-spread ratio 随数据预算增长而超过 Muon 的**。

**扩展（模拟）**：该趋势在**延长训练（extended training）**后依然保持。

- 该理论结果给出了**反超出现在线性可分析模型中的必然性**，而非仅仅是语言模型中的经验现象。

## 实验结果
### 核心事实汇总

| 编号 | 结论 | 类型 |
|------|------|------|
| 1 | Muon 在**最小化预训练 loss** 上优于 AdamW（有加速） | 已知（引言背景） |
| 2 | 超过足够大的预训练数据预算后，**AdamW 微调后优于 Muon** | 实验（反直觉） |
| 3 | 模型规模增大时，AdamW 反超的 token-parameter ratio **逐步变小** | 实验 |
| 4 | 小数据预算下 **Muon 的 MSR 更大**；大数据预算下 **AdamW 的 MSR 更大** | 实验 |
| 5 | 语言模型中 MSR 趋势与微调趋势**镜像一致** | 实验 + 机制 |
| 6 | 一次更新后，GD 的 MSR 随数据预算增长而超过 Muon | **理论证明（线性联想记忆）** |
| 7 | 该理论趋势在延长训练后保持 | 模拟 |

### 反转的结构性刻画

| 变量 | 对反转阈值的影响 |
|------|-----------------|
| 预训练数据预算 ↑ | 越过阈值 → AdamW 胜 |
| 模型规模 ↑ | **阈值下移**（更小数据量即反转） |

### 摘要未给出的定量信息
- 反转点的具体 token-parameter ratio 数值；
- 参与扫描的模型规模列表（small/large 具体大小）与数据预算档位；
- 微调任务与评测基准名称、微调数据量、评估指标；
- MSR 的具体数值曲线；
- MSR 中 "spread" 的精确定义与在 softmax 前/后的 logit 空间计算；
- 线性联想记忆的形式化设定（维度、激活函数、优化器近似）与定理的完整假设。

## 关键洞察
1. **「预训练 loss 更低」与「微调后更好」不是同一目标**：Muon 的核心卖点是在预训练 loss 上加速，但本文表明该优势在大数据预算下会反转。评测优化器时若只报预训练 loss，会系统性地误导选择——**优化器比较必须以数据预算为条件（conditional on data budget）**。
2. **margin-to-spread ratio 揭示了为什么**：在数据丰富时，正确的做法不是把正确答案的 logit 推得更高，而是**压缩错误 logit 的散布**（收紧竞争答案之间的分布），从而放大决策边界。AdamW 在大数据预算下更擅长这一点，而 Muon 的优势（更大的正 logit 裕度）在数据稀缺时更重要。
3. **规模会提前反转点，这是一个有实践后果的耦合**：大模型即使在更小的数据预算下也会出现 AdamW 更优的现象。因此「我们的模型规模足够大 → Muon 仍然更好」的辩护是不成立的；规模本身是风险因子。
4. **线性联想记忆上的证明把经验现象提升为机制**：一旦在最简单的记忆模型中就能复现「GD 随数据预算超车 Muon」，反转为理论必然而非偶然的工程现象；这也给出了一个廉价的研究沙盒，可在其他优化器家族上复用。
5. **方法论意义**：MSR 提示在预训练中应监控的不只是 loss，还包括**logit 几何（margin 与 spread）**——这是可直接落地的训练期诊断指标。

## 局限性
- 摘要未给出：实验的具体模型、数据量、token 数、微调设置、基准与具体数值，因此「足够大的预训练数据预算」的具体量级未知。
- 理论证明基于**线性联想记忆**这一简化模型，与真实 Transformer 的差距未量化；论文自身也只声称模拟层面趋势持续。
- MSR 是本文提出的解释性指标，但其**独立预测力**（是否能预测微调表现）与预训练 loss 相比如何，未在摘要中给出对照。
- 结论可能依赖于具体微调任务（指令微调？SFT？继续预训练？）与超参，摘要未说明适用范围。
- 是否覆盖其他优化器家族（SGD-momentum、Adam 变体、Lamb、Adafactor）未知。
- 摘要未说明计算规模与硬件成本、以及反转结论对精度（bf16/fp32）的影响。

## 适用场景
- 大模型预训练优化器选型：需要在给定数据预算与模型规模下判断 Muon / AdamW 谁更合适。
- 数据受限场景（小 token 预算）：Muon 可能是更优选择；数据充裕场景：AdamW 更稳。
- 训练期诊断：把 margin-to-spread ratio 加入监控指标以预测微调鲁棒性。
- 优化器研究的可控沙盒：在线性联想记忆上快速验证假说。

## 相关工作
[[Muon]] [[AdamW]] [[Optimizer]] [[Pre-training]] [[Fine-tuning]] [[Linear Associative Memory]] [[Margin-to-Spread Ratio]] [[Scaling Laws]]

---
#LLM #Research #optimizers #pretraining #arXiv-2611
