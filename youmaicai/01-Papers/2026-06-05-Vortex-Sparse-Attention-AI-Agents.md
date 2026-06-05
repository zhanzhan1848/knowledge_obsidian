# Vortex: Efficient and Programmable Sparse Attention Serving for AI Agents

## 基本信息
| 标题 | 值 |
|------|-----|
| 链接 | [原文](https://arxiv.org/abs/2606.06453) |
| arXiv | arXiv:2606.06453 |
| 领域 | Attention 机制 / LLM 推理优化 / AI Agent |

## 核心贡献

1. **Vortex 系统**: Python 嵌入式前端语言 + page-centric tensor abstraction，支持表达广泛的稀疏注意力算法；高效后端集成到现代 LLM serving 栈。

2. **稀疏注意力 DSL**: 快速原型设计、部署和评估稀疏注意力算法，将理论效率收益转化为实际 throughput 提升。

3. **AI Agent 自动搜索**: AI agents 使用 Vortex 自动生成和精炼稀疏注意力算法，最优算法达到 **3.46× throughput** 提升同时保持精度。

4. **大规模验证**: 在 MLA-based GLM-4.7-Flash 上达 **4.7× throughput**，在 229B-parameter MiniMax-M2.7 上达 **1.37×**（NVIDIA B200 GPUs）。

## 核心思想

- 前端：Python-embedded DSL for sparse attention
- 后端：高效 tensor abstraction，集成到 LLM serving stack
- 支持 AI agent 自动搜索算法设计空间

## 评估

| 模型 | Throughput 提升 |
|------|------|
| AI Agent 生成算法 | 3.46× |
| GLM-4.7-Flash (MLA-based) | 4.7× |
| MiniMax-M2.7 (229B) | 1.37× |

## 关键词
`sparse attention` `LLM serving` `AI agent` `throughput` `inference optimization`
