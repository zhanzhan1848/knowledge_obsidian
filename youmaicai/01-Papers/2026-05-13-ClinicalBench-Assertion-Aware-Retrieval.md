# ClinicalBench: Stress-Testing Assertion-Aware Retrieval for Cross-Admission Clinical QA

## 元信息
| 标题 | ClinicalBench: Stress-Testing Assertion-Aware Retrieval for Cross-Admission Clinical QA on MIMIC-IV |
|------|-------|
| 作者 | Alex Stinard |
| 链接 | [原文](https://arxiv.org/abs/2605.11143) |
| arXiv | arXiv:2605.11143 |
| 代码 | [HuggingFace](https://huggingface.co/datasets/alexstinard/epikg-clinicalbench) |
| 领域 | cs.CL, cs.AI, cs.IR |

## 核心贡献
1. 评估 reasoning 之前的步骤：从真实 EHR notes 检索，其中否定、时间性、家庭vs患者归属可能将正确答案翻转为错误
2. **EpiKG**: patient knowledge graph，每个 fact 带有 assertion label 和 temporality tag，按 question intent 路由检索
3. **ClinicalBench**: 400-question test，跨 43 MIMIC-IV 患者，9 个 assertion-sensitive 类别

## 架构创新：Intent-aware KG-RAG
- over Contriever dense-RAG baseline
- 主要终点：+8.84 百分点（paired McNemar p=1.79e-3）
- oracle intent 下：+12.43 百分点

## 六模型测试
Claude Opus 4.6, GPT-OSS 20B, MedGemma 27B, Gemma 4 31B, MedGemma 1.5 4B, Qwen 3.5 35B

## 关键方法论发现
- 医师 adjudication 发现 56% 的自动生成参考答案有缺陷
- 表明 NLP-pipeline 临床 QA benchmarks 需要医师 adjudication 才能使用

## 关键词
临床 NLP, RAG, 断言感知, EHR, MIMIC-IV, KG-RAG, 医学问答