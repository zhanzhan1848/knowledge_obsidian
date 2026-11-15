---
title: "Jais 3: Introducing Arabic-centric Agentic AI"
authors: ["Team IFM", "Haonan Li", "Hadi Abdine", "Nikhil Ranjan", "Mohamed Anwar", "Ahmad Chamma", "Amr Mohamed", "Ahmed Frikha", "Dani Bouch", "Maaz Maqsood", "George Ibrahim", "Mostafa Awad", "Nurkhan Laiyk", "Hasan Iqbal", "Abhishek Maiti", "Bilal Bouardi", "Shivam Chauhan", "Ahmer Tabassum", "Owais Aijaz", "Omar Arbi", "Neha Sengupta", "Aaryamonvikram Singh", "Abdelhakim Freihat", "Sarath Chandran", "Rahul Pal", "Mohammed Bellam", "Sajid Siddiki", "Sarah AlBarri", "Debopriyo Banerjee", "Ali El Filali", "Samta Kamboj", "Rifo Genadi", "Ahmed Attia", "Go Inoue", "Shuonan Dong", "Amine Khelif Khelif", "Evan Dufraisse", "Florian Valade", "Tapas Sen", "Guowei He", "Sunil Sahu", "Onkar Pandit", "Kareem Magdy", "Sheikh Khalid bin Khalifa Al Nahyan", "Samujjwal Ghosh", "Zainul Abedien Ahmed Quraishi", "Larry Murray", "Avraham Sheinin", "Natalia Vassilieva", "Preslav Nakov", "Guokan Shang", "Xuguang Hector Ren", "Zhengzhong Liu", "Eric Xing"]
date: "2026-11-13"
arxiv: "2611.10224"
arxiv_url: "https://arxiv.org/abs/2611.10224"
pdf_url: "https://arxiv.org/pdf/2611.10224"
categories: ["cs.CL", "cs.AI"]
tags: ["multilingual", "agentic-ai", "arabic", "low-resource", "continual-pretraining", "open-weights"]
venue: ""
status: "已读"
---

