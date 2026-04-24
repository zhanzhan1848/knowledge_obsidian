---
type: paper
created: 2026-04-24
updated: 2026-04-24
tags: [llm, privacy, reinforcement-learning, grpo, contextual-integrity]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2604.20904
---

# Reinforcing Privacy Reasoning in LLMs via Normative Simlacra from Fiction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Reinforcing Privacy Reasoning in LLMs via Normative Simlacra from Fiction |
| **作者** | Matt Franchi, Madiha Zahrah Choksi, Harold Triedman, Helen Nissenbaum |
| **发表** | arXiv cs.LG 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.20904) |
| **arXiv** | arXiv:2604.20904 |
| **代码** | - |
| **领域** | cs.LG, cs.AI |

---

## 核心贡献

> 从小说中提取规范性模拟（normative simulacra），结合 SFT + GRPO 训练 LLM 隐私推理能力

1. **规范性模拟**：从小说提取规范和信息流的结构化表示
2. **SFT + GRPO 组合**：监督学习 + 强化学习双重训练
3. **跨域迁移**： Fiction 学到的隐私推理可迁移到真实领域

---

## 技术方案

### 框架：Contextual Integrity (CI)

隐私 = 情境内信息流的适当性

### 训练方法

```
小说文本
    ↓ 提取
规范性模拟（规范 + 信息流）
    ↓ SFT + GRPO
隐私推理 LLM
```

### 复合奖励函数

- **程序化信号**：任务清晰度、结构完整性、内部一致性
- **LLM Judge**：评估隐私推理是否基于目标规范宇宙

### Per-completion 对比评分

- 正确规范宇宙 vs 随机错误宇宙
- 防止过拟合到源文本特定规范

### 实验结果

- SFT 引入保守先验，限制信息流
- GRPO + 规范 grounding 在法律合规基准上最高
- 与人群隐私期望最强相关

---

## 局限性

- 依赖高质量小说文本
- 规范提取的自动化程度
- 域泛化的边界条件

---

## 相关工作

- [[GRPO]]
- [[Privacy in LLMs]]
- [[Contextual Integrity]]

---

## 实现建议

- **适用场景**: 隐私敏感应用、Agent 合规
- **核心洞察**: 虚构文本是规范推理的优质训练数据
