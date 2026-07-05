# 🥬 LLM/NLP 每日论文汇总 - 2026-07-05

## 搜索范围
- **时间**: 2026-07-03 (最近24小时内发表)
- **分类**: cs.AI, cs.CL, cs.LG, cs.NE
- **关键词**: large language model, LLM, transformer, attention, GPT, BERT, NLP, fine-tuning, RLHF, instruction tuning, prompt engineering, multimodal, reasoning

---

## 📄 论文列表

### cs.CL (Computation and Language)

| ID | 标题 | 核心领域 | 备注 |
|----|------|---------|------|
| [2607.02513](2026-07-05-LACUNA-LLM-Unlearning-Testbed.md) | LACUNA: A Testbed for Evaluating Localization Precision for LLM Unlearning | LLM Unlearning, Machine Unlearning | 参数级遗忘评估基准 |
| [2607.02504](2026-07-05-DramaSR-LRM-Speaker-Recognition.md) | Reasoning LLM Improves Speaker Recognition in Long-form TV Dramas | Multimodal, Reasoning | ICML 2026 |
| [2607.02490](2026-07-05-VRRL-Visually-Grounded-Self-Reflection.md) | Visually Grounded Self-Reflection for Vision-Language Models via RL | Multimodal, Reinforcement Learning, VLM | 视觉基础自反思 |
| [2607.02473](2026-07-05-Audiobook-Narration-Appeal.md) | Audio-Based Understanding of Audiobook Narration Appeal | Audio/NLP | Interspeech 2026 |
| [2607.02464](2026-07-05-Scaling-Social-Simulation.md) | Will Scaling Improve Social Simulation with LLMs? | LLM Scaling, Social Simulation | |
| [2607.02459](2026-07-05-Language-Models-Culture.md) | Language Models as Measurement Apparatus for Culture | NLP, Cultural Analysis | ACL 2026 Workshop |
| [2607.02416](2026-07-05-NLP-Scholarly-Migration.md) | The Future of NLP may not be at NLP Conferences | NLP Research Trends | |
| [2607.02383](2026-07-05-MediaRef-Knowledge-Store.md) | MEDIAREF: A Public Knowledge Store for Media Background Checks | RAG, Fact-checking | |
| [2607.02381](2026-07-05-MER-TRANS-2026-Spanish.md) | Governed Multi-Agent Simplification for Spanish Easy-to-Read | Multi-Agent, Text Simplification | MER-TRANS 2026 |
| [2607.02369](2026-07-05-Literary-Tools-Cultural-AI.md) | World Wide Models: Literary Tools for Cultural AI | Cultural AI, Literary Analysis | |

### cs.AI (Artificial Intelligence)

| ID | 标题 | 核心领域 | 备注 |
|----|------|---------|------|
| [2607.02514](2026-07-05-Iterative-VibeCoding-AI-Control.md) | Distributed Attacks in Persistent-State AI Control | AI Safety, AI Control | AI Coding Agent安全 |
| [2607.02510](2026-07-05-Online-Safety-Monitoring-LLM.md) | Online Safety Monitoring for LLMs | LLM Safety, Monitoring | ICML 2026 Workshop |
| [2607.02509](2026-07-05-ReContext-Long-Context-Reasoning.md) | RECONTEXT: Recursive Evidence Replay for Long-Context Reasoning | Long Context, Reasoning | |
| [2607.02491](2026-07-05-G-RRM-Symbolic-Solvers.md) | Guiding Symbolic Solvers with Recurrent Reasoning Models | Neuro-Symbolic, Reasoning | |
| [2607.02440](2026-07-05-EvoPolicyGym-Autonomous-Policy-Evolution.md) | Evaluating Autonomous Policy Evolution in Interactive Environments | Autonomous Agents, RL | |

---

## 🔥 重点论文

### 1. LACUNA: LLM Unlearning 参数级评估基准
**arXiv: 2607.02513** | cs.CL

首个参数级真实标签的遗忘测试平台，用于评估 LLM 遗忘方法的精确性。

**核心创新**: 
- 通过掩码持续预训练将 PII 注入到预定参数位置
- 直接评估遗忘是否真正从模型参数中擦除知识

**发现**: 尽管输出级表现良好，现有方法不够精确且容易受到 resurfacing 攻击。

---

### 2. RECONTEXT: 长上下文推理的递归证据回放
**arXiv: 2607.02509** | cs.AI

提出一种无需训练的长上下文推理推理方法，通过递归选择证据来改善上下文利用。

**核心创新**:
- 利用模型内部相关性信号构建查询条件证据池
- 在最终生成前回放证据，保留完整原始上下文

---

### 3. VRRL: 视觉基础自反思的强化学习框架
**arXiv: 2607.02490** | cs.CL

提出 VRRL 框架，通过强化学习训练 VLM 进行视觉基础自反思。

**核心创新**:
- 随机掩码轨迹前缀以强调从错误中间预测中恢复
- 引入经验回放缓冲区暴露模型多样的失败状态

---

## 📊 趋势分析

1. **LLM 安全与控制**: 多篇论文关注 LLM 遗忘、安全监控、AI 控制问题
2. **长上下文推理**: 持续有工作改善 LLM 对长上下文中证据的利用
3. **多模态推理**: VLM 的视觉基础自反思、说话人识别等任务
4. **LLM 缩放定律**: 研究缩放对社交模拟等任务的影响
5. **多智能体系统**: 多智能体工作流用于文本简化等任务

---

*生成时间: 2026-07-05 14:17 UTC*
