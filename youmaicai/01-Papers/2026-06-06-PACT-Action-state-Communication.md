# PACT: Protocolized Action-state Communication for Efficient Multi-Agent Systems

## 元信息
| 标题 | What Should Agents Say? Action-state Communication for Efficient Multi-Agent Systems |
|------|------|
| 作者 | Chen Huang, Yuhao Wu, Wenxuan Zhang |
| 链接 | [原文](https://arxiv.org/abs/2606.05304) |
| arXiv | arXiv:2606.05304 |
| 代码 | [GitHub](https://github.com/iNLP-Lab/PACT) |
| 领域 | cs.AI |
| 发表 | 2026-06-03 |

## 核心贡献

1. **分析 5 种 Agent 间通信策略**：跨两个 MAS 拓扑分析，发现没有固定策略是普遍最优的
2. **提出 PACT 框架** (Protocolized Action-state Communication and Transmission)：将 Agent 间通信视为公共状态更新问题，将原始 Agent 输出投影为紧凑的 action-state record 再进入共享历史
3. **显著降低 token 消耗**：在 OpenHands 上提升 resolve rate 且 token 减少 10%；在 SWE-agent 上保持 resolve-neutral 同时将输入 token 减半

## 核心创新

### PACT 核心思想
有效的 Agent 间消息始终保留下游 Agent 所需的对中心信息 (action-centered information)。

### 三组件框架
1. **Gate**: 选择哪些信息需要传递
2. **Router**: 将信息路由到正确的下游 Agent
3. **Critic**: 评估信息的重要性

### 形式化
将 Agent 输出投影为紧凑的 action-state record：
```
action-state-record = {action_type, state_update, dependencies, metadata}
```

## 实验结果

| 系统 | 性能变化 | Token 变化 |
|------|----------|------------|
| OpenHands | +resolve rate | -10% tokens-per-resolved |
| SWE-agent | resolve-neutral | -50% input tokens |

## 核心发现

- 没有固定通信策略是普遍最优的
- 有效的 Agent 间消息始终 preserve action-centered information
- PACT 在不同 MAS 拓扑上一致提升性能-成本权衡

## 相关工作

- Multi-Agent Systems (MAS)
- LLM-based agents
- Agent communication protocols
- Token efficiency in LLM inference

## URL
- 原文: https://arxiv.org/abs/2606.05304
- GitHub: https://github.com/iNLP-Lab/PACT