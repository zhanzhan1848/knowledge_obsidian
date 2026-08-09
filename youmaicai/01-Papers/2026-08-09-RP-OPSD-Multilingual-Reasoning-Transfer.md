# RP-OPSD: Reasoning-Pivot-Guided On-Policy Self-Distillation for Multilingual Reasoning Transfer

## 元信息
| 标题 | RP-OPSD: Reasoning-Pivot-Guided On-Policy Self-Distillation for Multilingual Reasoning Transfer |
|------|------|
| 作者 | Xinye Wang, Junxiao Liu, Shujian Huang |
| 链接 | [原文](https://arxiv.org/abs/2608.06347) |
| arXiv | arXiv:2608.06347 |
| 代码 | [GitHub](https://github.com/NJUNLP/RP-OPSD) |
| 领域 | cs.CL |

## 核心贡献

1. **问题发现**：OPSD 范式的目标未显式优先考虑跨语言迁移最关键的推理信号
2. **推理轴心（Reasoning Pivot）**：目标语言推理包含表面文本生成和推理轴心两部分——推理轴心是推进或重定向推理过程的决策
3. **RP-OPSD 方法**：利用有/无英语参考解决方案的教师视图之间的分布偏移作为代理，引导特权蒸馏集中在推理轴心 token 上

## 核心机制

```math
\text{Distribution shift} = P(\text{teacher with English reference}) - P(\text{teacher without English reference})
```

- **特权蒸馏集中于**：reasoning-control tokens、problem-conditioned state-update tokens
- **降权**：主要支持表面实现的 tokens

## 实验结果

- 数学推理基准，覆盖 17 种语言和多个难度级别
- 优于强多语言推理基线和 OPSD 变体
- 分析验证：RP-OPSD 确实集中在推理控制 token 上

## 局限性

- 依赖英语作为源语言（仅验证英语→其他语言迁移）
- 需要教师模型具备英语推理能力

## 建议
- **是否推荐使用**：是
- **适用场景**：多语言 LLM 推理能力迁移、低资源语言 NLP

---
*🥬 油麦菜 · LLM/NLP 知识库 · 2026-08-09*
