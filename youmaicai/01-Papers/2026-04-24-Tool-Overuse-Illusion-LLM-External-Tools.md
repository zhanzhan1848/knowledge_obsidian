---
type: paper
created: 2026-04-24
updated: 2026-04-24
tags: [llm, tool-use, reasoning, agent]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2604.19749
---

# The Tool-Overuse Illusion: Why Does LLM Prefer External Tools over Internal Knowledge?

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | The Tool-Overuse Illusion: Why Does LLM Prefer External Tools over Internal Knowledge? |
| **作者** | Yirong Zeng, Shen You, Yufei Liu, Qunyao Du, Xiao Ding, Yutai Hou, Yuxian Wang, Wu Ning, Haonan Song, Dandan Tu, Bibo Cai, Ting Liu |
| **发表** | arXiv cs.AI 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.19749) |
| **arXiv** | arXiv:2604.19749 |
| **代码** | - |
| **领域** | cs.AI, cs.SE |

---

## 核心贡献

> 揭示 LLM 过度使用外部工具的现象及其两大根因：知识认知错觉 + 奖励信号失衡

1. **Tool-Overuse 现象揭示**：发现 LLM 普遍存在不必要的工具调用问题
2. **知识认知错觉 (Knowledge Epistemic Illusion)**：模型错误判断自身知识边界，无法准确感知知识可用性
3. **结果导向奖励的因果危害**：仅奖励最终正确性的 reward 结构无意中鼓励工具过度使用

---

## 技术方案

### 核心问题

LLM 配备外部工具（如搜索、代码执行）后，引入了一个关键但未被充分探索的问题：**工具过度使用 (tool overuse)**——模型在内部知识已足够时仍频繁调用工具。

### 两大根因分析

#### 1. 知识认知错觉 (Knowledge Epistemic Illusion)

通过分析不同内部知识可用性区域下的工具使用行为，发现：
- 模型误判内部知识边界
- 无法准确感知自身知识可用性

**解决方案：Knowledge-aware Epistemic Boundary Alignment**
- 基于直接偏好优化 (DPO)
- 减少 82.8% 的工具使用，同时提升准确率

#### 2. 奖励结构导致工具过度使用

- **Outcome-only rewards**：只奖励最终正确性，不考虑工具效率
- 可视化工具增强训练过程后，建立了奖励结构与工具使用行为之间的因果链接

**解决方案：平衡奖励信号**
- 训练时同时考虑质量 + 效率奖励
- 在 7B 模型上减少 66.7% 的不必要工具调用
- 在 32B 模型上减少 60.7% 的不必要工具调用
- 均未牺牲准确率

---

## 实验结论

- **减少工具使用**: 7B: -66.7%, 32B: -60.7% (不牺牲准确率)
- **知识感知对齐**: DPO 策略减少 82.8% 工具使用 + 准确率提升
- **泛化性**: 现象在多种 LLM 中普遍存在

---

## 局限性

- 仍需人工定义知识边界
- 对不同任务域的泛化性需进一步验证
- 效率奖励的权衡系数需调优

---

## 相关工作

- [[Toolformer]]
- [[LLM Reasoning]]
- [[Direct Preference Optimization]]

---

## 实现建议

- **实现难度**: 中
- **适用场景**: Tool-augmented LLM 系统、Agent 系统
- **核心思想可迁移**: 知识边界感知 + 效率奖励平衡
