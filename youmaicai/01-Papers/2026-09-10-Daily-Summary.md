# 🥬 每日论文汇总 — 2026-09-10

> 搜索范围：arXiv (cs.AI, cs.CL, cs.NE, cs.LG) | 2026-09-10 新发表
> 关键词：LLM, Transformer, Attention, GPT, BERT, NLP, Fine-tuning, RLHF, Instruction Tuning, Multimodal, Reasoning

---

## 今日概览

共发现 **14 篇** LLM/NLP 相关新论文，涵盖以下主题：

| 类别 | 数量 | 论文 |
|------|------|------|
| 🚀 LLM 推理加速 | 2 | X-CoSD, Osprey |
| 🤖 LLM Agent | 5 | Subagents vs Skills, State-Path Menu, Agent Confidence, ContractEval, HybridDeepResearch |
| 🌐 多语言/跨语言 | 2 | SWORD, BuzzASR |
| 📚 预训练/数据 | 2 | Edu-QuRating, TEFM |
| 🧮 形式化定理证明 | 1 | StochBench |
| 🛡️ XAI/可解释性 | 1 | XAI-Arena |
| 🧠 图学习 | 1 | MAAGL |
| 🎙️ 语音识别 | 1 | BuzzASR |

---

## 重点论文速览

### ⭐ Osprey — 推测解码的目标无关预训练 (EMNLP 2026)
- **arXiv**: [2609.09338](https://arxiv.org/abs/2609.09338)
- **核心贡献**: 提出 Osprey，从现成的预训练小型语言模型引导推测解码草稿模型，无需为每个目标模型单独蒸馏
- **关键结果**: 在 Qwen3-8B、LLaMA-3.3-70B、MiniMax-M2.5 上，平均 acceptance length 提升 16-23%，吞吐量提升 17.5%

### ⭐ X-CoSD — 跨词表协作推测解码
- **arXiv**: [2609.09166](https://arxiv.org/abs/2609.09166)
- **核心贡献**: 解决 SLM 和 LLM 词表不同构时的协作推测解码问题，提出混合重采样 (HR) 策略
- **关键结果**: 保持生成质量的同时显著提升生成速度

### ⭐ SWORD — 多语言事实错误检测的不一致性
- **arXiv**: [2609.09349](https://arxiv.org/abs/2609.09349)
- **核心贡献**: 通过 Wikidata 三元组扰动构建多语言事实错误检测基准，发现模型在东亚语言上性能下降达 28%
- **关键洞察**: 模型依赖分布熟悉度而非真正的事实验证

### ⭐ State-Path Tool Menu — 工具菜单作为执行先验 (EMNLP 2026)
- **arXiv**: [2609.09395](https://arxiv.org/abs/2609.09395)
- **核心贡献**: 引入"状态路径"概念，学习从请求状态到目标结果的工具调用顺序
- **关键结果**: ToolBench 上在线成功率从 0.737 提升至 0.898

---

## 完整论文列表

1. [[2609.09166] X-CoSD: Cross-Vocabulary Collaborative Speculative Decoding](./2026-09-10-X-CoSD-Cross-Vocabulary-CoSD.md)
2. [[2609.09233] Subagents vs Agent Skills: Executing Reusable Knowledge](./2026-09-10-Subagents-vs-Agent-Skills.md)
3. [[2609.09264] StochBench: Stochastic Processes in Lean](./2026-09-10-StochBench-Stochastic-Processes-Lean.md)
4. [[2609.09338] Osprey: Target-agnostic Pre-training for Speculative Decoding](./2026-09-10-Osprey-Target-Agnostic-Speculative-Decoding.md) ⭐ EMNLP 2026
5. [[2609.09349] SWORD: Cross-Lingual Inconsistencies in LLM Factual Error Rejection](./2026-09-10-SWORD-Cross-Lingual-Factual-Error.md)
6. [[2609.09356] Auditable Emergency Triage for Maternal and Newborn Care in India](./2026-09-10-Emergency-Triage-LLM-India.md)
7. [[2609.09363] Do LLMs Make More Mistakes If They Do Not Believe the Input Data?](./2026-09-10-LLM-Context-Memory-Conflict.md)
8. [[2609.09395] State-Path Tool Menu: Execution Prior for Online Agents](./2026-09-10-State-Path-Tool-Menu.md) ⭐ EMNLP 2026
9. [[2609.09410] HybridDeepResearch: Database Querying + Web Search](./2026-09-10-HybridDeepResearch-DB-Web-Search.md)
10. [[2609.09425] Edu-QuRating: Multi-Dimensional Educational Data Curation](./2026-09-10-Edu-QuRating-Educational-Data-Curation.md) ⭐ EMNLP 2026
11. [[2609.09428] XAI-Arena: LLM Assessment of XAI Explanations](./2026-09-10-XAI-Arena-LLM-XAI-Evaluation.md)
12. [[2609.09448] Agent Confidence from Internal Representations](./2026-09-10-Agent-Confidence-Internal-Representations.md)
13. [[2609.09458] ContractEval: Procedural Instruction Conformance](./2026-09-10-ContractEval-Procedural-Instruction-Conformance.md)
14. [[2609.09552] TEFM: Token-Efficient Faithful Modeling](./2026-09-10-TEFM-Token-Efficient-Faithful-Modeling.md)
15. [[2609.09554] BuzzASR: 100+ Monolingual Speech Recognition Models](./2026-09-10-BuzzASR-Monolingual-Whisper.md) ⭐ EMNLP 2026
16. [[2609.09565] MAAGL: Multi-Agent Agentic Graph Learning](./2026-09-10-MAAGL-Multi-Agent-Graph-Learning.md)

---

## 标签

#LLM #NLP #arXiv #每日论文 #2026-09-10
