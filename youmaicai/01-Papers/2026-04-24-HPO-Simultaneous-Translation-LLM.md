---
type: paper
created: 2026-04-24
updated: 2026-04-24
tags: [llm, simultaneous-translation, reinforcement-learning, kv-cache, policy-optimization]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2604.21045
---

# Hierarchical Policy Optimization for Simultaneous Translation of Unbounded Speech

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Hierarchical Policy Optimization for Simultaneous Translation of Unbounded Speech |
| **作者** | Siqi Ouyang, Shuoyang Ding, Oleksii Hrinchuk, Vitaly Lavrukhin, Brian Yan, Boris Ginsburg, Lei Li |
| **发表** | ACL 2026 Oral |
| **链接** | [原文](https://arxiv.org/abs/2604.21045) |
| **arXiv** | arXiv:2604.21045 |
| **代码** | [GitHub](https://github.com/owaski/HPO) |
| **领域** | cs.CL |

---

## 核心贡献

> 提出 HPO（层次策略优化），通过分层奖励平衡翻译质量与延迟，复用 KV-cache 降低计算开销

1. **分层奖励**：同时平衡翻译质量与延迟目标
2. **KV-cache 复用**：多轮对话形式避免冗余计算
3. **超越 +7 COMET / +1.25 MetricX**：1.5s 延迟下

---

## 技术方案

### 问题背景

同声传译 (SST) 在接收部分语音时生成翻译。LLM 可提升质量但计算开销大。

### HPO 方法

**核心创新**：后训练已有不完美 SFT 数据的模型

**分层奖励**：
- 质量奖励：翻译质量指标
- 延迟奖励：响应延迟惩罚

### 实验结果

- En→Zh/De/Ja：+7 COMET，+1.25 MetricX @ 1.5s 延迟
- KV-cache 复用显著降低计算开销

---

## 局限性

- 依赖对话形式 SFT 数据
- 对无界语音的边界检测
- 非英语方向效果待验证

---

## 相关工作

- [[Simultaneous Translation]]
- [[KV Cache]]
- [[Reinforcement Learning for NLP]]

---

## 实现建议

- **实现难度**: 中-高
- **适用场景**: 同声传译、实时翻译系统
- **核心洞察**: 分层奖励优于单一质量目标
