# Cross-Layer Error Compensation for LLM Quantization

## 元信息
| 标题 | Cross-Layer Error Compensation and Finite-Sample Feature-Statistics Matching for Extreme Low-Bit Quantization of Large Language Models |
|------|------|
| 作者 | Ryona Noda |
| 链接 | [原文](https://arxiv.org/abs/2607.14630) |
| arXiv | arXiv:2607.14630 |
| 领域 | cs.NE |

## 核心贡献
1. **Cross-Layer Error Compensation**: 通过递归 $e_{l+1} = A_l e_l + q_l$ 维持网络级累积误差
2. **Finite-Sample Feature-Statistics Matching**: 对齐全精度和量化网络的统计特性
3. **理论保证**: 传播算子为量化网络有限差分时，递归对任意非线性层精确

## 实验结果 (Qwen2.5-1.5B, 1.125-bit)

| 方法 | Perplexity Ratio |
|------|-----------------|
| Error Compensation Alone | **9.56 ± 0.15** |
| Logit Distillation | 14.09 ± 0.53 |
| Layer-local Reconstruction | >> 9.56 |

- 比 logit distillation 优 32%（超过 8 sigma）
- 迁移到 4-bit: 1.060 vs. 1.088

## Out-of-Domain
- C4, CNN/DailyMail 上错误补偿优势增长
- 统计匹配保持低差异（0.42-0.88 vs. 1.41-2.99）
