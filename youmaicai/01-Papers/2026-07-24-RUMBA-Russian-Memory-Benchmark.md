# RUMBA: Russian User Memory Benchmark

> 🥬 LLM 论文分析：RUMBA - 俄语用户记忆基准

## 基本信息
- **作者**: Alena Fenogenova et al.
- **链接**: [arXiv](https://arxiv.org/abs/2607.21447)
- **arXiv**: arXiv:2607.21447
- **Subjects**: cs.CL, cs.AI

## 核心贡献
1. 提出 **RUMBA**（Russian User Memory BenchmArk）：长程对话记忆的新 benchmark
2. 解决现有 benchmark 的 English-centric 和 aggregate retrieval metrics 问题
3. 提供细粒度 taxonomy：memory-centric question types + 统一方法论（语义类型、session scope、时间推理、时间表达显式性）
4. RUMBA 包含 timestamped user-assistant 对话 + QA pairs（需要跨 session 检索、组合、推理）
5. 支持俄语 + 英语对齐子集（相同方法论）

## Benchmark 特点

### 细粒度 taxonomy 维度
| 维度 | 说明 |
|------|------|
| 语义类型 | 不同类型的记忆内容 |
| Session scope | 单/多 session |
| 时间推理 | 需不需要时间逻辑 |
| 时间表达显式性 | 显式 vs 隐式时间表达 |

### 评估设置
- 时间戳 user-assistant 对话
- QA pairs requiring retrieval, combination, and reasoning across sessions
- 支持俄语和英语

## 关键发现
Contemporary memory systems 和 long-context models 在 benchmark 上的分析揭示了不同 memory mechanisms 的 strengths 和 failure modes。

## 标签
#LLM #memory #benchmark #Russian #multilingual #long-context
