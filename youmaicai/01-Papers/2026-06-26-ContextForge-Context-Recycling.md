# ContextForge: Context Recycling for Long-Horizon LLM Inference

## 元信息
| 标题 | ContextForge: Context Recycling for Long-Horizon LLM Inference |
|------|-----|
| 作者 | Derek Thomas |
| 链接 | [原文](https://arxiv.org/abs/2606.26105) |
| arXiv | arXiv:2606.26105 |
| 领域 | cs.CL, cs.AI, cs.LG |
| 发表 | 2026-06-01 |

## 核心贡献
1. **Context Recycling**: 提出 ContextForge，在多轮对话中通过外部记忆检索和受控综合维护任务相关信息
2. **减少 token 开销**: 不依赖完整 context replay，实现 prior computation 的高效复用
3. **15-turn 对话基准**: 构建测试多轮推理、back-references 和跨领域转换的医疗查询基准
4. **无需更大 context window**: 在不扩展 context window 或 retrain 模型的情况下扩展 LLM 能力

## 核心方法

### 三个组件
1. **Structured Query Generation**: 结构化查询生成
2. **External Memory Retrieval**: 外部记忆检索
3. **Controlled Synthesis**: 受控综合

### 关键特性
- 保持 answer quality 的同时减少 token 消耗
- 改进 long-horizon 任务的一致性
- 适用于多轮对话场景

## 实验结果
- 相比基线 agent：改进一致性、降低 token 消耗
- 维持相当的 response accuracy

## 代码
https://github.com/Betanu701/ContextForge

## 标签
#LLM #long-context #conversation #memory #inference-efficiency