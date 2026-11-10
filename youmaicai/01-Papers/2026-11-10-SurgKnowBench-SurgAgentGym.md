---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, surgical-vision, agentic-benchmark, medical-AI, tool-use]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.11437
arxiv: 2611.11437
---

# How to "train" a surgeon? Benchmarking generalist agents in surgical scene understanding

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | How to "train" a surgeon? Benchmarking generalist agents in surgical scene understanding |
| **作者** | Xiao Han, Shijie Zhou, Abdullah Koukash, Jingpei Wu, Jindong Gu, Yuqicheng Zhu, Nassir Navab, Volker Tresp, Ghazal Ghazaei |
| **发表** | NeurIPS 2026（Datasets and Evaluations Track）（64 页含附录） |
| **链接** | [原文](https://arxiv.org/abs/2611.11437) |
| **arXiv** | arXiv:2611.11437 |
| **分类** | cs.CV, cs.AI |
| **代码** | https://vitagent.github.io/（项目页） |

---

## 核心贡献

> 用两阶段评估回答"通用 MLLM 能否在不训练的情况下理解手术场景"：SurgKnowBench 诊断其零样本手术能力边界，SurgAgentGym 检验通用智能体能否靠工具-mediated 证据检索在推理期补足短板。

1. Stage I 提出 SurgKnowBench：聚合并统一 11 个公开手术数据集、7 种术式、7 条任务轴，产出 376,602 个样本的诊断性基准；对 17 个闭源与开源 MLLM 做零样本评测，绘制预训练手术能力的边界。
2. Stage I 的关键发现：模型保留部分视觉先验但关系与流程理解薄弱——工具检测最好仅 26.1% macro-F1（多数类基线 13.5%）、工具定位最好 22.7% F1@0.5、三元组检测全部低于 5% macro-F1、相位识别最佳数据集平均准确率低于多数类基线。
3. Stage II 提出 SurgAgentGym：给通用 MLLM 智能体两个工具族——通用视觉接地（perceive）与受限的、可溯源的外科知识检索（SurgWiki，74,315 个可索引知识块）；配套轨迹级分析，使"证据链是否可审查"成为可评估对象。

---

## 技术方案

### 核心思想

外科"超级智能"要求模型具备视觉、流程与专家密集的场景理解能力，但有两重障碍：手术数据稀缺、碎片化、隐私受限、标注昂贵且高度术式相关，使"大规模监督预训练 + 领域微调"的标准配方不可行；同时通用 MLLM 的手术能力边界刻画不清。论文因此提出分阶段提问：Stage I——直接推理下通用 MLLM 已经理解多少手术；Stage II——当数据密集的手术训练不现实时，能否在推理期（不额外训练）提升手术理解。

这一提问方式借鉴人类外科住院医师的培养结构：学员不只从标注样本学习，还研究解剖与手术本体、查阅手术参考、观看演示与既往病例，并把抽象知识连接到具体手术场景。论文强调可迁移的能力不是记忆，而是"认知控制"（epistemic control）：识别自己缺什么知识、寻找相关证据、把证据落到观察到的场景、再用它支撑决策。

Stage I 的基准覆盖三个任务域：空间识别（空间 recognition）、时间推理（temporal reasoning）、工作流评估（workflow assessment）。任务轴包括工具检测、（工具,动词,目标）三元组检测、工具定位、关键安全视野（CVS）分级，以及 GOALS 风格的技能评估（整体、Calot 阶段、剥离阶段）。11 个数据集覆盖 7 种术式：腹腔镜胆囊切除（Cholec80、CholecT50、Cholec80-CVS、HeiChole）、Roux-en-Y 胃旁路（MultiBypass140）、腹腔镜子宫切除（AutoLaparo）、腹腔镜直肠结肠切除（HeiCo）、机器人辅助根治性前列腺切除（GraSP）、内镜下垂体手术（PitVis）、白内障手术（Cataract-101、CATARACTS）。

Stage I 的评测揭示两类病态模式：一是"多数坍塌"——模型总是预测最频繁的分值，InternVL2.5-8B 因此在 CVS 上取得 71.2% 准确率但 κ=0；二是"乐观过度给分"——GPT-4o-mini 与 Lingshu-32B 频繁把 CVS 判据标为已达成（人类标注实为低分），准确率 15.6% 与 9.4% 甚至低于 32.8% 的随机基线。技能评估同理，评分集中在 5 级量表中部，导致低 MAE 却毫无区分度。

Stage II 的 SurgAgentGym 按两条原则设计：通用感知接入（不同骨干的像素级接地能力存在"先天"差距，需提供通用视觉接地工具以弥合）与受监管的知识检索（高风险判断需要控制来源身份与溯源，故引入闭域外科知识库 SurgWiki）。SurgWiki 含 74,315 个可索引知识块（37,672 文本块、35,951 教程视频块、692 病例记录块），来源为外科教科书、临床实践指南、旁述教程视频与标注病例记录，覆盖"陈述性–程序性–条件性"知识阶梯。工具预算被严格约束：retrieve() 对每个 source_type 每回合最多查询 2 次（四类证据合计隐含上限 8 次检索），perceive() 单图任务限 2 次、多帧任务限 3 次。

论文还构建 SurgKnowBench-Hard：按面板误差 PanelError 排序，保留所有模型都失败的回合，作为不受预训练能力混淆的受控压力测试。

### 关键公式

```math
% 面板难度评分（构造 Hard 集）
\mathrm{PanelError}(x) = \frac{1}{|\mathcal{M}_x|}\sum_{m\in\mathcal{M}_x}\left(1 - \mathrm{Perf}_{\tau(x)}(m,x)\right)
% \mathcal{M}_x 为面板模型集，\tau(x) 为任务类型，\mathrm{Perf}\in[0,1] 为任务归一化逐回合分数
% 按每个数据集内 PanelError 降序取候选回合构成 SurgKnowBench-Hard

% 检索相关性评估（相对 LLM 裁判与专家标注的区分度）
\mathrm{AUROC}(\text{relevance score vs LLM judge}) = 0.894,\quad
\mathrm{AUROC}(\text{vs human expert}) = 0.817
% 各知识来源内 AUROC 0.68 – 0.87；precision@1 估计 57% – 82%
```

### 关键组件

- **SurgKnowBench**：11 数据集 × 7 任务轴 × 7 术式 = 376,602 样本；统一 QA 式评测格式并保留标签集与时间元数据。
- **评测指标**：固定标签集任务用 macro-F1（暴露稀有标签失败）；相位识别用严格标签准确率；工具定位用 Hungarian 匹配后的标签约束 F1@0.5；CVS 用逐键精确均值准确率 + 三判据的二次加权 Cohen's κ；技能评估用 MAE + GOALS rubric 键的二次加权 κ；统计用视频聚类自助法（1000 次重采样）给 95% CI 与 BH-FDR 显著性。
- **SurgKnowBench-Hard**：面板误差排序得到的"全体失败"子集。
- **SurgWiki**：74,315 知识块（37,672 文本 / 35,951 教程视频 / 692 病例记录），四类溯源来源；另有排除商业来源的 SurgWiki-Open 配置。
- **perceive() 工具**：通用视觉接地，返回区域候选。
- **retrieve() 工具**：三参数（query 自然语言查询、knowledge_type 陈述性/程序性/条件性/元认知、source_type 硬过滤指南/教科书/教程视频/病例记录），返回带相关性分数的检索结果。
- **轨迹级分析**：考察是否识别信息需求、是否选对工具、是否检索到相关证据、是否把视觉证据落到手术输入、是否整合成符合契约的答案。
- **统计检验**：paired video-clustered bootstrap，BH-FDR q ≤ 0.05 标记显著领先。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| SurgKnowBench 规模 | 376,602 样本 / 11 数据集 / 7 术式 / 7 任务轴 |
| 评测模型数 | 17 个闭源与开源 MLLM |
| 工具检测 macro-F1（最佳） | 26.1%（多数类基线 13.5%；17 个模型中 16 个高于多数类基线） |
| 工具定位 F1@0.5（最佳） | 22.7%（InternVL2.5-78B） |
| 五个医学/专有模型的定位 F1@0.5 | 全部 ≤ 1.6% |
| 三元组检测 macro-F1 | 所有模型 < 5% |
| 相位识别 | 最佳数据集平均准确率仍低于多数类基线 |
| InternVL2.5-8B 的 CVS 多数坍塌 | 准确率 71.2%，κ = 0 |
| GPT-4o-mini / Lingshu-32B 的 CVS 过度给分 | 准确率 15.6% / 9.4%，低于随机基线 32.8% |
| 平均排名最佳模型 | Qwen3-VL-32B（平均排名 3.6），仅在工具检测上显著领先亚军 |
| 专有/医学模型 vs 通用开源模型 | 无一致优势；GPT-4o-mini 领先动作识别，HuatuoGPT-Vision 最高相位准确率，但两者 κ 均低于 Qwen3-VL-32B |
| 工具接入（匹配提示）增益 — 工具检测 | 5 个骨干全部为正，+1.4 ~ +9.7 macro-F1 |
| 工具接入（匹配提示）增益 — 动作识别 | 5 个骨干全部为正，+4.6 ~ +26.2 macro-F1 |
| 工具接入（匹配提示）增益 — 相位识别 | 5 个骨干全部为正，幅度较小 |
| 工具接入（匹配提示）增益 — 定位 | 5 个骨干中 4 个为正 |
| InternVL2.5-8B 定位 | 阶段间对比 −10.6 分，但匹配工具开关对比 +8.1 分 |
| CVS / 技能评估 | 信号混杂，工具接入无一致收益 |
| Full 设置下最高动作识别分数 | 27.6% macro-F1，仍低于多数类基线 30.0% |
| 工具调用模式 | perceive() 在工具检测 78.2%、三元组检测 95.0%、定位 76.2% 的回合被调用；相位识别中 retrieve() 72.6% |
| 来源偏好 | 教程视频占动作识别检索 80.3%、三元组 62.2%、定位 53.6%、相位 51.9%；教科书+指南占 CVS 80.8%、技能 66.9% |
| 检索相关性 precision@1 | 57% – 82%；AUROC vs 专家 0.817，vs LLM judge 0.894 |
| perceive() 无用区域提案比例 | GPT-4o-mini 与 Claude-Haiku-4.5 的动作识别轨迹中 90%–100% |
| 成功 vs 失败回合平均工具调用数 | 2.32 vs 2.36（失败回合 perceive() 更多：69.8% vs 56.4%） |

---

## 局限性

- Stage I 揭示的多项"领先"其实是捷径（多数坍塌、乐观过度给分），使得绝对分数难以解读——高分不等于真实能力。
- 工具接入主要惠及感知密集型任务（工具/动作检测、相位识别），细粒度定位与专家式（rubric）评估仍是顽固瓶颈；后者可能需要领域专属工具而非通用工具。
- 通用 perceive() 工具在部分骨干上几乎不可用（90%–100% 无有效区域提案），"通用视觉接地"这一假设并不成立于所有模型。
- SurgWiki 为闭域知识库，其覆盖范围与溯源限制了外推；商业来源不随论文分发。
- 检索质量受限于智能体自己生成的查询（precision@1 57%–82%），失败更多归因于查询生成而非检索管线。
- 全部结论基于零样本评测，未做手术领域微调的对照，因此无法回答"训练能补多少"。
- 智能体未真正"学习"——环境不提供跨回合记忆或训练信号，本质是推理期增强评测。

---

## 建议

- **是否推荐使用**：是
- **适用场景**：医疗 AI 的智能体评测方法学参考；外科场景理解的多模态模型能力边界测绘；把"检索 + 接地"类工具接入策略迁移到其他专业知识密集领域。
- **值得复现**：是（SurgKnowBench 的统一化协议与轨迹级分析范式有较强通用性）

---

**相关论文**：[[CholecT50]]、[[HeiChole]]、[[AutoLaparo]]、[[GraSP]]、[[CATARACTS]]
**主题标签**：#LLM #NLP #Multimodal #Surgical-Vision #Medical-AI #Agentic-Benchmark