# Jais 3: Introducing Arabic-centric Agentic AI

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Jais 3: Introducing Arabic-centric Agentic AI |
| 作者 | Team IFM 等 57 位作者（含 INRIA / MBZUAI / A*STAR / KAUST 等机构成员） |
| 链接 | [原文](https://arxiv.org/abs/2611.10224) |
| arXiv | arXiv:2611.10224 |
| 分类 | cs.CL, cs.AI |
| 发表 | 预印本（comment 仅标注篇幅，无会议信息） |
| 篇幅 | 113 pages |
| 代码 | 摘要声明开源完整训练配方、数据配方与配置、训练日志、评测基准与评测代码；同时发布全部六个模型各训练阶段的 checkpoints 与训练数据样本 |

## 核心贡献
1. **发布 Jais 3 系列**：六个完全开源（open-weight）的以阿拉伯语为中心的 agentic 语言模型，规模覆盖 **0.9B 到 375B** 参数；其中 375B 模型据称是目前最大的开源阿拉伯语中心语言模型。
2. **从"问答"转向"完成任务"**：模型被训练为能规划多步任务、调用工具与 **Model Context Protocol (MCP) servers**、操作 terminal、检索网页、读写并生成 **PDF / spreadsheet / presentation** 文件，并以阿拉伯语与用户交互。
3. **复用而非从零预训练**：以完全开放的 **K2 Horizon** 模型族为底座，通过 **continual pretraining → SFT → final token preference optimization (FTPO) → RLVR** 四段式适配到阿拉伯语，避免了从零训练的成本，同时保留原模型的推理、agentic 与英语能力。
4. **数据混合策略**：将自然阿拉伯语文本与翻译、转写（transliterated）、合成阿拉伯语混合，并 **replay 底座模型自身的训练数据** 以做能力保持（catastrophic forgetting 缓解）。
5. **评测范式革新**：批评现有阿拉伯语模型评测多为选择题/判别式，改为在 **audited Arabic benchmarks** 上做 fully generative evaluation，重审阿拉伯语模型的评估方式。

## 方法 / 技术细节

### 整体训练管线
$$\text{K2 Horizon (frozen open fleet)} \rightarrow \text{Continual Pretraining} \rightarrow \text{SFT} \rightarrow \text{FTPO} \rightarrow \text{RLVR}$$

### 能力覆盖
- **规划与工具使用**：multi-step task planning、tool calling、MCP server 通信、terminal 操作、web search。
- **产物级文档操作**：读取、编辑、生成 PDF、spreadsheet、presentation 三类办公产物。
- **语言覆盖**：Modern Standard Arabic 及主要地区方言（dialects）；遵循带有阿拉伯语特有约束的指令（Arabic-specific constraints）。
- **上下文长度**：继承 K2 Horizon 的 **512K token** 上下文窗口（**除 0.9B 模型外**）。

### 数据策略
1. 真实阿拉伯语自然语料；
2. 翻译得到的阿拉伯语；
3. 转写（transliterated）阿拉伯语；
4. 合成阿拉伯语；
5. **Self-replay**：重放底座模型自身训练数据，以锚定其原有的 reasoning / agentic / English 能力。

### 阶段说明
- **FTPO（final token preference optimization）**：在序列末端 token 上做偏好优化，作为 RLVR 之前的偏好对齐环节。
- **RLVR**：使用可验证奖励（verifiable rewards）强化多步任务与工具调用行为。

### 评测协议
- 迁移到 **fully generative** 评估，而非仅选择题式 benchmark。
- 所有参与评测的 Arabic benchmark 均为 **audited（人工审计）** 版本，评测代码与基准一并开源。

## 实验结果
- **规模**：Jais 3 提供六个模型，参数量区间 **0.9B – 375B**；375B 为已知最大开源阿拉伯语中心 LM。
- **上下文**：除 0.9B 外，所有模型支持 **512K token** 上下文窗口。
- **整体水平**：在阿拉伯语与 agentic benchmark 上，跨全部模型尺寸 **与同规模 open-weight 模型持平或更好**（matches or outperforms）。
- **强项**：agentic 能力与阿拉伯语指令跟随（Arabic instruction following）尤为突出。
- **幻觉**：**显著更少**（far fewer hallucinations）。
- **与前代对比**：具体分数、基线模型名与逐 benchmark 数值摘要中**未披露**。

## 关键数字速览
| 指标 | 数值 |
|------|------|
| 模型数量 | 6 |
| 参数规模范围 | 0.9B – 375B |
| 最大模型 | 375B（已知最大开源阿拉伯语中心 LM） |
| 上下文窗口 | 512K token（0.9B 除外） |
| 训练阶段 | Continual PT → SFT → FTPO → RLVR |
| 篇幅 | 113 页 |
| 具体评测分数 | 摘要未披露 |

## 局限性
- 摘要**未明确列出**局限性。可从设计推断（推测）：① 基于 K2 Horizon 底座而非原生阿拉伯语预训练，从零训练路径未验证；② 0.9B 模型不具备 512K 上下文，小模型在长程 agentic 任务上能力受限；③ 方言覆盖广度与各方言数据配比未披露；④ 开源"完全"程度依赖底座 K2 Horizon 的许可条款（推测）；⑤ 摘要仅声明相对 open-weight 同规模模型的相对结论，缺少对专有商业 agentic 模型的对照。

## 与已有工作的关系 / 启示
本文把"多语种 LLM 套壳"与"agentic LLM"两条线合并：说明多语种模型不必停留在纯文本翻译能力上，而可以通过 SFT + 偏好优化 + RLVR 直接获得工具使用、终端操作与文档产出能力。对研究者的启示是，**低资源语言的 agentic 后训练（而非预训练语料）可能是当前性价比最高的技术杠杆**。

## 相关论文
- [[Jais 2 / Jais LLM 系列]]
- [[K2 Horizon / Kimi K2 开源模型族]]
- [[Model Context Protocol 与工具调用 Agent 训练]]
- [[RLVR 可验证奖励强化学习]]
- [[指令跟随与多语言评测基准]]

## 我的评注
这篇论文真正的价值不在"又做了一个阿拉伯语模型"，而在于把 **agentic 能力作为多语种后训练目标**这一命题系统化落地。选 K2 Horizon 做底座再 continual-pretrain 到阿拉伯语，是务实且正确的工程判断——在数据稀缺语言的现状下，底座的多语能力和英文知识是必须继承的资产，而 replay 底座自身数据这一细节值得被更多"文化对齐"类工作照抄。
真正令人印象深刻的差异化是**评测范式的自我批判**：作者指出阿拉伯语模型评测长期停留在判别式选择题，于是重建 audited benchmark 并全面转向 fully generative evaluation——这说明他们深知"在有偏基准上刷榜"在 agentic 场景下没有意义。但摘要层面对具体分数、基线选择、误差分析的克制近乎保守，读者无法判断"持平或更好"在统计上是否显著，也无法确认 375B 模型在长程多工具任务上的稳定性是否达到可用水平。
实践建议：对于阿拉伯语场景的落地，Jais 3 值得作为首选开源基座，尤其因为它同时开放了**全训练阶段 checkpoints** 与**数据配方/日志/评测代码**——这在后训练复现极其困难的当下，是比"又一个更强基座"更稀缺的资产。建议关注完整技术报告中的 MCP 工具集定义与 RLVR 奖励设计，这两部分最可能成为可迁移的工程范式。

---
*采集时间：2026-11-13 | 油麦菜 🥬 自动精读*
