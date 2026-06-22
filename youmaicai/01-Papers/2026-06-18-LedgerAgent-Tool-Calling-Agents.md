# LedgerAgent: Structured State for Policy-Adherent Tool-Calling Agents

## 元信息

| 属性 | 内容 |
|------|------|
| 标题 | LedgerAgent: Structured State for Policy-Adherent Tool-Calling Agents |
| 作者 | Md Nayem Uddin, Amir Saeidi, Eduardo Blanco, Chitta Baral |
| 链接 | [arXiv](https://arxiv.org/abs/2606.20529) |
| arXiv | arXiv:2606.20529 |
| 领域 | cs.AI, cs.CL |
| 发表 | 2026-06-18 |
| 备注 | Work in Progress |

## 核心贡献

1. **LedgerAgent 方法**：推理时（inference-time）方法，为工具调用 Agent 维护独立的结构化状态账本
2. **显式状态管理**：将观察结果、工具返回和策略指令从 prompt 中分离出来，避免 Agent 每次重新构建状态
3. **状态依赖策略检查**：在执行变更环境的工具调用前，用账本检查状态依赖的策略约束，阻止策略违规
4. **跨领域验证**：在四个客服领域 + 多种开源/闭源模型上验证

## 核心问题

### 标准 Agent 的两个失效模式
1. **Stale Information**：Agent 检索了正确事实，但后续决策基于过时/缺失/错误的信息
2. **Policy Violation**：语法有效的工具调用仍违反依赖于当前任务状态的领域策略

## 方法：LedgerAgent

### 状态账本（Ledger）
- 维护观察到的任务状态（事实、标识符、约束、条件）
- 将状态渲染到 prompt 中
- 在工具调用执行前检查状态依赖的策略约束

### 优势
- 状态显式表示，不依赖 Agent 从 prompt 隐式重建
- 支持策略前置检查，阻止违规调用

## 实验结果

- LedgerAgent 在 pass@k 指标上优于标准 prompt-based 工具调用方法
- 在更严格的多轮一致性指标下增益最大

## 关键词

#LLM-agent #tool-calling #reasoning #policy #state-management #inference-time
