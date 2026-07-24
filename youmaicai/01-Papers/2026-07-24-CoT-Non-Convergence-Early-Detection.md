# Token Budget Saturation and Mechanistic Early Detection of Reasoning Non-Convergence in Chain-of-Thought Models

> 🥬 LLM 论文分析：CoT 推理不收敛的早期机械检测

## 基本信息
- **作者**: Renuka Oladri et al.
- **链接**: [arXiv](https://arxiv.org/abs/2607.21433)
- **arXiv**: arXiv:2607.21433
- **Subjects**: cs.CL, cs.AI, cs.LG

## 核心贡献
1. 表征 CoT 推理模型的**双峰收敛模式**：要么在 token budget 内收敛，要么耗尽 budget 而未达结论
2. 以 DeepSeek-R1-Distill-Qwen-7B 为例：
   - 收敛生成：AIME 1983-2024 上 90.3% 准确率
   - 不收敛生成：仅 6.6% 准确率
   - 总体收敛率：62.0%
3. 核心问题：能否在 thinking chain 早期检测收敛命运？
4. 在 token 50-300 的 hidden-state activations 上训练 linear probes
5. Layer-20 activations at token 150 达到 AUC 0.608（±0.080，5-fold CV），即使在 token 50 也可靠地高于 chance
6. Activation probes 始终优于基于 token entropy 和 repetition statistics 的行为基线

## 实验结果

### 收敛 vs 不收敛
| 类型 | AIME 准确率 | 占比 |
|------|-------------|------|
| 收敛生成 | 90.3% | ~62% |
| 不收敛生成 | 6.6% | ~38% |

### 早期检测性能
- Layer-20, token 150: AUC = 0.608
- 即使 token 50 也可靠高于 chance
- Activation probes > behavioral baselines (entropy, repetition)

## 关键发现
收敛命运在生成结束前 well before 就已部分编码在中间表征中——为 early-exit inference 和 adaptive compute allocation 开辟道路。

## 标签
#chain-of-thought #reasoning #CoT #early-exit #adaptive-compute #mechanistic-interpretability
