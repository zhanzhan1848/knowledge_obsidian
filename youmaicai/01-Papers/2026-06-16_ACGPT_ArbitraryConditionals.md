# AC-GPT: Arbitrary Conditionals GPT

## 元信息
| 标题 | Simplifying the Modeling of Arbitrary Conditionals in Natural Language |
|------|-----|
| 作者 | Yinhan Lu, Eric Elmoznino, Léo Gagnon, Sarthak Mittal, Tejas Kasetty, Guillaume Lajoie |
| 链接 | [原文](https://arxiv.org/abs/2606.14943) |
| arXiv | arXiv:2606.14943 |
| 领域 | cs.CL, cs.LG |

## 核心贡献
1. 提出 **AC-GPT (Arbitrary Conditionals GPT)**：对标准因果 Transformer 的简单修改，使其能在**单次前向传播**中评估和采样任意条件（过去、未来、混合上下文）
2. 保持标准 left-to-right 顺序和 next-token prediction 目标，兼容现有 LLMs 的微调
3. 在建模任意条件上超越基线，且不降低标准 left-to-right 性能

## 核心问题
### 因果 Transformer 的局限性
- 因果 Transformer 通过自回归因子化建模序列联合分布
- 优点：高效 left-to-right 解码和条件似然计算
- 局限：**无法高效地从未知条件分布中采样或评估**，例如"在给定过去和未来 token 的条件下，文本块的条件分布"

### 现有方法的不足
- 新型架构可解决任意条件建模问题，但通常导致对任意条件的建模次优和生成质量下降

## 方法
### AC-GPT 核心思想
对标准因果 Transformer 引入简单修改：
- 保持 left-to-right 顺序 → 继续使用标准的 next-token prediction 目标
- 增加对任意条件的支持 → 在单次前向传播中处理 past/future/mixed 上下文
- 兼容性：允许在现有 LLMs 上微调

### 关键属性
1. **单次前向传播**：无需多次迭代或昂贵的推理过程
2. **保持标准目标**：不牺牲自然语言处理性能
3. **可微调**：现有 LLMs 可直接适配

## 实验
- 在任意条件建模基准上超越基线
- 标准 left-to-right 性能不退化

## 关键词
`Causal Transformer` `Arbitrary Conditionals` `Conditional Language Modeling` `Autoregressive Model` `Next-Token Prediction`
