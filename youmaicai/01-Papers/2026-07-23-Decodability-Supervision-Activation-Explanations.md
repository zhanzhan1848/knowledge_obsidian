---
type: paper
created: 2026-07-23
updated: 2026-07-23
tags: [LLM, interpretability, activation-steering, faithfulness, AI-safety]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2607.20379
---

# Train the Model, Not the Reader: Decodability Supervision for Verifiable Activation Explanations

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Train the Model, Not the Reader: Decodability Supervision for Verifiable Activation Explanations |
| **作者** | Hiskias Dingeto Dr |
| **发表** | arXiv 2026-07-22 |
| **链接** | [原文](https://arxiv.org/abs/2607.20379) |
| **DOI** | 10.48550/arXiv.2607.20379 |
| **代码** | 待发布 |

---

## 核心贡献

> 揭示自然语言自编码器激活解释测试的结构性缺陷（无法惩罚独立错误陈述），提出 RECAP 方法使模型内部内容可被独立探针验证

1. **诊断两类不忠实通过方式**：模型通过 co-adapted private codes（重建依赖的错误措辞）绕过重建测试
2. **两个审计协议**：grounded-vs-true cross 和 evaluator swap，用于检测重建测试的虚假通过
3. **RECAP**：可读编码通过共训练辅助预测器，使用线性 head 与目标模型共同训练，保持指定内容可解码
4. **对抗鲁棒性**：对抗者编辑解释以最大化重建分数同时撒谎（抑制 ~87% 的撒谎惩罚），RECAP 探针仍能检测（AUC 0.95 vs 对照 0.51）

---

## 技术方案

### 问题背景

现有自然语言自编码器测试激活解释的忠实性：解释被判定忠实当且仅当激活可从中重建。但该测试对独立错误陈述结构上不敏感——翻转一个具体错误声称不改变重建分数，该声称永远不受惩罚。

### 核心方法：RECAP

| 组件 | 说明 |
|------|------|
| 线性探针 | 与目标模型共同训练的线性 head，保持指定内容可解码 |
| 共训练 | 辅助预测器与目标模型同时训练 |
| 独立验证 | 探针独立评分 verbalizer 的真实陈述 vs 虚假陈述 |

### 关键指标

- **RECAP 探针 AUC (对抗场景)**: 0.95
- **对照探针 AUC (对抗场景)**: 0.51
- **真实内容可解码性**: 0.44-0.46（对照接近 0）

---

## 实验结论

- 高重建分数不能保证个别陈述的忠实性
- RECAP 使指定内部内容可被独立探针检查，而非依赖模型自己生成的文本
- 对抗场景下仍可靠检测撒谎行为

---

## 局限性

- 仅在 sandbox 模型上验证
- 需要额外训练线性 head

---

## 实现建议

- **实现难度**: 中（需共训练探针）
- **预期性能**: 可靠的激活解释验证
- **适用场景**: AI 可解释性、安全性审计、模型行为验证
