# Improving LLMs via Validator-to-Generator Alignment

## 元信息
| 标题 | Improving LLMs via Validator-to-Generator Alignment |
|------|---------------------------------------------------|
| 作者 | Juan Diego Rodriguez, Jocelyn Zhang, Katrin Erk, Greg Durrett |
| 链接 | [原文](https://arxiv.org/abs/2607.02668) |
| arXiv | arXiv:2607.02668 |
| 类别 | cs.CL |
| 发表 | 2026-07-02 |

## 核心贡献
1. **G-V Gap 问题**：提出大型语言模型存在生成器-验证器不一致性（Generator-Validator Gap）：LLM 生成的响应在被重新查询验证时会判定为无效
2. **频率纠正**：指出问题根源在于生成器对 valid 字符串的 likelihood 较低，因为这些字符串本身先验概率低
3. **FCPA 方法**：提出 Frequency-Corrected G-V consistency (FCPA) 训练目标，在自然多答案问题模型下，验证器与频率纠正后的生成器分数一致性自然涌现
4. **显著提升**：在 IFEval 和 HumanEval 上，G-V 一致性和生成器性能均提升高达 **+27pp** Pearson correlation

## 问题定义
```
传统 G-V 一致性问题：
生成器 G 生成响应 r
验证器 V 验证 r 是否 valid
问题：V(r) ≠ G(r) 经常发生

根源：P(r) 很低的 valid 字符串会被 V 错误拒绝
```

## 方法：FCPA
- 频率纠正：在验证器评分中引入生成器频率先验
- 在理性多答案智能体模型下证明一致性自然涌现
- 训练目标：同时优化生成器质量和 G-V 一致性

## 实验结果
| Benchmark | 提升 |
|-----------|------|
| IFEval | +27pp Pearson correlation |
| HumanEval | +27pp Pearson correlation |

- 验证器质量在所有任务上保持

## 局限性
- 目前聚焦 IFEval 和 HumanEval，其他任务有待验证

## 相关方向
- [[LLM 一致性]]
- [[RLHF]]
- [[Generator-Validator]]
- [[Instruction Tuning]]

---
*🥬 LLM 核心问题 - 生成器-验证器一致性，提升指令遵循能力*
