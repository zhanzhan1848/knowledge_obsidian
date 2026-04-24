---
type: paper
created: 2026-04-24
updated: 2026-04-24
tags: [llm, reasoning, early-stopping, inference-efficiency, token-reduction]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2604.21057
---

# TRACES: Tagging Reasoning Steps for Adaptive Cost-Efficient Early-Stopping

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | TRACES: Tagging Reasoning Steps for Adaptive Cost-Efficient Early-Stopping |
| **作者** | Yannis Belkhiter, Seshu Tirupathi, Giulio Zizzo, John D. Kelleher |
| **发表** | arXiv cs.CL 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.21057) |
| **arXiv** | arXiv:2604.21057 |
| **代码** | - |
| **领域** | cs.CL |

---

## 核心贡献

> 提出 TRACES 框架，实时标记推理步骤类型，实现 LLM 推理的自适应早停，节省 20-50% token 而不损失准确率

1. **推理步骤实时标记**：轻量级框架，无需额外训练
2. **早停策略**：LRM 在得出正确答案后行为会改变
3. **20-50% token 减少**：MATH500、GSM8K、AIME、MMLU、GPQA 保持准确率

---

## 技术方案

### 核心发现

LRM（语言推理模型）在达到正确答案后会改变推理行为模式：
- 验证/反思步骤过度生成
- 不同步骤类型对正确答案的贡献尚未被充分探索

### TRACES 框架

- 实时标记推理步骤类型
- 监控推理过程中的行为变化
- 生成可解释的早停标准

### 实验结果

| 基准 | Token 减少 | 准确率保持 |
|------|-----------|-----------|
| MATH500 | 20-50% | ✓ |
| GSM8K | 20-50% | ✓ |
| AIME | 20-50% | ✓ |
| MMLU | 20-50% | ✓ |
| GPQA | 20-50% | ✓ |

---

## 局限性

- 需要识别推理步骤类型的先验知识
- 对不同模型泛化性需验证
- 早停阈值的自适应调整

---

## 相关工作

- [[LLM Reasoning]]
- [[Inference Efficiency]]
- [[Chain-of-Thought]]

---

## 实现建议

- **实现难度**: 中
- **适用场景**: 推理加速、成本优化、生产部署
- **核心洞察**: 推理行为监控是早停的有效信号
