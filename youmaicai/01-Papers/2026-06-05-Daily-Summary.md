# 2026-06-05 每日论文摘要

## 📅 日期：2026-06-05

## 🔍 搜索范围
- arXiv cs.CL, cs.AI, cs.NE, cs.LG（最近 24 小时）
- 关键词：LLM, transformer, attention, GPT, BERT, NLP, fine-tuning, RLHF, instruction tuning, multimodal, reasoning

## 📄 今日论文（共 9 篇）

### 1. CLSA: Cross-Layer Sparse Attention with Shared Routing
- **领域**: Transformer 架构优化
- **核心**: 在 YOCO 架构上共享 KV cache + 路由索引，128K 上下文下 7.6× decoding speedup
- **链接**: [arXiv:2606.06467](https://arxiv.org/abs/2606.06467)

### 2. NF-CoT: Latent Reasoning with Normalizing Flows
- **领域**: Reasoning / Chain-of-Thought
- **核心**: 用 normalizing flow 在 LLM 内建模连续 thoughts，保留 CoT 优势的同时降低 token 成本
- **链接**: [arXiv:2606.06447](https://arxiv.org/abs/2606.06447)

### 3. OpAI-Bench: AI-Text Detection Benchmark
- **领域**: AI-Text Detection
- **核心**: 多粒度渐进式 human-to-AI 转换 benchmark，发现混合 authorship 中间版本最难检测
- **链接**: [arXiv:2606.06481](https://arxiv.org/abs/2606.06481)

### 4. RL for Unseen Language Translation
- **领域**: 机器翻译 / RLHF
- **核心**: outcome-based RL 训练 LLM 从上下文 linguistic knowledge 泛化到 unseen 语言
- **链接**: [arXiv:2606.06428](https://arxiv.org/abs/2606.06428)

### 5. EDIT: Evidence-Diagnosed Intervention Training for LLM Grading
- **领域**: LLM 微调 / RLHF
- **核心**: 两阶段框架（EDIT-SFT + EDIT-RL）训练 rubric-faithful grader，用内部状态诊断定位问题步骤
- **链接**: [arXiv:2606.06350](https://arxiv.org/abs/2606.06350)

### 6. SARDI: Self-Augmenting Retrieval for Diffusion Language Models
- **领域**: RAG / Diffusion LM
- **核心**: 利用 diffusion LM 去噪时被丢弃的 token 作为 lookahead signal 引导检索，8× throughput 提升
- **链接**: [arXiv:2606.06474](https://arxiv.org/abs/2606.06474)

### 7. CollabSim: Multi-Agent LLM Collaboration
- **领域**: Multi-Agent LLM
- **核心**: CSCW 理论框架评估 LLM agents 协作能力，发现协作能力缺失是 MAS 失败主因
- **链接**: [arXiv:2606.06399](https://arxiv.org/abs/2606.06399)

### 8. Benchmark Agent: Autonomous Benchmark Construction
- **领域**: LLM 评估 / MLLM
- **核心**: 全自主 agentic 系统自动构建 benchmark，生成 15 个代表 benchmarks
- **链接**: [arXiv:2606.06462](https://arxiv.org/abs/2606.06462)

### 9. Vortex: Sparse Attention for AI Agents
- **领域**: Attention 优化 / AI Agent
- **核心**: Python DSL + 高效后端稀疏注意力系统，AI agent 自动搜索算法，最优 3.46× throughput
- **链接**: [arXiv:2606.06453](https://arxiv.org/abs/2606.06453)

## 📊 主题分布
- Reasoning/CoT: 2 篇
- Attention 优化: 2 篇
- Multi-Agent: 2 篇
- RLHF/Fine-tuning: 2 篇
- RAG/Diffusion: 1 篇

## ✅ 同步状态
- 创建时间：2026-06-05 14:12 UTC
- 笔记数量：9 篇 + 1 篇每日摘要
- Git 同步：待执行
