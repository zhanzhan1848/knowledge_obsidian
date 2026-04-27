# Outcome Rewards Do Not Guarantee Verifiable or Causally Important Reasoning

## 元信息
| 标题 | Outcome Rewards Do Not Guarantee Verifiable or Causally Important Reasoning |
|------|-------|
| 作者 | Qinan Yu, Alexa Tartaglini et al. |
| 链接 | [原文](https://arxiv.org/abs/2604.22074) |
| arXiv | arXiv:2604.22074 |
| 分类 | cs.CL |

## 核心贡献

1. **RLVR 的隐含假设质疑**: RLVR 训练推理链，但推理链是否真正代表模型如何得到答案是未验证的
2. **两个新指标**:
   - **CIR (Causal Importance of Reasoning)**: 测量推理 tokens 对最终答案的累积影响
   - **SR (Sufficiency of Reasoning)**: 测量验证者是否仅基于推理可得出明确答案

## 核心发现

### Qwen2.5 系列 + ReasoningGym 任务
1. **RLVR 提升准确性但不提升 CIR/SR**: RLVR 改进任务准确性，但不可靠地改进因果重要性或推理充分性
2. **SFT 先于 RLVR**: RLVR 前少量 SFT 可补救低 CIR 和 SR
3. **联合奖励**: 在结果奖励基础上添加 CIR/SR 辅助奖励，可在不损失准确性的同时获得因果重要且充分的推理

## 关键洞察

| 问题 | 发现 |
|------|------|
| RLVR 推理链真实性 | 推理 tokens 不一定因果重要 |
| 验证充分性 | 仅基于推理链可能无法得出明确答案 |
| 解决方案 | 联合 CIR/SR 奖励 + 结果奖励 |

## 核心公式

```
联合奖励 = Outcome Reward + α × CIR + β × SR
```

## 建议
- **适用场景**: RLVR 后训练、推理链质量评估、Chain-of-Thought 可靠性分析
- **推荐指数**: ⭐⭐⭐⭐⭐ (对 RLVR/CoT 研究和实践都有重要意义)
