---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, arabic, agentic-ai, continual-pretraining, open-weights]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.10224
arxiv: 2611.10224
---

# Jais 3: Introducing Arabic-centric Agentic AI

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Jais 3: Introducing Arabic-centric Agentic AI |
| **作者** | Jais Team（MBZUAI Institute of Foundation Models, Cerebras Systems, Inception42） |
| **发表** | arXiv preprint（技术报告，113 页） |
| **链接** | [原文](https://arxiv.org/abs/2611.10224) |
| **arXiv** | arXiv:2611.10224 |
| **分类** | cs.CL, cs.AI |
| **代码** | [训练代码 xllm](https://github.com/ifm-ai/xllm) · [RL 代码 RL360](https://github.com/ifm-ai/RL360) · [评测代码 gen-eval-arabic](https://github.com/ifm-ai/gen-eval-arabic) · [权重 hf.co/collections/IFM/jais-3](https://hf.co/collections/IFM/jais-3) |

---

## 核心贡献

> 发布 **Jais 3**：六个 0.9B–375B 参数的开放权重阿拉伯语中心**智能体**模型系列，不止回答问题，而是被训练去规划多步任务、调用工具与 MCP 服务器、操作终端、检索网页、读写并生成 PDF/表格/演示文稿，全程用阿拉伯语与用户沟通；375B 是目前最大的开放阿拉伯语中心语言模型。

1. **不从零预训练**：全部模型从完全开放的 K2 Horizon 系列出发，架构与 tokenizer 不变，通过**持续预训练 → SFT → 末位 token 偏好优化（FTPO）→ RLVR** 四阶段适配为阿拉伯语。
2. **数据策略**：混合自然阿拉伯语 + 翻译 + 转写（Arabizi）+ 合成阿拉伯语，并在**每个阶段回放基座模型自身的训练数据**，以保住推理、agentic 与英语能力；不额外做词表扩展（K2 Horizon tokenizer 已良好覆盖阿拉伯语）。
3. **覆盖广度**：覆盖 MSA 与主要地区方言，支持带阿拉伯语特定约束的指令跟随，继承 K2 Horizon 的 **512K token 上下文窗口**（0.9B 除外）。
4. **评测范式革新**：从多选 log-prob 打分转向**完全生成式评测**，并用三个 LLM judge **审计**所用基准（剔除三方一致标记为有缺陷的题目）；新推出 AraIFBench（指令跟随）、两个语言学基准（i'rab 句法分析、tashkeel 标音）、AA-LCR 与 SimpleQA-Verified 的阿拉伯语版，以及一个阿拉伯语文件处理基准。
5. **全面开源**：发布全部六个模型**每个训练阶段的 checkpoint**、训练数据样本、数据配方与训练配置、训练日志、审计后基准与评测代码。

---

## 技术方案

### 核心思想
论文的出发点是三个观察。第一，阿拉伯语作为中等资源语言，在多数模型与任务上仍显著落后于英语，方言尤甚；第二，单纯提升阿拉伯语知识与生成并不等于可靠的**阿拉伯语工具调用与多步 agent 能力**——BFCL 的阿拉伯语适配显示 Llama 3.3、Qwen3、gpt-oss 的工具调用准确率在阿拉伯语 prompt 下明显下降，Telco-GAIA 也发现涉及文档与报告的工具任务仍薄弱。Jais 3 因此同时针对"语言能力"与"agent 能力"两个缺口。技术上，选择"从已开放的最强基座适配"而非从零预训练：K2 Horizon 已在 17 种语言上做了多语言预训练（阿拉伯语是其中第二大语言，约占混合的 7%），tokenizer 训练语料约四分之一为阿拉伯语，因此无需 Gosal et al. (2024) 那样的词表扩展与嵌入对齐阶段，也不必像 Jais 1/2 那样牺牲英文与代码能力。数据上，本文采取了"自然文本设上限"的原则——自然阿拉伯语网页文本与文献只占持续预训练混合的约 19%，翻译与合成阿拉伯语提供约 38%（其中 Arabizi 约 16 点、阿拉伯字��约 22 点），并把 K2 Horizon 自身的 mid-training 数据在每个阶段固定比例回放，以防遗忘。后训练采用 SFT → FTPO（末位 token 偏好优化，用于把偏好信号精确作用到生成的最后 token）→ RLVR 四个阶段，并比较了级联式（cascade）与混合任务式 RLVR。

### 关键公式
```math
\text{本文核心方法为系统性数据与训练配方，未依赖关键公式}
```

### 关键组件
- **K2 Horizon 基座**：6 个稠密模型（0.9B、3.7B、7B、32B）+ 2 个稀疏模型（375B），共享 250,624 词表（0.9B 除外），预训练 5T–15T token 量级。
- **持续预训练（CPT）**：主阶段 + cooldown 阶段，每阶段回放基座自身数据；K2 Horizon 之后训练已 post-train，适配从 post-trained checkpoint 出发。
- **数据处理流水线**：自然阿拉伯语、翻译、转写、合成四路来源 + 回放；人工排除与限制处理（如"静默丢弃大量有效阿拉伯语"的数据缺陷被显式修正）。
- **SFT**：涵盖多步规划、工具/MCP 调用、终端操作、网页检索、PDF/表格/演示文稿的读写与生成，且要求以阿拉伯语回复。
- **FTPO（Final Token Preference Optimization）**：把偏好优化作用在生成的末位 token。
- **RLVR**：可验证奖励强化学习；论文专门比较了级联式（按阶段顺序）与混合任务式两种 RLVR 组织方式。
- **评测体系**：生成式评测 + LLM judge + 三 judge 审计的阿拉伯语基准集合 + 新基准（AraIFBench、i'rab、tashkeel、AA-LCR、SimpleQA-Verified、阿拉伯语文件处理）。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 模型规模 | 0.9B、3.7B、7B、32B、375B（共六个模型；375B 为 fine-grained MoE） |
| 上下文长度 | 512K token（0.9B 除外） |
| 相对基座的阿拉伯语提升 | 相比同规模 K2 Horizon，阿拉伯语平均分**提升 9 到 35 分** |
| 数据配方 | 自然阿拉伯语约 19%；翻译+合成约 38%（Arabizi 约 16 点、阿拉伯脚本约 22 点）；其余为回放 |
| 基准审计 | 15 个基准集合中，**5.3%** 的题目被三个 judge 一致判定有缺陷并移除 |
| 已知基准缺陷举例 | ArabicMMLU 把 NATO 成员国数标为 15（现为 32）；Arabic GSM8K 参考解法计数错误 |
| 定位阈值 | 远同源定义为序列同一性 30%；SCOPe 下六个同一性阈值（th10–th95）评估 |
| 对比对象 | 同规模开放权重模型（open-weight models） |
| 结果 | 在阿拉伯语与 agentic 基准上**持平或超越**同规模模型，agentic 能力与阿拉伯语指令跟随尤为突出，**幻觉显著更少** |
| 开放程度 | 权重 + 全阶段 checkpoint + 数据配方 + 训练配置 + 训练日志 + 审计基准 + 评测代码全部发布 |

---

## 局限性

- 依赖 K2 Horizon 基座的完全开放许可，若基座许可变更则派生模型的可用性受限（论文未详细讨论继承条款）。
- 基准审计依赖 LLM judge 三方一致，仍存在 judge 偏差与语言能力偏差；已剔除 5.3% 缺陷题目但可能引入选择偏差。
- 阿拉伯语评估生态仍在演进，新基准（AraIFBench 等）由作者自建，其外部效度需第三方验证。
- 375B 模型自述为"最大的开放阿拉伯语中心模型"，但这类"最大"声明随时间失效很快。
- 技术报告篇幅巨大（113 页），正文结论与具体数字分散在众多表格中，核心数字（如各基准的具体分数）需查阅原始表格而非摘要。
- 合成与翻译阿拉伯语约占 CPT 混合的 38%，天然文本上限（19%）可能限制真实世界口语与方言覆盖的天花板。

---

## 建议

- **是否推荐使用**：是（对阿拉伯语场景是当前最完整的开放方案之一）
- **适用场景**：阿拉伯语/海湾地区的 agentic 应用、MCP 与工具调用系统、文档处理（PDF/表格/演示文稿）自动化、需要长上下文（512K）的阿拉伯语任务；作为**全阶段 checkpoint** 可用于研究持续预训练与 agentic 后训练的分阶段效应。
- **值得复现**：是（训练代码、RL 代码、评测代码、审计基准全部公开，是少见的可完整复现阿拉伯语 agentic 训练栈；同时其"回放基座数据防止遗忘"与"自然文本设上限"的数据配方可直接迁移到其他语言适配场景）

---

**相关论文**：[[K2-Horizon]], [[Jais-2]], [[RLVR]]
**主题标签**：#LLM #NLP #Arabic #Agentic-AI #Open-Weights
