# Format Sensitivity Index: Prompt Wrapper Robustness in LLM Benchmarking

## 元信息
| 标题 | Format Sensitivity Index: Token-Controlled Prompt Wrapper Robustness and Schema Compliance in LLM Benchmarking |
|------|-----|
| 作者 | Deep Pankajbhai Mehta |
| 链接 | [原文](https://arxiv.org/abs/2607.09665) |
| arXiv | arXiv:2607.09665 |
| 日期 | 2026-07-14 |
| 分类 | cs.AI, cs.CL, cs.LG |

## 核心贡献

1. **Format Sensitivity Index (FSI)**: 提出衡量 prompt wrapper 选择对模型准确率影响范围的指标
2. **Parseability Sensitivity Index (PSI)**: 衡量 wrapper 对答案可解析性的影响范围
3. **Token-Controlled Protocol**: 在 token 受控条件下研究 wrapper 差异
4. **统计脆性论证**: 证明不报告 wrapper 方差的准确率评估在统计上是脆弱的

## 核心发现

- **140,000 次 OpenRouter 生成**，覆盖 7 个 QA 任务、5 个 wrapper 系列、4 个 instruct 模型（7B–72B）
- **mean FSI 在不同模型间相差超过 30 倍**，主要由合规失败（compliance failures）解释
- **Parseability 是准确率的强预测因子**，即使控制了任务、模型和 wrapper 后仍然显著
- 建议：基准测试和结构化输出部署都应报告 wrapper 方差和合规率

## 实验设置

- **任务**: 7 个 QA 任务
- **Wrapper**: 5 个不同家族（格式化方式各异）
- **模型**: 4 个 instruct 模型（7B 到 72B）
- **协议**: Token-controlled

## 关键结论

> 报告准确率时不报告 wrapper 方差和合规性，在统计上是脆弱的。

- 不同的 prompt wrapper 格式（如 XML tags、JSON、Markdown 等）会导致同一模型在同一任务上得分差异大到足以翻转排行榜结论
- 结构性输出（structured output）部署中，合规性（模型是否按要求格式输出）是关键瓶颈

## 建议

1. **基准测试**：应同时报告均值和 wrapper 诱导的方差
2. **结构化输出部署**：优先使用高合规率的 wrapper，而非追求复杂格式
3. **评估协议**：引入 token 控制协议以消除长度混淆

## 局限性

- 研究仅覆盖英文 QA 任务
- 未探索模型 scale 对 wrapper 敏感性的非线性效应

## 标签
#LLM评估 #PromptEngineering #Benchmarking #StructuredOutput #提示工程

---
*🥬 油麦菜 · LLM/NLP 知识库 · 2026-07-14*
