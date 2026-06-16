# PrologMCP: A Standardized Prolog Tool Interface for LLM Agents

## 元信息
| 标题 | PrologMCP: A Standardized Prolog Tool Interface for LLM Agents |
|------|-----|
| 作者 | Agnieszka Mensfelt, Adarsh Prabhakaran, Adrian Haret, Vince Trencsenyi, Kostas Stathis |
| 链接 | [原文](https://arxiv.org/abs/2606.14935) |
| arXiv | arXiv:2606.14935 |
| 领域 | cs.AI |

## 核心贡献
1. 提出 **PrologMCP**：首个任务无关、开源的 Prolog 工具服务器，通过 **Model Context Protocol (MCP)** 暴露给 LLM Agent
2. 提供紧凑的工具接口、结构化错误报告和会话级隔离
3. 将 LLM 的自然语言推理与 Prolog 的符号推理结合，形成可检查的翻译-运行-检查-修复循环

## 核心问题
- 前沿推理模型在深度演绎任务上仍然失败
- 通过延长内部推理来提升性能的成本 scaling 很差
- 符号委托是互补方案：将问题翻译给求解器执行推理

## 方法
### PrologMCP 架构
- 通过 MCP 协议暴露 Prolog 作为有状态工具
- Agent 循环：自然语言问题 → **自动形式化**为 Prolog → Prolog 求解 → 检查结果 → 修复重试

### 关键特性
| 特性 | 说明 |
|------|------|
| 紧凑工具接口 | Prolog predicate 暴露为 MCP 工具 |
| 结构化错误报告 | 包含求解器状态和错误类型 |
| 会话级隔离 | 每个 Agent 会话独立 Prolog 状态 |

## 实验结果
### PARARULE-Plus 基准
**General sample**:
- Formalizer + PrologMCP: **1.00** 准确率
- Reasoning LLMs: Claude Sonnet 4.6 / GPT-4.1 / o4-mini ≈ **1.00 / 0.998 / 1.00**
- Standard models (GPT-4.1): **0.762** (formalizer 大幅超越)

**Challenging subset**（针对自然语言推理特定失败模式）:
- Formalizer + PrologMCP: **1.00 / 0.99**
- Reasoning LLMs: **0.95 / 0.94**
- Standard models 差距更大

## 结论
- 将推理委托给 Prolog via MCP 是延长自然语言推理的**鲁棒且可检查**的替代方案
- 不需要针对特定任务定制的形式化流程
- 在 MCP-capable Agent 中可作为可复用原语

## 关键词
`Prolog` `Model Context Protocol` `MCP` `Symbolic Reasoning` `Autoformalization` `LLM Agents` `Deductive Reasoning`
