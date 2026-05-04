# ArabCulture-Dialogue: Cultural Benchmarking of LLMs in Standard and Dialectal Arabic Dialogues

## 基本信息
| 项目 | 内容 |
|------|------|
| 作者 | Muhammad Dehan Al Kautsar, Saeed Almheiri, et al. |
| 发表 | arXiv (2026-04-30) |
| 链接 | [原文](https://arxiv.org/abs/2605.00119) |
| arXiv | arXiv:2605.00119 |

## 核心贡献
1. **ArabCulture-Dialogue**: 文化接地对话数据集
2. 覆盖 **13 个阿拉伯语国家**，包含 MSA 和各国方言
3. **12 个日常话题**，**54 个细粒度子话题**

## 三种 Benchmark 任务
1. 多选文化推理 (multiple-choice cultural reasoning)
2. MSA 与方言间机器翻译 (machine translation)
3. 方言引导生成 (dialect-steering generation)

## 主要发现
- MSA 与方言间存在性能差距
- 模型在方言设置下三种任务表现均比 MSA 差

## 局限性
- 方言性能差距有待解决

## 建议
- **是否推荐使用**：是（用于阿拉伯语文化 reasoning 评测）
- **适用场景**：文化-aware LLM 评测、方言 NLP、Arabic NLP

---

## 摘要

There is a significant gap in evaluating cultural reasoning in LLMs using conversational datasets that capture culturally rich and dialectal contexts. Most Arabic benchmarks focus on short text snippets in Modern Standard Arabic (MSA), overlooking the cultural nuances that naturally arise in dialogues. To address this gap, we introduce ArabCulture-Dialogue, a culturally grounded conversational dataset covering 13 Arabic-speaking countries, in both MSA and each country's respective dialect, spanning 12 daily-life topics and 54 fine-grained subtopics.

## 关键词
- `#Arabic NLP` `#cultural reasoning` `#dialect` `#LLM evaluation` `#multilingual`