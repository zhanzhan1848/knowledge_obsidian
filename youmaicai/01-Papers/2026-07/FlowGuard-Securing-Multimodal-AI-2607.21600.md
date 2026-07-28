---
type: paper
created: 2026-07-28
updated: 2026-07-28
tags: [multimodal-llm, security, adversarial-attack, information-decomposition]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2607.21600
---

# FlowGuard: Securing Multimodal AI through Internal Information Decomposition

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | FlowGuard: Securing Multimodal AI through Internal Information Decomposition |
| **作者** | Jehyeok Yeon, Hyeonjeong Ha, Qiusi Zhan, Heng Ji |
| **发表** | ICML 2026 Spotlight |
| **链接** | [原文](https://arxiv.org/abs/2607.21600) |
| **arXiv** | arXiv:2607.21600 |
| **DOI** | 10.48550/arXiv.2607.21600 |

---

## 核心贡献

> 利用跨模态一致性检测多模态 LLM 的对抗性输入

1. **关键洞察**: 良性输入诱导文本和视觉单独推理时产生兼容的预测行为，融合时稳定；而对抗操纵破坏这种一致性
2. **FlowVectors**: 灵感来自部分信息分解 (Partial Information Decomposition)，量化跨模态冗余、协同和模态特定主导
3. **单类分类**: 仅在良性数据上训练，即可检测未见过的攻击

---

## 技术方案

### 核心思想

现有防御检查原始输入或输出，忽视了内部融合过程。FlowGuard 通过监控内部多模态一致性来检测有害输入。

### FlowVectors

FlowVectors 捕捉融合的多模态预测是否与单模态语义证据保持一致：
- **Redundancy (冗余)**: 跨模态共享信息
- **Synergy (协同)**: 仅在融合时出现的信息
- **Modality-specific dominance (模态主导)**: 某一模态主导预测

### 防御效果

| 指标 | 结果 |
|------|------|
| Attack Success Rate | 从 >90% 降至 <15% |
| Utility Loss | <3% |
| Latency Reduction | 最高 6 倍 |

---

## 实验结论

- **数据集**: 多模态安全评估基准
- **结果**: 
  - 在单类分类问题（仅训练良性数据）上表现优异
  - 7/7 prompt injection 评估全部获胜
  - 18 个基准中 11 个获胜

---

## 局限性

- 需要针对特定模态组合进行适配
- 对复杂对抗策略可能存在局限

---

## 实现建议

- **实现难度**: 中等
- **适用场景**: 多模态 AI 部署安全、内容审核、金融服务

---

## 相关工作

- [[Multimodal LLM Security]]
- [[Adversarial Attack Defense]]
- [[Cross-Modal Consistency]]
