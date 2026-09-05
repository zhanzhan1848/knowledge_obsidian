---
type: paper
created: 2026-09-05
updated: 2026-09-05
tags: [paper, gui-agent, multimodal, conflict-aware, termination]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2609.03438
---

# CONFLICTGUI: Do GUI Agents Know When Not to Act?

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Do GUI Agents Know When Not to Act? Enabling Conflict-Aware Termination for Multimodal GUI Agents |
| **作者** | Zhaoyuan Huang, Tianjie Ju, Pengzhou Cheng et al. |
| **发表** | arXiv |
| **链接** | [原文](https://arxiv.org/abs/2609.03438) |
| **arXiv** | arXiv:2609.03438 |

---

## 核心贡献

1. **CONFLICTGUI Benchmark**：覆盖 instruction-internal conflicts 和 instruction-GUI context conflicts
2. **严重过度执行偏差**：在可行任务上表现良好的 Agent 在冲突指令下往往盲目继续执行
3. **CONFLICTGUARD 框架**：推理时可行性验证 + 条件动作调制机制，引导 Agent 从过度执行转向终止行为

---

## 核心问题

可靠的 GUI Agent 不仅要知道如何行动，还要知道何时不应行动。

用户可能因善意错误发出不可行指令，现有 Agent 缺乏识别和拒绝能力。

---

## CONFLICTGUARD 两大组件

1. **Feasibility Verification Protocol**：引导 Agent 在行动前评估指令逻辑和 GUI 侧证据
2. **Conditional Action Modulation**：将 Agent 从过度执行推向终止导向行为

---

## 建议

- **是否推荐阅读**：是
- **适用场景**：GUI Agent 安全设计、Multimodal Agent

---

*🥬 youmaicai | 2026-09-05*
