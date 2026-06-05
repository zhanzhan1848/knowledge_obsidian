# NF-CoT: Latent Reasoning with Normalizing Flows

## 基本信息
| 标题 | 值 |
|------|-----|
| 链接 | [原文](https://arxiv.org/abs/2606.06447) |
| arXiv | arXiv:2606.06447 |
| 代码 | - |
| 领域 | Reasoning / Chain-of-Thought / 推理能力 |

## 核心贡献

1. **NF-CoT 框架**: 在 LLM backbone 内置入 TARFlow-style normalizing flow，建模紧凑连续 thoughts 的可 tractable 概率模型。连续 thought 位置由 NF head 生成，文本位置由标准 LM head 生成。

2. **保留 CoT 核心优势**: 
   - 原生 left-to-right 生成
   - 概率采样
   - KV-cache 解码兼容
   - 可 tractable 似然估计

3. **在代码生成 benchmark 上提升 pass rate**，同时大幅降低中间推理 token 成本。

## 核心思想

现有方法的问题：
- **显式 CoT**: 离散、串行、低信息密度，推理代价高
- **Coconut (确定性隐状态)**: 无概率分布，无法采样/scoring
- **LaDiR (diffusion)**: 需要迭代去噪，缺乏原生 AR 似然建模

NF-CoT 的创新：用 normalizing flow 在 LLM 因果流中建模连续 thoughts，使连续 CoT 获得与语言 token 同等的建模地位。

## 训练方法

```math
p_θ(x_{1:N}|q) = ∑_{d_{1:L}} p_θ(d_{1:L}|q) p_θ(x_{1:N}|q,d_{1:L})
```

NF-CoT 将显式 CoT 监督蒸馏为连续 thoughts，优化端到端似然目标。支持 supervised likelihood training 和 policy-gradient refinement。

## 四种 CoT 范式对比

| 范式 | 特点 |
|------|------|
| Explicit CoT | 离散文本 token |
| Coconut | 确定性隐状态 |
| LaDiR | 迭代去噪 latent |
| NF-CoT | AR 采样连续 thoughts |

## 评估基准

- MBPP, MBPP+, HumanEval, HumanEval+, LiveCodeBench v6

## 局限性

- 需要将显式 CoT 蒸馏为连续表示
- 实现复杂度较高

## 关键词
`reasoning` `chain-of-thought` `latent reasoning` `normalizing flows` `LLM` `code generation`
