---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, intent-inference, retrieval, agent, personalization]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2603.03325
arxiv: 2603.03325
---

# IntPro: Context-Aware Intent Inference via Selective Retrieval from User History

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | IntPro: Context-Aware Intent Inference via Selective Retrieval from User History |
| **作者** | Meng Wu, Peng Zhang, Yu Zhang, Yubo Shu, Xianliang Huang, Kainan Tu, Ning Gu, Liuxin Zhang, QianYing Wang, Tun Lu 等（复旦大学、联想集团） |
| **发表** | arXiv preprint（IEEE 期刊投稿格式） |
| **链接** | [原文](https://arxiv.org/abs/2603.03325) |
| **arXiv** | arXiv:2603.03325 |
| **分类** | cs.CL, cs.AI, cs.LG |
| **代码** | 未提供 |

---

## 核心贡献

> 提出 IntPro 代理智能体：对每个上下文自主决定"直接推断意图"还是"先从用户历史中检索意图对齐记录再推断"，并用共享的意图解释（intent explanation）自然语言形式统一表示历史记录与检索查询。

1. **统一"意图解释"表述**：意图解释同时表达观察到的行为、其功能目标，以及"线索→意图"的推理依据。**标签条件化的解释**用于表示历史记录；**从当前上下文生成的候选解释**用作检索查询——两者共享同一自然语言形式，从而让"表示"与"查询"对齐。
2. **选择式检索（selective retrieval）**：把"当前上下文是否需要检索用户历史"作为显式决策纳入训练，代理要么直接从当前上下文推断意图，要么生成候选意图解释去检索意图对齐的历史记录再推断。
3. **两阶段训练范式**：先做 **Direct-and-Retrieval SFT**（同时教两条推断路径），再做**多轮 GRPO + 检索决策奖励（retrieval-decision reward）**，联合优化意图预测与选择性检索机制。
4. **Human–Proxy–LLM 流水线**：把用户历史检索与意图推断都交给代理层，下游 LLM 保持任务特定，输出结构化意图（标签 + 解释）。

---

## 技术方案

### 核心思想

论文指出的核心现象是"**意图表达缺口（Intent Articulation Gap）**"——观察到的行为往往支持多个合理解释：高亮一个技术术语可能是要定义、要对比、还是要了解其起源演化。当前上下文往往不足以确定用户真正目标，而同一用户的历史里可能存在反复出现的"上下文→意图"模式。要利用这些模式，难点有二：一是**要不要检索**（对每个上下文动态判断），二是**怎么检索**——在当前意图尚未确定时，用上下文相似度做检索只提供间接证据。因此 IntPro 的关键设计是引入"意图解释"这一共享表述：用标签条件化意图解释标记历史记录（表达行为、功能目标、线索-意图依据），用从当前上下文生成的候选意图解释作为检索查询。因为查询与记录用同一种语言形式表达，检索到的是"意图对齐"而非"文本相似"的记录。训练上，先用构造的多轮示范同时教会两条路径（直接路径输出意图预测；检索路径先生成候选解释、发起检索、再结合返回记录推断）；再用多轮 GRPO 优化，奖励包含可验证的准确率奖励与检索决策奖励——后者按组内预测成功率调整分配给直接路径与检索路径的决策信用，解决"仅用最终意图奖励会让检索决策无解"（因为两条路径答对时同奖、答错时同罚）的信用分配问题。

### 关键公式

```math
# 意图解释的共享表述（结构化）
\text{IntentExplanation}=(\text{observed action},\ \text{functional goal},\ \text{cue-to-intent rationale})

# 历史记录表示 vs 检索查询
\text{Record}_i \mapsto \text{Explanation}(y_i,\ g(y_i),\ r_i)\quad(\text{标签条件化})
\text{Query}(x) \mapsto \{\text{CandidateExplanation}_1,\ldots,\text{CandidateExplanation}_k\}\quad(\text{由当前上下文生成})

# 多轮 GRPO 的检索决策奖励（示意）
r_{\mathrm{total}}=r_{\mathrm{intent}}(\hat y,y^*)+r_{\mathrm{retrieval\text{-}decision}}(\pi_{\mathrm{retrieval}}\mid \text{group accuracy})

# 信用分配示意：按组内成功率调节两条路径的权重
w_{\mathrm{path}}\propto f(\text{group success rate of that path})
```

### 关键组件
- **Proxy Agent（IntPro）**：在"直接推断"与"检索条件推断"之间做选择。
- **Per-User Intent Library**：存储历史上下文、标注意图与自然语言意图解释。
- **Intent Explanation 共享表述**：历史记录表示与检索查询使用同一语言形式。
- **Direct-and-Retrieval SFT**：同时教两条路径的多轮示范训练。
- **Multi-turn GRPO + Retrieval-Decision Reward**：联合优化意图预测与检索决策。
- **Human–Proxy–LLM 流水线**：代理层负责检索与意图推断，下游 LLM 负责任务特定生成。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 数据集 | Highlight-Intent（阅读）、MIntRec2.0（对话）、Weibo Post-Sync（社交媒体），三场景 |
| 模型骨干 | 3 个 backbone（含 Gemini-3-flash、Qwen3-30B-A3B 等） |
| 总体对比 | IntPro 在 **每个 backbone 上**都取得最高的 Accuracy、Macro-F1 与 Weighted-F1（Table II） |
| 相对 Naive GRPO | 加入检索决策奖励在 **全部 27 个（数据集×骨干×指标）组合**上都带来提升，增益范围从 1.x 个百分点起 |
| 策略对比 | 选择式检索策略的 Accuracy 与 Macro-F1 **高于**任一固定策略（始终直接 / 始终检索） |
| 检索效果 | 意图解释在三个数据集上的 Same-intent Hit@K 与 Intent Accuracy **均为最高**（Table IV），优于用行为或完整上下文作查询 |
| 检索对照 | 相对 Full Context，Global R@1 提升 **17.0** 个百分点（Weibo Post-Sync 上最明显，Highlight-Intent 上仅边际提升） |
| 检索增强收益 | Retrieval-Augmented 的 Gemini-3-flash 与 Qwen3-30B-A3B 在每个指标上都优于其 Direct 版本，最大差距出现在 Weibo Post-Sync |
| 意图解释增益 | 相比每个数据集上更强的原始查询形式，Hit@K 提升 2.x 个百分点 |

---

## 局限性

- 需要带标注意图与解释的**按用户**交互历史，真实场景中这类数据稀缺且需隐私合规处理。
- 检索是"意图对齐"检索而非通用检索，用户库规模大时的召回与计算成本未充分评估。
- 检索决策奖励的信用分配设计较复杂，超参与实现细节影响稳定性，跨场景泛化需验证。
- 实验覆盖 3 个数据集 × 3 个骨干，但数据集领域跨度有限（阅读/对话/社交媒体）。
- 未提供代码；提案中的隐私合规与数据可得性是实际落地的关键约束。
- 意图本体为闭集预定义标签，未覆盖开放意图发现。

---

## 建议

- **是否推荐使用**：是
- **适用场景**：智能助手/输入法/推荐系统中需要从用户行为推断潜在意图的产品；个性化 LLM 代理中"检索什么、何时检索"的决策层设计；研究"意图中心"检索表示（而非文本相似检索）的方法论参考。
- **值得复现**：是

---

**相关论文**：[[2026-11-10-FlashFusion-IoT-Query-Agent]] [[2026-11-10-AMTFV-Agentic-Math-Tool-Flow-Verification]]
**主题标签**：#LLM #NLP #IntentInference #Retrieval #Agent #Personalization #GRPO
