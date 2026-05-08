# SLAM: Structural Linguistic Activation Marking

## 元信息
| 标题 | SLAM: Structural Linguistic Activation Marking for Language Models |
|------|------|
| 作者 | Fabrice Harel-Canada, Amit Sahai |
| 链接 | [原文](https://arxiv.org/abs/2605.05443) |
| arXiv | arXiv:2605.05443 |
| 领域 | LLM Watermarking, AI Safety |

## 核心贡献

1. **Geometry over Token Frequencies**: 首次将水印写入 residual-stream 几何结构，而非 token 分布
2. **Sparse Autoencoders**: 识别编码语言结构（如 voice, tense, clause order）的 residual-stream 方向
3. **Causal Steering at Generation**: 生成时因果性地操控这些方向，保持词汇采样和语义不变
4. **极低质量损耗**: 100% 检测率，仅 1-2 reward points 质量损耗（vs KGW/EWD/Unigram 的 7.5-11.5）

## 方法

```
Token 分布 → 结构几何
SAE 识别 residual-stream 中的语言结构方向
生成时 causal steering 这些方向
→ 词汇采样自由、语义不变
```

## 实验结果 (Gemma-2 2B & 9B)

| 方法 | 检测率 | 质量损耗 |
|------|--------|----------|
| SLAM | 100% | 1-2 points |
| KGW | ~100% | 7.5-11.5 points |
| EWD | ~100% | 7.5-11.5 points |
| Unigram | ~100% | 7.5-11.5 points |

自然性和多样性接近无水印水平。

## 鲁棒性权衡

- **SLAM 强项**: 抵御 word-level edits
- **SLAM 弱项**: 对重构语法的 paraphrase 脆弱
- 恰好与 token-distribution 方法互补

## 关键词
`Watermarking` `Sparse Autoencoders` `Residual Stream` `Linguistic Structure` `AI Safety`

## 日期
2026-05-08