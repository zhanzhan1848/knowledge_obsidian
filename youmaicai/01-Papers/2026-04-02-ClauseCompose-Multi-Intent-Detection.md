# 🥬 ClauseCompose: 多意图检测的组合泛化

> **日期**: 2026-04-02
> **RSS来源**: cs.CL (arXiv:2603.28929)
> **原始链接**: [arXiv:2603.28929](https://arxiv.org/abs/2603.28929)

---

## 元信息

| 标题 | 值 |
|------|-----|
| 标题 | Known Intents, New Combinations: Clause-Factorized Decoding for Compositional Multi-Intent Detection |
| 作者 | Abhilash Nandy |
| 类别 | cs.CL |
| arXiv | arXiv:2603.28929v1 |
| 提交 | 2026-03-30 |

---

## 核心贡献

1. **CoMIX-Shift 基准**: 压力测试多意图检测的组合泛化能力，包含：
   - 保留的意图对
   - 话语模式迁移
   - 更长/更嘈杂的 wrapper
   - 保留的 clause 模板
   - 零样本三元组

2. **ClauseCompose 解码器**: 仅在 singleton intents 上训练的轻量级解码器，通过 clause 因子分解实现组合

3. **基线对比**: ClauseCompose vs WholeMultiLabel vs Fine-tuned Tiny BERT

---

## 核心问题

**现有基准的弱点**: 多意图检测论文通常只问模型能否从一个话语中恢复多个意图。但更困难且更有用的是：能否恢复**已知意图的新组合**？现有基准因为训练和测试共享相同的粗粒度共现模式，测试不够充分。

---

## CoMIX-Shift 评估结果

| 任务 | ClauseCompose | WholeMultiLabel | BERT |
|------|---------------|------------------|------|
| Unseen Intent Pairs | 95.7 | 81.4 | 91.5 |
| Discourse-shifted Pairs | 93.9 | 55.7 | 77.6 |
| Longer/Noisier Pairs | 62.5 | 18.8 | 48.9 |
| Held-out Templates | 49.8 | 15.5 | 11.0 |
| Unseen Triples | 91.1 | 0.0 | 0.0 |

---

## 关键洞察

1. **简单的因子分解效果出乎意料地好**：一旦评估要求组合泛化，简单的 clause 因子分解就能带来很好的效果

2. **组合评估的必要性**：多意图检测需要更严格的组合评估

3. **零样本三元组完全失败**：WholeMultiLabel 和 BERT 在零样本三元组上均为 0.0

---

## SNIPS 风格人工组合集 (240 examples)

- ClauseCompose: **97.5%** (unseen pairs), **86.7%** (connector shift)
- WholeMultiLabel: 41.3% (unseen pairs), 10.4% (connector shift)

---

## 局限性

- 仅在英语上验证
- Clause 边界检测仍有挑战

---

## 建议

- **推荐程度**: ⭐⭐⭐⭐ (值得关注)
- **适用场景**: 多意图检测、对话理解、意图识别、组合泛化
- **相关方向**: 对话系统、自然语言理解、组合泛化、意图检测

---

*ClauseCompose 以极简的方式解决了多意图检测的组合泛化问题，揭示了现有评估的不足。*
