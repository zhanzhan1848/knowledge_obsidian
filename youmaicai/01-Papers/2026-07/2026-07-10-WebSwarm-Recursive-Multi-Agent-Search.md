# WebSwarm: Recursive Multi-Agent Orchestration for Deep-and-Wide Web Search

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Recursive Multi-Agent Orchestration for Deep-and-Wide Web Search |
| **arXiv** | arXiv:2607.08662 [cs.CL] |
| **链接** | https://arxiv.org/abs/2607.08662 |
| **作者** | Xiaoshuai Song, Liancheng Zhang, Kangzhi Zhao, Yutao Zhu, Zhongyuan Wang, Guanting Dong, Jinghan Yang, Han Li, Kun Gai, Ji-Rong Wen, Zhicheng Dou (人大) |
| **日期** | 2026-07-10 |

## 核心贡献

1. 提出 **WebSwarm**：progressive recursive delegation framework，解决单 ReAct 智能体在深度+广度搜索上的根本局限
2. 核心机制：**动态实例化 agentic search nodes**，每个 node 耦合 local objective + search mode
3. 每个 node 可自己解决或委托 child nodes；解决后返回 evidence 供父节点扩展/修订/聚合

## 问题背景

单 ReAct 智能体的局限：
- 单一长轨迹（one long trajectory）
- 有限上下文（limited context）
- 难以同时兼顾 depth（深度）和 coverage（广度）

## 方法：WebSwarm

### 架构

```
Root Node (任务分解)
├── Child Node A (深度搜索)
│   ├── GrandChild A1
│   └── GrandChild A2
├── Child Node B (广度搜索)
└── Synthesis Node (聚合)
```

### 关键技术

1. **Task Decomposition + Recursive Expansion + Agent Collaboration 联合**
2. **Search Mode Specification**：每个 node 指定如何组织搜索和协作
3. **Web Probing**：先探测任务相关信息在 web 上的组织结构，再指导 node 扩展
4. **Process-level Evidence Reuse**：减少冗余搜索

## 相关工作

- [[2607.08768]] - UniClawBench（多智能体评估）
- [[2607.08716]] - Proactive Memory Agent（长程任务记忆）

---

*🥬 LLM 论文分析 | 来源: arXiv:2607.08662 | 2026-07-10*
