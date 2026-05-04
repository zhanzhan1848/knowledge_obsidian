# MemRouter: Memory-as-Embedding Routing for Long-Term Conversational Agents

## 基本信息
| 项目 | 内容 |
|------|------|
| 作者 | Tianyu Hu, Weikai Lin, et al. |
| 发表 | arXiv (2026-05-04) |
| 链接 | [原文](https://arxiv.org/abs/2605.00356) |
| arXiv | arXiv:2605.00356 |

## 核心贡献

### 问题
- 长期对话 agent 必须决定哪些 turn 存储在外部内存
- 近期系统依赖 autoregressive LLM generation 做决策（每 turn）

### 方法：MemRouter
- **Write-side memory router**：解耦 memory admission 与下游 answer backbone
- 用 **embedding-based routing policy** 替代每 turn memory-management decoding
- 编码每个 turn + recent context → frozen LLM backbone → 预测是否存储
- 仅训练 **12M 参数**的轻量分类头

## 实验结果
- LoCoMo benchmark（retrieval pipeline、answer prompts、QA backbone Qwen2.5-7B 相同）
- MemRouter 优于 LLM-based memory manager（所有 question category）
- Overall F1: **52.0 vs 45.6**（非重叠 95% CIs）
- Memory-management p50 latency: **970ms → 58ms**

## Ablations (Descriptive factorial averaging)
- Learned admission: +10.3 over random storage
- Category-specific prompting: +5.2 over generic prompt
- Retrieval: +0.7

## 建议
- **是否推荐使用**：是（长期对话系统）
- **适用场景**：Conversational AI、memory management、RAG

---

## 摘要

Long-term conversational agents must decide which turns to store in external memory, yet recent systems rely on autoregressive LLM generation at every turn to make that decision. We present MemRouter, a write-side memory router that decouples memory admission from the downstream answer backbone and replaces per-turn memory-management decoding with an embedding-based routing policy. MemRouter encodes each turn together with recent context, projects the resulting embeddings through a frozen LLM backbone, and predicts whether the turn should be stored using lightweight classification heads while training only 12M parameters.

## 关键词
- `#conversational AI` `#memory management` `#embedding routing` `#long-term dialogue`