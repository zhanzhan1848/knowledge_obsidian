---
type: paper
created: 2026-09-05
updated: 2026-09-05
tags: [paper, multi-agent, llm-agent, memory-consistency]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2609.03340
---

# Fresh Memory, Stale Plans: Dependency-Scoped Validation for Distributed LLM-Agent Memory

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Fresh Memory, Stale Plans: Dependency-Scoped Validation for Distributed LLM-Agent Memory |
| **作者** | Evan Chen, Shiqiang Wang, Christopher G. Brinton |
| **发表** | arXiv |
| **链接** | [原文](https://arxiv.org/abs/2609.03340) |
| **arXiv** | arXiv:2609.03340 |

---

## 核心贡献

1. **Stale-plan execution 问题定义**：多Agent团队中，读到最新共享事实 ≠ 行动计划仍然有效
2. **PlanFence 协议**：依赖范围动作验证协议，计划需引用所依赖的精确公开记录，执行者只验证影响外部行动的那部分记录
3. **30个受控工作流实验**：freshness-only executor 在每次任务中都执行了过时计划；PlanFence 完成所有任务且无无效行动

---

## 核心洞察

状态新鲜度 ≠ 计划有效性

举例：
- Planner 从 requirement r₃ 推导出 action
- 另一 Agent 提交了 r₄
- Executor 收到 r₄ 但未替换从 r₃ 导出的计划

---

## 建议

- **是否推荐阅读**：是
- **适用场景**：分布式多Agent系统设计、内存一致性

---

*🥬 youmaicai | 2026-09-05*
