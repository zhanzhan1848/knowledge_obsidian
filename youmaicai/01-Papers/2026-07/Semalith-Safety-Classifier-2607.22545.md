---
type: paper
created: 2026-07-28
updated: 2026-07-28
tags: [safety-classifier, prompt-injection, guardrail, deberta, llm-security]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2607.22545
---

# Semalith v1.4: A Calibrated 184M Safety Classifier Achieving State-of-the-Art Prompt-Injection Detection at 44x Fewer Parameters than Llama-Guard-3-8B

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Semalith v1.4: A Calibrated 184M Safety Classifier |
| **作者** | Tejasvi C. Addagada |
| **发表** | arXiv 2026-05-06 |
| **链接** | [原文](https://arxiv.org/abs/2607.22545) |
| **arXiv** | arXiv:2607.22545 |

---

## 核心贡献

> 184M 参数 DeBERTa-v3-base 分类器在单次前向传播中完成三重安全分类，prompt injection 检测全面超越 Llama-Guard-3-8B

1. **三轴安全分类**: 单次前向传播同时处理 prompt injection、通用危害和金融服务合规
2. **22 类分类头**: BENIGN、9 个 prompt injection 子类、通用危害、11 个 BFSI 标签
3. **零污染评估**: 76,204 行语料库，21/22 基准零污染

---

## 技术方案

### 模型架构

| 组件 | 说明 |
|------|------|
| Backbone | DeBERTa-v3-base (184M) |
| 主分类头 | 22 类 |
| 辅助分类头 | 4 类超类 |
| 训练策略 | 联合加权损失 |

### 分类类别

- **BENIGN**: 良性
- **Prompt Injection 子类**: 9 种
- **General Harm**: 通用危害
- **BFSI Labels**: 11 个金融服务合规标签

### 性能对比 (vs Llama-Guard-3-8B)

| 指标 | Semalith v1.4 | Llama-Guard-3-8B |
|------|---------------|------------------|
| Prompt Injection (7/7) | 全胜 | - |
| 总体基准 (18/22) | 11 胜 | - |
| 参数量 | 184M | 8B |
| 参数量节省 | 44x | - |
| FPR (208 良性 agentic prompts) | 0.000 | 0.063 |

---

## 实验结论

- **数据集**: 49 个公共来源，76,204 行语料库
- **基准**: 22 个 held-out 评估集
- **结果**:
  - 所有 prompt injection 评估获胜
  - 22 个基准中 11 个总体获胜
  - 44 倍更少的参数量

---

## 局限性

- 通用危害基准上弱于 Llama-Guard-3
- v1.3 推荐用于对话式审核部署

---

## 实现建议

- **实现难度**: 低（直接部署）
- **适用场景**: 金融服务和 Agentic 设置的安全分类器

---

## 相关工作

- [[Prompt Injection]]
- [[LLM Guardrails]]
- [[Safety Classification]]
