# When Chain-of-Thought Helps and When It Hurts: An Empirical Investigation of the Serial-Depth Bottleneck in LLM Reasoning

## 元信息
| 标题 | When Chain-of-Thought Helps and When It Hurts |
|------|------|
| 作者 | Tughanbulut Kurtulush |
| 链接 | [原文](https://arxiv.org/abs/2608.09942) |
| arXiv | arXiv:2608.09942 |
| 发表 | cs.CL, cs.AI, cs.LG |
| 标签 | Chain-of-Thought, Reasoning, LLM, Transformer |

## 核心贡献
1. **Serial-Depth 框架**: 基于 H_dp 带宽 bound (Chen et al., 2024)，将 CoT 重新解释为 transformer 单次计算容量的带宽旁路机制
2. **发现 serial-depth gradient**: 单次通过（无 CoT）准确率随每项 serial depth 单调下降，而 CoT 近似 depth-invariant
3. **非通用性**: CoT 不是通用的推理增强器——它帮助那些超出单次计算容量的串行计算，对已适应单次计算的任务冗余

## 关键实验
- **模型**: Qwen-2.5-7B/32B, Llama-3.1-8B (三个指令微调模型)
- **基准**: 5 个标准 NLP 基准（MMLU, ARC, GSM8K, MATH, HumanEval）

### 结果摘要
| 任务类型 | 任务示例 | CoT 效果 |
|----------|----------|----------|
| P-complete (高 serial depth) | GSM8K, MATH | **+54~+68 pp** 恢复差距 |
| TC^0 (浅 depth) | MMLU, ARC | Delta ∈ [0.0, +4.6] pp，结构性冗余 |
| L (中等) | HumanEval | 模型大小依赖：+23.2pp (32B), +9.1pp (8B), **-28.7pp** (7B) |

## 核心发现
- **跨基准 depth-recovery 相关性**: Spearman rho = 0.661 (p = 0.007, n = 15)
- **McNemar 检验**: 15 个基准级检验中 9 个经 Bonferroni 校正后显著
- **CoT 机制**: 是带宽旁路，而非通用推理增强器

## 关键公式
- **H_dp 带宽 bound**: serial computation 超出 transformer's single-pass capacity 时必须 externalize（CoT 的本质）
- 形式 bound 仅在渐近情况（天文大 prompt length）下成立，但识别了真实架构瓶颈

## 建议
- **是否推荐使用**: 视任务而定
- **适用场景**: 
  - 使用 CoT: 深度串行推理任务（数学、代码、复杂逻辑）
  - 避免 CoT: 浅层分类任务（可能降低 7B 等小模型性能）
- **实践建议**: 大模型（≥32B）可放心用 CoT；小模型（≤7B）在 HumanEval 类任务上可能受害
