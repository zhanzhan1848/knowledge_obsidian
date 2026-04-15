# Filtered Reasoning Score: Evaluating Reasoning Quality on a Model's Most-Confident Traces

## 元信息
| 标题 | Filtered Reasoning Score: Evaluating Reasoning Quality on a Model's Most-Confident Traces |
|------|-----|
| 作者 | Manas Pathak, Xingyao Chen, Shuozhe Li, Amy Zhang, Liu Leqi |
| 链接 | [原文](https://arxiv.org/abs/2604.11996) |
| arXiv | arXiv:2604.11996 |
| 代码 | [GitHub](https://github.com/Manas2006/benchmark_reproducibility) |

## 核心贡献
1. 指出基于结果的评估 (outcome-based evaluation) 的 fundamental limitation
2. 提出 **Filtered Reasoning Score (FRS)**，仅使用 top-K% 最 confident traces 计算推理质量
3. 评估推理 traces 的维度：faithfulness, coherence, utility, factuality

## 问题背景
- 高准确率不等于高质量推理
- 模型可能通过记忆或过度优化获得正确答案
- 相似准确率的模型可能有显著不同的推理能力

## 方法

### 推理质量维度
- **Faithfulness**: 推理过程是否忠实于实际计算
- **Coherence**: 推理步骤之间的逻辑连贯性
- **Utility**: 推理步骤对最终答案的贡献
- **Factuality**: 推理中使用的事实是否正确

### Filtered Reasoning Score
- 仅使用 top-K% 最 confident traces
- 避免低 confidence 正确 traces 的干扰

## 实验发现
- 标准准确率下无法区分的模型，FRS 显示显著推理质量差异
- 高 FRS 的模型在不同基准上迁移性更好

## 相关领域
- Reasoning Evaluation
- Chain-of-Thought
- LLM Benchmark
- faithfulness

## 关键词
#reasoning #evaluation #benchmark #faithfulness #CoT
