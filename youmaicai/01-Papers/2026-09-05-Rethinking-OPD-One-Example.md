---
type: paper
created: 2026-09-05
updated: 2026-09-05
tags: [paper, llm-distillation, on-policy-distillation, training-dynamics]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2609.04172
---

# Rethinking On-Policy Distillation of Large Language Models II: One Training Example

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Rethinking On-Policy Distillation of Large Language Models II: One Training Example |
| **作者** | Zixuan Fu, Bingxiang He, Yuxin Zuo et al. (13人) |
| **发表** | arXiv |
| **链接** | [原文](https://arxiv.org/abs/2609.04172) |
| **arXiv** | arXiv:2609.04172 |

---

## 核心贡献

1. **One-shot OPD 极限测试**：仅用1个query训练，OPD 仍能持续改进数百步并恢复大部分 full-data OPD 效果
2. **State Coverage 理论**：单一 query 已达 71.5% 状态覆盖，16 个语义多样化 query 达 98.9%
3. **OPD 本质诊断**：是 **data-overfed but algorithm-starved**——rollouts 快速暴露广泛监督，但学生吸收速度越来越慢

---

## 关键发现

### State Coverage 分析

- 单 query 覆盖 full-data OPD 71.5% 的状态，大多数在前100步就覆盖
- 16 个语义多样化 query → 98.9% 状态覆盖 → 匹配 full-data 训练
- 内容轻量模板和 off-domain WildChat 查询也接近 real-query baseline

### Alignment 速度

- 即使固定状态集，OPD 仍需数百步才能吸收
- 结论：训练数据不是瓶颈，**step efficiency** 才是

---

## Multi-teacher OPD 扩展

- 16 个语义多样化 query / domain → 匹配 full-data MOPD
- **内容与诱导状态覆盖可以分离**

---

## 意义

- 促使未来工作关注 OPD 的 step efficiency
- 重新审视 OPD 近期成功背后的数据和机制

---

## 建议

- **是否推荐阅读**：是（理论深度高，对理解 LLM 蒸馏有重要意义）
- **适用场景**：LLM 蒸馏、Post-training 效率优化

---

*🥬 youmaicai | 2026-09-05*
