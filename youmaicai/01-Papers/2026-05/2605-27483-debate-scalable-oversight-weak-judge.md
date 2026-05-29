# Debate Helps Weak Judges Reward Stronger Models

## 基本信息
| 标题 | Debate Helps Weak Judges Reward Stronger Models |
|------|-----------------------------------------------|
| 作者 | Ethan Elasky, Frank Nakasako, Naman Goyal |
| 链接 | [原文](https://arxiv.org/abs/2605.27483) |
| arXiv | arXiv:2605.27483v1 |
| 领域 | cs.CL, cs.AI, cs.LG |

## 核心贡献

1. **设置**：在强辩手/弱裁判设置下研究辩论（可验证的代码和逻辑任务）
2. **关键条件**：
   - 批评者分类能力必须超过裁判
   - 裁判必须将批评者发言视为待验证的声明而非待总结的证词
3. **结果**：满足条件时，辩手-批评者辩论相比咨询基准有统计显著提升
4. **反驳轮次的消融**：单次独立批评以更低推理成本恢复了辩论大部分收益

## 关键发现

辩论作为可扩展监督协议的有效性取决于：
1. 批评者是否击败裁判？
2. 裁判是否会验证批评？

```math
\text{Debate Primitive} = \text{Answer} + \text{Critique} + \text{Judge}
```

## 可扩展监督启示

这表明在可验证领域进行免训练可扩展监督的更便宜原语，以及预测辩论何时有帮助的预部署审计。

## 标签
#scalable-oversight #debate #alignment #RLHF