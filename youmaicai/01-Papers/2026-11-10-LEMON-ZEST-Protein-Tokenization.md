---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, protein-language-model, tokenization, bioinformatics, contrastive-learning]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2609.37675
arxiv: 2609.37675
---

# LEMON-ZEST: Evolution-Informed Tokenization for Efficient Protein Language Modeling

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | LEMON-ZEST: Evolution-Informed Tokenization for Efficient Protein Language Modeling |
| **作者** | Biswajit Banerjee, Claudia Alvarez-Carreño, Anton S. Petrov |
| **发表** | NeurIPS 2026（camera-ready） |
| **链接** | [原文](https://arxiv.org/abs/2609.37675) |
| **arXiv** | arXiv:2609.37675 |
| **分类** | cs.LG, q-bio.BM |
| **代码** | [github.com/LDWLab/ZEST](https://github.com/LDWLab/ZEST)（MIT 许可，权重同步发布于 Hugging Face） |

---

## 核心贡献

> 提出 **ZEST**（Zoned Encoding of Sequence Traits）——直接从多序列比对（MSA）的进化保守区构造蛋白质词表，把生物学先验在**分词阶段**就注入模型；配套的 200M 参数 **LEMON** 模型证明"进化感知分词可以替代大规模参数扩展"。

1. **ZEST 词表**：从 TEDLH 数据的 MSA profile 中抽取"区域（zone）"，把互可替换的序列变体聚到同一 token id，使词表内置"保守性/可替换性"这一领域先验，而不必靠规模化隐式学习。词表规模 **31,975** token，其中 27,524（86.1%）为 singleton（无生物化学可替换变体），4,451（13.9%）为真实簇，**在 32K 词表预算内编码了 43,388 个不同序列片段**；簇大小中位数 3–4，token 长度 3–82 残基（中位 4），相对单残基分词实现约 **4×** 上下文压缩。
2. **压缩比突破**：ZEST 原生把序列压到**平均 3.3 残基/token**，使模型能在标准 **1024 token** 上下文窗口内处理 **≥3380 残基**。
3. **LEMON**（Layered Extraction of Molecular Ordering from Nature）：200M 参数、纯序列模型，在**单张 H100 上训练一周**，在远缘同源（remote homology）检测上超越 600M–3B 级模型，与结构监督的 TM-Vec 打平。
4. **消融证据**：LEMON-BPE（同架构同数据同微调，仅把 ZEST 换成 BPE）与 ESM2-CFT（ESM-2 650M 端到端对比微调）两个匹配对照表明增益来自**分词本身**而非对比目标或规模。

---

## 技术方案

### 核心思想
现代语言模型的两大支柱是子词分词与算力最优规模化，蛋白质语言模型（PLM）沿用了同样的规模化路线，却忽视了分词粒度。论文的出发点是一个生物学事实：与人类语言不同，蛋白质在经历大量序列变异后仍保持结构——"忒修斯之船"在折叠（fold）层面是可以回答的，因为折叠只要序列中的氨基酸维持结构完整性就不变，而这些关键氨基酸往往位于**进化保守区**。生物学家通过多序列比对（MSA）把同折叠序列排成二维网格，正好暴露出决定折叠的保守区景观。于是作者提出：既然结构比序列更保守、序列→结构是多对一映射，那么**MSA 的保守区就可以直接当作"自然界的词表"**。ZEST 的构造流程是：从 TEDLH 的 census 序列的 MSA profile 中抽取 zone；给每个 zone 打分并按分数取 Top-N 构建闭集词表；打分时对长度做轻微偏置以免词表被高频短 motif 主导、也不惩罚天然低频的长 motif，具体为 $\text{score}=\text{freq}\cdot\text{length}^{1.5}$；随后将互可替换的变体聚到同一 token id，簇内成员共享 token（用以应对序列的可变性）。LEMON 的架构上使用**共享编码器 + 两个任务头**：一个头做 token 级与序列级 MLM，另一个头做对比学习——后者在 TEDLH 的 5,970 万蛋白对上微调，标注来自 TED domain 层级（CATH 三个层级）。数据规模上，预训练使用 9,000 万条蛋白序列，微调用 5,970 万对。

### 关键公式
```math
\text{Zone scoring:}\quad \text{score}=\text{freq}\cdot\text{length}^{1.5},
\qquad \mathcal{V}\leftarrow\text{Top-}N(\mathcal{C},\text{score})

\text{Vocabulary compression:}\quad \text{avg. token length}=3.3\ \text{residues/token},
\qquad 1024\ \text{tokens} \Rightarrow \ge 3380\ \text{residues}

\text{Cluster statistics:}\quad
|\mathcal{V}|=31{,}975,\quad
27{,}524\ (86.1\%)\ \text{singletons},\quad
4{,}451\ (13.9\%)\ \text{clusters covering } 43{,}388\ \text{fragments}
```

### 关键组件
- **ZEST 分词器**：MSA 保守区抽取 + 打分取 Top-N + 变体聚类（Algorithm 1），32K 词表预算。
- **LEMON 编码器（200M）**：共享编码器同时服务 token 级 MLM 与序列级对比学习两个头。
- **两级训练目标**：预训练（9,000 万序列，token 级 + 序列级 MLM）→ 对比微调（5,970 万 TEDLH 对，CATH 三层级标注）。
- **匹配对照组**：LEMON-BPE（BPE 替换 ZEST，其余完全一致）、ESM2-CFT（ESM-2 650M 端到端对比微调 + LEMON 的头与数据）、LEMON-Tok-only（表征消融）。
- **评测协议**：CATH-S20（Architecture / Topology）与 SCOPe（Fold / Superfamily），主指标 fold-level AUROC，辅助指标 mAP；SCOPe 上按 6 个序列同一性阈值（th10–th95）评估，远同源定义为序列同一性 <30%。
- **推理成本基准**：单张 L40S，三个长度分箱（small 100–499 / medium 500–999 / large 1000–1999 残基）。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| LEMON CATH-S20 Architecture | AUROC **0.815 ± 0.002**、mAP 0.346 ± 0.003（最佳） |
| LEMON CATH-S20 Topology | AUROC **0.886 ± 0.002**、mAP 0.312 ± 0.006 |
| LEMON SCOPe Fold | AUROC **0.901 ± 0.004**、mAP 0.300 ± 0.009 |
| LEMON SCOPe Superfamily | AUROC **0.942 ± 0.003**、mAP 0.463 ± 0.010 |
| TM-Vec（结构监督）对照 | CATH-S20 Architecture AUROC 0.716、Topology 0.895、SCOPe Fold 0.980（LEMON 与其"打平"） |
| SCOPe fold 分阈值 | LEMON 在全部序列模型中领先，th10（最难）AUROC **0.91** 至 th95 **0.98**，紧贴 TM-Vec |
| 结构监督对照 | SaProt（3Di 残基级结构 token）大幅落后 LEMON，说明残基级结构监督不能替代 LEMON 学到的全局表征几何 |
| 零样本酶学分类 | EC（酶学委员会）任务 AUROC 最高 0.977（ProtTucker 主导）；LEMON 与 ProtTucker 在 GO MF 上基本不可区分 |
| 推理速度（L40S） | LEMON 在每个长度分箱都是最快、最轻；中等长度下比 ESM2-650M 快一个数量级，显存近乎持平而基线陡增；large 分箱中 LEMON 约 **2.8 ms/条**，比唯一能跑该分箱的 ProstT5 快一个数量级以上、显存约省 10 倍 |
| 训练成本 | 单张 NVIDIA H100 80GB HBM3；全规模模型单 seed 训练 |
| 消融结论 | BPE 加速预训练吞吐但精度急降；ZEST 同时提升精度与微调速度；LEMON 在远缘折叠检索上超越 ESM2-CFT，尽管参数与算力不到其三分之一 |

---

## 局限性

- **间接结构监督**：LEMON 虽不把结构作为输入模态，但对比微调所用的 CATH 层级与 TED domain 边界本身派生自蛋白结构。
- **仅在单结构域序列上微调**，多结构域蛋白与短 motif 级查询的行为未测试。
- **细粒度 vs 结构鲁棒的权衡**：ZEST 的"替换不变"词表牺牲细节，LEMON 在 fold 层最强，但在 superfamily 层与残基级 PLM（TM-Vec）及更大的对比模型（ProtTucker）相比仍有差距，残基级属性预测弱于 ESM-2。
- 评测为氨基酸困惑度时，ZEST token 跨度大于遮蔽位点，故实际被遮蔽残基比例高于标称，两种遮蔽方案不可直接按列比较。
- **单 seed**：受算力限制全规模模型仅训练一个随机种子，bootstrap 区间只反映评测 query 的变异，不反映训练运行间变异；也未扩展到 200M 以上。
- 定位/分类性能之外的功能预测（结构预测、多模态）未验证。

---

## 建议

- **是否推荐使用**：是（对 PLM 与结构生物学社区）
- **适用场景**：远缘同源检索、折叠级蛋白分类、酶学功能零样本预测、受上下文长度与显存限制的结构蛋白建模场景；以及任何"领域先验可在分词阶段注入"这一思路的启发（可迁移到 DNA/其他生物序列）。
- **值得复现**：是（代码与权重以 MIT 许可完全开放，单卡 H100 一周即可训练；LEMON-BPE 与 ESM2-CFT 两个匹配对照设计干净，适合独立验证"增益来自分词"这一核心主张）

---

**相关论文**：[[ESM-2]], [[TM-Vec]], [[ProtT5]], [[Byte-Pair-Encoding]]
**主题标签**：#LLM #NLP #Protein-Language-Model #Tokenization #Bioinformatics
