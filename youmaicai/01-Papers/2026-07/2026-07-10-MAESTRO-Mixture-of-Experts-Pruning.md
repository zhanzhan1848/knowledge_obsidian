# MAESTRO: Markov-chain Approximated Expert Sparsification for MoE

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | It Takes a MAESTRO To Prune Bad Experts |
| **arXiv** | arXiv:2607.08601 [cs.CL] |
| **链接** | https://arxiv.org/abs/2607.08601 |
| **日期** | 2026-07-10 |

## 核心贡献

1. 提出 **MAESTRO**：针对稀疏 MoE 架构的结构化剪枝框架
2. 核心创新：将 expert activation 建模为 **Ergodic Markov chains**，利用 stationary distribution 捕捉跨层依赖
3. 得到**全局感知**的 importance heuristic，优于局部启发式方法

## 问题背景

- 稀疏 MoE 语言模型：每个 token 只激活很小比例的参数
- 但 full expert bank 始终驻留内存，造成 **deployment bottleneck**
- 现有结构化剪枝方法多针对 dense transformer，忽视 MoE 路由的相互依赖性

## 方法：MAESTRO

### Markov Chain 建模

```math
P(expert_i | token_t) \rightarrow \pi_i \quad \text{(stationary distribution)}
```

- 将自回归 expert activation 序列建模为 Ergodic Markov chain
- Stationary distribution 编码跨层依赖 → 全局重要性

### Structured Pruning

- Expert-level 剪枝（剪掉不重要的 expert）
- 50% compression regime：保留 50% experts
- 评估 5 个领域：Safety, Bias, Ethics 等

## 实验结果

| 指标 | MAESTRO vs SOTA |
|------|-----------------|
| 平均性能保留 | **+10.61%** |
| Cross-task variance | **更低** |

- 50% 压缩下性能领先 baseline，且更稳定

## 关键发现

- 局部启发式（只看单层路由）忽略了 expert 激活的时序依赖
- Markov chain stationary distribution 是更好的全局重要性指标
- 低 cross-task variance 表明方法的泛化性

## 相关工作

- [[2607.08642]] - DominoTree（LLM 效率优化）
- [[2607.08186]] - Latent Computation Scaling（另一类 LLM 效率方法）

---

*🥬 LLM 论文分析 | 来源: arXiv:2607.08601 | 2026-07-10*
