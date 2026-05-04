# RSAT: Structured Attribution Makes Small Language Models Faithful Table Reasoners

## 基本信息
| 项目 | 内容 |
|------|------|
| 作者 | Jugal Gajjar, Kamalasankari Subramaniakuppusamy |
| 发表 | arXiv (2026-05-04) |
| 链接 | [原文](https://arxiv.org/abs/2605.00199) |
| arXiv | arXiv:2605.00199 |

## 核心贡献
1. **RSAT**: 训练小语言模型 (1-8B) 生成带 cell-level citations 的 step-by-step reasoning
2. Phase 1 (SFT): 从验证推理迹学习结构化 JSON 输出格式
3. Phase 2 (GRPO): 优化 composite reward，中心为 NLI-based faithfulness + citation validity + parsimony

## 模型
- 6 个模型：Qwen 2.5 (1.5B/3B/7B) 和 Llama 3 (1B/3B/8B)

## 关键结果
- faithfulness: 0.224 → 0.826 (**3.7x 提升**)
- citation validity: 0.992 (接近完美)
- 后验 attribution 格式成功率 <13%，证明 attribution 必须集成到推理中，不能事后补救
- faithfulness reward 至关重要：移除后 faithfulness 从 0.97 降至 0.03

## 建议
- **是否推荐使用**：是
- **适用场景**：table QA、可解释推理、 faithful LLM reasoning

---

## 摘要

When a language model answers a table question, users have no way to verify which cells informed which reasoning steps. We introduce RSAT, a method that trains small language models (SLMs, 1-8B) to produce step-by-step reasoning with cell-level citations grounded in table evidence. Phase 1 (SFT) teaches a structured JSON output format from verified reasoning traces. Phase 2 (GRPO) optimizes a composite reward centered on NLI-based faithfulness, alongside citation validity and parsimony.

## 关键词
- `#table reasoning` `#faithful reasoning` `#attribution` `#small language models` `#GRPO`