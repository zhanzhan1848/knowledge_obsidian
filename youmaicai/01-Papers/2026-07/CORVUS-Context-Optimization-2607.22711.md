---
type: paper
created: 2026-07-28
updated: 2026-07-28
tags: [llm-coding-agent, context-optimization, trajectory-management, efficiency]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2607.22711
---

# CORVUS: Context Optimization and Reduction Via Underlying Synchronization for LLM Coding Agents

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | CORVUS: Context Optimization and Reduction Via Underlying Synchronization for LLM Coding Agents |
| **作者** | Mingwei Zheng, David OBrien, Siwei Cui, Pardis Pashakhanloo, Rajdeep Mukherjee, Myeongsoo Kim, Sachit Kuhar |
| **发表** | arXiv 2026-07-20 |
| **链接** | [原文](https://arxiv.org/abs/2607.22711) |
| **arXiv** | arXiv:2607.22711 |

---

## 核心贡献

> 新型轨迹架构通过文件读操作与观测的解耦，消除冗余文件复制和过时快照

1. **同步注册表**: 维护相关文件的同步注册表，注入当前内容而非历史快照
2. **轻量级轨迹**: 结构上更轻的轨迹与实际代码库状态保持同步
3. **效率提升**: 9-50% 输入 token 减少，15-32% 更短最终提示，最多 37% 更少推理周期

---

## 技术方案

### 传统架构问题

传统 append-only 轨迹架构将文件读操作与其观测紧密耦合：
- 文件通过 Agent 编辑或并发人类修改更改后，快照永久固定在历史中
- Agent 冗余重新读取文件，每次重新读取又追加另一份副本

### CORVUS 解决方案

| 组件 | 说明 |
|------|------|
| Synchronized Registry | 维护相关文件的注册表 |
| Current Content Injection | 每个推理周期仅注入当前内容 |
| Decoupled File Reads | 文件读操作与观测解耦 |

### 性能提升

| 指标 | 改进 |
|------|------|
| 平均输入 tokens | 减少 9-50% |
| 最终提示长度 | 减少 15-32% |
| 推理周期 | 减少最多 37% |
| 通过率 | 保持相当 |

---

## 实验结论

- **数据集**: SWE-POLYBENCH_VERIFIED, SWE-BENCH PRO
- **模型**: 4 种 LLM
- **结果**: 在保持相当通过率的同时显著减少 context 使用

---

## 局限性

- 需要额外的同步机制
- 对极快修改的文件可能存在一致性问题

---

## 实现建议

- **实现难度**: 中等
- **适用场景**: LLM Coding Agent 部署、代码编辑场景

---

## 相关工作

- [[LLM Coding Agent]]
- [[Context Window Optimization]]
- [[Trajectory Management]]
