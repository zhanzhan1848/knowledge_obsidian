# How Green Is Your Manifesto? Scoring Environmental Positions in the 2024 EU Elections with an LLM Panel

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | How Green Is Your Manifesto? Scoring Environmental Positions in the 2024 EU Elections with an LLM Panel |
| 作者 | Franco Corti, Sajid Siraj |
| 链接 | [原文](https://arxiv.org/abs/2611.02033) |
| arXiv | arXiv:2611.02033 |
| 类别 | cs.CL, cs.CY, econ.GN |
| 发表时间 | 2026-11-01 |
| 会议 | arXiv preprint |
| 评分 | 6 |

## 核心贡献
1. **提出「LLM 面板」（LLM panel）作为政治文本测度工具**：以三家独立供应商的三个模型组成面板，替代成本高、周期性强、难以扩展到新文档的专家问卷与人工 manifesto 编码。
2. **双维度句子级评分**：每个句子在 **environmental protection（环境保护）** 与 **climate change（气候变化）** 两个维度上被打分，实现**位置（position）**与**显著性（salience）**的分离，再平均到 manifesto 层级。
3. **以模型间一致性作为内建可靠性信号**：保留 inter-model agreement，用于标记该测度工具在哪里出错。
4. **在 2024 欧洲议会选举上应用并对照专家基准**：覆盖 41 份 manifesto（奥地利、法国、德国、意大利、西班牙及欧洲政党家族），其中 **25 个政党** 与 **2024 Chapel Hill Expert Survey** 做 like-for-like 专家基准对照，其余作为诊断案例。
5. **开放科学**：prompt、代码与 manifesto 层级结果全部公开。

## 问题背景
在政党竞争研究中，把政党定位到环境与气候政策轴上是核心操作。既有工具——**专家问卷（expert surveys）** 与 **人工 manifesto 编码（hand coding of manifestos）**——成本高昂、只在周期性节点进行、且难以快速扩展到新文档或新语言。本研究问：**一组大语言模型能否作为一个更便宜、更可复现的替代方案？** 关键是 LLM 评分能否在两个关键效度维度上站得住：(a) 能否复现专家对政党排序（rank agreement），(b) 能否在「宣言承诺」与「实际执政记录」之间做出合理区分——因为 manifesto 与Chapel Hill 专家评分衡量的本就不是同一件事。

## 方法
### 1. 文本单元化
- 将每份 manifesto 视为**句子集合（set of sentences）**。
- 逐句评分而非整篇打分：避免长文档中少数高信息量句子被稀释。

### 2. 三模型面板
- **三个来自独立供应商（independent providers）的模型**组成面板。
- 对每个句子输出**两个维度**的评分：
  - **environmental protection**（环境保护）
  - **climate change**（气候变化）
- 每个维度同时捕捉两个可分解的量：
  - **position（位置）**：政党在该议题上的立场（支持/反对的程度）；
  - **salience（显著性）**：政党赋予该议题的权重/重视程度。
  - 这一分离是核心设计：把「我支持环保」与「环保对我很重要」区分开。
- **判定平均到 manifesto 层级**（judgments averaged to the manifesto level）。

### 3. 内建可靠性信号
- **Agreement across the models is retained as a built-in reliability signal**：不丢弃模型间分歧，而是把 disagreement 作为每个单元格的可靠性/不确定度指标保留。
- 用途：**modestly flags where the instrument errs**（模型分歧适当地标示出工具出错的位置）。

### 4. 语料与对照
| 项目 | 数量 / 说明 |
|------|-------------|
| manifesto 总数 | **41** |
| 覆盖国家 | 奥地利、法国、德国、意大利、西班牙 + 欧洲政党家族 |
| 有专家基准的政党 | **25**（与 2024 Chapel Hill Expert Survey 做 like-for-like 对照） |
| 诊断案例 | 其余 manifesto（无专家对照，用作方法学诊断） |

### 5. 效度分析维度
- **排序一致性（rank agreement）**：面板排序 vs 专家排序，两个维度分别评估。
- **系统性偏差**：面板是否整体比专家更「绿」。
- **位置—显著性关系**：position 与 salience 是否相关（分别对两个议题维度检验）。
- **工具误差定位**：用模型间分歧识别失准单元。

### 6. 开放性
- prompt、code、manifesto-level results 全部公开发布。

## 实验结果
### 核心发现

| 检验项 | 结果 |
|--------|------|
| 与专家排序的一致性 | 面板**recover the expert ordering** of parties，两个维度上均有 **strong rank agreement** |
| 系统性水平差异 | 面板读出的政党**systematically greener than experts do**（比专家更绿） |
| 模型间分歧的作用 | **modestly flags where the instrument errs**（适度标示工具误差位置） |
| position 与 salience 的关系 | **environmental protection：相关**；**climate change：相互独立** |
| 工具定位 | transparent, low-cost, multilingual instrument that **complements rather than replaces** expert and hand-coded approaches |

### 数据规模
- 41 份 manifesto（2024 欧洲议会选举）
- 25 个政党有 like-for-like 专家基准
- 3 个模型（独立供应商）

### 定量细节
- 摘要**未给出**具体的排名相关系数数值、模型名、每份 manifesto 的分数值、以及"more green"差距的具体幅度（仅定性描述）。

## 关键洞察
1. **「宣言比承诺更绿」很可能是测量对象差异，而非模型错误**：面板系统性地比 Chapel Hill 专家给出更绿的位置，作者将其解释为**宣言承诺与执政记录之间的距离**（distance between manifesto promise and governing record）。这是一个有实质含义的发现——它把工具偏差重新解释为被测量构念的差异，从而把"模型不准"这个担忧转化为"两种工具在测不同东西"。
2. **position 与 salience 在两个议题上表现不同**：环保议题上二者相关（既支持又重视），气候议题上相互独立（可能存在"重视但不支持"或"支持但不突出"的分离）。这说明用单一「绿度」分数概括政党环境立场的做法，会在气候维度上损失信息。
3. **模型分歧是有用信号而非噪声**：把 inter-model disagreement 保留下来作为逐单元可靠性指标，使面板可以输出「哪些句子的评分不可信」，这比单纯平均掉分歧的常规做法更适合用于政策研究这类需要审计的场合。
4. **LLM 面板的正确定位是互补而非替代**：在成本、可扩展性、多语言覆盖上有优势，可作为高频/跨语言扩展层与专家基准互为校验。

## 局限性
- 摘要未给出：模型身份、提示词细节、打分量表定义与刻度、排序相关系数（Spearman? Kendall?）的具体数值、每维度评分的方差、41 份 manifesto 的句子数总计、Chapel Hill 专家问卷对照的具体对齐规则。
- "strong rank agreement" 未量化，不同维度一致强度可能差异较大。
- 3 个模型 × 独立供应商的选择带有任意性，面板规模偏小；模型族多样性（不同训练数据/立场倾向）未受控。
- 模型可能带有政治立场偏见（例如在「气候怀疑」类文本上系统偏移），摘要未评估该风险。
- 句子级评分再平均到 manifesto 层级，忽略了句子间的重要性差异与修辞结构（宣言文本的承诺强度常由情态动词承载）。
- 诊断案例（无专家基准的 manifesto）的结论仅为定性。
- 「越绿」差距的解读（宣言 vs 执政记录）是一种解释，而非被独立验证的机制。

## 适用场景
- 政治文本的快速、可复现、跨语言环境/气候立场测量。
- 需要大规模覆盖政党或候选人的比较研究（专家问卷无法覆盖的规模）。
- 与专家问卷 / 人工编码并用，作为低成本预筛与交叉验证层。
- 社会科学方法学：把 LLM 作为「文本测量仪器」的效度检验范式。

## 相关工作
[[LLM-as-a-Judge]] [[Chapel Hill Expert Survey]] [[Political Manifestos]] [[Text Measurement]] [[Inter-Annotator Agreement]] [[Multilingual NLP]]

---
#LLM #Research #llm-as-judge #political-nlp #arXiv-2611
