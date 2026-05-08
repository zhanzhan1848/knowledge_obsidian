# LCM: Lossless Context Management

## 元信息
| 标题 | LCM: Lossless Context Management |
|------|------|
| 作者 | Clint Ehrlich, Theodore Blackman |
| 链接 | [原文](https://arxiv.org/abs/2605.04050) |
| arXiv | arXiv:2605.04050 |
| 领域 | LLM Memory, Agent Architecture |

## 核心贡献

1. **Lossless Context Management (LCM)**: 提出确定性 LLM 记忆架构，在长上下文任务上超越 Claude Code
2. **Recursive Context Compression**: 层次化摘要 DAG 自动压缩旧消息，保留指向所有原始消息的无损指针
3. **Recursive Task Partitioning**: 引擎管理的并行原语（如 LLM-Map）替代模型编写的循环
4. **Volt 编码智能体**: LCM 增强的智能体，在 OOLONG 长上下文评估中，32K-1M token 范围内均超越 Claude Code

## 模型架构

**核心思想**: 将符号递归分解为两个确定性、引擎管理的机制，类比从 GOTO 到结构化控制流的演进。

- **递归上下文压缩**: 层级摘要 DAG，自动压缩旧消息，保留无损指针
- **递归任务分区**: 引擎管理并行原语替代模型循环 → 终止保证、零成本短任务连续性、全历史无损检索

**与 RLM 的区别**: RLM 由模型控制递归；LCM 由引擎控制，牺牲最大灵活性换取确定性终止保证。

## 实验结果

- OOLONG long-context eval: LCM-augmented Volt 在 32K-1M token 所有长度均超越 Claude Code
- Opus 4.6 作为 backbone

## 局限性

- 架构依赖引擎管理，灵活性受限
- 仅验证编码任务（Volt），泛化性待考察

## 关键词
`LLM Memory` `Context Management` `Recursive Language Models` `Coding Agent` `Long Context`

## 日期
2026-05-08