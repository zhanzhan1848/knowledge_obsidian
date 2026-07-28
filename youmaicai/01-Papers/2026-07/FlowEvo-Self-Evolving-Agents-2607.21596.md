---
type: paper
created: 2026-07-28
updated: 2026-07-28
tags: [llm-agent, skill-compilation, workflow, self-evolution]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2607.21596
---

# FlowEvo: Self-Evolving Agents through the Co-Evolution of Workflows and Executable Skills

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | FlowEvo: Self-Evolving Agents through the Co-Evolution of Workflows and Executable Skills |
| **作者** | Zeyu Ren, Ling Yue, Ran Li, Yishu Wang, Shengxiang Xu, Hanmo Liu, Shaowu Pan, Shimin Di |
| **发表** | arXiv 2026-07-18 |
| **链接** | [原文](https://arxiv.org/abs/2607.21596) |
| **arXiv** | arXiv:2607.21596 |
| **代码** | [GitHub](https://github.com/DEFENSE-SEU/FlowEvo) |

---

## 核心贡献

> LLM Agent 通过工作流-技能共演化实现无需参数更新的自进化

1. **工作流到技能编译 (Workflow-to-Skill Compilation)**: 从成功轨迹中提取可重用的可执行技能记录
2. **技能到工作流反馈 (Skill-to-Workflow Feedback)**: 通过直接执行或结构化上下文注入检索积累的技能
3. **技能策展 (Skill Curation)**: 监控下游效用并抑制导致负迁移的技能

---

## 技术方案

### 核心思想

FlowEvo 是一个无需训练的框架，将成功轨迹编译成可重用的技能记录。每个技能记录将可调用对象与辅助结构化指导配对，入库时应用接口检查、回放检查和安全检查。技能记录在推理时持久化在技能库中。

### 三大机制

| 机制 | 说明 |
|------|------|
| Workflow-to-Skill Compilation | 从成功轨迹中提取可重用的可执行对象 |
| Skill-to-Workflow Feedback | 通过直接执行或上下文注入支持未来问题解决 |
| Skill Curation | 监控下游效用，抑制负迁移技能 |

### 工作流-技能-工作流反馈循环

```
成功轨迹 → 技能编译 → 技能库 → 技能检索 → 新任务解决
                ↑                          ↓
                ←─────── 技能策展 ←────────┘
```

---

## 实验结论

- **数据集**: ALFWorld, HumanEval, GSM8K
- **基线**: 多种 Agent 基线方法
- **结果**:
  - ALFWorld: 82.8% 成功率，比最强基线高 23.6 个百分点
  - 每个 episode 平均 token 使用量不到最高效基线的一半
  - 消融实验确认每个机制都贡献了整体结果

---

## 局限性

- 技能库需要持续管理以避免膨胀
- 安全检查可能无法覆盖所有边界情况

---

## 实现建议

- **实现难度**: 中等
- **适用场景**: 需要长期运行的多任务 Agent 系统、代码生成、数学推理

---

## 相关工作

- [[LLM Agent]]
- [[Skill Library]]
- [[Self-Evolving Systems]]
