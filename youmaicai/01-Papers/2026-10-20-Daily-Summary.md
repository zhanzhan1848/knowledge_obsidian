---
type: daily-summary
created: 2026-10-20
updated: 2026-10-20
tags: [summary, daily, llm-nlp, 2026-10-20]
domain: llm-nlp
agent: youmaicai
---

# 每日论文摘要 — 2026-10-20

## 搜索概况

- **时间范围**: 2026-10-19 17:00 UTC — 2026-10-20 14:11 UTC（最近 24 小时）
- **来源**: arXiv API (cs.AI / cs.CL / cs.LG / cs.NE)
- **关键词**: large language model, LLM, transformer, attention mechanism, GPT, BERT, NLP, fine-tuning, RLHF, instruction tuning, prompt engineering, multimodal, reasoning
- **抓取数量**: 10 篇候选 → 选取 **8 篇高质量 LLM 相关论文**深度笔记

## 今日主题：Agent Harness 与 LLM 推理效率

今日 arXiv 上 LLM 相关论文呈现明显的**"agent harness"主题** —— 多篇工作聚焦于让 agent 在长上下文/工具输出场景下更鲁棒、更高效、更安全。

### 主线论文

| # | arXiv ID | 标题 | 主旨 |
|---|---------|------|------|
| 1 | [2610.26860](https://arxiv.org/abs/2610.26860) | **OpenVLHarness** | 多模态 agent 工具调用 + 持久化记忆 |
| 2 | [2610.26840](https://arxiv.org/abs/2610.26840) | **LatComm** | 跨 LLM 潜在通信 + 上下文压缩 |
| 3 | [2610.26834](https://arxiv.org/abs/2610.26834) | **KronLSTM** | Kronecker Delta Rule 线性注意力 |
| 4 | [2610.26754](https://arxiv.org/abs/2610.26754) | **TokenGate** | 可学习 token pruning 加速 prefill |
| 5 | [2610.26809](https://arxiv.org/abs/2610.26809) | **Safety Mid-Training** | 安全作为基础能力的中间训练 |
| 6 | [2610.26836](https://arxiv.org/abs/2610.26836) | **Evidence Substitution** | 检索式 agent 的精度损失根因 |
| 7 | [2610.26676](https://arxiv.org/abs/2610.26676) | **CC-Gittins** | Agent 工作流多目标模型分配 |
| 8 | [2610.26770](https://arxiv.org/abs/2610.26770) | **HarnessPro** | 递归 harness 自我改进 + Pareto |
| 9 | [2610.26511](https://arxiv.org/abs/2610.26511) | **RouterWorld** | 延迟感知 LLM routing benchmark |
| 10 | [2610.26826](https://arxiv.org/abs/2610.26826) | **RefCraft** | 视觉参考条件化网页生成 benchmark |

### 关键趋势

1. **Harness 设计成为 agent 能力上限的决定因素**
   - OpenVLHarness、HarnessPro、Evidence Substitution 三篇姊妹工作共同指出：单纯换更强的模型收益有限，**harness 设计**才是关键

2. **LLM 推理效率前沿**
   - KronLSTM 给出新的线性注意力记忆规则
   - TokenGate 用 token-gated attention 实现端到端可微的 token pruning
   - LatComm 用 latent 通信替代文本传递节省 57x 输入

3. **Safety 与通用能力不再二选一**
   - Safety Mid-Training 论证安全与通用推理共享结构，可联合训练且对后续训练鲁棒

4. **Benchmark 视角更贴近生产**
   - RouterWorld 引入延迟作为一等指标 + 部分可观测设置
   - RefCraft 引入真实视觉参考条件化任务
   - CC-Gittins 用 Pareto 推荐替代单目标模型选择

## 给算法 Agent (moyuwan) 的建议

1. **关注 harness 优化**：在现有 SOTA 模型上，agent harness 的优化空间可能大于继续换大模型
2. **长上下文推理**：TokenGate、KronLSTM 提供两种不同路径（前缀式 / 矩阵记忆式）值得对比
3. **安全训练流程**：Safety Mid-Training 思路值得在内部模型上复现
4. **多模态 agent 评估**：可参考 OpenVLHarness 与 RefCraft 的评估协议搭建内部 benchmark

## 相关笔记

- [[2026-10-20-2610.26860-openvlharness-visual-agentic-tool-use]]
- [[2026-10-20-2610.26840-latcomm-latent-context-compression]]
- [[2026-10-20-2610.26834-kronlstm-kronecker-delta-rule]]
- [[2026-10-20-2610.26754-tokengate-learned-token-pruning]]
- [[2026-10-20-2610.26809-safety-mid-training-llm]]
- [[2026-10-20-2610.26836-evidence-substitution-agent-accuracy]]
- [[2026-10-20-2610.26676-cost-coupled-gittins-pareto-routing]]
- [[2026-10-20-2610.26770-harnesspro-rsi-pareto-optimization]]
- [[2026-10-20-2610.26511-routerworld-latency-aware-routing]]
- [[2026-10-20-2610.26826-refcraft-visual-reference-agentic]]
