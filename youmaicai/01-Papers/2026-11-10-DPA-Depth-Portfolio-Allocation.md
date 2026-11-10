---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, test-time-scaling, recurrent-reasoning, inference-allocation]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.12293
arxiv: 2611.12293
---

# Depth as a Candidate Source: Portfolio Allocation for Recurrent Test-Time Scaling in Large Language Models

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Depth as a Candidate Source: Portfolio Allocation for Recurrent Test-Time Scaling in Large Language Models |
| **作者** | Chaoyuan Hao, Wentao Yue, Yanyan Wu, Boyuan Gao, Tianyou Lai, Maolin Wang 等 |
| **发表** | arXiv preprint |
| **链接** | [原文](https://arxiv.org/abs/2611.12293) |
| **arXiv** | arXiv:2611.12293 |
| **分类** | cs.AI |
| **代码** | [anonymous.4open.science/r/LLM-latent-B7BC](https://anonymous.4open.science/r/LLM-latent-B7BC/) |

---

## 核心贡献

> 指出单深度视角的盲区：**更深的递归推理会丢失浅层已找到的正确解，且各深度的成功集合大体非嵌套**；因此提出 DPA（Depth Portfolio Allocation），把递归测试时扩展重述为"在多个深度候选源之间做预算分配"。

1. **诊断性发现**（论文最核心的贡献）：初步分析显示不同问题偏好不同深度、更深递归并不单调精化浅层解；即使控制了边际准确率，各深度的成功集合仍系统性非嵌套——深度决定的不只是算力成本，更是**可达候选解的集合**。
2. **新形式化**：DPA 把每个递归深度同时视为"计算成本"与"候选来源"，在共享推理预算下做分配；将分配问题与其优化器解耦，既支持**预先固定的组合（fixed portfolio）**，也支持**基于反馈的序贯分配**。
3. **序贯实现**：标准 PPO 策略观察当前候选集与剩余预算，决定下一个查询哪个深度或直接停止；策略按任务分别训练，在验证集选配置后冻结，再到独立测试集评估。
4. **系统性实证**：在 GSM8K、SVAMP、MultiArith、MBPP 四个基准上，混合深度组合在**匹配的候选数与名义成本**下均扩大 oracle 覆盖；反馈引导的分配总体持平或优于均匀分配，并在高预算下减少计算。

---

## 技术方案

### 核心思想
递归潜在推理（recurrent latent reasoning）通过增加递归深度来扩展测试时算力，天然把推理表述为"何时停止"的问题。但这一单轨迹（single-trajectory）形式隐含了一个前提：更深的递归会逐步精化、至少保留浅层已有的解。作者的初步分析推翻了这个前提——递归深度上的性能会先升后降（呼应 looped LM 的既有观察），且逐题来看，更深的轨迹经常把浅层已经答对的题答错。这意味着"选一个停止深度"是不完整的：不同深度解锁的是**部分互补**的候选解集合。于是 DPA 把问题重新表述为**预算约束下的组合式采集**：在共享预算下，决定要从哪些深度各采多少个候选。DPA 进一步把"怎么分配"与"用什么优化器分配"解耦：静态组合可以直接给定，序贯组合则可以由任意策略决定下一步动作。论文的序贯版本用 PPO 实现：状态包含候选反馈特征（LRM 分数按 LRM 在当前子集上标准化后按深度取均值与最大值等）、计数特征、剩余预算比例，输出为选择某个深度或停止；奖励为选择器的最终准确率。每个深度动作获取一个新候选后更新反馈与成本。最终答案由基于潜在奖励模型（LRM）的 Borda 选择器给出。

### 关键公式
```math
\text{Oracle coverage} = \frac{\#\{\text{questions with } \ge 1 \text{ correct candidate}\}}{\#\text{questions}}

\min_{\{n_d\}} \sum_d n_d \cdot c_d \ \le\ B
\quad\text{s.t.}\ \sum_d n_d = N
\quad\text{where } c_d = \text{nominal recurrent cost of depth } d

\text{PPO objective: } \mathcal{J}(\theta)=\mathbb{E}\Big[\min\big(r_t \hat{A}_t,\ \mathrm{clip}(r_t, 1-\epsilon, 1+\epsilon)\hat{A}_t\big)\Big]
```

### 关键组件
- **深度候选源（depth-specific candidate source）**：每个深度 d 有名义成本 $c_d$ 与一个候选池（最多 5 个候选/深度，每题至多 15 个候选）。
- **DPA 静态组合 vs. DPA/Uniform vs. DPA/PPO**：静态预先固定组合；均匀分配为基线；PPO 为反馈引导的序贯分配。
- **缓存模拟实现**：cache 模式下深度动作后从该深度的 5 个候选中均匀抽一个未用槽位，不重新生成答案；在线执行则是每次深度动作真实调用生成器。
- **LRM Borda 选择器**：基于潜在奖励模型的 Borda 计数给出最终答案。
- **策略状态编码**：文本分支 96 维、分数分支 96 维、预算分支 32 维（Tanh）；隐藏态分支保留 4 个 32 维深度槽位；获得 LLM-normalized 256 维向量。
- **可行性规则**：一个深度可行当且仅当其成本可被剩余预算覆盖且已用次数 < 5。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 基准 | GSM8K、SVAMP、MultiArith、MBPP |
| 骨干 | 冻结的 Huginn（recurrent）骨干 |
| 关键对照设计 | (A) 固定候选数：组合 vs 固定中间深度，均 4 候选，名义成本同为 64；(B) 匹配名义预算：组合与中间深度同候选数，浅层重复采样允许更多候选 |
| Oracle 覆盖（匹配候选数） | MBPP：4×d₈ 为 21.04%、82.50%（MultiArith）；组合方案在各任务上覆盖更高 |
| DPA/PPO 单轨迹基线 | GSM8K 47.62%、SVAMP 58.03%、MBPP 31.30%、MultiArith 92.12% |
| 单轨迹基线 | Base/single：GSM8K 32.60%、SVAMP 51.70%、MBPP 27.80% |
| DPA/PPO vs Uniform | 在全部四个数据集的大多数预算档位上持平或更优，MultiArith 上增益最大 |
| 预算利用 | MBPP 上 PPO 仅用掉 74.6% 的预算却略优于 Uniform；GSM8K/MBPP/MultiArith 上 PPO 用的名义计算少于 Uniform，SVAMP 上略多 |
| 覆盖饱和现象 | MultiArith 上浅层重复采样随预算增大逐渐逼近组合方案，最高预算时追平——深度组合的价值取决于固定源还漏掉哪些题 |
| 超越基线 | 深度间的"方向性互救"明显：一个深度能救回另一个深度失败的题，但反向贡献很小（对角元为 0） |

---

## 局限性

- 仅在冻结的 Huginn 单一递归骨干与四个基准上验证，未覆盖其他递归架构、模型规模与任务域。
- 顺序实验采用有界候选池 + 缓存模拟，名义递归深度是主要计算度量，**未计入解码、评分与策略推理开销**，与端到端 runtime 成本不等价。
- PPO 策略按任务单独训练，泛化到新任务/新预算需重训。
- 高预算下 PPO 留下未用预算，其中一部分来自"无可行动作"而非显式 STOP，二者在实验中未严格区分。
- 论文结论主要基于 oracle coverage（上限）与选择准确率，未直接给出端到端部署收益。

---

## 建议

- **是否推荐使用**：是（作为测试时算力分配的新视角）
- **适用场景**：使用递归/looped LLM 做推理并希望在固定算力预算下最大化准确率的场景；候选生成成本随深度递增、需要权衡"多采浅层"与"采深层"的推理服务。
- **值得复现**：是（诊断性分析部分——深度成功集合的非嵌套性——独立价值高，容易在自有模型上验证）

---

**相关论文**：[[Test-Time-Scaling]], [[Looped-LM]], [[Best-of-N]]
**主题标签**：#LLM #NLP #Test-Time-Scaling #Inference-Allocation #Recurrent-Reasoning
