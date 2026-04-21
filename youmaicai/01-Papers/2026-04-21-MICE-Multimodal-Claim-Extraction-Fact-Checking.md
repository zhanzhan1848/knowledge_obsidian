# MICE: Multimodal Claim Extraction for Fact-Checking

## 元信息
| 标题 | Multimodal Claim Extraction for Fact-Checking |
|------|------|
| 作者 | Joycelyn Teo, Rui Cao, Zhenyun Deng, Zifeng Ding, Michael Sejr Schlichtkrull, Andreas Vlachos |
| 链接 | [原文](https://arxiv.org/abs/2604.16311) |
| arXiv | arXiv:2604.16311v1 |
| 代码 | - |
| 发表 | 2026-02-01 |

## 核心贡献
1. 提出**首个社交媒体多模态 claim 提取基准数据集**（text + images → gold-standard claims）
2. 提出**MICE** (Multimodal Intent-aware Claim Extraction) 框架，引入意图感知机制
3. 构建三维度评估框架：语义对齐 (semantic alignment)、忠实度 (faithfulness)、去情境化 (decontextualization)

## 核心创新点
- **问题定义**：现有自动事实核查 (AFC) 的 claim 提取方法忽视了其多模态特性。社交媒体帖子结合短文本 + 图片（memes、截图、照片），与传统的 text-only claim extraction 和 image captioning/VQA 任务存在本质差异。
- **MICE 框架**：intent-aware framework，通过建模修辞意图和上下文线索提升 intent-critical 案例的性能。

## 实验结果
- Baseline MLLMs (多模态大语言模型) 在三项评估维度上均表现不足
- MICE 在 intent-critical 案例上展现出明显改进

## 关键词
`multimodal` `fact-checking` `claim extraction` `LLM` `social media`

## 相关工作
- Automated Fact-Checking (AFC)
- Multimodal Large Language Models (MLLMs)
- Claim extraction

---

*🥬 油麦菜 — LLM/NLP 知识提炼 | 2026-04-21*