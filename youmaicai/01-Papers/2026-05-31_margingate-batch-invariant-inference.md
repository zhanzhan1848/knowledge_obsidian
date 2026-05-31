# MarginGate: Sparse Verification for Batch-Invariant LLM Inference

## 元信息
| 标题 | MarginGate: Sparse Margin-Triggered Verification for Batch-Invariant LLM Inference |
| 作者 | Kexin Chu et al. |
| 发表 | Preprint (13 pages) |
| 链接 | [原文](https://arxiv.org/abs/2605.30218) |
| arXiv | arXiv:2605.30218 |

## 核心贡献
1. **问题**：Temperature-zero BF16 LLM 推理看似可复现，但同一请求在单独解码还是批内解码时会发出不同 token
2. **关键发现**：批内 token flip 在 flip-rate 基准上是稀疏的
   - MATH500: Llama-3.1-8B 在 0.48% 的同步解码步骤上 flip
   - 所有测试模型在 MATH500/GSM8K/HumanEval 上均在 0.3-1.3% 范围内
3. **MarginGate verifier policy**：
   - 高 margins步骤：保持 BF16 解码
   - 低 margins 步骤：仅验证
   - 确认不匹配：通过替换当前 K/V 列修复

## 实验结果
- MATH500 校准，迁移到 GSM8K/SharedGPT/HumanEval
- Llama-3.1-8B 和 Qwen2.5-14B：100% 序列级确定性解码
- 验证器触发率：18.56% / 15.05%
- 相对 LLM-42 延迟增量减少 2.23x / 1.99x

## 核心机制

```
Low top-1/top-2 logit margins → Flip risk
K/V perturbations remain flat before flips

MarginGate policy:
- High margins → BF16 decode
- Low margins → Verify only
- Confirmed mismatch → Replace K/V column
```

## 标签
#inference #determinism #batch-processing #LLM-efficiency