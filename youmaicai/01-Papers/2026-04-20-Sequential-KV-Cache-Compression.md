# Sequential KV Cache Compression via Probabilistic Language Tries: Beyond the Per-Vector Shannon Limit

## 元信息
| 标题 | Sequential KV Cache Compression via Probabilistic Language Tries |
|------|---------|
| 作者 | Gregory Magarshak |
| 链接 | [原文](https://arxiv.org/abs/2604.15356) |
| arXiv | arXiv:2604.15356v1 |
| 领域 | cs.LG, cs.AI, cs.IT, cs.NE |
| 发表 | 2026-04-10 |

## 核心贡献

1. **问题发现**：TurboQuant 等 KV cache 量化方法对每个向量独立压缩，但实际问题是**序列压缩**——token 间存在语言结构相关性
2. **关键洞察**：KV cache 中的 token 不是任意浮点数据，而是模型训练语料的采样，模型本身是该语言的近最优预测器
3. **两层架构**：
   - **Layer 1 - Probabilistic Prefix Deduplication**：使用 PLTs 的 trie metric d_T(s, s') = -log₂ P_M(s ^ s') 识别跨会话的语义等价共享前缀
   - **Layer 2 - Predictive Delta Coding**：仅存储每个新 KV 向量相对于模型自身预测的残差

## 理论结果

- **熵界限**：H(KV_{i+1} | KV_{<=i}) ≤ H(token_{i+1} | token_{<=i})
- **典型困惑度（10-20）下**：每 token 位置 3.3-4.3 bits（TurboQuant 每向量分量 3 bits，但注意典型 attention head 有 64-128 个分量）
- **理论压缩比 vs TurboQuant**：约 **914,000x**（Shannon 极限）
- 即使在熵底 1000x 以上的悲观情况下，仍有约 **914x** 压缩比

## 关键特性

- 压缩效果随上下文长度增长而**改善**（而非退化）
- 两层设计**正交**，可与 TurboQuant 等现有逐向量量化方法组合
- 利用语言模型的近最优预测能力（perplexity ~ 10-20）

## 核心公式

```math
d_T(s, s') = -\log_2 P_M(s \wedge s')
```

```math
H(KV_{i+1} | KV_{<=i}) \leq H(token_{i+1} | token_{<=i})
```

## 标签
#KV-cache #compression #transformer #inference-optimization #information-theory #probabilistic-language-models
