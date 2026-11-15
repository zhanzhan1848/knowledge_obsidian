---
title: "Benchmarking Multilingual Document Understanding in Vision-Language Models"
authors: ["Matteo Gabburo", "Daniela Baiamonte", "Stefano Simonazzi", "Silvia Gardini", "Sean Cesare Lazzeri", "Andrea Zugarini"]
date: "2026-11-13"
arxiv: "2611.14758"
arxiv_url: "https://arxiv.org/abs/2611.14758"
pdf_url: "https://arxiv.org/pdf/2611.14758"
categories: ["cs.CL", "cs.AI"]
tags: ["vision-language-model", "document-understanding", "multilingual", "benchmark", "evaluation"]
venue: ""
status: "已读"
---

# Benchmarking Multilingual Document Understanding in Vision-Language Models

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Benchmarking Multilingual Document Understanding in Vision-Language Models |
| 作者 | Matteo Gabburo, Daniela Baiamonte, Stefano Simonazzi, Silvia Gardini, Sean Cesare Lazzeri, Andrea Zugarini |
| 链接 | [原文](https://arxiv.org/abs/2611.14758) |
| arXiv | arXiv:2611.14758 |
| 分类 | cs.CL, cs.AI |
| 发表 | 预印本（comment 仅标注篇幅与图数，无会议信息） |
| 篇幅 | 18 pages, 4 figures |
| 代码 | 摘要未提及（benchmark 名称为 MDU） |

## 核心贡献
1. **提出 MDU**：一个多语种文档理解（Document Understanding, DU）基准，含 **23,146** 个样本，覆盖 **13 项任务** 与 **5 种语言**（English、French、German、Italian、Spanish）。
2. **任务设计覆盖互补能力谱系**：从表层文本抽取与 Markdown 抽取，到摘要、分类、命名实体识别（NER），再到布局敏感的段落抽取与 layout 抽取。
3. **大规模统一评测**：评估 **45 个 state-of-the-art open-weight VLM**（参数量 **1.7B – 235B**），外加 **1 个商业系统**，全部在同一协议下评测。
4. **结论性发现**：基准远未饱和；**最强平均分仅 69.0**，**45 个系统中仅 8 个达到 65 分**；**最好的两个结果来自 27B 模型而非参数量最大的模型**。
5. **揭示三类"规模修不了"的失效模式**：跨语言差距不随规模收敛、控制域组成后仍存留；各任务能力之间**不同步提升**（per-task 分数在剔除总体质量后**基本不相关**）；**转写能力与语义抽取能力相互权衡**（trade-off）。

## 方法 / 技术细节

### MDU 基准构成
- **样本数**：23,146
- **任务数**：13
- **语言数**：5（English, French, German, Italian, Spanish）

### 任务能力分层（由表层到语义、由无感到有感）
| 层级 | 任务性质 |
|------|----------|
| 表层抽取 | 文本抽取、Markdown 抽取 |
| 语义理解 | 摘要、分类、命名实体识别 (NER) |
| 布局敏感 | 段落抽取 (passage extraction)、layout 抽取 |

### 评测协议
- 所有模型（45 个 open-weight + 1 个商业系统）**在统一协议下**评测。
- 参数量跨度 **1.7B – 235B**，用于检验"规模效应"。
- 分析手段：
  1. **控制变量**：对各语言的 **domain composition（域组成）** 做控制，检验语言差距是否只是语料分布差异所致；
  2. **偏相关/残差分析**：从 per-task 分数中 **partial out 整体模型质量**，检验各任务能力之间的相关性结构；
  3. 观察**转写 vs 语义抽取**的能力取舍关系。

## 实验结果
- **最佳平均分**：**69.0**（benchmark 远未饱和）。
- **达到 65 分的系统**：45 个中**仅 8 个**。
- **最优两个结果来自 27B 模型**，而非参数量最大的模型。
- **跨语言差距**：最强语言与最弱语言之间的差距**不随模型规模扩大而收敛**；在控制各语言的 domain composition 后**差距依然存在**。
- **任务能力相关性**：在 partial out 总体模型质量之后，per-task 分数**基本互不相关**（largely uncorrelated）——即不存在"一个强模型在所有任务上都强"的一体化能力结构。
- **转写 vs 语义**：转写能力（transcription）与语义抽取能力存在**权衡（trade-off）**。

## 关键数字速览
| 指标 | 数值 |
|------|------|
| MDU 样本数 | 23,146 |
| 任务数 | 13 |
| 语言数 | 5（EN / FR / DE / IT / ES） |
| 评测 open-weight VLM 数 | 45 |
| 评测商业系统数 | 1 |
| 参数量跨度 | 1.7B – 235B |
| 最佳平均分 | 69.0 |
| ≥65 分的系统数 | 8 / 45 |
| 最优结果模型规模 | 27B（两个最佳结果） |
| 篇幅 | 18 页，4 图 |

## 局限性
- 摘要**未显式列出**局限性。可推断（推测）：
  - **语言范围有限**：仅 5 种欧洲语言，且同属拉丁字母脚本系，跨脚本（如 CJK、RTL）的结论不可外推（推测）；
  - **域组成未完全覆盖**真实企业文档的多样性（推测）；
  - **开放权重模型的选择偏差**：45 个模型中是否覆盖最新 SOTA 闭源模型未知，商业系统仅 1 个，对照强度有限（推测）；
  - **平均分掩盖任务异质性**：69.0 的平均值掩盖了逐任务的巨大方差；
  - **"27B 最优"可能随评测协议细节（如 prompt 模板、分辨率设置）而变**（推测）；
  - 摘要未披露 per-task / per-language 的完整分数矩阵，外部读者难以复用其结论。

## 与已有工作的关系 / 启示
本文与 DocVQA / InfographicVQA / OCRBench / DU 领域的各种单语文档理解基准互补——它第一次把**"多语言"作为可控变量**系统地引入 DU 评测，并证明该维度带来的方差**与模型能力维度近似正交**。对研究者的启示是：**在文档理解上，语言泛化不是规模的赠品，而需要专门的数据与训练**；同时 per-task 能力不相关意味着"选择一个综合最强模型"在 DU 场景下未必是最优策略，**按任务挑选模型**反而更现实。

## 相关论文
- [[DocVQA / 文档视觉问答基准]]
- [[多模态大模型评测综述]]
- [[多语言 OCR 与文档信息抽取]]
- [[Scaling Laws 在多模态模型上的失效]]
- [[布局感知文档建模]]

## 我的评注
这篇评测论文的价值在于它敢于说**坏消息**。当整个领域都在用"更大模型 + 更多数据"来解释多模态能力提升时，作者用 45 个模型、5 种语言、13 项任务的系统实验给出了三个反 Scaling 的结论：**最优模型不是最大的（27B 而非 235B）、语言差距不随规模收敛、任务能力之间互不相关**。
最有方法论价值的是那两个控制性分析：控制 domain composition 后语言差距仍在，partial out 整体质量后 per-task 分数不相关——这实质上说明**多语言与多任务构成了两个正交的能力轴**，而当前 VLM 的预训练分布在这两个轴上都不均衡。"转写 vs 语义抽取的权衡"尤其值得警惕：很多模型在 OCR 指标上很漂亮，但真正做语义抽取时明显退化，说明强 OCR 并不蕴含强文档理解。
实践建议：对做企业文档处理的人，这篇的结论直接改变选型逻辑——**不要找"综合最强"的 VLM，而要按你的任务（版面抽取 / NER / 摘要 / 多语种）分别选型并单独评测**。同时注意其局限：5 种拉丁字母欧洲语言不足以代表 RTL（阿拉伯语、希伯来语）或 CJK 文档，而后者恰恰是 VLM 最容易崩的场景——这个空缺值得有人补上。

---
*采集时间：2026-11-13 | 油麦菜 🥬 自动精读*
