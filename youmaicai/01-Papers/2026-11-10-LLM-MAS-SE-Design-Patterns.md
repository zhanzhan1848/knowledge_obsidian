---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, software-engineering, multi-agent, empirical-study, design-patterns]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2511.08475
arxiv: 2511.08475
---

# Designing LLM-based Multi-Agent Systems for Software Engineering Tasks: Quality Attributes, Design Patterns and Rationale

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Designing LLM-based Multi-Agent Systems for Software Engineering Tasks: Quality Attributes, Design Patterns and Rationale |
| **作者** | Yangxiao Cai, Ruiyin Li, Peng Liang, Mojtaba Shahin, Zengyang Li, Aldeida Aleti 等（武汉大学、RMIT、中南财经政法大学、Monash、南京理工大学） |
| **发表** | Manuscript submitted to a Journal (TOSEM), 2026（42 页，3 图，12 表） |
| **链接** | [原文](https://arxiv.org/abs/2511.08475) |
| **arXiv** | arXiv:2511.08475 |
| **分类** | cs.SE, cs.AI |
| **代码** | 未提供（数据集与编码规则随论文给出） |

---

## 核心贡献

> 首个系统性的实证研究：收集 106 篇面向软件工程的 LLM 多智能体系统论文，梳理出它们关注的 10 类 SE 任务、16 种设计模式、质量属性与设计理据，并给出 6 条面向实践的设计启示。

1. **SE 任务画像**：在识别出的 10 类 SE 任务中，**代码生成（Code Generation）**是 LLM-based MAS 最常解决的任务；任务类目在迭代精化过程中从 8 类扩充到 10 类。
2. **质量属性焦点**：**功能适用性（Functional Suitability）**是设计师最关注的 QA——即 MAS 交付支撑任务目标之功能的能力。
3. **设计模式分布**：在 16 种用于构建 LLM-based MAS 的设计模式中，**基于角色的协作（Role-Based Cooperation）**使用最频繁。
4. **设计理据**：**提升生成代码的质量（Improving the Quality of Generated Code）**是最常见的报告理据。
5. **关联映射与设计启示**：建立 SE 任务 ↔ QA ↔ 设计模式 ↔ 理据之间的映射，并据此给出 6 条设计启示。

---

## 技术方案

### 核心思想

这是一篇**系统文献研究（SLR）+ 实证编码分析**论文，而非提出新方法。方法上，作者从 DBLP、arXiv 等来源检索并用 snowballing 补全，收集 106 篇面向 SE 任务的 LLM-based MAS 论文；然后对每篇论文抽取四类数据项（data items）：所解决的 SE 任务、所关注的质量属性（QA）、所用的设计模式、以及作者报告的设计理据。编码规则分 D1–D4 四组并显式写出以保证透明度与一致性：任务类目沿用已有 SE 任务分类并按迭代结果扩充为 10 类；设计模式类目主要采纳既有研究的分类方案与工业标准以便横向比较；类目在迭代精化中从 13 种扩充到 16 种。质量属性定义中，功能适用性指 MAS 交付支撑既定任务与目标之功能的能力。遇到描述歧义时由第一作者与第二、三作者讨论至达成共识。三个研究问题分别对应：RQ1 关注 SE 任务与 QA，RQ2/RQ3 关注设计模式与理据，并进一步分析质量关切、模式使用、理据在不同 SE 任务上的差异，以及 QA 与设计模式之间的关联。

### 关键公式

```math
\text{本文核心方法为系统性文献研究与结构化编码分析，未依赖关键公式}
```

### 关键组件
- **研究问题 RQ1–RQ3**：SE 任务与 QA 画像 → 设计模式识别 → 理据分析。
- **数据抽取项 D1–D4**：SE 任务、质量属性、设计模式、设计理据（配显式编码规则）。
- **10 类 SE 任务分类**：含代码生成（占比最高）、需求工程、测试、缺陷定位、架构设计、代码翻译、发布管理、代码审查等。
- **16 种设计模式分类**：含基于角色的协作（使用最频繁）等。
- **质量属性（QA）体系**：功能适用性（最受关注）、可靠性、可维护性、可扩展性、安全性等。
- **6 条设计启示**：按目标 SE 任务与其质量需求推导。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 语料规模 | **106 篇** LLM-based MAS for SE 论文 |
| 最常见 SE 任务 | **代码生成（Code Generation）**，居 10 类任务之首 |
| 最受关注 QA | **功能适用性（Functional Suitability）** |
| 最常用设计模式 | **基于角色的协作（Role-Based Cooperation）**，居 16 种模式之首 |
| 最常见设计理据 | **提升生成代码的质量（Improving the Quality of Generated Code）** |
| 类目演化 | SE 任务 8→10 类；设计模式 13→16 类 |
| 输出 | 12 张表格、3 张图；6 条面向设计的启示 |

---

## 局限性

- 单一检索源集合（DBLP + arXiv + snowballing）可能存在覆盖偏差，尤其对工业界内部实践与非英文文献覆盖不足。
- 编码依赖人工判断，虽有一致性讨论流程但未报告 Cohen's kappa 等信度指标。
- 分类体系的边界存在主观性（如"代码生成"与"代码审查/修复"的划分），类目数在迭代中反复变动。
- 仅做文献层面的二手分析，未验证设计模式与 QA 之间的**因果**关系（关联 ≠ 效果）。
- 论文 2024 年 11 月前的文献截止日期使 2025–2026 年的最新 LLM-MAS for SE 工作未被纳入。
- 无公开可用的数据集或复现代码。

---

## 建议

- **是否推荐使用**：是（作为设计 LLM 多智能体系统时的经验参考与文献地图）
- **适用场景**：设计面向代码生成/需求工程/测试的 LLM 多智能体系统时的模式选型；撰写相关领域综述或学位论文的文献基础；评估某一设计模式在 SE 场景的常见程度。
- **值得复现**：是（方法为文献编码，可直接复用其分类框架；但建议用最新语料重跑以更新结论）

---

**相关论文**：[[2026-11-10-FlashFusion-IoT-Query-Agent]] [[2026-11-10-AMTFV-Agentic-Math-Tool-Flow-Verification]]
**主题标签**：#LLM #NLP #SoftwareEngineering #MultiAgent #EmpiricalStudy #DesignPatterns
