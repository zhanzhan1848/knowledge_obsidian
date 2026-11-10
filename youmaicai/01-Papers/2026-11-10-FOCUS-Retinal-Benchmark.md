---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, multimodal, medical-imaging, benchmark, foundation-model]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2609.33158
arxiv: 2609.33158
---

# FOCUS: Benchmarking Retinal Model Generalization from Foundation Vision Encoders to Multimodal LLMs

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | FOCUS: Benchmarking Retinal Model Generalization from Foundation Vision Encoders to Multimodal LLMs |
| **作者** | David Restrepo, Chenwei Wu, Luis Filipe Nakayama, Miguel L. Martins, Stergios Christodoulidis, Maria Vakalopoulou, Enzo Ferrante 等 |
| **发表** | NeurIPS 2026, Evaluations & Datasets Track |
| **链接** | [原文](https://arxiv.org/abs/2609.33158) |
| **arXiv** | arXiv:2609.33158 |
| **分类** | cs.CV, cs.AI |
| **代码** | [github.com/dsrestrepo/FOCUS-Retinal-Benchmark](https://github.com/dsrestrepo/FOCUS-Retinal-Benchmark)（含 [HF 交互式 dashboard](https://huggingface.co/spaces/dsrestrepo/FOCUS-Retinal-Benchmark)） |

---

## 核心贡献

> 首次在同一套跨数据集协议下，系统比较眼底图像基础模型从纯视觉编码器、双塔 VLM 到多模态大模型的泛化、可靠性与公平性，发现"没有任何模型家族能一致占优"。

1. **数据集注册表 + 任务协调层**：把 10 个公开彩色眼底图像数据集（BRSET、mBRSET、PAPILA、RFMiD、RFMiD 2.0、IDRiD、Messidor-2、REFUGE、G1020、JSIEC1000）协调为 3 个二分类临床任务——any DR（ICDR ≥1）、referable DR（ICDR ≥2 和/或可疑黄斑水肿）、GON（VCDR ≥0.6 或专家标注）。
2. **统一分析层 + 超大规模评测**：覆盖 **532 个模型–数据集–任务–方法配置**（190 个 VM、228 个 VLM、114 个 MLLM），另有 **228 个经 LoRA SFT 适配的 MLLM 配置**，在性能（AUROC/AUPRC/Accuracy）、校准（ECE）、公平性（年龄/性别子群差异）、图像质量鲁棒性四个轴上评测。
3. **跨接口统一协议**：VM 用冻结特征线性探针，VLM 用图文嵌入匹配 + 冻结特征线性探针，MLLM 用提示后取首 token 肯定类概率，避免"表面增益其实来自提示模板/阈值/标签映射变化"的伪比较。
4. **细粒度 LoRA 迁移分析**：在 BRSET / mBRSET 上做 SFT+LoRA，逐配置比较同域测试集与同任务外部数据集的 ΔAUROC、ΔECE、Δ公平性。

---

## 技术方案

### 核心思想

FOCUS 的核心是"**任务协调 + 统一分析层**"两层结构。任务层把各数据集异质的标注体系映射到统一的三类临床终点（any DR / referable DR / GON），并显式承认这种协调并不使各源数据集的评分标准完全等价（GON 尤其如此）——因此每个"模型–数据集–任务–方法"配置独立评测，图像绝不跨数据集池化。分析层则把三类模型接口统一到四类评测轴上：性能轴用无阈值指标（AUROC、AUPRC）与固定阈值指标（Accuracy）刻画排序能力；校准轴用正类概率 ECE（10 个等宽分箱）衡量置信度与实际正类频率的一致性；公平性轴在 BRSET/mBRSET/PAPILA 上按年龄与性别子群报告 DP gap、Accuracy gap、Equal Opportunity gap、Equalized Odds gap（仅作描述性诊断，非因果公平估计）；鲁棒性轴在 BRSET/mBRSET 上按数据集自带图像质量分层考察性能与校准漂移。MLLM 适配实验只在 BRSET 与 mBRSET 上训练 LoRA，因为只有这两个数据集同时覆盖全部三项任务并带有行级元数据。

### 关键公式

```math
\operatorname{AUROC}=\frac{1}{|P||N|}\sum_{i\in P}\sum_{j\in N}\left(\mathbb{1}[s_i>s_j]+\frac{1}{2}\mathbb{1}[s_i=s_j]\right)

\operatorname{AUPRC}=\sum_k (R_k-R_{k-1})P_k

\mathrm{ECE}=\sum_{m=1}^{M}\frac{|B_m|}{n}\left|\mathrm{score}(B_m)-\mathrm{pos}(B_m)\right|,\quad M=10

\Delta_{\mathrm{DP}}=\left|\Pr(\hat{Y}=1\mid G_1)-\Pr(\hat{Y}=1\mid G_0)\right|
```

### 关键组件
- **Dataset Registry**：10 个公开眼底数据集的统一下载、清洗与标签映射管线。
- **Task Harmonization Layer**：把各库 ICDR / VCDR / 专家标注映射到 any DR / referable DR / GON 三个二分类任务，并在附录 B.1 给出逐数据集的标注溯源与操作映射。
- **Unified Analysis Layer**：AUROC/AUPRC/Accuracy/ECE + 四类公平性 gap + 图像质量分层分析；跨模型族比较（VM/VLM/MLLM）与同族内比较分开呈现。
- **Spider/Radar 可视化**：Figure 1 的蛛网图同时展示 AUROC、AUPRC、Accuracy、校准、公平性诊断与图像质量鲁棒性，直观暴露"排序强 ≠ 校准好 ≠ 子群均衡"。
- **MLLM LoRA 分析**：532 基础配置 + 228 MLLM LoRA 配置，同域 vs 同任务外部数据集的指标增量对照。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 评测配置总数 | 532 基础配置（VM 190 / VLM 228 / MLLM 114）+ 228 MLLM LoRA 配置 |
| 数据集数量 | 10 个公开眼底数据集（跨地理、采集条件、标注协议） |
| 任务数量 | 3 个协调后的二分类临床任务 |
| 通用 VM vs 眼科 VM AUROC | 通用 VM 编码器在 FOCUS 中取得最高 AUROC，在多数数据集上超过眼科专域 VM 编码器 |
| 医疗 MLLM 表现 | 零样本设定下 AUROC 有竞争力，但线性探针明显落后，跨数据集表现方差大 |
| 双塔 VLM | 经过轻量适配（线性探针 / LoRA）后获益显著 |
| LoRA 迁移结论 | 微调提升同域性能，但向外部数据集的迁移异质，**校准**上的迁移尤其不稳定 |
| 通用-眼科 AUROC 差 | FLAIR 等眼科模型从 0.373 提升到更高水平（具体数值见原文 Table 4 的 Δ=AUROC_gen−AUROC_oph） |

---

## 局限性

- 公平性分析仅覆盖 BRSET、mBRSET、PAPILA，图像质量鲁棒性分析仅覆盖 BRSET、mBRSET，覆盖面远窄于主性能评测。
- 任务协调只统一了评测终点，并未使各源数据集的评分标准等价（尤其 GON），跨数据集绝对指标的比较需谨慎解读。
- 校准指标按"正类概率校准"定义而非"正确性-置信度校准"，与部分文献的 ECE 定义不一致。
- 公平性 gap 属描述性子群诊断，不可直接解读为因果公平性估计。
- 仅在 BRSET / mBRSET 上做 LoRA SFT，其他数据集的微调迁移结论未经验证。

---

## 建议

- **是否推荐使用**：是
- **适用场景**：医学影像基础模型的选型与上线前评估；需要同时看排序性能、校准、亚群公平性与图像质量鲁棒性的临床 AI 部署场景；跨数据集 OOD 泛化评测的基准建设。
- **值得复现**：是（代码与 dashboard 已公开，数据集均为公开可获取）

---

**相关论文**：[[2026-11-10-WorldMind-Latent-World-Simulation]] [[2026-11-10-DAWN-Dependency-Aware-dLLM-Inference]]
**主题标签**：#LLM #NLP #Multimodal #MedicalImaging #Benchmark #FoundationModel
