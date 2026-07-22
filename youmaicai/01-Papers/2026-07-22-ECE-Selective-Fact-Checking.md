---
type: paper
created: 2026-07-22
updated: 2026-07-22
tags: [llm, fact-checking, selective-prediction, evidence, calibration]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2607.18240
---

# Calibrated Selective Fact-Checking via Evidence Chain Evaluation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Calibrated Selective Fact-Checking via Evidence Chain Evaluation |
| **作者** | Dekun Yang |
| **发表** | arXiv cs.AI (2026) |
| **链接** | [原文](https://arxiv.org/abs/2607.18240) |
| **DOI** | 10.48550/arXiv.2607.18240 |
| **代码** | https://github.com/cheshireyang/ECE |

---

## 核心贡献

> 提出 **Evidence Chain Evaluation (ECE)**，选择性 fact-checking 框架，通过 uncertain verdict 允许 abstention，而非强制二值判断。91.6% 标准准确率，97.8% 选择性准确率（answered claims）。

1. **Selective Fact-Checking**：允许 uncertain verdict 放弃判断，而非强制 true/false
2. **Tool-using Verification Agent**：通过 Web 搜索、学术搜索、可执行检查收集证据
3. **ECE-Bench**：91.6% 标准准确率、93.7% 覆盖率、97.8% 选择性准确率
4. Abstention 作为安全机制处理认知弱证据：5/6 延迟案例集中在 source level L4

---

## 技术方案

### 核心思想

传统 fact-checking 强制二值判断，但证据可能弱、稀疏或内部不一致。ECE 允许模型说"不确定"。

### 关键指标

| 指标 | 值 |
|------|------|
| 标准准确率 | 91.6% |
| 覆盖率 | 93.7% |
| 选择性准确率（answered） | 97.8% |
| 延迟案例 | 6/95 |

---

## 实验结论

- **数据集**: ECE-Bench (95 cases)
- **延迟分布**: 5/6 集中在 source level L4（低可靠性证据）
- **结论**: Abstention 作为安全机制有效

---

## 局限性

- ECE 在 ECE、Brier score、AURC 上未超越最强 retrieval 基线
- 延迟案例判断标准可进一步优化

---

## 实现建议

- **实现难度**: 中（需要多源验证工具集成）
- **预期性能**: 高选择准确率，低召回
- **适用场景**: 高风险 fact-checking 场景
