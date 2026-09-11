# 🥬 LLM 论文分析：K/V-Cache Interventions

## 基本信息
- **标题**: K/V-Cache Interventions Dissociate Representation Alignment from Persona Expression in Decoder-Only Language Models
- **作者**: Huimin Han
- **发表**: arXiv:2609.11020 | cs.CL
- **链接**: [原文](https://arxiv.org/abs/2609.11020) | [PDF](https://arxiv.org/pdf/2609.11020) | [HTML](https://arxiv.org/html/2609.11020v1)

## 核心贡献

1. **K/V-Cache Intervention 方法**: 将目标条件的 K/V 轨迹移植到源人格生成中，实现 decoder-only LLM 的人格控制
2. **表征-行为解耦发现**: 表征级对齐指标（V-gap）不是下游 persona 表达的有效预测因子
3. **中层替换最优**: 只有中层替换 (layers 9-20) 能同时实现目标标记表达和保留词汇多样性
4. **位置扰动失败**: lag 和 shuffle 操作都会抑制目标人格表达，表明存在共同的结构约束

## 方法详解

**K/V-Cache Intervention**:
- 将 source persona 生成过程中的 K/V 缓存替换为 target persona 的 K/V 轨迹
- 测试 13 种干预配置（不同层次组合）
- 评估指标: V-gap (V空间对齐), TTR (Type-Token Ratio, 词汇多样性), 目标标记表达

**Trajectory-Level Transplantation**:
- 由于移植的轨迹携带目标自己的生成 token 历史
- 引入 same-token-sequence control 进行消融

## 实验结果 (Llama-3.1-8B)

| 干预配置 | V-gap | TTR | 目标标记表达 |
|----------|-------|-----|--------------|
| Early (layers 1-8) | 0.91 | - | 弱 |
| Mid (layers 9-20) | 0.89 | 0.77 | **强** |
| Late (layers 21-28) | 0.84 | - | 弱 |
| Full | 0.94 | 0.65 | 中等 |

**关键发现**:
1. **解耦 1**: 所有层带 K/V 替换都达到强局部 V-space 对齐 (0.84-0.91)，但只有中层实现同时表达目标 persona 和保留词汇多样性
2. **解耦 2**: Full 和中层替换诱导相当的 V-gap (0.94 vs 0.89)，但产生不同的词汇多样性 (TTR 0.65 vs 0.77)
3. **位置扰动失败**: lag 和 shuffle 操作一致抑制目标 persona 表达

## Same-Token-Sequence Control

在源 vs 目标条件下去码相同 token 序列，复现了 L28 表征偏移的符号和层定位，表明偏移不能仅由导入的 token 历史解释。

## 局限性

- 仅在 Llama-3.1-8B 上验证， universality 待验证
- 高信号设置下验证，不一定适用于所有 persona pair

## 建议
- **是否推荐使用**: ⭐⭐⭐⭐ (发现重要的表征-行为解耦现象)
- **适用场景**: LLM 人格控制、可解释性研究、干预机制分析
- **关键洞察**: K/V cache 是可控但结构受限的干预表面

---

## 🏷️ Tags
#LLM-Interpretability #Persona-Control #KV-Cache #Intervention #Representation-Alignment
