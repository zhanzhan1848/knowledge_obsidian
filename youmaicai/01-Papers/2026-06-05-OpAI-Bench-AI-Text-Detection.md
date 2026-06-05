# OpAI-Bench: Operation-Guided Progressive Human-to-AI Text Transformation Benchmark

## 基本信息
| 标题 | 值 |
|------|-----|
| 链接 | [原文](https://arxiv.org/abs/2606.06481) |
| arXiv | arXiv:2606.06481 |
| 代码 | [GitHub](https://github.com/VILA-Lab/OpAI-Bench) |
| 领域 | AI-Text Detection / NLP 应用 |

## 核心贡献

1. **OpAI-Bench 基准**: 研究渐进式 human-to-AI 文本转换的 benchmark，覆盖 document/sentence/token/span 四个粒度。

2. **渐进式修订轨迹**: 从人类写作文档出发，构建 9 个逐步修订版本，predefined AI coverage levels + 5 种代表 AI edit operations。

3. **5 种 AI edit operations**: polish（润色）、paraphrase（改写）、style rewrite（风格重写）、compress（压缩）、expand（扩展）。

4. **发现关键洞察**: 混合 authorship 的中间版本往往比纯人类和纯 AI 端点更难检测，揭示非单调检测模式。

## 核心洞察

- AI 文本可检测性不仅由 AI 修改内容比例决定
- Edit operation 类型、领域、累积修订历史都会影响检测
- 混合 authorship 中间区域（约 v4）是检测关键点

## 评估维度

- 8 个 document-level 检测器
- 7 个 sentence-level 检测器
- 2 个 fine-grained token/span-level 检测器

## 局限性

- 聚焦英语写作场景
- 检测器泛化性待进一步验证

## 关键词
`AI-text detection` `NLP` `LLM` `human-AI collaboration` `benchmark`
