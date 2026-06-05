# Benchmark Agent: Benchmark Everything Everywhere All at Once

## 基本信息
| 标题 | 值 |
|------|-----|
| 链接 | [原文](https://arxiv.org/abs/2606.06462) |
| arXiv | arXiv:2606.06462 |
| 领域 | LLM 评估 / MLLM / Agent |

## 核心贡献

1. **Benchmark Agent**: 全自主 agentic 系统，编排完整 benchmark 构建 pipeline：用户查询分析 → 子任务设计 → 数据标注 → 质量控制。

2. **自动生成 15 个代表 benchmarks**：覆盖 text understanding、multimodal understanding、domain-specific reasoning 等多种评估场景。

3. **极低人工参与**: 包含 human evaluation、LLM-as-judge、consistency checks 等质量保障机制。

## 核心问题

- 现有 benchmark 构建劳动密集，难以复用和规模化
- Benchmark 发布后性能快速饱和，无法区分 SOTA 模型

## 方法

- 用户 query 分析
- 子任务设计
- 数据标注
- 质量控制

## 局限性

- 自动化评估质量边界待划定
- 特定领域 benchmark 生成效果待验证

## 关键词
`LLM evaluation` `MLLM` `agent` `benchmark` `autonomous benchmark construction`
