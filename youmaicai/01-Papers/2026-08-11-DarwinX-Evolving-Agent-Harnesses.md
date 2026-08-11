# DarwinX: Evolving Agent Harnesses Through Natural Selection

## 元信息
| 标题 | DarwinX: Evolving Agent Harnesses Through Natural Selection |
|------|-----|
| 作者 | Yifan Zhang, Yutong Dai, Juntao Tan, Luyu Yang, Rishi Mullur, Thai Hoang, Zhiyuan Hu, James Zhu, Phil Mui, Silvio Savarese, Ran Xu, Zeyuan Chen |
| 链接 | [原文](https://arxiv.org/abs/2608.07545) |
| arXiv | arXiv:2608.07545 |

## 核心贡献

1. **Harness Evolution**: 将 LLM Agent 的自进化视为在冻结模型条件下的 harness 群体选择
2. **Preserve-and-Extend Contract**: 只接纳扩展覆盖范围且不回归的变体
3. **Archive for Recombination**: 保留替代谱系供重组
4. **统一编辑接口**: 失败证据、教师证据、自派生证据共享
5. **无 gold solutions、无人工挑选胜者**:  fitness 来自各基准自身的验证器

## 核心机制

- **Frozen model + evolving harness**: 模型参数冻结，进化的是 prompt、tools、skills、control flow
- **Population selection** over single-lineage search
- **Preserve-and-extend**: 避免局部最优导致的回归

## 实验结果

| 基准 | 基础 | DarwinX | 提升 |
|------|------|---------|------|
| Terminal-Bench 2.1 (matched base) | 75.5% | 83.2% | +7.7 |
| Terminal-Bench 2.1 (stronger base) | - | 84.7% | frontier |
| TerminalWorld held-out | - | 68.3% | SOTA |
| WebArena-Infinity pass@1 | 43.5% | 93.0% | +49.5 |
| SWE-bench Verified | (Terminal-Bench harness transfers) | ✓ | 无改动迁移 |

**平均提升: ~17 points / loop**

## 核心洞察

- 进化的是通用 Agent 能力，而非 benchmark 特异性补丁
- 跨任务、验证器和基础模型的泛化能力
- 冻结模型不必是固定智能体：harness 选择将评估计算转化为持久能力

## 相关领域
[[LLM agent]] [[evolution]] [[harness]] [[self-improvement]] [[prompt engineering]] [[agent]]

---
*🥬 LLM/NLP Paper | 2026-08-11*
